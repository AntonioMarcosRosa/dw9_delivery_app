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
        appBar: AppBar(title: const Text('Slash')),
        body: Column(
          children: [
            Container(),
            DeliveryButton(
              label: 'Delivery',
              onPressed: () {},
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Teste'),
            ),
          ],
        ),
      ),
    );
  }
}
