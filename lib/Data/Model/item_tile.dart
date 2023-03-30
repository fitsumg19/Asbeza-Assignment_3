import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final num price;
  final bool cartButtonPressed;

  const ItemTile(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.cartButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    const String dollar_sign = "\$";
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
                          child: Container(width: 200, child: Text(title))),
                      Text(dollar_sign + price.toString()),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Item item =
                        Item(id: id, image: image, title: title, price: price);
                    item_ = item;
                    if (!cartButtonPressed) {
                      BlocProvider.of<CartBloc>(context)
                          .add(GetDataButtonPressed());
                    } else {
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
