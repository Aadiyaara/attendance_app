import 'package:flutter/material.dart';

// Phases
import './components/student/student.dart';
import './components/teacher/teacher.dart';

// graphql Provider
import 'package:graphql_flutter/graphql_flutter.dart';

//Temporary
import 'workflow/pages/main_page.dart';
import 'workflow/pages/ui/login_page.dart';
import 'workflow/pages/ui/mark_att.dart';

import './components/teacher/create_course.dart';

//Components
import './components/pedestal/interface.dart';

//Tests
import './components/student/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final HttpLink httpLink = HttpLink(
        uri: 'https://attendanceappbackend.herokuapp.com/graphql');

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
        GraphQLClient(link: httpLink as Link,
            cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject))
    );

    return GraphQLProvider(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          '/teacher': (BuildContext context) => Teacher(),
          '/student': (BuildContext context) => Student(),
          '/create': (BuildContext context)=> CreateCourse(),
        },
      ),
      client: client,
    );
  }
}