import 'package:flutter/material.dart';
import './view/home_page.dart';
main(List<String> args) {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(primarySwatch: Colors.indigo),
home: HomePage(),
);
}
}