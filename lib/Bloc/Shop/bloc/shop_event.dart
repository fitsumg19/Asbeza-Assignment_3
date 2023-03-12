part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {}

class GetDataButtonPressed extends ShopEvent {
  @override
  List<Object> get props => [];
}