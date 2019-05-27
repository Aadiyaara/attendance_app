import 'package:flutter/material.dart';

// Phases
import './components/student/student.dart';
import './components/teacher/teacher.dart';

//Temporary
import 'workflow/pages/main_page.dart';
import 'workflow/pages/ui/login_page.dart';
import 'workflow/pages/ui/mark_att.dart';

//Components
import './components/pedestal/interface.dart';

//Tests
import './components/student/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/teacher':(BuildContext context)=>Teacher(),
        '/student':(BuildContext context)=>Student(),
      },
    );
  }
}