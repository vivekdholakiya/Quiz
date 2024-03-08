import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/database/databasehelper.dart';
import '../pages/admin/addquiz.dart';

class AdminController extends GetxController {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController qustionController = TextEditingController();
  TextEditingController op1Controller = TextEditingController();
  TextEditingController op2Controller = TextEditingController();
  TextEditingController op3Controller = TextEditingController();
  TextEditingController op4Controller = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();

  loginAdminFun() async {
    await FirebaseFirestore.instance.collection("admin").get().then((database) {
      database.docs.forEach((res) {
        if (res.data()['id'] != usernameController.text.trim()) {
          Get.snackbar("", "Your id is not correct", snackPosition: SnackPosition.BOTTOM);
        } else if (res.data()["password"] != passwordController.text.trim()) {
          Get.snackbar("", "Your password is not correct",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.to(AddQuiz(), arguments: {'name': usernameController.text});
        }
      });
    });
  }
  bool show = false;
  List<String> quizList = [
    'C',
    'C++',
    'Asp.net',
    'HTML',
    'Css',
    'Java Script',
    'Java',
    'Kotlin',
    'Android',
    'Dart',
    'Flutter',
    'Swift',
  ];

  String value="";

  Stream? QuizStrim;

  addDataFirebase(){
    if (qustionController.text != "" &&
        op1Controller.text != "" &&
        op2Controller.text != "" &&
        op3Controller.text != "" &&
        op4Controller.text != "" &&
        correctAnswerController.text != "" &&
        value != "") {
      // String addId = randomAlphaNumeric(10);
      Map<String, dynamic> addQuizFirebase = {
        // "Id": addId,
        "qustion":
        qustionController.value.text.toString(),
        "op1": op1Controller.value.text.toString(),
        "op2": op2Controller.value.text.toString(),
        "op3": op3Controller.value.text.toString(),
        "op4": op4Controller.value.text.toString(),
        "correct":correctAnswerController.value.text
            .toString(),
      };
          DatabaseHelper().addQuiz(addQuizFirebase, value,
          qustionController.text)
          .then((value) {
        Get.snackbar("", "Quiz added",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange);
      });
      correctAnswerController.clear();
      op1Controller.clear();
      op2Controller.clear();
      op3Controller.clear();
      op4Controller.clear();
      qustionController.clear();
    }
    else{
      Get.snackbar("", "Your detail is not correct", snackPosition: SnackPosition.BOTTOM);

    }
  }

}
