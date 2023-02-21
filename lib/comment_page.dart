import 'package:emergency_phone/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ข้อเสนอแนะ",
          style: TextStyle(color: AppColor.violet),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "ข้อความ",
                    fillColor: Color.fromARGB(199, 255, 255, 255)),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 60),
                  backgroundColor: AppColor.violet,
                ),
                onPressed: () {},
                child: Text(
                  "ส่ง",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Material(
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Vitoria vagaga",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          " 15 min ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Like",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.favorite,
                          color: AppColor.violet,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
