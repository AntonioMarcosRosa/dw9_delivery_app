import 'package:dw9_delivery_app/app/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/app/repositories/products_repository.dart';
import 'package:dw9_delivery_app/app/repositories/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(dio: context.read()),
          ),
          Provider<HomeController>(
            create: (context) => HomeController(context.read()),
          )
        ],
        child: const HomePage(),
      );
}