import 'package:counter/detail.dart';
import 'package:counter/services/gituser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<GitUser>(
    create: (context) => GitUser(),
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<dynamic> users = [];

  void setUser() async {
    var user = context.read<GitUser>();
    await user.getUser();
  }

  void initState() {
    super.initState();
    setUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('UserList'),
      ),
      body: Consumer<GitUser>(
        builder: (context, users, child) {
          return Container(
              child: ListView.builder(
            itemCount: users.name.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Detail(login: users.name[index])));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users.avatar[index]),
                    ),
                    title: Text(
                      "${users.name[index]}",
                      style: TextStyle(color: Colors.grey[200], fontSize: 18),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey[200],
                    ),
                  ),
                  Divider(height: 4, color: Colors.grey[200]),
                ],
              );
            },
          ));
        },
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
