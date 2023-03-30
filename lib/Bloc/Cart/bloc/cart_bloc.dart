import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/Repository/service.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

final _service = Service();

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(CartLoadingState());
      _service.saveItem(item_);
      addedItems.clear(); //no duplicates in the database
      readFromDatabase();
      List added_items = addedItems;
      calculatePrice();

      emit(CartSuccessState(added_items));
    });

    on<RemoveDataButtonPressed>((event, emit) async {
      emit(CartLoadingState());
      _service.deleteItem(item_.id);
      addedItems.clear();
      readFromDatabase();
      List items = addedItems;
      calculatePrice();

      emit(CartSuccessState(items));
    });
  }
}

void readFromDatabase() {
  _service.readItem().then((value) => itemData = value);
  for (var i = 0; i < itemData!.length; i++) {
    addedItems.add(Item.fromJson(itemData![i]));
  }
}

//calculate the total price
void calculatePrice() {
  totalPrice = 0;
  for (int i = 0; i < addedItems.length; i++) {
    totalPrice += addedItems[i].price;
    //fix the precision to 2 decimal numbers
    String stringTotalPrice = totalPrice.toStringAsFixed(2);
    //cast back to double
    totalPrice = double.parse(stringTotalPrice);
  }
}
