import 'package:fbnc_toolset/component/index.dart';
import 'package:fbnc_toolset/model/router.dart';
import 'package:flutter/material.dart';

class TestPage extends FbPage {
  @override
  Widget buildPage(BuildContext ctx) {
    return Container(
        child: Center(
            child: ElevatedButton(
      child: Text("Hello World! "),
      onPressed: () => Viewer.of(ctx, path: "/home").switchRoute(),
    )));
  }
}
