import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// Gestionar el estado del timer. En esta clase se encuentra toda la funcionalidad de la aplicación
class CountDownProvider extends ChangeNotifier {
  // Tiene la capacidad de notificar a los widgets que dependen de su estado cuando ocurren cambios.
  Duration duration = const Duration(seconds: 0);
  bool isRunning = false;
  final player = AudioPlayer();
  StreamSubscription<int>? _tickSubscription; //Para pausar el temporalizador
  List<int> pomodoro = [5, 3, 5, 7];
  var cont = 0;

  void startStopTimer() {
    if (!isRunning) {
      // Llamada a la función con el ciclo pomodoro correspondiente
      
      if (cont == pomodoro.length) cont = 0;
      duration = Duration(seconds: pomodoro[cont]);
      _startTimer(Duration(seconds: pomodoro[cont]).inSeconds);
      cont++;
    } else {
      _stopAlarm();
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
        .take(
            seconds) // Se va a detener cuando se haya ejecutado 'seconds' veces
        .listen((timeLeftInSeconds) {
      //Aquí se recibe el resultado de la función, es decir 'seconds - sec - 1'
      duration = Duration(seconds: timeLeftInSeconds);
      notifyListeners();

      if (timeLeftInSeconds == 0) {
        _tickSubscription?.pause();
        _playAlarm();
      }
    });
  }

/*  void setCountDownDuration(Duration newDuration) {
    //Para establecer una nueva duracion
    duration = newDuration;
    _tickSubscription?.cancel();
    isRunning = false;
    notifyListeners();
  }*/

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
      await player.play(AssetSource('aaa.mp3'));
    } catch (e) {
      print('Error al reproducir el audio: $e');
    }
  }

  void _stopAlarm() async {
    try {
      await player.stop();
    } catch (e) {
      print('Error al detener el audio: $e');
    }
  }
}
