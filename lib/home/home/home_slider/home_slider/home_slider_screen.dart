import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/home/home/home_slider/home_slider/index.dart';
import 'package:mystore_project/product/product_detail_page.dart';
import 'package:mystore_project/utilities/random.dart';

class HomeSliderScreen extends StatefulWidget {
  @override
  HomeSliderScreenState createState() {
    return HomeSliderScreenState();
  }
}

class HomeSliderScreenState extends State<HomeSliderScreen> {
  HomeSliderScreenState();

  HomeSliderBloc homeSliderBloc;
  int currentSlider = 0;
  var tag = MyRandom.getRandom();
  @override
  void initState() {
    super.initState();
    homeSliderBloc = HomeSliderBloc();
    _load();
  }

  void _load() {
    homeSliderBloc.add(LoadHomeSliderEvent());
  }

  @override
  void dispose() {
    homeSliderBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSliderBloc, HomeSliderState>(
        bloc: homeSliderBloc,
        builder: (
          BuildContext context,
          HomeSliderState currentState,
        ) {
          if (currentState is UnHomeSliderState) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: CustomLoading(),
            );
          }
          if (currentState is ErrorHomeSliderState) {
            return Center(child: Text(currentState.errorMessage));
          }
          if (currentState is InHomeSliderState) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            currentState.sliders[currentSlider], tag)));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                height: 200,
                child: Stack(children: <Widget>[
                  PageView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        mainSlider(context, index, currentState),
                    itemCount: currentState.sliders.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentSlider = index;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140),
                    child: Center(child: sliderFooter(currentState)),
                  ),
                ]),
              ),
            );
          }
          return CustomLoading();
        });
  }

  Widget mainSlider(BuildContext context, int index, InHomeSliderState state) {
    var width = MediaQuery.of(context).size.width - 20;
    return Hero(
      tag: tag,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: new DecorationImage(
                  image: new NetworkImage(state.sliders[index].image),
                  fit: BoxFit.cover))),
    );
  }

  Widget sliderFooter(InHomeSliderState state) {
    List<Widget> footer = [];
    for (int i = 0; i < state.sliders.length; i++) {
      footer.add(currentSlider == i ? footerItem(true) : footerItem(false));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: footer,
    );
  }

  Widget footerItem(bool active) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: active
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
