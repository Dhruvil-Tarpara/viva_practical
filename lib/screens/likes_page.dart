import 'package:flutter/material.dart';
import 'package:viva_practical/global/globals.dart';

class Likes extends StatefulWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Product"),
          centerTitle: true,
        ),
        body: ListView(
          children: Global.likeProducts
              .map(
                (e) => ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(e[0]["thumbnail"]),
                  ),
                  title: Text(e[0]["title"]),
                  subtitle: Text(e[0]["category"]),
                ),
              )
              .toList(),
        ));
  }
}
