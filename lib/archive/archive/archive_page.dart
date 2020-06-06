import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/archive/archive/index.dart';

import '../../Universal/MyScafold.dart';

class ArchivePage extends StatefulWidget {
  static const String routeName = '/archive';

  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ArchiveScreen(),
      title: "Archived",
    );
  }
}
