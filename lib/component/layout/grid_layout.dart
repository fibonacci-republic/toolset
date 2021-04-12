import 'package:fbnc_toolset/component/layout/index.dart';
import 'package:fbnc_toolset/model/router.dart';
import 'package:flutter/material.dart';

class GridRouterLayout extends Viewer {
  GridRouterLayout({
    Key key,
    AppRoute route,
    Map<String, List<String>> query,
  }) : super(key: key, route: route, query: query);
  @override
  State<StatefulWidget> createState() => _GridRouterLayoutState();
}

class _GridRouterLayoutState extends FbViewerState<GridRouterLayout> {
  @override
  Widget buildPage(BuildContext ctx) {
    return Wrap(
      children: [],
    );
  }
}
