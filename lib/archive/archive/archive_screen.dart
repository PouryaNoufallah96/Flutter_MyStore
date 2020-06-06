import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mystore_project/archive/archive/index.dart';

import '../../Universal/widgets/customLoading.dart';
import '../../Universal/widgets/product_card.dart';

class ArchiveScreen extends StatefulWidget {
  final ArchiveBloc archiveBloc;
  const ArchiveScreen(this.archiveBloc);

  @override
  ArchiveScreenState createState() {
    return ArchiveScreenState();
  }
}

class ArchiveScreenState extends State<ArchiveScreen> {
  ArchiveScreenState();

  @override
  void initState() {
    super.initState();
    widget.archiveBloc.add(LoadArchiveEvent());
  }

  @override
  void dispose() {
    widget.archiveBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        widget.archiveBloc.add(LoadArchiveEvent());
      },
      child: BlocBuilder<ArchiveBloc, ArchiveState>(
          bloc: widget.archiveBloc,
          builder: (
            BuildContext context,
            ArchiveState currentState,
          ) {
            if (currentState is UnArchiveState) {
              return Center(
                child: CustomLoading(),
              );
            } else if (currentState is ErrorArchiveState) {
              return Center(
                child: Text('Error'),
              );
            } else if (currentState is InArchiveState) {
              return GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: currentState.archives.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(5.0),
                itemBuilder: (BuildContext context, index) {
                  return ProductCard(currentState.archives[index]);
                },
              );
            } else if (currentState is NoArchiveState) {
              return Center(child: Text("No Archive Found"));
            } else
              return Center(
                child: CustomLoading(),
              );
          }),
    );
  }
}
