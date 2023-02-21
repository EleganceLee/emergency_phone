import 'package:emergency_phone/common.dart';
import 'package:emergency_phone/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final items = const [
    "conid-19",
    "การแพทย์",
    "เหตุด่วน\nเหตุร้าย",
    "การเดินทาง",
    "ไฟฟ้าประปา",
    "ธนาคาร",
    "เครือข่ายมือถือ",
  ];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "เกิดอะไรขึ้นกับคุณ",
          style: TextStyle(color: AppColor.violet),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(Get.width * 0.9, 50),
          backgroundColor: AppColor.violet,
        ),
        onPressed: () {},
        child: Text(
          "Call",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 40,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                homeController.currentIndex.value = 1;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  icons[index],
                  Text(items[index]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
