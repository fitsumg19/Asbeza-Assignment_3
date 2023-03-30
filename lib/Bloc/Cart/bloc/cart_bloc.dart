import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(CartLoadingState());
      List added_items = addedItems;
      emit(CartSuccessState(added_items));
    });

    on<RemoveDataButtonPressed>((event, emit) async {
      emit(CartLoadingState());
      List items = addedItems;
      emit(CartSuccessState(items));
    });
  }
}
