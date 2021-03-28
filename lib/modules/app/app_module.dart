import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_demo/modules/app/pages/home_page.dart';
import 'package:flutter_modular_demo/modules/app/pages/login_page.dart';
// import 'package:flutter_modular_demo/modules/secured/secured_module.dart';
import 'package:flutter_modular_demo/modules/secured/secured_widget_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        /// '/'
        ChildRoute(
          HomePage.routePath,
          child: (_, __) => HomePage(),
        ),

        /// '/login'
        ChildRoute(
          LoginPage.routePath,
          child: (_, __) => LoginPage(),
        ),

        /// '/secured'
        ModuleRoute(
          SecuredModule.routePath,
          module: SecuredModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
