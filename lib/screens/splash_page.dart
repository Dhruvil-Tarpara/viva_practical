import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viva_practical/global/globals.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   getData() async {
    String data = await rootBundle.loadString("assets/productData.json");
    setState((){
      Global.products = jsonDecode(data);
    });
  }

 @override
  void initState() {
    goForward();
    getData();
    super.initState();
  }
   goForward() async{
     await Future.delayed(const Duration(seconds:3));
     Navigator.of(context).pushReplacementNamed("/");
   }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
