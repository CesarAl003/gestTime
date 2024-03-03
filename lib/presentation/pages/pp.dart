import 'package:flutter/material.dart';
import 'package:countdown_app/presentation/Provides/Navigation_provider.dart';
import 'pepapig.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationBarProvider())
      ],
    );
  }
}