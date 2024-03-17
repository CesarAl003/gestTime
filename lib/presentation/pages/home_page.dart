import 'package:countdown_app/presentation/Providers/Navigation_provider.dart';
import 'package:countdown_app/presentation/pages/countdown_page.dart';
import 'package:countdown_app/presentation/pages/login_page.dart';
import 'package:countdown_app/presentation/pages/login2.dart';
import 'package:countdown_app/presentation/pages/note_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBarProvider>(context);

    return HomePageView(navigationProvider: navigationProvider,);
  }
}

class HomePageView extends StatelessWidget {
  final NavigationBarProvider navigationProvider;

  const HomePageView({Key? key, required this.navigationProvider})
      : super(key: key);

  
  @override
  Widget build(BuildContext context) {
  List<dynamic> screens = [
        // Mis pestañas contenidas en el menu
        countDown(),
        login(),
        login2(), // Prueba
        note(), // Prueba
      ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GesTime'),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior:  NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: navigationProvider.fetchCurrentScreenIndex,
        elevation: 1.5,
        onDestinationSelected: (value) => navigationProvider.updateScreenIndex(value),
        destinations: <Widget>[
          NavigationDestination(
              label: '1',
              icon: Icon((navigationProvider.fetchCurrentScreenIndex == 0)
                  ? Icons.home
                  : Icons.home_outlined),
              ),
          NavigationDestination(
            label: '2',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 1)
                ? Icons.search
                : Icons.search_outlined),
          ),
          NavigationDestination(
            label: '3',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 2)
                ? Icons.favorite
                : Icons.favorite_outline),
          ),
          NavigationDestination(
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
