import 'package:com_class/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFa3f782)),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Color(0xFF2F2F2F)),
      ),
      home: const SplashView(),
    );
  }
}
