import 'package:flutter/material.dart';
import 'package:kalpas_project/models/newsinfo.dart';
import 'package:kalpas_project/screens/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
          child: MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: SignUp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  } 
}