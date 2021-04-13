import 'package:fbnc_toolset/component/index.dart';
import 'package:fbnc_toolset/model/router.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends FbPage {
  @override
  Widget buildPage(BuildContext ctx) {
    return Container(
        child: Center(
            child: ElevatedButton(
      child: Text("未找到指定页面，返回"),
      onPressed: () => Viewer.of(ctx, path: "/home/1").switchRoute(),
    )));
  }
}
