// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/screen/more_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller; //내가 late 추가
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DanFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        //accentColor: Colors.white, //예전 코드라 실행이 안됨
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
