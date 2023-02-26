import 'package:emergency_phone/add_phone_number.dart';
import 'package:emergency_phone/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final List<String> items = const [
    "conid-19",
    "การแพทย์",
    "เหตุด่วน เหตุร้าย",
    "การเดินทาง",
    "ไฟฟ้าประปา",
    "ธนาคาร",
    "เครือข่ายมือถือ",
    "อื่นๆ",
    "อื่นๆ",
    "อื่นๆ",
    "อื่นๆ",
    "อื่นๆ",
    "อื่นๆ",
    "อื่นๆ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit",
          style: TextStyle(color: AppColor.violet),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "แก้ไขข้อมูล",
                style: TextStyle(color: AppColor.violet, fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length, //จำนวน
                itemBuilder: (context, i) => Align(
                  alignment: Alignment.center,
                  child: Card(
                    child: SizedBox(
                      width: Get.width,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => AddPhoneNumberPage(
                                title: items[i],
                              ));
                        },
                        title: Text("แก้ไขข้อมูล ${items[i]}"),
                        trailing: Icon(
                          Icons.edit,
                          color: AppColor.violet,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
