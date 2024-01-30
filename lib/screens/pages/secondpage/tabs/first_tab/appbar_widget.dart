import 'package:flutter/material.dart';
import 'package:netflix/screens/pages/search/search.dart';

AppBar appbarWidget(
    {required String title,
    PreferredSize? bottom,
    BuildContext? context,
    bool notification = false}) {
  return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        notification
            ? const Icon(
                Icons.notifications_none_sharp,
                size: 28,
              )
            : const SizedBox(),
        const SizedBox(
          width: 10,
        ),
        context != null
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ))
            : const SizedBox(),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(6)),
          width: 28,
        ),
        const SizedBox(
          width: 10,
        )
      ],
      bottom: bottom);
}
