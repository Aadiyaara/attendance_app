import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/AppModel.dart';

class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Manager"),
      ),
      body: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Query(options: QueryOptions(document: """
                query sessionStudents ( \$sessionId: String! ){
                  sessionStudents ( sessionId: \$sessionId ) {
                    _id
                    name
                  }
                }
                """, variables: <String, dynamic> {
            "sessionId": model.sessionId
          }, pollInterval: 100, fetchPolicy: FetchPolicy.noCache), builder: (QueryResult result, {VoidCallback refetch}) {
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
            List students = result.data["sessionStudents"];
            print(students);
            return ListView.builder(
                itemCount: result.data["sessionStudents"].length,
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
                              onTap: () => {  },
                              child: Padding (
                                padding: const EdgeInsets.all(24.0),
                                child: Row (
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget> [
                                      Column (
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget> [
                                          Text('${students[index]["name"]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
//                                          Text('Attendance: ${sessions[index]["attendance"]}', style: TextStyle(color: Colors.redAccent)),
//                                          SafeArea(child: Text('Date Created: ${sessions[index]["dateCreated"]}'.split('GMT')[0], style: TextStyle(color: Colors.redAccent))),
                                        ],
                                      ),
                                      Material (
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(24.0),
                                          child: Center (
                                              child: Padding (
                                                padding: EdgeInsets.all(16.0),
                                                child: Icon(Icons.add, color: Colors.white, size: 30.0),
                                              )
                                          )
                                      )
                                    ]
                                ),
                              )
                          )
                      )
                  );
                }
            );
          }
          )
      ),
    )
    ));
  }

  goToSession (model, sessionId) {
    model.setSessionId(sessionId);
    Navigator.pushNamed(context, '/session');
  }
}