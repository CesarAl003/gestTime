import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // Vista principal
  const HomePage({Key? key}) : super(key: key); // COnstructor

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountdownProvider = Provider.of<CountDownProvider>(context); // Llamamos a la instancia de nuestra clase para poder llamar metodos y variables

    return Scaffold(
      // Título de la página
      appBar: AppBar(
        // Linea superior o barra de aplicación
        title: const Text('Cuenta regresiva'),
        
      ),

      /// Contador
      body:
          const _CounterLabel(), // _ indica que _CounterLabel es probablemente una clase privada dentro del mismo archivo

      /// Play - Stop
      floatingActionButton: FloatingActionButton(
        //botón flotante
        onPressed: () {
          // Iniciar o detener el temporizador
          CountdownProvider.startStopTimer();
        },
        child: Icon(
            //Cambiar el icono dependiendo de si el timer esta activo o no
            CountdownProvider.isRunning
                ? Icons.pause
                : Icons.play_arrow_outlined),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  const _CounterLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // ESte widget ocupa todo el espacio disponible
      child: Row(
        // Hijo de Size box que es una lista horizontal
        mainAxisAlignment: MainAxisAlignment.center, //Posición centrada
        crossAxisAlignment: CrossAxisAlignment.center, // Pocisión centrada
        children: [
          //Contenido de la lista horizontal
          const Icon(Icons.timer_outlined,
              color: Colors.blue, size: 60), // Un icono de reloj
          const SizedBox(width: 10), //Espaciado entre cada elemento
          Text(
            context.select(
                (CountDownProvider countdown) => countdown.timeLeftString),
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
