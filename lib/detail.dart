import 'package:counter/services/gituser.dart';
import 'package:flutter/material.dart';
import 'package:link/link.dart';

class Detail extends StatefulWidget {
  final String login;
  const Detail({Key key, this.login}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Map userdetail = {};
  void setUserDetail() async {
    GitUser user = GitUser(login: widget.login);
    await user.getUserDetail();
    setState(() {
      userdetail = user.user;
    });
  }

  void initState() {
    super.initState();
    setUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('User Detail'),
      ),
      body: userdetail.isNotEmpty
          ? Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundImage: NetworkImage(userdetail['avatar_url']),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.grey[200],
                        fontSize: 20),
                  ),
                  SizedBox(),
                  Text(
                    '${userdetail['login']}',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.grey[200],
                        fontSize: 20),
                  ),
                  SizedBox(),
                  Text(
                    '${userdetail['followers']}',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Following',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.grey[200],
                        fontSize: 20),
                  ),
                  SizedBox(),
                  Text(
                    '${userdetail['following']}',
                    style: TextStyle(
                        letterSpacing: 2.1,
                        color: Colors.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(
                        Icons.link,
                        color: Colors.grey[400],
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Link(
                        child: Text(
                          'Github',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        url: userdetail['url'],
                      )
                    ],
                  )
                ],
              ),
            )
          : Center(child: Text('sout oo')),
    );
  }
}
