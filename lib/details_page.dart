import 'package:flutter/material.dart';
import 'package:product_api/product_model.dart';

class Detailspage extends StatelessWidget {
  final Product product;
  Detailspage({required this.product});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text(product.title),centerTitle: true,),
      body: Padding(padding: const EdgeInsets.all(15),
      child: Center(child: Column(
        children: [
          SizedBox(height: 15,),
          Container(height: 300,width: 300,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(product.thumbnail))),),
          Text("Name:${product.title}"),
          Text("price:${product.price}"),
          Text("Description:${product.description}"),
          Text("Discount:${product.discountPercentage}"),
        ],
      ),),),
    );
  }
}
