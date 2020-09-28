import 'package:counter/bloc/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link/link.dart';

class Detail extends StatefulWidget {
  final String login;
  const Detail({Key key, this.login}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void didChangeDependencies() {
    BlocProvider.of<DetailBloc>(context)
        .add(DetailRequested(login: widget.login));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('User Detail'),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state){
        if (state is DetailInitial){
          return Center(
              child: Text(
              'sout oo',
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ));
        }
        if  (state is DetailData){
          return Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundImage: NetworkImage(state.user.avatar),
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
                    '${state.user.login}',
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
                    '${state.user.followers}',
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
                    '${state.user.following}',
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
                        url: state.user.url,
                      )
                    ],
                  )
                ],
              ),
            )
        }
      })
    );
  }
}
