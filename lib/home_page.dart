import 'package:emergency_phone/account_page.dart';
import 'package:emergency_phone/comment_page.dart';
import 'package:emergency_phone/common.dart';
import 'package:emergency_phone/controllers/home_controller.dart';
import 'package:emergency_phone/edit_page.dart';
import 'package:emergency_phone/phone_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = const [
    AccountPage(),
    PhonePage(),
    CommentPage(),
    EditPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages[homeController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          fixedColor: AppColor.violet,
          currentIndex: homeController.currentIndex.value,
          onTap: (index) => homeController.currentIndex.value = index,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: AppColor.violet,
              ),
            ),
            BottomNavigationBarItem(
              label: "Phone",
              icon: Icon(
                Icons.phone,
                color: AppColor.violet,
              ),
            ),
            BottomNavigationBarItem(
              label: "Comment",
              icon: Icon(
                Icons.comment,
                color: AppColor.violet,
              ),
            ),
            BottomNavigationBarItem(
              label: "Edit",
              icon: Icon(
                Icons.edit,
                color: AppColor.violet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
