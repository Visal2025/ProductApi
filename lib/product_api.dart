import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_api/details_page.dart';

import 'package:flutter/material.dart';

import 'package:product_api/product_model.dart';

class ProductApi extends StatefulWidget {
  const ProductApi({super.key});

  @override
  State<ProductApi> createState() => _productApiState();
}

class _productApiState extends State<ProductApi> {
  bool _isLoading=true;
  ProductModelApi? dataFromApi;

  _getData() async{
    try{
      String url="https://dummyjson.com/products";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode==200){
        dataFromApi=ProductModelApi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

  void initState(){
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Api"),backgroundColor: Colors.pink,),
      body:_isLoading? const Center(child: CircularProgressIndicator())
      :dataFromApi==null? Center(child: Text("Failed to Load Data"),)
      
      
      
       :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: dataFromApi!.products.length,
      itemBuilder:(context,index){
        final product=dataFromApi!.products[index];
        return Container(
          height: 250,
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:Border.all(color: Colors.black,width: 2),
          color: const Color.fromARGB(255, 235, 192, 206),
          boxShadow: [BoxShadow(
            color: Colors.white,
            blurRadius: 0,
            spreadRadius: 1,
          )]),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detailspage(product: product)));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(product.thumbnail),)),
                ),
              ),
              SizedBox(height: 10,),
              Text(product.title),
             
            ],
          ),
        );
      }),
    );
  }
}