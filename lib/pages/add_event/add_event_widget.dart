import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytodolist/routes/route_helper.dart';
import 'package:mytodolist/service/task_services.dart';
import 'package:mytodolist/utils/dimensions.dart';
import 'package:mytodolist/utils/globalvariables.dart';
import 'package:http/http.dart' as http;
import 'package:mytodolist/widgets/app_text_field.dart';
import 'package:mytodolist/widgets/big_text.dart';
import 'package:get/get.dart';
class AddEvent extends StatefulWidget {
  final VoidCallback refreshTasks;
  const AddEvent({Key? key, required this.refreshTasks}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleController= TextEditingController();
  final descriptionController= TextEditingController();
  final timeController= TextEditingController();
  final dateController= TextEditingController();
  String selectedCategory = "Personal";
  String selected="on";
  List? tasks;
  final TaskServices taskServices= TaskServices();
  //add task
  void addTask(){
    taskServices.saveTask(titleController.text, descriptionController.text, selectedCategory,timeController.text,dateController.text);
    widget.refreshTasks();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: selected=="on"?MediaQuery.of(context).size.height * 0.8:0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius30),topRight: Radius.circular(Dimensions.radius30))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(Dimensions.height10),
            padding: EdgeInsets.only(left: Dimensions.height100,right: Dimensions.height100),
            child: Center(
              child: Divider(
                color: Colors.grey,
                thickness: Dimensions.height5,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height20,),
          Center(child: BigText(text: "New Task", size: Dimensions.font26,)),
          Container(
            margin: EdgeInsets.only(right:Dimensions.height10,left:Dimensions.height10),
            padding: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
            child: const Center(
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          Expanded(child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              //height: Dimensions.pageTextContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Title Task"),
                  SizedBox(height: Dimensions.height5 ,),
                  AppTextField(hintText: "Add Task Name", textController: titleController),
                  SizedBox(height: Dimensions.height5 ,),
                  BigText(text: "Category"),
                  SizedBox(height: Dimensions.height5 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = "Personal";
                          });
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            color: selectedCategory == "Personal"
                                ? GlobalVariables.primaryColor:Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(Dimensions.radius10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.person_outline,color: selectedCategory == "Personal"? Colors.white:Colors.black,),
                              BigText(text: "Personal",color:  selectedCategory == "Personal"? Colors.white:Colors.black,size: Dimensions.font18,),
                              SizedBox(width: Dimensions.width15,)
                            ],
                          ),
                        ),
                      ),
                      //SizedBox(width: Dimensions.width10,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = "Work";
                          });
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: selectedCategory == "Work"
                                  ? GlobalVariables.primaryColor:Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(Dimensions.radius10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.work_outline,color: selectedCategory == "Work"? Colors.white:Colors.black,),
                              BigText(text: "Work",color: selectedCategory == "Work"? Colors.white:Colors.black,size: Dimensions.font18,),
                              SizedBox(width: Dimensions.width15,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height5 ,),
                  BigText(text: "Description"),
                  SizedBox(height: Dimensions.height5 ,),
                  AppTextField(hintText: "AddDescription", textController: descriptionController,lines: 3,),
                  SizedBox(height: Dimensions.height5 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Date"),
                          SizedBox(height: Dimensions.height5,),
                          AppTextField(hintText: "dd/mm/yy", textController: dateController,height: Dimensions.height60 ,width: Dimensions.width150,icon: Icons.calendar_month_outlined,)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Time"),
                          SizedBox(height: Dimensions.height5,),
                          AppTextField(hintText: "hh:mm", textController: timeController,height: Dimensions.height60 ,width: Dimensions.width150,icon: Icons.access_time_outlined,)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height50 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(Dimensions.radius10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              BigText(text: "Cancel",color: Colors.black,size: Dimensions.font18,),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width30,),
                      GestureDetector(
                        onTap: (){
                          addTask();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width150,
                          decoration: BoxDecoration(
                              color: GlobalVariables.primaryColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Create",color: Colors.white,size: Dimensions.font18,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10 ,),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
