import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/model/Movie.dart';
import 'package:netflix/service/apiservice.dart';

// ignore: must_be_immutable
class Moviewidget extends StatelessWidget {
  Moviewidget(
      {super.key,
      required this.size,
      required this.text,
      required this.future,
      this.key1});
  String text;
  Size size;
  Future future;
  bool? key1;
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
          final List<Movie> data = snapshot.data ?? [];

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
                      itemCount: key1 == true ? 10 : data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final values = data[index];

                        String imagePath = values.coverImage;
                        String imageUrl = '$baseUrl$imagePath';

                        // ignore: unrelated_type_equality_checks
                        return key1 == true
                            ? Container(
                                width: size.width * .45,
                                margin: const EdgeInsets.only(right: 10),
                                child: Stack(children: [
                                  Positioned(
                                      bottom: size.width * .01,
                                      left: size.width * .02,
                                      child: BorderedText(
                                        strokeColor: Colors.white,
                                        strokeWidth: 1.5,
                                        child: Text(
                                          '${index + 1}',
                                          style: index + 1 == 10
                                              ? GoogleFonts.alumniSansInlineOne(
                                                  textStyle: TextStyle(
                                                      color:
                                                          Colors.grey.shade900,
                                                      shadows: [
                                                        Shadow(
                                                          color: Colors
                                                              .grey.shade700
                                                              .withOpacity(.9),
                                                          offset: const Offset(
                                                              -3.0, -1.0),
                                                          blurRadius: 30.0,
                                                        ),
                                                      ],
                                                      fontSize: 110,
                                                      fontWeight:
                                                          FontWeight.bold))
                                              : TextStyle(
                                                  color: Colors.grey.shade900,
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(.9),
                                                      offset: const Offset(
                                                          -3.0, -1.0),
                                                      blurRadius: 30.0,
                                                    ),
                                                  ],
                                                  fontSize: 110,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: size.width * .30,
                                      height: size.width * .40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.cover,
                                              filterQuality:
                                                  FilterQuality.high)),
                                    ),
                                  )
                                ]),
                              )
                            : Container(
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
