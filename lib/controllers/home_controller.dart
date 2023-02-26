import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController inputPhone = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference categorys = FirebaseFirestore.instance.collection('category');

  var currentIndex = 0.obs;

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': "lee", // John Doe
          'company': "lee company", // Stokes and Sons
          'age': 18 // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> getUser() {
    return users.get().then((value) => print("test : ${value.docs.length}"));
  }

  Future<void> getCategory() {
    return categorys.get().then((value) {
      value.docs.forEach((element) {
        print("test : ${element.id}");
        // print("test : ${element.get("name")}");
        if (element.id == "โทรศัพท์ฉุกเฉินด้านการแพทย์") {}
        // print("test : ${element.data()}");
      });
    });
  }
}
