import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../config/env/env.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const DeliveryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(Env.instance['backend_base_url'] ?? ''),
      ),
    );
  }
}