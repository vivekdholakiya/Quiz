import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/admincontroller.dart';
import 'package:quizapp/controller/homecontroller.dart';
import 'package:quizapp/pages/admin/admin.dart';
import 'package:quizapp/pages/question.dart';
int markCount = 0;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HOmeState();
}

class _HOmeState extends State<HomeScreen> {
  @override
  void initState() {
    // print("${adminController.markCount}");
    super.initState();
  }

  HomeController homeController = HomeController();
  AdminController adminController = AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf3f6),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height / 4,
                    padding: EdgeInsets.only(left: 20, top: 30),
                    decoration: BoxDecoration(
                        color: Color(0xff2a2b31),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/profile.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 8),
                          child: Text("Vivek Dholakiya",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              Get.to(AdminScreen());
                            },
                            child: Text("Admin\n Login ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black54, borderRadius: BorderRadius.circular(30)),
                    width: Get.width,
                    margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          child: Image.network(
                            "https://image.shutterstock.com/image-vector/question-mark-icon-260nw-157594730.jpg",
                            width: 150,
                            height: 160,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Play &\nWin ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold)),
                          Text("Play quiz by guessing \nthe image ",
                              style: TextStyle(
                                  color: Color(0xffa4a4a4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Top Quiz category",
                    style: TextStyle(
                        color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.CategoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                              QuestionScreen(
                                  category: homeController.CategoryList[index]['name']),
                              arguments: {
                                'name': homeController.CategoryList[index]['name'],
                              });
                          markCount=0;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image(
                                      image: NetworkImage(
                                          "${homeController.CategoryList[index]["img"]}"),
                                      fit: BoxFit.cover),
                                  // child: Text(homeController.CategoryList[index]["img"]),
                                ),
                                Spacer(),
                                Text(homeController.CategoryList[index]["name"],
                                    style: TextStyle(fontSize: 20)),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
