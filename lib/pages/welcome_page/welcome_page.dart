import 'dart:async';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mytodolist/routes/route_helper.dart';
import 'package:mytodolist/utils/dimensions.dart';
import 'package:mytodolist/utils/globalvariables.dart';
import 'package:mytodolist/widgets/big_text.dart';
import 'package:mytodolist/widgets/small_text.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List welcomeImages=[
    "welcome-three.png",
    "welcome-two.png",
    "welcome-one.png",
  ];
  List bigTexts=[
    "Update your profile",
    "Create a task",
    "achieve your goals"
  ];
  List smalltexts=[
    "You can mark your\nprogram during the work",
    "Write down your task\n so you don't forget",
    "achieve your goals on\n the path of success"
  ];
  final PageController controller = PageController(viewportFraction: 1);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to scroll through each page automatically
    timer = Timer.periodic(Duration(seconds: 4), (_) {
      final int? currentPage = controller.page?.round();
      final int nextPage = currentPage == welcomeImages.length - 1   ? 0 : currentPage! + 1;
      controller.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
         body: PageView.builder(
             controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: welcomeImages.length,
          itemBuilder: (_, index){
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/welcome_page_images/"+welcomeImages[index]),fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(height: Dimensions.height80),
                 DotsIndicator(
                  dotsCount: welcomeImages.length,
                  position: index,
                  decorator: DotsDecorator(
                    activeColor: GlobalVariables.primaryColor,
                    size: const Size.square(12.0),
                    activeSize: const Size(38.0, 12.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                 SizedBox(height: Dimensions.height80),
                 BigText(text: bigTexts[index],size: Dimensions.font30),
                SizedBox(height: Dimensions.height15,),
                SmallText(text: smalltexts[index], size: Dimensions.font20,color: Colors.black,),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){Get.toNamed(RouteHelper.getHomePage());},
                      child: BigText(text: "Skip"),
                    ),
                    SizedBox(height: Dimensions.width30,),
                    GestureDetector(
                      onTap: () {
                        if (index < welcomeImages.length - 1) {
                          controller.animateToPage(index + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        }
                        if(index==2){
                          Get.toNamed(RouteHelper.getHomePage());
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: Dimensions.iconsize60,
                            height: Dimensions.iconsize60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: GlobalVariables.primaryColor,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height20,)
              ],
            );
          }),
    )
    );
  }
}
