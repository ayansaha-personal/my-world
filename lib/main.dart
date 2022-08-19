import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:ui/design/texts.dart';
import 'package:ui/firebase_options.dart';
import 'package:ui/views/auth/phone_auth.dart';
import 'package:ui/views/splash.dart';
import 'package:ui/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyWorld());
}

class MyWorld extends StatelessWidget {
  const MyWorld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(bodyLarge: bodyPrimary, bodyMedium: bodyPrimary, bodySmall: bodyPrimary),
        canvasColor: Colors.black,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Colors.grey,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.black,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.white),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) =>
              const Scaffold(body: Center(child: Text('Not Found'))),
        );
      },
      routes: {
        '/welcome': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/phone_auth': (context) => const PhoneAuthView()
      },
    );
  }
}
