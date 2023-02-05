// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';

class OrderDto {
  final List<OrderProductDto> products;
  final String address;
  final String document;
  final int paymentMethodId;
  
  OrderDto({
    required this.products,
    required this.address,
    required this.document,
    required this.paymentMethodId,
  });
  
}
