import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providers/products_provider.dart';
class ProductDetailScreen extends StatelessWidget {
  static const routeName='/Product-Detail';
  //final String title;
  //ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as String;//We Want a central state management solution
    final loadedProduct=Provider.of<ProductsProvider>(context).items.firstWhere((element) => element.id==productId);//Centrally Managed Data
    return Scaffold(appBar: AppBar(title: Text(loadedProduct.title),
    ),
    body: SingleChildScrollView(
          child: Column(
        children: [
          Container(height: 300,
          child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text('\$${loadedProduct.price}',style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(loadedProduct.description,
            textAlign: TextAlign.center,
            softWrap: true,
            ),
          ),
        ],
      ),
    ),
    );
  }
}