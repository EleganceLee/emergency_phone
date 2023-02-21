import 'package:emergency_phone/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhoneNumberPage extends StatefulWidget {
  String title;

  AddPhoneNumberPage({super.key, required this.title});

  @override
  State<AddPhoneNumberPage> createState() => _AddPhoneNumberPageState();
}

class _AddPhoneNumberPageState extends State<AddPhoneNumberPage> {
  final List<String> items = [
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
    "1234-4444",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.violet),
        centerTitle: true,
        title: Text(
          "เพิ่มข้อมูล",
          style: TextStyle(color: AppColor.violet),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "เพิ่มข้อมูล ${widget.title}",
              style: TextStyle(
                color: AppColor.violet,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "เบอร์โทร",
                  fillColor: Color.fromARGB(199, 255, 255, 255)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(Get.width * 0.9, 50),
                backgroundColor: AppColor.violet,
              ),
              onPressed: () {},
              child: const Text(
                "+ Add",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
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
                        title: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: AppColor.violet,
                            ),
                            Text(" ${items[i]}"),
                          ],
                        ),
                        trailing: Icon(
                          Icons.delete,
                          color: AppColor.red,
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
