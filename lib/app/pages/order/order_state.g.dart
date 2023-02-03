// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStatusMatch on OrderStatus {
  T match<T>({required T Function() initial}) {
    final v = this;
    if (v == OrderStatus.initial) {
      return initial();
    }

    throw Exception('OrderStatus.match failed, found no match for: $this');
  }

  T matchAny<T>({required T Function() any, T Function()? initial}) {
    final v = this;
    if (v == OrderStatus.initial && initial != null) {
      return initial();
    }

    return any();
  }
}
