import 'package:flutter/material.dart';
import 'package:flutterd/screens/home_screens.dart';
import 'package:flutterd/state/post_state.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PostState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.orange,
        ),
        home: HomeScreens(),
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
        },
      ),
    );
  }
}
