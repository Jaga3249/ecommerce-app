// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollections;
  //text controller

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  String category = 'General';
  String brand = 'unBranded';
  bool offer = false;
  @override
  void onInit() {
    productCollections = firestore.collection("products");
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollections.doc();
      Product product = Product(
          id: doc.id,
          name: productNameCtrl.text,
          description: productDescCtrl.text,
          category: category,
          brand: brand,
          price: double.tryParse(productPriceCtrl.text),
          image: productImgCtrl.text,
          offer: offer);
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("sucess", "product added sucessfuly",
          colorText: Colors.green);
      resetValue();
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
    }
  }

  resetValue() {
    productNameCtrl.clear();
    productDescCtrl.clear();
    productPriceCtrl.clear();
    productImgCtrl.clear();
    category = "General";
    brand = "unBranded";
    offer = false;
    update();
  }
}
