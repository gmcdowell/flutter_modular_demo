import 'package:abstract_widget_view/abstract_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageController createState() => _DashboardPageController();
}

class _DashboardPageController extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
  }

  /// Redirects to 'relative tab paths'
  void _updateDestinationSelected(int index) {
    if (index == 0) {
      Modular.to.navigate(FirstTabPage.routePath);
    } else if (index == 1) {
      Modular.to.navigate(SecondTabPage.routePath);
    } else if (index == 2) {
      Modular.to.navigate(ThirdTabPage.routePath);
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => _DashboardPageView(this);
}

class _DashboardPageView
    extends WidgetView<DashboardPage, _DashboardPageController> {
  _DashboardPageView(_DashboardPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modular:Secured area'),
        leading: CloseButton(onPressed: () => Modular.to.navigate('/')),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: state._selectedIndex,
            onDestinationSelected: state._updateDestinationSelected,
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: RouterOutlet(),
          )
        ],
      ),
    );
  }
}

class FirstTabPage extends StatefulWidget {
  static const String routePath = 'first';

  @override
  _FirstTabPageController createState() => _FirstTabPageController();
}

class _FirstTabPageController extends State<FirstTabPage> {
  @override
  Widget build(BuildContext context) => _FirstTabPageView(this);
}

class _FirstTabPageView
    extends WidgetView<FirstTabPage, _FirstTabPageController> {
  _FirstTabPageView(_FirstTabPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'first',
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }
}

class SecondTabPage extends StatefulWidget {
  static const String routePath = 'second';

  @override
  _SecondTabPageController createState() => _SecondTabPageController();
}

class _SecondTabPageController extends State<SecondTabPage> {
  @override
  Widget build(BuildContext context) => _SecondTabPageView(this);
}

class _SecondTabPageView
    extends WidgetView<SecondTabPage, _SecondTabPageController> {
  _SecondTabPageView(_SecondTabPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'second',
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }
}

class ThirdTabPage extends StatefulWidget {
  static const String routePath = 'third';

  @override
  _ThirdTabPageController createState() => _ThirdTabPageController();
}

class _ThirdTabPageController extends State<ThirdTabPage> {
  @override
  Widget build(BuildContext context) => _ThirdTabPageView(this);
}

class _ThirdTabPageView
    extends WidgetView<ThirdTabPage, _ThirdTabPageController> {
  _ThirdTabPageView(_ThirdTabPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'third',
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }
}
