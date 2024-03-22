// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_task_management/utils/app_colors.dart';
import 'package:flutter_app_task_management/widgets/button_widget.dart';
import 'package:flutter_app_task_management/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["try harder", "try smarter"];
    final leftEditIcon = Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      color: Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 40),
          alignment: Alignment.topLeft,
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 3.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/images.png"),
            ),
          ),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
          ),
          child: Row(
            children: [
              Icon(
                Icons.home,
                color: AppColors.secondaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Icon(
                Icons.calendar_month_sharp,
                color: AppColors.secondaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '2',
                style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: leftEditIcon,
                secondaryBackground: rightDeleteIcon,
                onDismissed: (DismissDirection direction) {},
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    showModalBottomSheet(
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (_) {
                          return Container(
                            height: 550,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonWidget(
                                      text: 'View',
                                      textColor: Colors.white,
                                      backgroundcolor: AppColors.mainColor),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ButtonWidget(
                                      text: 'Edit',
                                      textColor: AppColors.secondaryColor,
                                      backgroundcolor: AppColors.mainColor)
                                ],
                              ),
                            ),
                          );
                        });
                    return false;
                  } else {
                    return Future.delayed(Duration(seconds: 1),
                        () => direction == DismissDirection.endToStart);
                  }
                },
                key: ObjectKey(index),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child:
                      TaskWidget(text: myData[index], color: Colors.blueGrey),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
