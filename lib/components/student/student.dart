import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {

  int stateUpdator = 0;

  List <String> courseNames = ["this"];
  List <String> courseCodes;

  TextEditingController sessionTokenController = new TextEditingController();


  int _year;
  String _branch;
  String _group;

  List <DropdownMenuItem<int>> yearDropList = [];
  List <DropdownMenuItem<String>> branchDropList = [];
  List <DropdownMenuItem<String>> groupDropList = [];


  void buildDrops () {
    yearDropList = [];
    branchDropList = [];
    groupDropList = [];
    yearDropList.add(DropdownMenuItem(child: Text('1st year'), value: 1,));
    yearDropList.add(DropdownMenuItem(child: Text('2nd year'), value: 2,));
    yearDropList.add(DropdownMenuItem(child: Text('3rd year'), value: 3,));
    yearDropList.add(DropdownMenuItem(child: Text('4th year'), value: 4,));
    if (_year != null) {
      if(_year == 1) {
        branchDropList.add(DropdownMenuItem(child: Text('Group A'), value: 'A',));
        branchDropList.add(DropdownMenuItem(child: Text('Group B'), value: 'B',));
      }
      else if(_year == 2) {
        branchDropList.add(DropdownMenuItem(child: Text('COE'), value: 'COE',));
        branchDropList.add(DropdownMenuItem(child: Text('ENC'), value: 'ENC',));
        branchDropList.add(DropdownMenuItem(child: Text('ECE'), value: 'ECE',));
        branchDropList.add(DropdownMenuItem(child: Text('CHE'), value: 'CHE',));
        branchDropList.add(DropdownMenuItem(child: Text('CIE'), value: 'CIE',));
        branchDropList.add(DropdownMenuItem(child: Text('EIC'), value: 'EIC',));
        branchDropList.add(DropdownMenuItem(child: Text('MEE'), value: 'MEE',));
        branchDropList.add(DropdownMenuItem(child: Text('ELE'), value: 'ELE',));
        branchDropList.add(DropdownMenuItem(child: Text('MPE'), value: 'MPE',));
        branchDropList.add(DropdownMenuItem(child: Text('MTX'), value: 'MTX',));
        branchDropList.add(DropdownMenuItem(child: Text('BTD'), value: 'BTD',));
      }
      else if(_year == 3) {
        branchDropList.add(DropdownMenuItem(child: Text('COE'), value: 'COE',));
        branchDropList.add(DropdownMenuItem(child: Text('ENC'), value: 'ENC',));
        branchDropList.add(DropdownMenuItem(child: Text('ECE'), value: 'ECE',));
        branchDropList.add(DropdownMenuItem(child: Text('CHE'), value: 'CHE',));
        branchDropList.add(DropdownMenuItem(child: Text('CIE'), value: 'CIE',));
        branchDropList.add(DropdownMenuItem(child: Text('EIC'), value: 'EIC',));
        branchDropList.add(DropdownMenuItem(child: Text('MEE'), value: 'MEE',));
        branchDropList.add(DropdownMenuItem(child: Text('ELE'), value: 'ELE',));
        branchDropList.add(DropdownMenuItem(child: Text('MPE'), value: 'MPE',));
        branchDropList.add(DropdownMenuItem(child: Text('MTX'), value: 'MTX',));
        branchDropList.add(DropdownMenuItem(child: Text('BTD'), value: 'BTD',));
      }
      else if(_year == 4) {
        branchDropList.add(DropdownMenuItem(child: Text('COE'), value: 'COE',));
        branchDropList.add(DropdownMenuItem(child: Text('ENC'), value: 'ENC',));
        branchDropList.add(DropdownMenuItem(child: Text('ECE'), value: 'ECE',));
        branchDropList.add(DropdownMenuItem(child: Text('CHE'), value: 'CHE',));
        branchDropList.add(DropdownMenuItem(child: Text('CIE'), value: 'CIE',));
        branchDropList.add(DropdownMenuItem(child: Text('EIC'), value: 'EIC',));
        branchDropList.add(DropdownMenuItem(child: Text('MEE'), value: 'MEE',));
        branchDropList.add(DropdownMenuItem(child: Text('ELE'), value: 'ELE',));
        branchDropList.add(DropdownMenuItem(child: Text('MPE'), value: 'MPE',));
        branchDropList.add(DropdownMenuItem(child: Text('MTX'), value: 'MTX',));
        branchDropList.add(DropdownMenuItem(child: Text('BTD'), value: 'BTD',));
      }
      if(_branch != null) {
        if(_branch == 'COE') {
          for(int i = 0; i < 28; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('COE-${i+1}'), value: 'COE-${i+1}',),);
          }
        }
        else if(_branch == 'ENC') {
          for(int i = 0; i < 6; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('ENC-${i+1}'), value: 'COE-${i+1}',),);
          }
        }
        else if(_branch == 'ECE') {
          for(int i = 0; i < 6; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('ECE-${i+1}'), value: 'COE-${i+1}',),);
          }
        }
        else if(_branch == 'CIE') {
          for(int i = 0; i < 4; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('CIE-${i+1}'), value: 'CIE-${i+1}',),);
          }
        }
        else if(_branch == 'EIC') {
          for(int i = 0; i < 2; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('CHE-${i+1}'), value: 'CHE-${i+1}',),);
          }
        }
        else if(_branch == 'CHE') {
          for(int i = 0; i < 2; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('CHE-${i+1}'), value: 'CHE-${i+1}',),);
          }
        }
        else if(_branch == 'MEE') {
          for(int i = 0; i < 12; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('MEE-${i+1}'), value: 'MEE-${i+1}',),);
          }
        }
        else if(_branch == 'MPE') {
          for(int i = 0; i < 2; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('MPE-${i+1}'), value: 'MPE-${i+1}',),);
          }
        }
        else if(_branch == 'MTX') {
          for(int i = 0; i < 2; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('MTX-${i+1}'), value: 'MTX-${i+1}',),);
          }
        }
        else if(_branch == 'BTD') {
          for(int i = 0; i < 3; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('BTD-${i+1}'), value: 'BTD-${i+1}',),);
          }
        }
        else if(_branch == 'ELE') {
          for(int i = 0; i < 6; i++) {
            groupDropList.add(DropdownMenuItem(child: Text('ELE-${i+1}'), value: 'ELE-${i+1}',),);
          }
        }
      }
    }
  }

  Mutation markAttendance() {
    return Mutation(
      options: MutationOptions(document: """
            mutation markAttendance(\$token: String!){
              markAttendance(token: \$token)
            }
        """),
      builder: (
          RunMutation runMutation,
          QueryResult result,
          ) {
        return RaisedButton(
          onPressed: () => markNewAttendance(runMutation),
          child: Text('Mark Attendance'),
          color: Colors.pink, //specify background color for the button here
          colorBrightness: Brightness.dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
          disabledColor: Colors.blueGrey, // specify color when the button is disabled
          highlightColor: Colors.red, //color when the button is being actively pressed, quickly fills the button and fades out after
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        );
      },
      onCompleted: (dynamic res) {
        if (res == null) {
          createAlertDialog(context, "Error", "No Such Class");
        } else {
          print (res);
          if(res["markAttendance"] == 'Marked Present') {
            createAlertDialog(context, "Success", res["markAttendance"]);
          }
          else {
            createAlertDialog(context, "Error", res["markAttendance"]);
          }
        }
      },
    );
  }

  void markNewAttendance(runMutation) {
    runMutation({
      "token": sessionTokenController.text,
    });
  }

  createAlertDialog (BuildContext context, String title, String content) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Attendance Manager"),
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container (
                    margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 54.0),
                    child: Material (
                      elevation: 8.0,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32.0),
                      child: InkWell (
                        onTap: ()=> Navigator.pushReplacementNamed(context, '/joinCourse'),
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
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  TextFormField(
                    controller: sessionTokenController,
                    decoration: InputDecoration(
                      labelText: "Session Token",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Session Token cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  markAttendance(),
                  Expanded(
                    flex: 1,
                    child: Query(options: QueryOptions(document: """
              query studentCourses{
                studentCourses {
                  name
                  code
                }
              }
              """,
                        variables: <String, dynamic>{},
                        pollInterval: 100,
                        fetchPolicy: FetchPolicy.noCache),
                        builder: (QueryResult result, {VoidCallback refetch}) {
                          if (result.errors != null) {
                            return Center(
                              child: Text(result.errors.toString()),
                            );
                          }
                          if (result.loading) {
                            return Center(
                              child: Text("Loading"),
                            );
                          }
                          List courses = result.data["studentCourses"];
                          return ListView.builder(
                              itemCount: result.data["studentCourses"].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: 16.0, left: 12.0, right: 12.0),
                                    child: Material(
                                        elevation: 14.0,
                                        borderRadius: BorderRadius.circular(12.0),
                                        shadowColor: Color(0x802196F3),
                                        color: Colors.white,
                                        child: InkWell(
                                          // Do onTap() if it isn't null, otherwise do print()
                                            onTap: () => {},
                                            child: Padding(
                                              padding: const EdgeInsets.all(24.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                            '${courses[index]["code"]}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontSize: 34.0)),
                                                        Text(
                                                            '${courses[index]["name"]}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .redAccent)),
                                                      ],
                                                    ),
                                                    Material(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius
                                                          .circular(24.0),
                                                      child: Center(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .all(16.0),
                                                            child: Icon(Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 30.0),
                                                          )
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                            )
                                        )
                                    )
                                );
                              });
                        }),
                  )
                ])
        )
    );
  }

//  void getCourses () async{
//    await GraphQLProvider.of(context).value.query(QueryOptions(document: """
//      query studentCourses {
//        studentCourses {
//          code
//          name
//        }
//      }
//      """, pollInterval: 100, fetchPolicy: FetchPolicy.noCache)).then((res) => {
//        setState(() {
//          courseNames.add(res.data["studentCourses"]["name"]);
//          courseCodes.add(res.data["studentCourses"]["code"]);
//        })
//      });
//  }

  void addAttendance () {

  }

}