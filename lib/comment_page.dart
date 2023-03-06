import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_phone/common.dart';
import 'package:emergency_phone/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('Messages').orderBy('time').snapshots();
  final TextEditingController message = new TextEditingController();
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
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
              child: TextFormField(
                controller: message,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "ข้อความ",
                  fillColor: Color.fromARGB(199, 255, 255, 255),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 60),
                  backgroundColor: AppColor.violet,
                ),
                onPressed: () {
                  if (message.text.isNotEmpty) {
                    fs.collection('Messages').doc().set({
                      'message': message.text.trim(),
                      'time': DateTime.now(),
                      'email':
                          homeController.isAdmin.value ? "Admin" : _auth.currentUser?.email ?? "",
                    });

                    message.clear();
                  }
                },
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
            child: StreamBuilder(
                stream: _messageStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("something is wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.length == 0) {
                    return Center(child: Text("ไม่มีข้อความ"));
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        primary: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                          Timestamp t = qs['time'];
                          DateTime d = t.toDate();
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      qs['email'],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${d.day}/${d.month}/${d.year} ${d.hour}:${d.minute}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    qs['message'],
                                    style: TextStyle(color: Colors.black87),
                                  ),
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
                          );
                        }),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
