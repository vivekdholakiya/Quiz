import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/admincontroller.dart';
import 'package:quizapp/controller/homecontroller.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  AdminController adminController = AdminController();
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Quiz",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          // title: Text(Get.arguments['name'].toString(),),
          centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Upload the Quiz",
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          controller: adminController.qustionController,
                          decoration: InputDecoration(
                              hintText: "Write a qustion", border: InputBorder.none)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "option-1",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: adminController.op1Controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter option 1",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "option-2",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: adminController.op2Controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter option 2",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "option-3",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: adminController.op3Controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter option 3",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "option-4",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: adminController.op4Controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter option 4",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Correct Answer",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: adminController.correctAnswerController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Correct Answer",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: adminController.quizList.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                        adminController.value = value;
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 16,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      adminController.addDataFirebase();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Add",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
