//import 'package:provider/provider.dart';

import 'package:flutter/widgets.dart';//We Can Also USe This Package for ChangeNotifier
import 'package:flutter/foundation.dart';
class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem(
    {
     @required this.id,
      @required this.price,
      @required this.title,
      this.quantity,
    }
  );
}
class Cart with ChangeNotifier{
  Map<String, CartItem> _items={};
  Map<String,CartItem> get items{
    return {..._items};
  }
  int get itemCount{
    return /*_items.length==null ? 0 : */_items.length;
  }
  double get totalAmount{
    /*double*/var total=0.0;
    _items.forEach((key, cartItem) { 
      total+=cartItem.price*cartItem.quantity;
    });
    return total;
  }
  void addItem(
    String productId,
    double price,
    String title){
      if(_items.containsKey(productId)){
        _items.update(productId, (existingCartItemvalue) => 
        CartItem(
          id: existingCartItemvalue.id, 
          price: existingCartItemvalue.price, 
          title: existingCartItemvalue.title,
          quantity: existingCartItemvalue.quantity+1),
          );
        //Change Quantity
      } else{
        _items.putIfAbsent(productId, () => CartItem(
          id: DateTime.now().toString(), 
          price: price, 
          title: title,quantity: 1),
          );
      }
      notifyListeners();
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
}
