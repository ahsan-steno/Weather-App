import 'package:flutter/material.dart';

import 'home.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/pic_1.png'

                  )

              )
          ),
        ),

      ),
    );
  }
}
