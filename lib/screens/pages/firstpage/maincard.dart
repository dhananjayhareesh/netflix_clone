import 'package:flutter/material.dart';
import 'package:netflix/model/Movie.dart';

import 'package:netflix/service/apiservice.dart';
import 'package:netflix/service/functions.dart';
import 'package:palette_generator/palette_generator.dart';

// ignore: must_be_immutable
class Maincard extends StatelessWidget {
  Maincard({super.key, required this.size});
  Size size;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getnowplaying(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.transparent);
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          }
          final data = snapshot.data ?? [];

          return FutureBuilder(
              future: getPaletColor(data[data.length - 1]),
              builder: (context, paletteGenerator) {
                if (paletteGenerator.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      color: Colors.transparent);
                } else if (paletteGenerator.hasError ||
                    !paletteGenerator.hasData) {
                  return const Center(
                    child: Text('Somthing went wrong'),
                  );
                }
                final palette = paletteGenerator.data;
                final paletteColor = palette?.colors.first;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [paletteColor ?? Colors.grey, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 2.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: double.infinity,
                  height: size.height * .78,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 137, left: 20, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '$baseUrl${data[data.length - 1].posterpath}'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(0, 2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 44,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          150, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 44,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          150, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        ' My List',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  Future<PaletteGenerator> getPaletColor(Movie movie) async {
    return await PaletteGenerator.fromImageProvider(
        NetworkImage('$baseUrl${movie.posterpath}'));
  }
}
