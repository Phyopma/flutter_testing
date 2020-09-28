import 'package:counter/bloc/detail/bloc/detail_bloc.dart';
import 'package:counter/detail.dart';
import 'bloc/user/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
      ),
      BlocProvider<DetailBloc>(
        create: (context) => DetailBloc(),
      )
    ],
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<dynamic> users = [];

  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserBlocFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('UserList'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return CircularProgressIndicator();
          }
          if (state is UserData) {
            return Container(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(login: state.users[index].login)));
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(state.users[index].avatar),
                        ),
                        title: Text(
                          "${state.users[index].login}",
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 18),
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
              ),
            );
          }
        },
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
