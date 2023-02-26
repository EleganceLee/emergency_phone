import 'package:emergency_phone/common.dart';
import 'package:emergency_phone/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  @override
  void initState() {
    homeController.getPhones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Book",
          style: TextStyle(color: AppColor.violet),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                "หมายเลขที่เกี่ยวข้องกับ\nCOVID-19",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColor.violet,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black38,
                ),
              ),
              child: Obx(
                () => homeController.phoneItems.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () async {
                          homeController.getPhones();
                        },
                        child: ListView.builder(
                          itemCount: homeController.phoneItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: AppColor.violet,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(homeController.phoneItems[index]),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
