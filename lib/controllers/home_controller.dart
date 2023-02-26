import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController inputPhone = TextEditingController();

  CollectionReference phones = FirebaseFirestore.instance.collection('phones');
  CollectionReference categorys = FirebaseFirestore.instance.collection('category_name');

  var currentIndex = 0.obs;

  var categoryItems = <String>[].obs;
  var phoneItems = <String>[].obs;

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'full_name': "lee", // John Doe
  //         'company': "lee company", // Stokes and Sons
  //         'age': 18 // 42
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  // Future<void> getUser() {
  //   return users.get().then((value) => print("test : ${value.docs.length}"));
  // }

  // Stream<List<Category>> getCategory() {
  //   return categorys.snapshots().map((event) => event.docs.map((e) {
  //         print(e.data());
  //         return Category.fromJson(jsonDecode(
  //           e.data().toString(),
  //         ));
  //       }).toList());
  // }
  getCategorys() {
    categorys.get().then((value) {
      categoryItems.value = value.docs.map((e) => "${e["name"]}").toList();
    });
  }

  getPhones() {
    phones.where({"id": "ytWshAy7ZmOpTXh7Fwzf"}).get().then((value) {
          value.docs.forEach((e) {
            print("${e.data()}");
          });
          phoneItems.value = value.docs.map((e) => "${e["name"]} : ${e["phone"]}").toList();
        });
  }
}

// class Category {
//   String name;

//   Category({required this.name});

//   static Category fromJson(Map<String, String> json) {
//     return Category(name: json['name'] as String);
//   }
// }
