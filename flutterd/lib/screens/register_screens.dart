import 'package:flutter/material.dart';
import 'package:flutterd/screens/login_screens.dart';
import 'package:flutterd/state/post_state.dart';
import 'package:provider/provider.dart';

class RegisterScreens extends StatefulWidget {
  static const routeName = '/register-screens';
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  String _username;
  String _password;
  String _confPassword;
  final _form = GlobalKey<FormState>();

  void _registerNow() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool isRegister = await Provider.of<PostState>(context, listen: false)
        .registerNow(_username, _confPassword);
    if (isRegister == false) {
      Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Somthing is Wrong!Try Again"),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register To Code"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Text(
                  "Register Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter a Username';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _username = v;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter a Password';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    setState(() {
                      _password = v;
                    });
                  },
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Enter Password";
                    }
                    if (_password != v) {
                      return 'Confirm your Password';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _confPassword = v;
                  },
                  obscureText: true,
                ),
                Row(
                  children: [
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        _registerNow();
                      },
                      child: Text("Register"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreens.routeName);
                      },
                      child: Text("Login Now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
