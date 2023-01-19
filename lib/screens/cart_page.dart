import 'package:flutter/material.dart';
import 'package:viva_practical/global/globals.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("May cart"),
        centerTitle: true,
      ),
      body: ListView(
        children: Global.myCart
            .map(
              (e) => ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(e["thumbnail"]),
                ),
                title: Text(e["title"]),
                subtitle: Text(e["category"]),
                trailing: TextButton(
                  onPressed: () {
                    setState(() {
                      Global.myCart.remove(e);
                    });
                  },
                  child: const Text("Remove"),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
