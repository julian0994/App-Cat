import 'package:flutter/material.dart';
import 'home.dart';

class SplashS extends StatefulWidget {
  const SplashS({super.key});

  @override
  _SplashSState createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {
  @override
  void initState() {
    super.initState();
    _home();
  }

  _home() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xfffef2e6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            edgecat(),


            SizedBox(height: 200),

            Text(
              'App Cat',
              style: TextStyle(
                color: Color(0xff725435),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Image.asset(
              "assets/images/catSplash.gif",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            edgecat(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget edgecat () {
  return
  const Row(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: [

        Icon(
        Icons.pets,
        color: Color(0xff725435),
        size: 20,
        ),
        Icon(
        Icons.pets,
        color: Color(0xff725435),
        size: 20,
        ),
        Icon(
        Icons.pets,
        color: Color(0xff725435),
        size: 20,
        ),
        Icon(
        Icons.pets,
        color: Color(0xff725435),
        size: 20,
        ),
        Icon(
        Icons.pets,
        color: Color(0xff725435),
        size: 20,
        ),
    ],
  );
}