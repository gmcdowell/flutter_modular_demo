import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_demo/modules/secured/pages/dashboard_page.dart';

class SecuredModule extends Module {
  static const String routePath = '/secured';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          DashboardPage.routePath,
          transition: TransitionType.fadeIn,
          child: (_, __) => DashboardPage(),

          // navigation rail destinations
          children: [],
        ),
      ];
}
