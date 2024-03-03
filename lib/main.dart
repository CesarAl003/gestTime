import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';
import 'package:countdown_app/presentation/Provides/Navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:countdown_app/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

// StatelessWidget se utiliza cuando la parte visual del widget no cambia.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Construir la UI
    return MultiProvider(
      providers: [
        //Creamos una una instancia de mi clase CountDownProvider
        ChangeNotifierProvider(create: ((_) => CountDownProvider())),
        ChangeNotifierProvider(create: ((_) => NavigationBarProvider
        ()))
      ],
      child: const MaterialApp(
        title: 'Material App', // Nombre de la app
        debugShowCheckedModeBanner: false, // Quitar la marca de debug
        home: HomePage(), // La vista principal
        // theme: AppTheme().currentTheme,
      ),
    );
  }
}
