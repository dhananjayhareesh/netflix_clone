import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/appbar/appbar_widget.dart';
import 'package:netflix/screens/pages/firstpage/maincard.dart';
import 'package:netflix/screens/pages/firstpage/movies_widget.dart';
import 'package:netflix/screens/pages/firstpage/tv_widgetcard.dart';
import 'package:netflix/service/functions.dart';

class Fisrtpage extends StatelessWidget {
  Fisrtpage({super.key});

  final ScrollController _scrollController = ScrollController();

  final ValueNotifier<bool> tabBarNotifier = ValueNotifier(true);

  final ValueNotifier<bool> colorNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_scrollListner);
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black,
      height: size.height,
      width: double.maxFinite,
      child: Stack(
        children: [
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              Maincard(size: size),
              Moviewidget(
                text: ' Trending Now',
                size: size,
                future: getnowplaying(),
              ),
              Moviewidget(
                text: 'New Releases',
                size: size,
                future: newRealease(),
              ),
              Moviewidget(
                text: ' Top 10 Movies',
                size: size,
                future: topRatedMovies(),
                key1: true,
              ),
              Tvcard(
                  size: size,
                  text: ' Bingeworthy TV Dramas',
                  future: tvDramas()),
              Moviewidget(
                text: 'Up Coming Movies',
                size: size,
                future: upcoming(),
              ),
              Tvcard(
                size: size,
                text: ' Airing Today',
                future: airingtoday(),
              )
            ],
          ),
          HomeAppBar(
            colorNotifier: colorNotifier,
            safeAreaHeight: safeAreaHeight,
            tabBarNotifier: tabBarNotifier,
          ),
        ],
      ),
    );
  }

  _scrollListner() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      tabBarNotifier.value = true;
    } else {
      tabBarNotifier.value = false;
    }
    if (_scrollController.offset > 400) {
      colorNotifier.value = true;
    } else {
      colorNotifier.value = false;
    }
  }
}
