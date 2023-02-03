import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
}

class OrderState extends Equatable {
  final OrderStatus status;

  const OrderState({
    required this.status,
  });

  const OrderState.initial() : status = OrderStatus.initial;

  @override
  List<Object?> get props => [status];

  OrderState copyWith({
    OrderStatus? status,
  }) =>
      OrderState(status: status ?? this.status);
}
