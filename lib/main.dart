import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:kukhurikaa/pages/dashboard_page.dart';
import 'package:kukhurikaa/providers/sensor_data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SensorDataProvider(),
    )
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 100, 100)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 233, 233),
          elevation: 0, // Flat AppBar (Material 3 style)
          centerTitle: true, // Optional: Center titles
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      home: DashboardPage(),
    );
  }
}
