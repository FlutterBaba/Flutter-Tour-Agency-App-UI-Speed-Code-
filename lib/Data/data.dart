import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String image;
  final String name;
  final int price;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
  });
}

class CategoryModel {
  final String image;
  final String name;

  CategoryModel({
    required this.image,
    required this.name,
  });
}

List<ProductModel> popularList = [
  ProductModel(
      image: "images/image1.jpg", name: "Best Of Tajj Malah ", price: 50),
  ProductModel(
      image: "images/image2.jpg", name: "Best Of Tajj Malah ", price: 700),
  ProductModel(
      image: "images/image3.jpg", name: "Best Of Tajj Malah ", price: 100),
];

List<CategoryModel> singleProductImgList = [
  CategoryModel(
    image: "images/image4.webp",
    name: "Sofa",
  ),
  CategoryModel(
    image: "images/image5.jpg",
    name: "Chair",
  ),
  CategoryModel(
    image: "images/image6.jpg",
    name: "Table",
  ),
  CategoryModel(
    image: "images/image7.jpg",
    name: "Wall Shelf",
  ),
];
List<CategoryModel> recommend = [
  CategoryModel(
    image: "images/image9.jpg",
    name: "Sofa",
  ),
  CategoryModel(
    image: "images/image8.jpg",
    name: "Chair",
  ),
  CategoryModel(
    image: "images/image7.jpg",
    name: "Table",
  ),
  CategoryModel(
    image: "images/image6.jpg",
    name: "Wall Shelf",
  ),
];

class AppColors {
  static const kBlack = Colors.black;
  static const kBrownColor = Color(0xffed6954);
  static const kWhite = Colors.white;
  static const kBlack54 = Colors.black54;
  static const kRed = Colors.red;
  static const kGrey = Colors.grey;
}
