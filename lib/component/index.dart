import 'package:fbnc_toolset/model/router.dart';
import 'package:flutter/material.dart';

///! 无状态 给业务界面使用
abstract class FbPage extends StatelessWidget {
  final AppRoute route;
  final Map<String, List<String>> query;

  const FbPage({Key key, this.route, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(child: buildPage(context));

  Widget buildPage(BuildContext ctx);
}
