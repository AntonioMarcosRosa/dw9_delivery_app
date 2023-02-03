import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final ValueNotifier<bool> _seePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _seeConfirmPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _seePassword.dispose();
    _seeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Registro efetuado com sucesso');
            Navigator.of(context).popAndPushNamed('/order');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos para criar o cadastro.',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome é obrigatório.'),
                      Validatorless.min(
                          4, 'Nome precisa de no minimo 4 caracteres.'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail é obrigatório.'),
                      Validatorless.email('E-mail inválido.'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _seePassword,
                    builder: (context, value, _) => TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        suffixIcon: InkWell(
                          onTap: () => setState(
                              () => _seePassword.value = !_seePassword.value),
                          child: Icon(_seePassword.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye_rounded),
                        ),
                      ),
                      obscureText: _seePassword.value,
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha é obrigatória.'),
                        Validatorless.min(
                            8, 'Senha deve ter no mínimo 8 caracteres'),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _seeConfirmPassword,
                    builder: (context, value, _) => TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirme a senha',
                        suffixIcon: InkWell(
                          onTap: () => setState(() => _seeConfirmPassword
                              .value = !_seeConfirmPassword.value),
                          child: Icon(_seeConfirmPassword.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye_rounded),
                        ),
                      ),
                      obscureText: _seeConfirmPassword.value,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            'Confirme a senha é obrigatório.'),
                        Validatorless.compare(_passwordEC,
                            'A confirmação da senha está diferente da senha.')
                      ]),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: DeliveryButton(
                      width: double.infinity,
                      label: 'REGISTRAR-SE',
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
