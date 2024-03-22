import 'package:flutter/material.dart';
import 'package:flutter_app_task_management/utils/app_colors.dart';
import 'package:flutter_app_task_management/widgets/button_widget.dart';
import 'package:flutter_app_task_management/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(right: 20, left: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/2.jpeg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  hintText: "Task name",
                  borderRadius: 30,
                  textController: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintText: "Task Detail",
                  borderRadius: 15,
                  textController: detailController,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    text: "Add",
                    textColor: Colors.grey.shade500,
                    backgroundcolor: AppColors.mainColor)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
          ],
        ),
      ),
    );
  }
}
