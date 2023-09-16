import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mytodolist/utils/globalvariables.dart';
import '../model/task.dart';
import '../widgets/show_custom_snackbar.dart';
class TaskServices{
  List? items;
  void saveTask( String taskTitle,
       String taskDescription,
       String taskCategory,
       String taskTime,
      String taskDate,
      ) async {
    var url = Uri.parse('${GlobalVariables().uri}/add-task');
    var headers = {'Content-Type': 'application/json'};
    var body = {
      'taskTitle': taskTitle,
      'taskCategory': taskCategory,
      'taskDescription': taskDescription,
      'taskTime': taskTime,
      'taskDate': taskDate,
    };
    var response = await http.post(url, headers: headers, body: json.encode(body));

    if (response.statusCode < 400) {
      // Task saved successfully
      print('Task saved successfully');
      showCustomSnackBar(title: "Added successfully","Don't forget what you came for!");
    } else {
      // Failed to save task
      showCustomSnackBar(title: "Errow while adding task","check your infos");
      print('Failed to save task');
    }
  }

}