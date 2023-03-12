part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {}

class ShopInitialState extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopLoadingState extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopSuccessState extends ShopState {
  final List item;

  ShopSuccessState(
    this.item,
  );

  @override
  List<Object> get props => [];
}

class ShopFailState extends ShopState {
  String message;

  ShopFailState(this.message);

  @override
  List<Object> get props => [];
}
