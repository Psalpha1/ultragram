import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_chat/screens/auth/loginOrRegister.dart';

import '../../../main.dart';
import '../../api/apis.dart';
import 'main_screen.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white));

      log('\nUser: ${APIs.auth.currentUser}');

      //navigate
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => APIs.auth.currentUser != null
                ? const MainScreen()
                : const LoginOrRegister(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      //body
      body: Stack(children: [
        //app logo
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('assets/images/icon.png')),

        //google login button
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: Text('MADE IN Tunisia WITH ❤️',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    letterSpacing: .5)))
      ]),
    );
  }
}
