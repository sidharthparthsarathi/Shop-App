//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../models/providers/cart.dart';
//import '../models/providers/products_provider.dart';
import './cart_screen.dart';
enum FilterOptions{
  Favorites,
  All,
}
class ProductsOvervieScreen extends StatefulWidget {
  @override
  _ProductsOvervieScreenState createState() => _ProductsOvervieScreenState();
}

class _ProductsOvervieScreenState extends State<ProductsOvervieScreen> {
  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    //final productsContainer=Provider.of<ProductsProvider>(context);1st Approach Of Filtering
    //final cart=Provider.of<Cart>(context);
    return Scaffold(appBar: AppBar(
      title: Text('My Shop'),
      actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue){
            print(selectedValue);
            setState(() {
              if(selectedValue==FilterOptions.Favorites){
              //productsContainer.showFavoritesOnly();
              _showOnlyFavorites=true;
            }
            else{
              //productsContainer.showAll();
              _showOnlyFavorites=false;
            }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Only Favorite'), value: FilterOptions.Favorites,),
              PopupMenuItem(
              child: Text('Show All'), value: FilterOptions.All,),
          ],
          ),
          Consumer<Cart>(
                      builder: (_, cartData, ch) => Badge(
              child: ch,
            value: cartData.itemCount.toString(),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart
                  ), 
                  onPressed: (){
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  }),
          )
      ],
    ),
    body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

