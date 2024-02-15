import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_provider_theme/config/di.dart';
import 'package:shared_provider_theme/providers/counter_provider.dart';
import 'package:shared_provider_theme/providers/theme_provider.dart';
import 'package:shared_provider_theme/utils/theme_manager.dart';
import 'package:shared_provider_theme/view/counter_page.dart';

import 'view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..initTheme(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeProvider>().themeData,
          home: const CounterPage(),
        );
      }),
    );
  }
}
