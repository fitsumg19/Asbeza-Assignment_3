// import 'package:flutter/material.dart';
// import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddedItemTIle extends StatelessWidget {
//   const AddedItemTIle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List added_items = [];
//     return BlocBuilder<CartBloc, CartState>(
//       builder: (context, state) {
//         return Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.all(8),
//             child: Container(
//                 height: 380,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                         height: 50,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 width: 300,
//                                 child: const Text("FoodTitle"),
//                               ),
//                             ),
//                             const Text("FoodPrice"),
//                           ],
//                         )),
//                     IconButton(
//                         onPressed: () {}, icon: const Icon(Icons.remove)),
//                   ],
//                 )));
//       },
//     );
//   }
// }
