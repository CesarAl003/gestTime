import 'package:countdown_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(login());
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de Usuario
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: const Icon(
                Icons.person,
                size: 100.0,
                color: Colors.blue,
              ),
            ),
            // Campo de Correo
            const TextField(
              decoration: InputDecoration(
                labelText: 'Correo',
                hintText: 'Ingrese su correo',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            // Campo de Contraseña
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
              ),
              obscureText: true,
            ),
            // Botón de Aceptar
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Agregar la lógica de inicio de sesión aquí
                print('Botón de Aceptar presionado');
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Screen 3",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}*/