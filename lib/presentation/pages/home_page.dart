import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';
import 'package:countdown_app/presentation/Provides/Navigation_provider.dart';
import 'package:countdown_app/presentation/pages/countdown_page.dart';
import 'package:countdown_app/presentation/pages/login_page.dart';
import 'package:countdown_app/presentation/pages/login2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountDownProvider>(context);
    final navigationProvider = Provider.of<NavigationBarProvider>(context);
    //final _screenindezProvider = Provider.of<NavigationBarProvider>(context);
    //int currentScreenIndex = _screenindezProvider.fetchCurrentScreenIndex;

    return HomePageView(
        countdownProvider: countdownProvider, navigationProvider: navigationProvider,);
  }
}

class HomePageView extends StatelessWidget {
  final CountDownProvider countdownProvider;
  final NavigationBarProvider navigationProvider;

  const HomePageView({Key? key, required this.countdownProvider, required this.navigationProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  List<dynamic> screens = [
        // Mis pestañas
        const countDown(),
        login(),
        login2(),
        
      ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GesTime'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        elevation: 1.5,
        currentIndex: navigationProvider.fetchCurrentScreenIndex,
        onTap: (value) => navigationProvider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
              label: '1',
              icon: Icon((navigationProvider.fetchCurrentScreenIndex == 0)
                  ? Icons.home
                  : Icons.home_outlined),
              backgroundColor: Colors
                  .indigo // provide color to any one icon as it will overwrite the whole bottombar's color ( if provided any )
              ),
          BottomNavigationBarItem(
            label: '2',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 1)
                ? Icons.search
                : Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: '3',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 2)
                ? Icons.favorite
                : Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            label: '4',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 3)
                ? Icons.person
                : Icons.person_outline),
          ),
        ],
      ),
      body: screens[navigationProvider.fetchCurrentScreenIndex],
    );
  }
}
