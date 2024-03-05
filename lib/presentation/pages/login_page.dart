
import 'package:countdown_app/presentation/Provides/Contdown_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountDownProvider>(context);

    return loginView(
        countdownProvider: countdownProvider);
  }
}

class loginView extends StatelessWidget {

  const loginView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
    );
  }
}