import 'package:flutter/material.dart';
import 'package:flutter_application_1/kvinna_parfym.dart';
import 'man_parfym.dart';
import 'cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cart.loadCartFromPrefs(); // Ladda kundvagnen
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Parfym Paradise",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Man parfume"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManParfym()),
                );
              },
            ),
            ListTile(
              title: Text("Women parfume"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KvinnaParfym()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Image.network(
            "https://theperfumeworld.co.uk/cdn/shop/collections/top-10-best-perfume-discountewr-main-image.jpg?v=1678077746&width=2000"),
      ),
    );
  }
}
