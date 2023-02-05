import 'package:dw9_delivery_app/app/core/global/global_context.dart';
import 'package:dw9_delivery_app/app/core/provider/application_binding.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_router.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_router.dart';
import 'package:dw9_delivery_app/app/pages/home/home_router.dart';
import 'package:dw9_delivery_app/app/pages/order/order_complete_page.dart';
import 'package:dw9_delivery_app/app/pages/order/order_router.dart';
import 'package:dw9_delivery_app/app/pages/product_detail/product_detail_router.dart';
import 'package:dw9_delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/theme_config.dart';

class Dw9DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  Dw9DeliveryApp({super.key}) {
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/product-detail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletePage(),
        },
        theme: ThemeConfig.theme,
      ),
    );
  }
}
