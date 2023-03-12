part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {}

class GetDataButtonPressed extends CartEvent {
  @override
  List<Object> get props => [];
}

class RemoveDataButtonPressed extends CartEvent {
  @override
  List<Object> get props => [];
}
