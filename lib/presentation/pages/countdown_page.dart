import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';
import 'package:countdown_app/presentation/Provides/Navigation_provider.dart';
import 'package:countdown_app/presentation/pages/countdown_page.dart';
import 'package:countdown_app/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class countDown extends StatelessWidget {
  const countDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountDownProvider>(context);
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    //final _screenindezProvider = Provider.of<NavigationBarProvider>(context);
    //int currentScreenIndex = _screenindezProvider.fetchCurrentScreenIndex;

    return countDownView(
        countdownProvider: countdownProvider, navigationProvider: navigationProvider,);
  }
}

class countDownView extends StatelessWidget {
  final CountDownProvider countdownProvider;
  final NavigationBarProvider navigationProvider;

  const countDownView({Key? key, required this.countdownProvider, required this.navigationProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CounterLabel(countdownProvider: countdownProvider),
      
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
                child: InkResponse(
                  onTap: () {
                    if (!countdownProvider.isRunning) {
                      countdownProvider.startStopTimer();
                    }
                  },
                  highlightColor: Colors.blue,
                  highlightShape: BoxShape.circle,
                  child: Image.asset(
                    'assets/img/Logo.png',
                    width: 190,
                    height: 190,
                  ),
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




/*import 'package:flutter/material.dart';
import 'package:countdown_app/presentation/pages/home_page.dart';
import 'package:countdown_app/presentation/pages/login.dart';
import 'package:countdown_app/presentation/pages/aaa.dart';

import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
    
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            _navigateToPage(index);
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: '1',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: '2',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: '3',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
  switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBarApp()));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      break;
    case 2:
      //Navigator.push(context, MaterialPageRoute(builder: (context) => aaa()));
      break;
  }
}

}
*/