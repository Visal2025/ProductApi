// To parse this JSON data, do
//
//     final productModelApi = productModelApiFromJson(jsonString);

import 'dart:convert';

ProductModelApi productModelApiFromJson(String str) => ProductModelApi.fromJson(json.decode(str));


class ProductModelApi {
    List<Product> products;

    ProductModelApi({
        required this.products,
    });

    factory ProductModelApi.fromJson(Map<String, dynamic> json) => ProductModelApi(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

   
}

class Product {
    int id;
    String title;
    String description;
    String category;
    double price;
    double discountPercentage;
    double rating;
    int stock;
    List<String> tags;
    String brand;
    String sku;
    int weight;
    Dimensions dimensions;
    String warrantyInformation;
    String shippingInformation;
    String availabilityStatus;
    List<Review> reviews;
    String returnPolicy;
    int minimumOrderQuantity;
    Meta meta;
    List<String> images;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.tags,
        required this.brand,
        required this.sku,
        required this.weight,
        required this.dimensions,
        required this.warrantyInformation,
        required this.shippingInformation,
        required this.availabilityStatus,
        required this.reviews,
        required this.returnPolicy,
        required this.minimumOrderQuantity,
        required this.meta,
        required this.images,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromJson(json["meta"]),
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
    );

    
}

class Dimensions {
    double width;
    double height;
    double depth;

    Dimensions({
        required this.width,
        required this.height,
        required this.depth,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
    );

   
}

class Meta {
    DateTime createdAt;
    DateTime updatedAt;
    String barcode;
    String qrCode;

    Meta({
        required this.createdAt,
        required this.updatedAt,
        required this.barcode,
        required this.qrCode,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
    );

   
}

class Review {
    int rating;
    String comment;
    DateTime date;
    String reviewerName;
    String reviewerEmail;

    Review({
        required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
    );

   
}