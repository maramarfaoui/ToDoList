import 'package:get/get.dart';
import 'package:mytodolist/pages/home/home_page.dart';
import 'package:mytodolist/pages/welcome_page/welcome_page.dart';
class RouteHelper{
  static const String initial="/";
  static const String homePage="/home";
  static String getInitial()=>'$initial';
  static String getHomePage()=>'$homePage';
  static List<GetPage> routes=[
    GetPage(name: initial, page: (){return const WelcomePage();},transition: Transition.fadeIn),
    GetPage(name: homePage, page: (){return const HomePage();},transition: Transition.fadeIn)
  ];
}