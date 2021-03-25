import 'package:abstract_widget_view/abstract_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  static const String routePath = '/login';

  @override
  _LoginPageController createState() => _LoginPageController();
}

class _LoginPageController extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => _LoginPageView(this);
}

class _LoginPageView extends WidgetView<LoginPage, _LoginPageController> {
  _LoginPageView(_LoginPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modular:Login'),
        leading: CloseButton(
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Text(
              'Login',
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
