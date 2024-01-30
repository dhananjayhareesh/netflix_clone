import 'package:flutter/material.dart';
import 'package:netflix/screens/appbar/appbar_button.dart';
import 'package:netflix/screens/pages/search/search.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.colorNotifier,
    required this.safeAreaHeight,
    required this.tabBarNotifier,
  });

  final ValueNotifier<bool> colorNotifier;
  final double safeAreaHeight;
  final ValueNotifier<bool> tabBarNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: colorNotifier,
        builder: (context, isTransparent, _) {
          return SizedBox(
            height: 148,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(microseconds: 500),
                  color: isTransparent
                      ? Colors.black.withOpacity(.5)
                      : Colors.transparent,
                  height: 65 + safeAreaHeight,
                  child: Column(
                    children: [
                      Container(
                        height: safeAreaHeight,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 70,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://clipground.com/images/logo-de-netflix-clipart-1.png'),
                                    fit: BoxFit.contain)),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.greenAccent,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: tabBarNotifier,
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      curve: Curves.easeInCubic,
                      duration: const Duration(milliseconds: 300),
                      height: value ? 50 : 0,
                      width: double.maxFinite,
                      color: isTransparent
                          ? Colors.black.withOpacity(.5)
                          : Colors.transparent,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutLinedButton(label: 'TV Shows'),
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutLinedButton(label: 'Movies'),
                          SizedBox(
                            width: 10,
                          ),
                          CustomOutLinedButton(label: 'Catagories'),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}
