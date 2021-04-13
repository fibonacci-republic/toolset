import 'package:fbnc_toolset/component/index.dart';
import 'package:fbnc_toolset/global.dart';
import 'package:fbnc_toolset/model/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthorizeLayoutPage extends FbPage {
  final Widget child;
  const AuthorizeLayoutPage(
    this.child, {
    Key key,
    AppRoute route,
    Map<String, List<String>> query,
  }) : super(key: key, route: route, query: query);

  @override
  Widget buildPage(BuildContext ctx) {
    if (GlobalData.authority.currentUser == null) {
      Future.microtask(() => Navigator.of(ctx).pushReplacementNamed(
          "/login?redirect=${Uri.encodeComponent(route.uri.path)}"));
      return Scaffold(
          body: SafeArea(
              child: Row(children: <Widget>[Expanded(child: Text(""))])));
    }
    return child;
  }
}
