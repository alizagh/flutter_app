// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'product.dart';

// class Cart {
//   // håller reda på alla produkter som lagts till i kundvagnen
//   static List<Products> _items = [];

//   //Denna metod lägger till en produkt i kundvagnen och sparar uppdateringen i SharedPreferences.
//   static Future<void> addToCart(Products product) async {
//     bool exist = false;
//     for (var i in _items) {
//       if (i.id == product.id) {
//         exist = true;
//       }
//     }
//     exist ? true : _items.add(product);
//     // _items.add(product);
//     await saveCartToPrefs();
//   }

//   static List<Products> getCartItems() {
//     return _items;
//   }

// //konverterar alla produkter i kundvagnen till JSON-strängar och sparar dem i SharedPreferences
//   static Future<void> saveCartToPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> cartJson =
//         _items.map((item) => jsonEncode(item.toJson())).toList();
//     await prefs.setStringList('cart_items', cartJson);
//   }

// //laddar produkterna från SharedPreferences om de finns, och konverterar dem från JSON-strängar tillbaka till Products-objekt
//   static Future<void> loadCartFromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? cartJson = prefs.getStringList('cart_items');
//     if (cartJson != null) {
//       _items =
//           cartJson.map((item) => Products.fromJson(jsonDecode(item))).toList();
//     }
//   }

//   static int getItemCount(int produkt_id) {
//     int count = 0;
//     for (var item in _items) {
//       if (item.id == produkt_id) {
//         count++;
//       }
//     }
//     return count;
//   }

// }

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';

class Cart {
  static List<Products> _items = [];
  // Håller reda på antalet av varje produkt i kundvagnen
  static Map<int, int> _itemCounts = {};

  // Denna metod lägger till en produkt i kundvagnen och sparar uppdateringen i SharedPreferences.
  static Future<void> addToCart(Products product) async {
    if (_itemCounts.containsKey(product.id)) {
      _itemCounts[product.id] = _itemCounts[product.id]! + 1;
    } else {
      _items.add(product);
      _itemCounts[product.id] = 1;
    }
    await saveCartToPrefs();
  }

  static List<Products> getCartItems() {
    return _items;
  }

  // Konverterar alla produkter i kundvagnen till JSON-strängar och sparar dem i SharedPreferences
  static Future<void> saveCartToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart_items', cartJson);
    await prefs.setString('item_counts', jsonEncode(_itemCounts));
  }

  // Laddar produkterna från SharedPreferences om de finns, och konverterar dem från JSON-strängar tillbaka till Products-objekt
  static Future<void> loadCartFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart_items');
    String? itemCountsJson = prefs.getString('item_counts');
    if (cartJson != null) {
      _items =
          cartJson.map((item) => Products.fromJson(jsonDecode(item))).toList();
    }
    if (itemCountsJson != null) {
      _itemCounts = Map<int, int>.from(jsonDecode(itemCountsJson));
    }
  }

  // Hämta antalet av en specifik produkt i kundvagnen
  static int getItemCount(int productId) {
    return _itemCounts[productId] ?? 0;
  }

  // Öka antalet av en specifik produkt i kundvagnen
  static Future<void> increaseItem(int productId) async {
    if (_itemCounts.containsKey(productId)) {
      _itemCounts[productId] = _itemCounts[productId]! + 1;
    } else {
      for (var item in _items) {
        if (item.id == productId) {
          _itemCounts[productId] = 1;
          break;
        }
      }
    }
    await saveCartToPrefs();
  }

  // Minska antalet av en specifik produkt i kundvagnen
  static Future<void> decreaseItem(int productId) async {
    if (_itemCounts.containsKey(productId) && _itemCounts[productId]! > 1) {
      _itemCounts[productId] = _itemCounts[productId]! - 1;
    } else {
      _itemCounts.remove(productId);
      _items.removeWhere((item) => item.id == productId);
    }
    await saveCartToPrefs();
  }
}
