import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/screens/cart_screen.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/screens/login_screen.dart';
import 'package:plant_app/screens/main_screen.dart';
import 'package:plant_app/screens/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) =>  SignupScreen(),
        MainScreen.id: (context) => MainScreen(),
        HomeScreen.id: (context) =>  HomeScreen(),
        CartScreen.id: (context) =>  CartScreen(),
      },
    );
  }
}
