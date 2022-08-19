import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui/design/layout.dart';
import 'package:ui/design/texts.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class ProviderConfig {
  final String name;
  final String route;

  ProviderConfig(this.name, this.route);
}

class _LoginViewState extends State<LoginView> {
  List<ProviderConfig> providers = [
    ProviderConfig('Google', ''),
    ProviderConfig('Twitter', ''),
    ProviderConfig('Apple', ''),
    ProviderConfig('Facebook', ''),
    ProviderConfig('Github', ''),
    ProviderConfig('Phone', '/phone_auth')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/my_world.png'), fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: Center(
              child: Column(
                mainAxisAlignment: orientation == Orientation.portrait
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Your World',
                    style: headerText,
                  ),
                  Text(
                    'Login to continue...',
                    style: bodyText,
                  ),
                  Container(
                    width: orientation == Orientation.portrait
                        ? width(context)
                        : width(context) / 3,
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        children: providers
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(e.route);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      e.name,
                                      style: buttonText,
                                    ),
                                  ),
                                ))
                            .toList()),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
