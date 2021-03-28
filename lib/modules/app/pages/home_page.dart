import 'package:flutter/material.dart';
import 'package:abstract_widget_view/abstract_widget_view.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_demo/modules/app/pages/login_page.dart';
import 'package:flutter_modular_demo/modules/secured/secured_widget_module.dart';
// import 'package:flutter_modular_demo/modules/secured/secured_module.dart';

class HomePage extends StatefulWidget {
  static const String routePath = '/';

  @override
  _HomePageController createState() => _HomePageController();
}

class _HomePageController extends State<HomePage> {
  @override
  Widget build(BuildContext context) => _HomePageView(this);
}

class _HomePageView extends WidgetView<HomePage, _HomePageController> {
  _HomePageView(_HomePageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modular::Home'),
        actions: [
          ElevatedButton(
            onPressed: () => Modular.to.pushNamed(LoginPage.routePath),
            child: Text(
              'Login',
            ),
          ),

          // content
          ElevatedButton(
            onPressed: () => Modular.to.navigate(SecuredModule.initialPath),
            child: Text(
              'Secured',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 5.0,
            ),
            child: Text(
              'Home',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Item'),
                  onTap: () => print('item tap heard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
