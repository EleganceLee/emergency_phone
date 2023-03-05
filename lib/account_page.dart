import 'package:emergency_phone/auth_page.dart';
import 'package:emergency_phone/common.dart';
import 'package:emergency_phone/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final icons = [
    Icon(
      Icons.sentiment_very_dissatisfied_outlined,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.local_hospital_outlined,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.emergency_outlined,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.car_crash,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.build,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.assured_workload,
      size: 50,
      color: AppColor.violet,
    ),
    Icon(
      Icons.send_to_mobile_outlined,
      size: 50,
      color: AppColor.violet,
    ),
  ];

  @override
  void initState() {
    homeController.getCategorys();
    homeController.getPhones();
    super.initState();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: homeController.isAdmin.value
            ? Text(
                "สวัสดี Admin",
                style: TextStyle(color: AppColor.violet),
              )
            : Row(
                children: [
                  if (FirebaseAuth.instance.currentUser != null)
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 2)),
                      builder: (context, snapshot) => Text(
                        "${FirebaseAuth.instance.currentUser!.displayName ?? ""}",
                        style: TextStyle(color: AppColor.violet),
                      ),
                    ),
                  const SizedBox(width: 10),
                  Text(
                    "เกิดอะไรขึ้นกับคุณ",
                    style: TextStyle(color: AppColor.violet),
                  ),
                ],
              ),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              if (homeController.isAdmin.value == true) {
                Get.offAll(() => AuthPage());
                return;
              }

              FirebaseAuth.instance.signOut();
            },
            child: Text(
              "Logout",
              style: TextStyle(color: AppColor.violet),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(Get.width * 0.9, 50),
          backgroundColor: AppColor.violet,
        ),
        onPressed: () => _makePhoneCall("1222"),
        child: const Text(
          "Call",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Obx(() => homeController.categoryItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: RefreshIndicator(
                onRefresh: () async {
                  homeController.getCategorys();
                },
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                  ),
                  itemCount: homeController.categoryItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        homeController.currentIndex.value = 1;
                        homeController.nameFilter.value = homeController.categoryItems[index];
                        homeController.filterByName();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icons[index],
                          SizedBox(
                            height: 40,
                            child: Text(
                              textAlign: TextAlign.center,
                              homeController.categoryItems[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          : const Center(child: Text("ไม่มีข้อมูล"))),
    );
  }
}
