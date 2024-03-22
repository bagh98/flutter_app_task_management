// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_app_task_management/screen/add_task.dart';
import 'package:flutter_app_task_management/screen/all_tasks.dart';
import 'package:flutter_app_task_management/utils/app_colors.dart';
import 'package:flutter_app_task_management/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '\n Start your beatiful day',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AddTask(),
                      transition: Transition.fade,
                      duration: Duration(seconds: 1));
                },
                child: ButtonWidget(
                    text: "Add Task",
                    textColor: Colors.white,
                    backgroundcolor: AppColors.mainColor),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AllTasks(),
                      transition: Transition.fade,
                      duration: Duration(seconds: 1));
                },
                child: ButtonWidget(
                    text: "View All",
                    textColor: AppColors.smallTextColor,
                    backgroundcolor: Colors.white),
              ),
            ]),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/1.jpg"),
          ),
        ),
      ),
    );
  }
}
