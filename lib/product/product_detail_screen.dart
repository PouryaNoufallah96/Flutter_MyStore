import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/models/product.dart';
import 'product_comment/index.dart';
import 'product_comment_form/index.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
  final Product product;
  ProductDetailScreen(this.product);
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  ProductCommentBloc productCommentBloc;
  ProductCommentFormBloc productCommentFormBloc;
  ScrollController _scrollController;
  bool lastStatus = true;
  bool favorite = false;
  AnimationController _animationController;
  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;
  bool _visible;
  bool show;
  Color _color = Colors.purple;
  @override
  void initState() {
    super.initState();
    productCommentBloc = BlocProvider.of<ProductCommentBloc>(context);
    productCommentFormBloc = BlocProvider.of<ProductCommentFormBloc>(context);
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    _visible = !widget.product.purchased;
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    show = true;
    _animationController.addListener(() {
      setState(() {
        animateButton();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }

  void animateButton() {
    show = false;
    _animationValue = _animationController.value;
    if (_animationValue >= 0.2 && _animationValue < 0.4) {
      _containerPaddingLeft = 100.0;
      _color = Colors.green;
    } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
      _translateX = 80.0;
      _rotate = -20.0;
      _scale = 0.1;
    } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
      _translateY = -20.0;
    } else if (_animationValue >= 0.81) {
      _containerPaddingLeft = 20.0;
      widget.product.purchased = true;
      _visible = false;
    }
  }

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentProduct = widget.product;
    var edgeInsets = EdgeInsets.all(10);
    var opacityDuration = Duration(milliseconds: 500);
    Widget productInfo() {
      var lightColor = Colors.white;
      var textStyle = TextStyle(color: lightColor);
      return Column(
        children: <Widget>[
          Container(
            margin: edgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: opacityDuration,
                        child: Text(
                          '${currentProduct.price} \$ ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        )),
                    AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: opacityDuration,
                        child: GestureDetector(
                            onTap: () async {
                              if (!currentProduct.purchased)
                                _animationController.forward();
                            },
                            child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color: _color,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _color,
                                      blurRadius: 2,
                                      offset: Offset(
                                        1.0,
                                        1.5,
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    left: _containerPaddingLeft,
                                    right: 20.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOutCubic,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    if (!currentProduct.purchased)
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        child: Icon(
                                          Icons.shopping_basket,
                                          color: lightColor,
                                        ),
                                        curve: Curves.fastOutSlowIn,
                                        transform: Matrix4.translationValues(
                                            _translateX, _translateY, 0)
                                          ..rotateZ(_rotate)
                                          ..scale(_scale),
                                      )
                                    else
                                      Container(),
                                    AnimatedSize(
                                      vsync: this,
                                      duration: Duration(milliseconds: 600),
                                      child: show
                                          ? SizedBox(width: 10.0)
                                          : Container(),
                                    ),
                                    AnimatedSize(
                                      vsync: this,
                                      duration: Duration(milliseconds: 200),
                                      child: show
                                          ? Text(
                                              "Purchase",
                                              style: textStyle,
                                            )
                                          : Container(),
                                    ),
                                    AnimatedSize(
                                      vsync: this,
                                      duration: Duration(milliseconds: 200),
                                      child: currentProduct.purchased
                                          ? Icon(
                                              Icons.done,
                                              color: lightColor,
                                            )
                                          : Container(),
                                    ),
                                    AnimatedSize(
                                      vsync: this,
                                      alignment: Alignment.topLeft,
                                      duration: Duration(milliseconds: 500),
                                      child: currentProduct.purchased
                                          ? SizedBox(width: 10.0)
                                          : Container(),
                                    ),
                                    AnimatedSize(
                                      vsync: this,
                                      duration: Duration(milliseconds: 200),
                                      child: currentProduct.purchased
                                          ? Text(
                                              "Done",
                                              style: textStyle,
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ))))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: edgeInsets,
            child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: currentProduct.description,
                    style: Theme.of(context).textTheme.bodyText1)),
          ),
        ],
      );
    }

    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          Container(
            child: SliverAppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              expandedHeight: 250.0,
              floating: true,
              pinned: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    })
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).primaryColor),
                  child: Text(
                    currentProduct.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                background: Hero(
                  tag: currentProduct.image,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(currentProduct.image),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(child: productInfo()),
          !_visible
              ? ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Comments",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          MaterialButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return DraggableScrollableSheet(
                                      initialChildSize: 0.7,
                                      minChildSize: 0.7,
                                      maxChildSize: 1,
                                      builder: (BuildContext context,
                                          ScrollController scrollController) {
                                        return Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(top: 30),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                            ),
                                            child: ListView(
                                                controller: scrollController,
                                                children: <Widget>[
                                                  BlocConsumer<
                                                      ProductCommentFormBloc,
                                                      ProductCommentFormState>(
                                                    bloc:
                                                        productCommentFormBloc,
                                                    builder: (context, state) {
                                                      return ProductCommentFormScreen(
                                                          state,
                                                          productCommentFormBloc);
                                                    },
                                                    listener: (BuildContext
                                                            context,
                                                        ProductCommentFormState
                                                            state) {
                                                      if (state
                                                          is SuccessProductCommentFormState) {
                                                        productCommentBloc.add(
                                                            LoadProductCommentEvent());
                                                      }
                                                    },
                                                  ),
                                                  ProductCommentScreen(
                                                      productCommentBloc),
                                                ]));
                                      },
                                    );
                                  });
                            },
                            child: Text(
                              "Show",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          )
                        ],
                      ),
                    ])
              : Container()
        ],
      ),
    );
  }
}
