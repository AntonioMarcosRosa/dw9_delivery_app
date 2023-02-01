import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeConfig.theme,
      child: Scaffold(
        body: ColoredBox(
          color: const Color(0xFF140e0e),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth,
                  child: Image.asset(
                    'lib/assets/images/lanche.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: context.percentHeight(.30)),
                    Image.asset('lib/assets/images/logo.png'),
                    const SizedBox(height: 80),
                    DeliveryButton(
                      width: context.percentWidth(.6),
                      height: 35,
                      label: 'ACESSAR',
                      onPressed: () =>
                          Navigator.of(context).popAndPushNamed('/home'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
