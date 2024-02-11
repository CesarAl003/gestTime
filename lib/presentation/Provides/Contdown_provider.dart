import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// Gestionar el estado del timer. En esta clase se encuentra toda la funcionalidad de la aplicación
class CountDownProvider extends ChangeNotifier {
  // Tiene la capacidad de notificar a los widgets que dependen de su estado cuando ocurren cambios.
  Duration duration = const Duration(seconds: 3);
  bool isRunning = false;

  StreamSubscription<int>? _tickSubscription; //Para pausar el temporalizador

  void startStopTimer() {
    if (!isRunning) {
      _startTimer(duration.inSeconds); // Llamada a la función
    } else {
      _tickSubscription?.pause();
    }

    isRunning = !isRunning;
    notifyListeners(); // Avisa a los widgets que ha avido cambios. Esto activará la reconstrucción de los widgets que dependen de este estado.
  }

  // El guion bajo dicta que es privado, es decir, no se puede utilizar fuera de esta clase
  void _startTimer(int seconds) {
    _tickSubscription
        ?.cancel(); // Limpiamos la suscripción anterior para optimizar nuestra app
    // Stream es un flujo de datos, este se ejecuta perodicamente, cada un segundo ejecuta la funcion lamda
    _tickSubscription = Stream<int>.periodic(
            const Duration(seconds: 1),
            (sec) =>
                seconds -
                sec -
                1) // sec es el número de veces que se ha ejecutado la función
        .take(seconds) // Se va a dener cuando se haya ejecutado 'seconds' veces
        .listen((timeLeftInSeconds) {
      //Aquí se recibe el resultado de la función, es decir 'seconds - sec - 1'
      duration = Duration(seconds: timeLeftInSeconds);
      notifyListeners();

      if (timeLeftInSeconds == 0) {
        _playAlarm();
      }
    });
  }

  void setCountDownDuration(Duration newDuration) {
    //Para establecer una nueva duracion
    duration = newDuration;
    _tickSubscription?.cancel();
    isRunning = false;
    notifyListeners();
  }

  String get timeLeftString {
    final minutes = ((duration.inSeconds / 60) % 60)
        .floor()
        .toString()
        .padLeft(2, '0'); //Floor redondea hacia abajo
    final seconds = (duration.inSeconds % 60)
        .floor()
        .toString()
        .padLeft(2, '0'); //Convierte a Strin y rellena los espacios con ceros

    return '$minutes:$seconds';
  }

  void _playAlarm() async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('jpn.mp3'));
    } catch (e) {
      print('Error al reproducir el audio: $e');
    }
  }
}
