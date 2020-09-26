import 'package:counter/detail.dart';
import 'package:counter/services/gituser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> users = [];

  void setUser() async {
    GitUser instance = GitUser();
    await instance.getUser();
    setState(() {
      users = instance.users;
    });
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
      body: Container(
          child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detail(login: users[index]["login"])));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index]["avatar_url"]),
                ),
                title: Text(
                  "${users[index]["login"]}",
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
      )),
      backgroundColor: Colors.grey[900],
    );
  }
}
