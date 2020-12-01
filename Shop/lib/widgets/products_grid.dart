import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products_item.dart';
import '../models/providers/products_provider.dart';
class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  /*const ProductsGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;*/ //We Dont Need This Because We Are Using Provider.

  @override
  Widget build(BuildContext context) {
    final productsProviderData=Provider.of<ProductsProvider>(context);
    final products=showFavs ? productsProviderData.favoriteItems : productsProviderData.items;//2nd Approach
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length, 
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],//create: (ctx) => products[i],
              child: ProductItem(
          //id: products[i].id,
          //title: products[i].title,
          //imageUrl: products[i].imageUrl,
          ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,//amount of columns
        childAspectRatio: 3/2,//height-3,width-2
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        ),
      );
  }
}