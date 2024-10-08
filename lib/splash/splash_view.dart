import 'dart:async';

import 'package:com_class/auth/registration_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final int splashDuration = 3;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    Timer(Duration(seconds: splashDuration), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegistartionView(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
      ),
    ));
  }
}
