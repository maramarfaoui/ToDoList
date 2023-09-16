import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodolist/pages/add_event/add_event_widget.dart';
import 'package:mytodolist/pages/home/menu_page.dart';
import 'package:mytodolist/utils/app_constants.dart';
import 'package:mytodolist/utils/dimensions.dart';
import 'package:http/http.dart' as http;
import 'package:mytodolist/utils/globalvariables.dart';
import 'package:mytodolist/widgets/app_icon.dart';
import 'package:mytodolist/widgets/big_text.dart';
import 'package:mytodolist/widgets/small_text.dart';
import 'package:mytodolist/widgets/task.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? tasks;
  @override
  void initState() {
    super.initState();
    getTasks();
    print(tasks);
  }

  PageController pageController = PageController();
  void getTasks() async {
    var url = Uri.parse('${GlobalVariables().uri}/get-tasks');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);
    var jsonResponse = jsonDecode(response.body);
    tasks = jsonResponse['success'];
    setState(() {

    });
  }
  void refreshTasks() {
    getTasks();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: const MenuPage(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: "Today"),
                BigText(text: "March 6,2023")
              ],
            ),
            SizedBox(width: Dimensions.width30 ,),
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.search,color: Colors.black,size: Dimensions.iconsize40,),
            ),
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.notifications_none_outlined,color: Colors.black,size: Dimensions.iconsize40,),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: Dimensions.height20,),
          Container(
            height: Dimensions.pageViewAppContainer,
            margin: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
            padding: EdgeInsets.all(Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: GlobalVariables.primaryColor,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "keep it up Your daily\ngoals almost done!",color: Colors.white,size: Dimensions.font15,),
                    Container(
                      height: Dimensions.height50,
                      width: Dimensions.width150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: BigText(text: "View plan", color: Colors.black, size: Dimensions.font20,),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: CircularPercentIndicator(
                    radius: Dimensions.radius45,
                    lineWidth: Dimensions.line7,
                    percent:0.87,
                    center: BigText(text: "87%",color: Colors.white,),
                    progressColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Task Category"),
              SizedBox(width: Dimensions.width150,),
              Icon(Icons.arrow_forward,size: Dimensions.iconsize24,)
            ],
          ),
          SizedBox(height: Dimensions.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width:  Dimensions.pageViewContainerWidth,
                height: Dimensions.pageViewContainer ,
                padding: EdgeInsets.only(left: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.blueGrey.shade50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppIcon(icon: Icons.person_outline,backgroundColor: GlobalVariables.primaryColor,iconColor: Colors.white,size: Dimensions.iconsize40,iconSize: Dimensions.iconsize24,),
                        BigText(text: "Personel"),
                        SizedBox(width: Dimensions.width15,)
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    SmallText(text: "1 Plan Remaining", size: Dimensions.font15,),
                    SizedBox(height: Dimensions.height20,),
                   GestureDetector(
                     onTap: (){},
                     child:  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         BigText(text: "Go To Plan",color: GlobalVariables.primaryColor,size: Dimensions.font18,),
                         Icon(Icons.arrow_forward,size: Dimensions.iconsize40,color: GlobalVariables.primaryColor,)
                       ],
                     ),
                   )
                  ],
                ),
              ),
              Container(
                width:  Dimensions.pageViewContainerWidth,
                height: Dimensions.pageViewContainer ,
                padding: EdgeInsets.only(left: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.blueGrey.shade50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppIcon(icon: Icons.work_outline,backgroundColor: GlobalVariables.primaryColor,iconColor: Colors.white,size: Dimensions.iconsize40,iconSize: Dimensions.iconsize24,),
                        BigText(text: "Work"),
                        SizedBox(width: Dimensions.width15,)
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    SmallText(text: "3 Plan Remaining", size: Dimensions.font15,),
                    SizedBox(height: Dimensions.height20,),
                    GestureDetector(
                      onTap: (){},
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BigText(text: "Go To Plan",color: GlobalVariables.primaryColor,size: Dimensions.font18,),
                          Icon(Icons.arrow_forward,size: Dimensions.iconsize40,color: GlobalVariables.primaryColor,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Priority Task"),
              SizedBox(width: Dimensions.width150,),
              Icon(Icons.arrow_forward,size: Dimensions.iconsize24,)
            ],
          ),
          Expanded(child: SingleChildScrollView(
            child:tasks?.length==null?Container(): Column(
              children: [

                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tasks?.length,
                      itemBuilder: (_,index){
                        return TaskContainer(taskTitle: '${tasks?[index]['taskTitle']}',taskDate:'${tasks?[index]['taskDate']}',taskDescription: '${tasks?[index]['taskDescription']}');
                      }),


              ],
            ),
          )),
          SizedBox(height: Dimensions.height5,),
          Center(child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      //height: MediaQuery.of(context).size.height * 0.8,
                      child: AddEvent(refreshTasks: refreshTasks),
                    );
                  },
                );
              },
              child: AppIcon(icon: Icons.add, backgroundColor: GlobalVariables.primaryColor, iconColor: Colors.white,iconSize: Dimensions.iconsize40, size: Dimensions.iconsize50,)),),
          SizedBox(height: Dimensions.height10,)
        ],
      ),
    )
    );
  }
}
