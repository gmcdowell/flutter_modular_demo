import 'package:abstract_widget_view/abstract_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatefulWidget {
  /// route below module.routePath e.g. '/secured/'
  static const String routePath = '/';

  // final String currentIndex;

  // DashboardPage([this.currentIndex = '0']);

  @override
  _DashboardPageController createState() => _DashboardPageController();
}

class _DashboardPageController extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // _selectedIndex = int.parse(widget.currentIndex);
  }

  void _updateDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Modular.to.pushReplacementNamed('$index');
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
        title: Text('Modular:Stuff'),
        leading: CloseButton(
          onPressed: () => Modular.to.pop(),
        ),
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
            child: Center(
              child: Text('selectedIndex: ${state._selectedIndex}'),
            ),
          )
        ],
      ),
    );
  }
}
