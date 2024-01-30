import 'package:flutter/material.dart';

import 'package:netflix/service/apiservice.dart';

// ignore: must_be_immutable
class ForthTab extends StatelessWidget {
  ForthTab({super.key, required this.future});

  Future future;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
          final data = snapshot.data ?? [];
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                final values = data[index];
                String imagePath = values.coverImage;
                String imageUrl = '$baseUrl$imagePath';
                return Container(
                  color: Colors.black,
                  height: size.height / 2.2,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                              height: size.height / 3.7,
                              width: (size.width / 1.2) + 7,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45, top: 15),
                            child: SizedBox(
                              width: size.width / 2.8,
                              height: 50,
                              child: Text(
                                values.title,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.share,
                                            size: 22,
                                          )),
                                    ],
                                  ),
                                  const Text(
                                    'Share',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              size: 28,
                                            )),
                                      ],
                                    ),
                                    const Text(
                                      'Info',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.play_arrow,
                                              size: 28,
                                            )),
                                      ],
                                    ),
                                    const Text(
                                      'Info',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 44, right: 10),
                        child: Text(
                          values.overview,
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 14,
                              height: 1.3,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
