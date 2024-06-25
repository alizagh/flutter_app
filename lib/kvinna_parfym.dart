import 'package:flutter/material.dart';
import 'cart.dart';
import 'kundvagn.dart';
import 'product.dart';

class KvinnaParfym extends StatelessWidget {
  const KvinnaParfym({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kvinna parfym"),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            color: Colors.yellow,
          )
        ],
      ),
      body: ManParfymBody(),
    );
  }
}

class ManParfymBody extends StatelessWidget {
  const ManParfymBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Products> parfanfilter =
        parfan.where((val_fri) => val_fri.gender == 2).toList();
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
                      Cart.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${product.name} added to cart')),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.blueAccent),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}


//InkWell Widget: InkWell används för att göra Container klickbar 