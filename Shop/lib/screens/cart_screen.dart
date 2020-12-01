import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providers/cart.dart' show Cart;//We can Use Show Cart
import '../widgets/cart_item.dart' /*as ci*/;//Solution for the issue with same class name with multiple file import.


class CartScreen extends StatelessWidget {
  static const routeName='/Cart-Screen';
  @override
  Widget build(BuildContext context) {
      final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Total',
              style: TextStyle(
                fontSize: 10,
              ),
              ),
              Spacer(),
              //SizedBox(width: 10,),We Dont Need This If We Have SpaceBetween
              Chip(label: Text('\$'+cart.totalAmount.toString(),//You Can Use String Interpolation
              style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              ),
              FlatButton(onPressed: (){
              }, 
              child: Text('ORDER NOW'),
              textColor: Theme.of(context).primaryColor,
              ),
            ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(itemBuilder: (ctx,i) {
            final cartD=cart.items.values.toList()[i];//i'm Using Shortcut
            return CardItem(
              id: cartD.id,
              price: cartD.price,
              quantity: cartD.quantity,
              title: cartD.title,
              productId: cart.items.keys.toList()[i],
            );
          },
          itemCount: cart.itemCount,//For Mixed Up Quantities Use cart._items.length;
          ),
          ),
      ],),
    );
  }
}