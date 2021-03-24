import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const WidgetView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}

abstract class StatelessView<T1> extends StatelessWidget {
  final T1 widget;

  const StatelessView(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
    ).modular();
  }
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        /// root
        ChildRoute('/', child: (_, __) => HomePage()),

        /// login
        ChildRoute('/login', child: (_, __) => LoginPage()),

        /// stuff
        ModuleRoute(
          '/stuff',
          module: StuffModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}

class StuffModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/:id',
          transition: TransitionType.fadeIn,
          child: (_, args) => StuffPage(
              args.params.containsKey('id') ? args.params['id'] : '0'),
        ),
      ];
}

class HomePage extends StatefulWidget {
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
            onPressed: () => Modular.to.pushNamed('/login'),
            child: Text(
              'Login',
            ),
          ),

          // content
          ElevatedButton(
            onPressed: () => Modular.to.pushNamed('/stuff'),
            child: Text(
              'Stuff',
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

class LoginPage extends StatefulWidget {
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

class StuffPage extends StatefulWidget {
  final String currentIndex;

  StuffPage([this.currentIndex = '0']);

  @override
  _StuffPageController createState() => _StuffPageController();
}

class _StuffPageController extends State<StuffPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = int.parse(widget.currentIndex);
  }

  void _updateDestinationSelected(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    Modular.to.pushReplacementNamed('$index');
  }

  @override
  Widget build(BuildContext context) => _StuffPageView(this);
}

class _StuffPageView extends WidgetView<StuffPage, _StuffPageController> {
  _StuffPageView(_StuffPageController state) : super(state);

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
