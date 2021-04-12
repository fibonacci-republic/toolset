import 'package:fbnc_toolset/model/router.dart';
import 'package:fbnc_toolset/view/404/index.dart';

import 'store/router_store.dart';

class RoutesConfig {
  //默认导航 TODO 后面直接增加兜底 保证输出
  //后续从后端获取
  static List<AppRoute> defaultRoutes = [
    AppRoute(
      "root",
      path: "/",
      routes: [
        //包装孩子
        AppRoute("global_layout", path: "/home", routes: [
          AppRoute("normal_trade_layout", path: "/home/trade", routes: [
            AppRoute("change_password", path: "/home/trade/change_password"),
          ]),
          AppRoute("credit_trade", path: "/home/credit"),
          AppRoute("hk", path: "/home/hk"),
        ]),

        AppRoute("login", path: "/login"),
        // 兜底 这个可以去掉
        AppRoute("404", path: "/404"),
      ],
    ),
    // 兜底
    AppRoute("404"),
  ];

  //获取默认全局路由
  static RouterStore makeDefaultRouter() {
    var store = RouterStore();

    for (var item in _getRoutes(defaultRoutes)) {
      item.routeProperties = Components.getAppRoutePropertiesBuilder(item.name);
      store.addRoute(item);
    }

    return store;
  }

  //递归查找所有路由
  static Iterable<AppRoute> _getRoutes(List<AppRoute> routes) sync* {
    if (routes != null) {
      for (var item in routes) {
        yield item;
        if (item.routes != null && item.routes.length > 0) {
          for (var child in _getRoutes(item.routes)) {
            if (!child.uri.startsWith(item.uri)) throw ArgumentError("嵌套关系有问题");
            yield child;
          }
        }
      }
    }
  }
}

// 组件独立
class Components {
  static final Map<String, AppRouteProperties> _appRoutePropertiesBuilder = {
    /// 404
    "404": AppRouteProperties(
      componentBuilder: (ctx, route, query) => NotFoundPage(),
    )
  };

  //获取路由 相关配置 该配置必须写死在本地
  static AppRouteProperties getAppRoutePropertiesBuilder(String name) {
    if (_appRoutePropertiesBuilder.containsKey(name)) {
      return _appRoutePropertiesBuilder[name];
    }
    return null;
  }
}
