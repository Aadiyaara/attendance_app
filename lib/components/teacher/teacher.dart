//import 'package:flutter/material.dart';
//
//// Teacher UI
//import './ui/ui.dart';
//
//class Teacher extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return TeacherUI();
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/AppModel.dart';
import './Attendance.dart';

class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {

  Future<String> getTeacher (String arg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(arg);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold (
        appBar: PreferredSize(
          child: AppBar (
            elevation: 2.0,
            backgroundColor: Colors.white,
            title: Text('Attendance Manager', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
            actions: <Widget> [

            ],
          ),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08)
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
//              color: Colors.pink,
              child: Container (
                margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 54.0),
                child: Material (
                  elevation: 8.0,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32.0),
                  child: InkWell (
                    onTap: ()=>Navigator.pushReplacementNamed(context, '/create'),
                    child: Padding (
                      padding: EdgeInsets.all(12.0),
                      child: Row (
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          Icon(Icons.add, color: Colors.white),
                          Padding(padding: EdgeInsets.only(right: 16.0)),
                          Text('ADD A COURSE', style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.72,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Query(options: QueryOptions(document: """
                query teacherCourses{
                  teacherCourses {
                    _id
                    name
                    year
                    type
                    branch
                    group
                    code
                    token
                    strength
                  }
                }
                """, variables: <String, dynamic> {}, pollInterval: 10, fetchPolicy: FetchPolicy.noCache), builder: (QueryResult result, {VoidCallback refetch}) {
                      if(result.errors != null) {
                        return Center(
                          child: Text(result.errors.toString()),
                        );
                      }
                      if(result.loading) {
                        return Center(
                          child: Text("Loading"),
                        );
                      }
                      List courses = result.data["teacherCourses"];
                      print(courses);
                      return ScopedModelDescendant<AppModel>(
                          builder: (context, child, model) => ListView.builder(
                            itemCount: result.data["teacherCourses"].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
                                child: Material(
                                    elevation: 14.0,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shadowColor: Color(0x802196F3),
                                    color: Colors.white,
                                    child: InkWell(
                                      // Do onTap() if it isn't null, otherwise do print()
                                        onTap: () => showBottomSheet(context: context, builder: (builder) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.music_note),
                                                title: Text('Create Session'),
                                                onTap: () => {createSessionScanerio(model, courses[index]['token'], courses[index]['_id'], courses[index]['name'], courses[index]["year"], courses[index]["branch"], courses[index]["group"])},
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.music_note),
                                                title: Text('Attendance View'),
                                                onTap: () => {goToAttendanceView(model, courses[index]['_id'], courses[index]['code'])},
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.photo_album),
                                                title: Text('Course Information'),
                                                onTap: () => {goToCourse(model, courses[index]['token'], courses[index]['_id'], courses[index]['code'], courses[index]["name"], courses[index]["strength"])},
                                              ),
                                            ],
                                          );
                                        }),
                                        child: Container(
                                          child: Padding (
                                            padding: const EdgeInsets.all(24.0),
                                            child: Column (
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget> [
                                                Text('${courses[index]["code"]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('${courses[index]['name']}', style: TextStyle(color: Colors.redAccent)),
                                                    Row(children: <Widget>[
                                                      Text('${courses[index]['group']}', style: TextStyle(color: Colors.redAccent)),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text('${courses[index]['type']}', style: TextStyle(color: Colors.redAccent)),
                                                      )
                                                    ],)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    )
                                ),
                              );
                            },
                          )
                      );
                    },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                          child: ScopedModelDescendant<AppModel>(
                              builder: (context, child, model) => RaisedButton(
                                color: Colors.red,
                                onPressed: () async {
                                  model.setToken(null);
                                  model.setId(null);
                                  SharedPreferences preferences = await SharedPreferences.getInstance();
                                  await preferences.setString('token', null);
                                  await preferences.setString('userId', null);
                                  await preferences.setString('userType', null);
                                  Navigator.pushReplacementNamed(context, '/auth');
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
          ],
        )
      );
  }

  createSessionScanerio (model, token, id, courseName, courseYear, courseBranch, courseGroup) {
    model.setCourseToken(token);
    model.setCourseId(id);
    model.setCourseName(courseName);
    model.setCourseYear(courseYear);
    model.setCourseBranch(courseBranch);
    model.setCourseGroup(courseGroup);
    Navigator.pushNamed(context, '/createSess');
  }

  goToAttendanceView (model, id, code) {
    model.setCourseId(id);
    model.setCourseCode(code);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Attendance(courseCode: code, courseId: id)
      )
    );
  }

  goToCourse (model, token, id, code, name, strength) {
    model.setCourseToken(token);
    model.setCourseId(id);
    model.setCourseCode(code);
    model.setCourseName(name);
    model.setCourseStrength(strength);
    Navigator.pushNamed(context, '/course');
  }

}