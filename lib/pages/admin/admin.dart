import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admincontroller.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  AdminController adminController = AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height / 2),
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              height: Get.height+10,
              width: Get.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(Get.width, 110))),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Form(
                  child: Column(
                children: [
                  Text(
                    "Let's start with Admin!",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Get.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 160, 169, 147),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: adminController.usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the username ";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 147),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 160, 169, 147),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: adminController.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the password ";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 147),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            adminController.loginAdminFun();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
