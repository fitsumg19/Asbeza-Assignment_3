import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/Data/Model/item_tile.dart';
import 'package:assignment_3/Repository/service.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int index = 0;

  @override
  void initState() {
    final _service = Service();
    _service.readItem().then((value) => itemData = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitialState) {
            if (itemData == null) {
              return Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                child: const Text("No Items Added to Cart"),
              );
            } else {
              for (var i = 0; i < itemData!.length; i++) {
                addedItems.add(Item.fromJson(itemData![i]));
              }
              calculatePrice();
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: addedItems.length,
                    itemBuilder: (context, index) {
                      final Item itemVal = addedItems[index];
                      return ItemTile(
                        id: itemVal.id,
                        image: itemVal.image,
                        title: itemVal.title,
                        price: itemVal.price,
                        cartButtonPressed: true,
                      );
                    },
                  ),
                  Positioned(
                    top: height * .8 - (width * .2),
                    left: width * .4,
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(10),
                      shadowColor: Colors.black,
                      child: Container(
                        height: width * .2,
                        width: width * .2,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: width * .2,
                            child: Center(
                              child: Text(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                '\$' + totalPrice.toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          } else if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailState) {
            return Text(state.message);
          } else if (state is CartSuccessState) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    final Item itemVal = state.item[index];
                    return ItemTile(
                      id: itemVal.id,
                      image: itemVal.image,
                      title: itemVal.title,
                      price: itemVal.price,
                      cartButtonPressed: true,
                    );
                  },
                ),
                Positioned(
                  top: height * .8 - (width * .2),
                  left: width * .4,
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: Colors.black,
                    child: Container(
                      height: width * .2,
                      width: width * .2,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: width * .2,
                          child: Center(
                            child: Text(
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              '\$' + totalPrice.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
