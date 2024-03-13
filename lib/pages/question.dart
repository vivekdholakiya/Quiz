import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/controller/admincontroller.dart';
import 'package:quizapp/database/databasehelper.dart';
import 'homescreen.dart';

class QuestionScreen extends StatefulWidget {
  String category;

  QuestionScreen({super.key, required this.category});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  getonTheLoad() async {
    QuizStrim = await DatabaseHelper().getCategoryData(widget.category);
    setState(() {});
  }

  AdminController adminController = AdminController();
  Stream? QuizStrim;
  PageController pageController = PageController();

  Widget allQuiz() {
    return StreamBuilder(
      stream: QuizStrim,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
            onPageChanged: (value) {
              adminController.show = false;
              setState(() {});
            },
            controller: pageController,
            itemCount: snapshot.data.docs.length + 1,
            itemBuilder: (context, index) {
              DocumentSnapshot? ds;
              if (snapshot.data.docs.length != index) {
                ds = snapshot.data.docs[index];
              }
              return snapshot.data.docs.length == index
                  ? Padding(
                    padding: EdgeInsets.only(top: Get.height/5),
                    child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            markCount <= index / 2 - 1
                                ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              "please prectise more and then try!!!!",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Lottie.asset(
                                            "assets/lottie/oops.json",
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              "You have archived $markCount mark on your ${Get.arguments["name"]} test",
                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                )
                                : Column(
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: Lottie.asset(
                                          "assets/lottie/congo.json",
                                        ),
                                      ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "You have archived $markCount mark on your ${Get.arguments["name"]} test",
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                          ],
                        ),
                      ),
                  )
                  : Container(
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(width: 2)),
                                      child: Center(
                                        child: Text("${index + 1}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width - 90,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Text("${ds!["qustion"]}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    adminController.show = true;
                                    if (ds!["correct"] == ds["op1"]) {
                                      markCount = markCount + 1;
                                      Get.snackbar("", "Good! Your Answer is correct",
                                          snackPosition: SnackPosition.values[0],
                                          duration: Duration(milliseconds: 900));
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Your Answer is not correct",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.transparent,
                                        textColor: Colors.black87,
                                        fontSize: 16.0,
                                      );
                                    }
                                    setState(() {});
                                  },
                                  child: adminController.show
                                      ? Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] == ds["op1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("A) ${ds["op1"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      : Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff818181), width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("A) ${ds["op1"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    adminController.show = true;
                                    if (ds!["correct"] == ds["op2"]) {
                                      markCount = markCount + 1;
                                      Get.snackbar("", "Good! Your Answer is correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                    } else {
                                      Get.snackbar("", "Your Answer is not correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                    setState(() {});
                                  },
                                  child: adminController.show
                                      ? Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] == ds["op2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("B) ${ds["op2"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      : Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff818181), width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("B) ${ds["op2"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    adminController.show = true;
                                    if (ds!["correct"] == ds["op3"]) {
                                      markCount = markCount + 1;
                                      Get.snackbar("", "Good! Your Answer is correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                    } else {
                                      Get.snackbar("", "Your Answer is not correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                    setState(() {});
                                  },
                                  child: adminController.show
                                      ? Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] == ds["op3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("C) ${ds["op3"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      : Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff818181), width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("C) ${ds["op3"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    adminController.show = true;
                                    if (ds!["correct"] == ds["op4"]) {
                                      markCount = markCount + 1;
                                      Get.snackbar("", "Good! Your Answer is correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                      print("${markCount}");
                                    } else {
                                      Get.snackbar("", "Your Answer is not correct",
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                    setState(() {});
                                  },
                                  child: adminController.show
                                      ? Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] == ds["op4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("D) ${ds["op4"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      : Container(
                                          width: Get.width,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff818181), width: 1.5),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("D) ${ds["op4"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    adminController.show = false;
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey, width: 2),
                                            borderRadius: BorderRadius.circular(50)),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: Get.height / 3),
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    getonTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(60)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    Get.arguments['name'].toString(),
                    style: TextStyle(
                        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 10,
            ),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
