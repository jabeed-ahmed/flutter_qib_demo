import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qib_app/src/views/ui/home_screen.dart';
import 'package:qib_app/src/views/ui/login_screen.dart';

import '../app.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, __) => LoginScreen(),
        ),
        ModularRouter(
          '/LoginScreen',
          child: (_, __) => LoginScreen(),
        ),
        ModularRouter(
          '/HomeScreen',
          child: (_, __) => HomeScreen(),
        ),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => MainApp();
}
