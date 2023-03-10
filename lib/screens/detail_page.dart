import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viva_practical/global/globals.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["title"],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(data["thumbnail"]),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["title"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                data["like"] = !data["like"];
                                if (data["like"]) {
                                  data["like"] = true;
                                  Global.likeProducts.add(data);
                                } else {
                                  data["like"] = false;
                                  Global.likeProducts.remove(data);
                                }
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.heart_fill,
                              color: (data["like"]) ? Colors.red : Colors.grey,
                            ))
                      ],
                    ),
                    Text("\$ ${data["price"].toString()}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Brand : ${data["brand"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    Text("Category : ${data["category"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const Text("About",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(data["description"],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      Global.myCart.add(data);
                    });
                  },
                  child: const Text("Add to cart")),
            ),
          ],
        ),
      ),
    );
  }
}
