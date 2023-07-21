import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tasteq_bloc/core/constants/constants.dart';
import 'package:tasteq_bloc/domain/recipe_model/recipe.dart';
import 'package:tasteq_bloc/infrastructure/recent_db/recent_db.dart';

import 'package:url_launcher/url_launcher.dart';

import '../comments/comments.dart';

// ignore: must_be_immutable
class ViewRecipes extends StatelessWidget {
  ViewRecipes({Key? key, required this.passValue, required this.passId})
      : super(key: key);

  Recipe passValue;
  final int passId;

  @override
  Widget build(BuildContext context) {
    addToRecent(passValue, context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 240),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommentScreen(passValue: passValue),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                width: double.maxFinite,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      passValue.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: coverImage(),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.timer),
                            Text(' : ${passValue.duration}')
                          ],
                        ),
                        Text(passValue.category),
                      ],
                    ),
                    const Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    heightBox20,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        children: [
                          Text(
                            passValue.ingrediants,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    line(),
                    const Text(
                      'Cooking Procedure',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    heightBox20,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 80),
                      child: Text(passValue.procedure),
                    ),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
      bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 70,
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  redirect(passValue.videoLink);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 70,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.play_circle),
                      Text(
                        'Play Video',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget coverImage() {
    return Image(
      image: FileImage(File(passValue.image)),
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }

  line() {
    return const Divider(
      color: Colors.black,
    );
  }

  redirect(url) async {
    final Uri urls = Uri.parse(url);
    if (!await launchUrl(urls)) {
      throw Exception('failed');
    }
  }
}
