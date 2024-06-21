import 'package:flutter/material.dart';
import 'package:footware_admin/controller/home_controller.dart';
import 'package:footware_admin/widgets/dropdown_btn.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text('Add product'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      label: const Text("Product Name"),
                      hintText: "Enter Your Product Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                  maxLines: 4,
                  controller: ctrl.productDescCtrl,
                  decoration: InputDecoration(
                      label: const Text("Product Description"),
                      hintText: "Enter Your Product Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      label: const Text("Image Url"),
                      hintText: "Enter Your Image Url",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      label: const Text("Product Price"),
                      hintText: "Enter Your Product Price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: DropdownBtn(
                      items: const ["cate1", "cate2", "cate3"],
                      selectedItemText: ctrl.category,
                      onSelected: (seleectedValue) {
                        ctrl.category = seleectedValue ?? "general";
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropdownBtn(
                      items: const ["brand1", "brand2", "brand3"],
                      selectedItemText: ctrl.brand,
                      onSelected: (seleectedValue) {
                        ctrl.brand = seleectedValue ?? "unBrand";
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "offer Product?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                DropdownBtn(
                  items: const ["true", "false"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (seleectedValue) {
                    ctrl.offer =
                        bool.tryParse(seleectedValue ?? "false") ?? false;
                    ctrl.update();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: const Text("Add Product"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
