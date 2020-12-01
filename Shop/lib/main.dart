import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './models/providers/products_provider.dart';
import './models/providers/cart.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(//ChangeNotifierProvider.value(////Shortcut/Alternative Syntax of Provider
      create: (ctx) => ProductsProvider(),
      ),//value: ProductsProvider(),////For Older Versions of Provider Use builder,
      ChangeNotifierProvider(
        create: (ctx) => Cart(),
        ),
    ],
          child: MaterialApp(title: 'Shop App',
      debugShowCheckedModeBanner: false,
      home: ProductsOvervieScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        splashColor: Colors.black,
        fontFamily: 'Lato',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 15,
          color: Colors.yellow,
          fontWeight: FontWeight.normal),
        ),
      ),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ct) => CartScreen(),
      },
      ),
    );
  }
}
/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Shop App'),
    ),
    body: Center(child: Text('Shop App'),
    ), 
    );
  }
}*/