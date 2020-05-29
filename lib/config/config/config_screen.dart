import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystore_project/config/config/index.dart';
import 'package:mystore_project/home/home/home_page.dart';
import 'package:mystore_project/Universal/MyScafold.dart';

class ConfigScreen extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  ConfigBloc configBloc;
  int _selectedIndex = 0;
  List<Widget> myItems = [];

  @override
  void initState() {
    super.initState();

    setupApp();
    addNavigationRailItems();
  }

  addNavigationRailItems() {
    myItems.add(HomePage());
    myItems.add(MyScaffold(
      body: Text("2"),
      title: "2",
    ));
    myItems.add(MyScaffold(
      body: Text("3"),
      title: "3",
    ));
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.add(LoadConfigEvent());
  }

  @override
  void dispose() {
    configBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'My Store',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font

              primarySwatch:
                  configBloc.darkModeOn ? Colors.purple : Colors.deepPurple,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              accentColor: configBloc.darkModeOn
                  ? Colors.deepPurple
                  : Colors.deepPurpleAccent,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: Row(
              children: <Widget>[
                NavigationRail(
                  groupAlignment: 0,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  leading: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46"),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      IconButton(
                        icon: Icon(
                          configBloc.darkModeOn
                              ? FontAwesomeIcons.solidMoon
                              : FontAwesomeIcons.moon,
                          size: 18,
                        ),
                        onPressed: () {
                          configBloc.add(DarkModeEvent(!configBloc.darkModeOn));
                        },
                      ),
                    ],
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.category),
                      selectedIcon: Icon(Icons.category),
                      label: Text('Category'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.archive),
                      selectedIcon: Icon(Icons.archive),
                      label: Text('Saved'),
                    ),
                  ],
                ),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: IndexedStack(
                    children: myItems,
                    index: _selectedIndex,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
