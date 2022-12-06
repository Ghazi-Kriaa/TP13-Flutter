class TaskData {
 int? id;
 String title;
 TaskData({this.id, required this.title});
 Map<String, dynamic> toMap() {
 return {'id': id, 'title': title};
 }
}