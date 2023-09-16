import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodolist/utils/dimensions.dart';



class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  final int?lines;
  final double?height;
  final double?width;
  bool isObscure;
  AppTextField({Key? key,required this.hintText,this.icon,this.lines,this.height,this.width,
    required this.textController,this.isObscure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: lines,
        obscureText: isObscure?true:false,
        controller: textController,
        decoration: InputDecoration(
          //hintext
          hintText: hintText,
          prefixIcon: Icon(icon,color: Colors.black54,),
          //focusedborder
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.black54,
              )
          ),
          //enabledborder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.black54,
            ),
          ),
          //border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
          ),
        ),
      ),
    );
  }
}
