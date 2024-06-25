// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/product.dart';
// import 'cart.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Products> produkter_cart = Cart.getCartItems();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Varukorg",
//             style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.yellow,
//                 fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.black,
//       ),
//       body: ListView.builder(
//         itemCount: produkter_cart.length,
//         itemBuilder: (context, index) {
//           int item_count = Cart.getItemCount(produkter_cart[index].id);
//           return ListTile(
//             leading: FittedBox(
//               child: Image.asset(
//                 produkter_cart[index].image,
//                 height: 170,
//                 width: 170,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(produkter_cart[index].name,
//                     style: TextStyle(fontSize: 18)),
//                 Text("${item_count}")
//               ],
//             ),
//             subtitle: Text(
//               "${produkter_cart[index].pris}",
//               style: TextStyle(color: Colors.black87),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/product.dart';
import 'cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Products> produkter_cart = Cart.getCartItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Varukorg",
            style: TextStyle(
                fontSize: 20,
                color: Colors.yellow,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: produkter_cart.length,
        itemBuilder: (context, index) {
          int itemCount = Cart.getItemCount(produkter_cart[index].id);
          return ListTile(
            leading: FittedBox(
              child: Image.asset(
                produkter_cart[index].image,
                height: 170,
                width: 170,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(produkter_cart[index].name,
                    style: TextStyle(fontSize: 18)),
                Text("$itemCount")
              ],
            ),
            subtitle: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      Cart.decreaseItem(produkter_cart[index].id);
                    });
                  },
                ),
                Text("${produkter_cart[index].pris * itemCount} kr", ////////7
                    style: TextStyle(color: Colors.black87)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      Cart.increaseItem(produkter_cart[index].id);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
