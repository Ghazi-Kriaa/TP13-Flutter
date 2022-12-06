import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
class HomePage extends StatelessWidget {
final TaskController _taskController = Get.put(TaskController());
 HomePage({super.key});

 late int idupdate;
// This function will be triggered when the floating button is pressed
 // It will also be triggered when you want to update an item
 void showMyForm(int? id, String? title) async {
 if (id!=null && title != null ) {
 idupdate=id ;
 _taskController.addTaskController.text=title;
 }
 } 

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Todo List")),
body: Container(
alignment: Alignment.topLeft,
padding: const EdgeInsets.all(16),
child: Column(
children: <Widget>[
Row(
children: <Widget>[
Expanded(
child: TextFormField(
controller: _taskController.addTaskController,
decoration: const InputDecoration(hintText: "Enter a task"),
)),
IconButton(
icon: const Icon(Icons.add),
onPressed: () {
_taskController.addData();
}),
IconButton(
 icon: const Icon(Icons.edit),
 onPressed: () {
 _taskController.updateTask(idupdate);
 }) 

],
),
Expanded(
child: Obx(() => ListView.builder(
itemCount: _taskController.taskData.length,
itemBuilder: (context, index) => ListTile(
leading: Text(_taskController.taskData[index].title),
trailing:Wrap(
 children: <Widget>[ 
  IconButton(
    icon: const Icon(Icons.edit),
 onPressed: ()
=>{showMyForm(_taskController.taskData[index].id!
,_taskController.taskData[index].title)}
 ),  
 IconButton(
icon: const Icon(Icons.delete),
onPressed: () => _taskController
.deleteTask(_taskController.taskData[index].id!)),
 ],
 ),
 ),
 )),
 ),
 ],
 ),
 ),
 );
 }
}  