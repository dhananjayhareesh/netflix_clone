import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/screens/pages/secondpage/tabs/first_tab/appbar_widget.dart';
import 'package:netflix/screens/pages/thirdpage/imagecard.dart';
import 'package:netflix/service/apiservice.dart';
import 'package:netflix/service/functions.dart';

class thirdPage extends StatelessWidget {
  const thirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbarWidget(title: 'Downloads', context: context),
      body: Container(
        height: size.height,
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 32,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Smart Downloads',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Turn on Downloads for You',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: size.height / 41,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "We'll download movies and shows just for you, so you'll nalways have somthing to watch",
                style:
                    TextStyle(fontSize: 15, wordSpacing: 2, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            FutureBuilder(
                future: getnowplaying(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                        color: Colors.transparent);
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text('Somthing went wrong'),
                    );
                  }
                  final data = snapshot.data ?? [];
                  return Center(
                    child: SizedBox(
                        height: size.width * .7,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: size.width * .32,
                                backgroundColor:
                                    const Color.fromARGB(255, 68, 68, 68),
                              ),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: DownloadCard(
                                    angle: pi / 16,
                                    imagepath: '$baseUrl${data[0].coverImage}',
                                    height: size.width * .45,
                                    width: size.width * .33,
                                    margin: const EdgeInsets.only(left: 150))),
                            Align(
                                alignment: Alignment.center,
                                child: DownloadCard(
                                    angle: pi / -16,
                                    imagepath: '$baseUrl${data[1].coverImage}',
                                    height: size.width * .45,
                                    width: size.width * .33,
                                    margin: const EdgeInsets.only(right: 150))),
                            Align(
                              alignment: Alignment.center,
                              child: DownloadCard(
                                angle: 0,
                                height: size.width * .50,
                                imagepath: '$baseUrl${data[2].coverImage}',
                                width: size.width * .35,
                              ),
                            ),
                          ],
                        )),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  width: double.maxFinite,
                  height: size.height / 18,
                  child: const Center(
                      child: Text(
                    'Set Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 18,
            ),
            Center(
              child: Container(
                height: size.height / 25,
                width: size.width / 2,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 35, 35),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'Find More to Download',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
