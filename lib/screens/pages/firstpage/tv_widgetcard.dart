import 'package:flutter/material.dart';
import 'package:netflix/model/series.dart';
import 'package:netflix/service/apiservice.dart';

// ignore: must_be_immutable
class Tvcard extends StatelessWidget {
  Tvcard(
      {super.key,
      required this.size,
      required this.text,
      required this.future});
  String text;
  Size size;
  Future future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final List<Series> data = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 80,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                SizedBox(
                  height: size.width * .4,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final values = data[index];

                        String imagePath = values.posterImage!;
                        String imageUrl = '$baseUrl$imagePath';

                        return Container(
                          width: size.width * .28,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover)),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
