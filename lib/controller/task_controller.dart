import 'package:flutter/material.dart';
import '../database/database_fetch.dart';
import '../model/task_data.dart';
import 'package:get/get.dart';
class TaskController extends GetxController {
var taskData = <TaskData>[].obs;
late TextEditingController addTaskController;
@override
void onInit() {
addTaskController = TextEditingController();
_getData();
super.onInit();
}
void _getData() {
DatabaseHelper.instance.queryAllRows().then((value) {
value.forEach((element) {
taskData.add(TaskData(id: element['id'], title: element['title']));
});
});
}
void addData() async {
await DatabaseHelper.instance
.insert(TaskData(title: addTaskController.text));
taskData.insert(
0, TaskData(id: taskData.length, title: addTaskController.text));
addTaskController.clear();
}
void deleteTask(int id) async {
await DatabaseHelper.instance.delete(id);
taskData.removeWhere((element) => element.id == id);
}
void updateTask(int id) async {
await DatabaseHelper.instance
.updateItem(TaskData(id:id,title: addTaskController.text));
final index = taskData.indexWhere((e) => e.id == id);
if (index > -1) taskData[index].title = addTaskController.text;
taskData.refresh();
addTaskController.clear();
} 

} 
