import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountDownProvider>(context);

    return HomePageView(countdownProvider: countdownProvider);
  }
}

class HomePageView extends StatelessWidget {
  final CountDownProvider countdownProvider;

  const HomePageView({Key? key, required this.countdownProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
      ),
      body: _CounterLabel(countdownProvider: countdownProvider),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countdownProvider.startStopTimer();
        },
        child: Icon(
          countdownProvider.isRunning ? Icons.pause : Icons.play_arrow_outlined,
        ),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  final CountDownProvider countdownProvider;

  const _CounterLabel({Key? key, required this.countdownProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              progressBar(),
              Positioned(
                child: Image.asset(
                  'assets/img/Logo.png',
                  width: 190,
                  height: 190,
                  ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            context.select(
              (CountDownProvider countdown) => countdown.timeLeftString,
            ),
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }

  Widget progressBar() => SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 -
                  countdownProvider.duration.inSeconds /
                      countdownProvider.pomodoro[countdownProvider.cont],
              valueColor: AlwaysStoppedAnimation(Colors.purple.shade50),
              strokeWidth: 12,
              backgroundColor: Color.fromARGB(255, 117, 167, 255),
            ),
          ],
        ),
      );
}
