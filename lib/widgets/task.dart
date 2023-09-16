import 'package:flutter/material.dart';
import './big_text.dart';
import './small_text.dart';
import '../utils/dimensions.dart';
class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key, required this.taskTitle, required this.taskDate, required this.taskDescription}) : super(key: key);
  final String taskTitle;
  final String taskDate;
  final String taskDescription;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top: Dimensions.height10,bottom: Dimensions.height10),
      height: Dimensions.height100,
      decoration:  BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: Colors.white
      ),
      padding: EdgeInsets.all(Dimensions.width15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: taskTitle),
              SizedBox(height: Dimensions.height10,),
              SmallText(text: taskDate + ", " +taskDescription,size: Dimensions.font15,)
            ],
          ),
          Center(
            child: BigText(text: "Completed",color: Colors.green,),
          )
        ],
      ),
    );
  }
}
