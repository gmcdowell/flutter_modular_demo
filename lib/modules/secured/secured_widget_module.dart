import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_demo/modules/secured/pages/dashboard_page.dart';

// ignore: must_be_immutable
class SecuredModule extends WidgetModule {
  static const String routePath = '/secured';
  static const String initialPath = '$routePath/${FirstTabPage.routePath}';

  @override
  List<Bind<Object>> get binds => [];

  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => DashboardPage(),
      children: [
        ChildRoute(
          FirstTabPage.routePath,
          child: (_, __) => FirstTabPage(),
        ),
        ChildRoute(
          SecondTabPage.routePath,
          child: (_, __) => SecondTabPage(),
        ),
        ChildRoute(
          ThirdTabPage.routePath,
          child: (_, __) => ThirdTabPage(),
        ),
      ],
    ),
  ];

  @override
  Widget get view => DashboardPage();

  @override
  T? getInjectedBind<T>([Type? type]) {
    // TODO: implement getInjectedBind
    // throw UnimplementedError();
    return null;
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [];
}
