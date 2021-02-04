import 'package:flutter/material.dart';
import 'package:flutterd/screens/login_screens.dart';
import 'package:localstorage/localstorage.dart';

class AddDrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("usertoken");
    _logoutnow() {
      storage.clear();
      Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
    }

    return Drawer(
      child: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1605821469603-6112b2cd8254?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=689&q=80',
          ),
          Text(
            "About",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
          ),
          Spacer(),
          ListTile(
            onTap: () {
              _logoutnow();
            },
            trailing: Icon(
              Icons.logout,
              color: Theme.of(context).accentColor,
            ),
            title: Text("LogOut"),
          ),
        ],
      ),
    );
  }
}
