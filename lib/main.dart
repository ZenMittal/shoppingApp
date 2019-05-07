import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './pages/product_create.dart';


void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          // body1: TextStyle(fontFamily: "Raleway"),
          // button: TextStyle(fontFamily: "Raleway"),
          // body2: TextStyle(fontFamily: "Raleway"),
          // display1: TextStyle(fontFamily: "Raleway"),
          // display2: TextStyle(fontFamily: "Raleway"),
          // display3: TextStyle(fontFamily: "Raleway"),
          // display4: TextStyle(fontFamily: "Raleway"),
          // caption: TextStyle(fontFamily: "Raleway"),
          // headline: TextStyle(fontFamily: "Raleway"),
          // overline: TextStyle(fontFamily: "Raleway"),
          // subhead: TextStyle(fontFamily: "Raleway"),
          // subtitle: TextStyle(fontFamily: "Raleway"),
          // title: TextStyle(fontFamily: "Raleway"),
        ),
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.lime,
        fontFamily: "Raleway",
      ),
      home: AuthPage(),
      routes: {
        // "/": (BuildContext context) => ProductsPage(_products),
        "/admin": (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings route) {
        final List<String> pathElements = route.name.split("/");
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == "product") {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(builder: (context) {
            return ProductPage(
              title: _products[index]["title"],
              imageURL: _products[index]["imageURL"],
            );
          });
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products));
      },
    );
  }
}
