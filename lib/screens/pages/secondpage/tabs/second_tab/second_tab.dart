import 'package:flutter/material.dart';
import 'package:netflix/service/apiservice.dart';

// ignore: must_be_immutable
class SeccondTab extends StatelessWidget {
  SeccondTab({super.key, required this.future});
  Future future;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                final values = data[index];
                String imagePath = values.coverImage;
                String imageUrl = '$baseUrl$imagePath';

                return Container(
                  height: size.height / 2.3,
                  width: double.maxFinite,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10)),
                          height: size.height / 4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: SizedBox(
                              width: size.width / 2,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
