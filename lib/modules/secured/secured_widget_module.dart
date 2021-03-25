import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_demo/modules/secured/pages/dashboard_page.dart';

// ignore: must_be_immutable
class SecuredModule extends WidgetModule {
  static const String routePath = '/secured';

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => DashboardPage();
}
