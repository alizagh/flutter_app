// import 'package:flutter/material.dart';
// import 'cart.dart';
// import 'kundvagn.dart';
// import 'product.dart';

// class ManParfym extends StatefulWidget {
//   const ManParfym({super.key});

//   @override
//   State<ManParfym> createState() => _ManParfymState();
// }

// class _ManParfymState extends State<ManParfym> {
//   // int cartItemCount = Cart.getCartItems().length; //7777
//   int cartItemCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     updateCartItemCount();
//   }

//   void updateCartItemCount() {
//     setState(() {
//       cartItemCount = Cart.getCartItems().length;
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     updateCartItemCount();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Man parfym"),
//           backgroundColor: Colors.blue,
//           actions: [
//             Stack(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.shopping_cart),
//                   onPressed: () async {
//                     await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CartPage(),
//                         ));
//                   },
//                   color: Colors.yellow,
//                 ),
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: CircleAvatar(
//                     radius: 10,
//                     backgroundColor: Colors.red,
//                     child: Text(
//                       "${cartItemCount}",
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//         // body: ManParfymBody(),
//         body: ManParfymBody(updateCartItemCount: () {
//           setState(() {
//             cartItemCount = Cart.getCartItems().length;
//           });
//         }));
//   }
// }

// class ManParfymBody extends StatelessWidget {
//   const ManParfymBody({super.key, required this.updateCartItemCount});
//   final VoidCallback updateCartItemCount;

//   @override
//   Widget build(BuildContext context) {
//     List<Products> parfanfilter =
//         parfan.where((val_fri) => val_fri.gender == 1).toList();
//     return GridView.builder(
//       padding: EdgeInsets.all(10),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Antal kolumner per rad
//         crossAxisSpacing: 10.0, // Avstånd mellan kolumner
//         mainAxisSpacing: 10.0, // Avstånd mellan rader
//         childAspectRatio: 0.7,
//       ),
//       itemCount: parfanfilter.length,
//       itemBuilder: (context, index) {
//         return visning_parfym(context, parfanfilter[index]);
//       },
//     );
//   }

//   Card visning_parfym(BuildContext context, Products product) {
//     return Card(
//       elevation: 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Image.asset(
//               product.image,
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(height: 5),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   "${product.pris} kr",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(height: 5),
//                 InkWell(
//                     onTap: () {
//                       Cart.addToCart(product);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text('${product.name} added to cart')),
//                       );
//                       updateCartItemCount();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(7),
//                           color: Colors.blueAccent),
//                       child: Text(
//                         "Add to Cart",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// //InkWell Widget: InkWell används för att göra Container klickbar

import 'package:flutter/material.dart';
import 'cart.dart';
import 'kundvagn.dart';
import 'product.dart';

class ManParfym extends StatefulWidget {
  const ManParfym({super.key});

  @override
  State<ManParfym> createState() => _ManParfymState();
}

class _ManParfymState extends State<ManParfym> {
  int cartItemCount = 0;

  @override
  void initState() {
    super.initState();
    updateCartItemCount();
  }

  void updateCartItemCount() {
    setState(() {
      cartItemCount = Cart.getCartItems().length;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateCartItemCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Man parfym"),
        backgroundColor: Colors.blue,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                  updateCartItemCount();
                },
                color: Colors.yellow,
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    "$cartItemCount",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: ManParfymBody(updateCartItemCount: updateCartItemCount),
    );
  }
}

class ManParfymBody extends StatelessWidget {
  const ManParfymBody({super.key, required this.updateCartItemCount});
  final VoidCallback updateCartItemCount;

  @override
  Widget build(BuildContext context) {
    List<Products> parfanfilter =
        parfan.where((val_fri) => val_fri.gender == 1).toList();
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Antal kolumner per rad
        crossAxisSpacing: 10.0, // Avstånd mellan kolumner
        mainAxisSpacing: 10.0, // Avstånd mellan rader
        childAspectRatio: 0.7,
      ),
      itemCount: parfanfilter.length,
      itemBuilder: (context, index) {
        return visning_parfym(context, parfanfilter[index]);
      },
    );
  }

  Card visning_parfym(BuildContext context, Products product) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${product.pris} kr",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    List<Products> lst = Cart.getCartItems();
                    bool exist = false;
                    for (var item in lst) {
                      if (item.id == product.id) {
                        exist = true;
                      }
                    }
                    exist ? false : Cart.addToCart(product);
                    exist ? true : updateCartItemCount();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to cart')),
                    );
                    updateCartItemCount();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blueAccent,
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
