import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => DeliveryProductTile(
              product: ProductModel(
                id: 0,
                name: 'Xis Teste',
                description: 'Um Xis feito para testes',
                price: 25.90,
                image:
                    "https://burger.eriklima.me/wp-content/uploads/2021/03/X-Bacon.jpg",
              ),
            ),
          ),
        )
      ]),
    );
  }
}
