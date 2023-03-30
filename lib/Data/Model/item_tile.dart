import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final String image;
  final String foodTitle;
  final num foodPrice;
  final bool cartButtonPressed;

  const ItemTile(
      {required this.image,
      required this.foodTitle,
      required this.foodPrice,
      required this.cartButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    const String dollar_sign = "\$";
    int index_to_remove = 0;
    bool item_to_remove_found = false;
    double total_price = 0;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          color: Color.fromARGB(255, 250, 248, 245),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                ),
                Container(
                  height: 50,
                  color: Colors.white10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Container(width: 200, child: Text(foodTitle))),
                      Text(dollar_sign + foodPrice.toString()),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!cartButtonPressed) {
                      Item item = Item(
                          image: image,
                          foodTitle: foodTitle,
                          foodPrice: foodPrice);
                      addedItems.add(item);
                      calculatePrice();
                      BlocProvider.of<CartBloc>(context)
                          .add(GetDataButtonPressed());
                    } else {
                      Item item = Item(
                        image: image,
                        foodTitle: foodTitle,
                        foodPrice: foodPrice,
                      );
                      for (int i = 0;
                          i < addedItems.length &&
                              item_to_remove_found == false;
                          i++) {
                        if (item.foodTitle == addedItems[i].foodTitle) {
                          index_to_remove = i;
                          item_to_remove_found = true;
                        }
                      }
                      item_to_remove_found = false;
                      addedItems.removeAt(index_to_remove);
                      calculatePrice();
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveDataButtonPressed());
                    }
                  },
                  icon: cartButtonPressed
                      ? const Icon(Icons.remove_shopping_cart_outlined)
                      : const Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//calculate the total price
void calculatePrice() {
  totalPrice = 0;
  for (int i = 0; i < addedItems.length; i++) {
    totalPrice += addedItems[i].foodPrice;
    String stringTotalPrice = totalPrice.toStringAsFixed(2);
    totalPrice = double.parse(stringTotalPrice);
  }
}
