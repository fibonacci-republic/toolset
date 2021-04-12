import 'package:fbnc_toolset/global.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GlobalData.router.generator,
      initialRoute: GlobalData.router.path,
      theme: ThemeData.light(),
    );
  }
}
