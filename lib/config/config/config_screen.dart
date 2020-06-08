import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystore_project/Category/category/category_page.dart';
import 'package:mystore_project/account/login/login/index.dart';
import 'package:mystore_project/archive/archive/archive_page.dart';
import 'package:mystore_project/home/home/home_page.dart';
import 'package:mystore_project/search/search/search_page.dart';
import 'package:mystore_project/utilities/mystore.dart';
import 'index.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  int _selectedIndex = 0;

  List<Widget> myItems = [];
  addNavigationRailItems() {
    myItems.add(HomePage());
    myItems.add(CategoryPage());
    myItems.add(SearchPage());
    myItems.add(ArchivePage());
  }

  @override
  void initState() {
    addNavigationRailItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
              IconButton(
                icon: Icon(
                  BlocProvider.of<ConfigBloc>(context).darkModeOn
                      ? FontAwesomeIcons.solidMoon
                      : FontAwesomeIcons.moon,
                  size: 18,
                ),
                onPressed: () {
                  BlocProvider.of<ConfigBloc>(context).add(DarkModeEvent(
                      !BlocProvider.of<ConfigBloc>(context).darkModeOn));
                },
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 40,
              ),
              BlocProvider.of<ConfigBloc>(context).username.isNotEmpty
                  ? Center(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                            "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46"),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              var backgroundColor2 =
                                  Theme.of(context).backgroundColor;
                              var edgeInsets = EdgeInsets.only(bottom: 10);
                              return Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  margin: EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    color: backgroundColor2,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: DefaultTabController(
                                      length: 2,
                                      child: Scaffold(
                                        appBar: PreferredSize(
                                            preferredSize:
                                                Size.fromHeight(kToolbarHeight),
                                            child: Container(
                                              color: backgroundColor2,
                                              child: SafeArea(
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Container(
                                                            color:
                                                                backgroundColor2)),
                                                    TabBar(
                                                      tabs: [
                                                        Container(
                                                            margin: edgeInsets,
                                                            color:
                                                                backgroundColor2,
                                                            child:
                                                                Text("Login")),
                                                        Container(
                                                            margin: edgeInsets,
                                                            color:
                                                                backgroundColor2,
                                                            child: Text(
                                                                "Sign Up")),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        body: TabBarView(
                                          children: [
                                            LoginScreen(),
                                            Text("Sign Up")
                                          ],
                                        ),
                                      )));
                            });
                      },
                      child: Center(
                        child: Text("Account"),
                      ),
                    ),
              SizedBox(
                height: 8,
              ),
              BlocProvider.of<ConfigBloc>(context).username.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        BlocProvider.of<ConfigBloc>(context).add(LogoutEvent());
                      },
                      child: Center(
                        child: Text("Logout"),
                      ),
                    )
                  : Container()
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
              icon: Icon(Icons.search),
              selectedIcon: Icon(Icons.search),
              label: Text('Search'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.archive),
              selectedIcon: Icon(Icons.archive),
              label: Text('Archived'),
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
    );
  }
}
