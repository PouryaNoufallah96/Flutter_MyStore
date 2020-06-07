import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/archive/archive/archive_bloc.dart';
import 'package:mystore_project/config/config/index.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => configBloc),
        BlocProvider(create: (context) => ArchiveBloc())
      ],
      child: BlocBuilder<ConfigBloc, ConfigState>(
        bloc: configBloc,
        builder: (context, state) {
          return MaterialApp(
              title: 'My Store',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch:
                    configBloc.darkModeOn ? Colors.purple : Colors.deepPurple,
                primaryColor:
                    configBloc.darkModeOn ? Colors.black : Colors.white,
                accentColor: configBloc.darkModeOn
                    ? Colors.deepPurple
                    : Colors.deepPurpleAccent,
                disabledColor: Colors.grey,
                backgroundColor:
                    configBloc.darkModeOn ? Colors.grey[900] : Colors.grey[50],
                cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                canvasColor:
                    configBloc.darkModeOn ? Colors.black : Colors.white,
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
              home: ConfigScreen());
        },
      ),
    );
  }
}
