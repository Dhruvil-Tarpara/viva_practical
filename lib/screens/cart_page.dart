import 'package:flutter/material.dart';
import 'package:viva_practical/global/globals.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  total() {
    num price = 0;
    for (int i = 0; i < Global.myCart.length; i++) {
      price += (Global.myCart[i]["price"] * Global.myCart[i]["quantity"]);
    }
    return price;
  }

  @override
  void initState() {
    Global.total = total();
    Global.myCart = Global.myCart.toSet().toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My cart",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: Global.myCart
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        color: Colors.grey.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: NetworkImage(e["thumbnail"]),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e["title"],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    e["category"],
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    Global.myCart.remove(e);
                                  });
                                },
                                child: const Text("Remove"),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$ ${e["price"].toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Card(
                                elevation: 0,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 38,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (e["quantity"] > 1) {
                                              e["quantity"]--;
                                              Global.total = total();
                                            } else {
                                              Global.myCart.remove(e);
                                              Global.total = total();
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 24,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                      Text(
                                        e["quantity"].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            e["quantity"]++;
                                            Global.total = total();
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 24,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "\$ ${Global.total.toString()}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Global.button),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
