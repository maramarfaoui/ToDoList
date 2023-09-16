import 'package:flutter/material.dart';
import 'package:mytodolist/utils/dimensions.dart';
import 'package:mytodolist/utils/globalvariables.dart';
import 'package:mytodolist/widgets/app_icon.dart';
import 'package:mytodolist/widgets/big_text.dart';
import 'package:mytodolist/widgets/small_text.dart';
class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          width: 200,
          margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
          height: double.maxFinite,
          color:Colors.white,
          child: Column(
            children: [
              SizedBox(height: Dimensions.height50,),
              AppIcon(icon: Icons.image,size: Dimensions.iconSize150,iconSize: Dimensions.iconProfile100,backgroundColor: Colors.grey.shade300,),
              SizedBox(height: Dimensions.height20,),
              BigText(text: "Radhwen",size: Dimensions.font26,),
              SizedBox(height: Dimensions.height5,),
              SmallText(text: "radhwen.rmili@esprit.tn",size: Dimensions.font20,),
              SizedBox(height: Dimensions.height20,),
              Container(
                padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                child: const Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              SizedBox(height: Dimensions.height50,),
              Row(
                children: [
                  AppIcon(icon: Icons.access_time_outlined,backgroundColor: GlobalVariables.primaryColor, iconColor: Colors.white,iconSize: Dimensions.iconSize30,size: Dimensions.iconsize50,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: "Today")
                ],
              ),
              SizedBox(height: Dimensions.height50,),
              Row(
                children: [
                  AppIcon(icon: Icons.calendar_month_outlined,backgroundColor: GlobalVariables.primaryColor, iconColor: Colors.white,iconSize: Dimensions.iconSize30,size: Dimensions.iconsize50,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: "Calendar")
                ],
              ),
              SizedBox(height: Dimensions.height50,),
              Row(
                children: [
                  AppIcon(icon: Icons.settings_outlined,backgroundColor: GlobalVariables.primaryColor, iconColor: Colors.white,iconSize: Dimensions.iconSize30,size: Dimensions.iconsize50,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: "Settings")
                ],
              ),
              SizedBox(height: Dimensions.height50,),
              Row(
                children: [
                  AppIcon(icon: Icons.share_outlined,backgroundColor: GlobalVariables.primaryColor, iconColor: Colors.white,iconSize: Dimensions.iconSize30,size: Dimensions.iconsize50,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: "Share")
                ],
              ),
              SizedBox(height: Dimensions.height50,),
            ],
          ),
        ),
      ),
    );
  }
}
