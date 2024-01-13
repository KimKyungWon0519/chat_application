import 'package:chat_application/src/core/routes/app_pages.dart';
import 'package:chat_application/src/dependency_injection.dart' as Di;
import 'package:flutter/material.dart';

void main() {
  Di.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF4E5CA)),
        useMaterial3: true,
      ),
      routerConfig: AppPages.routes,
    );
  }
}
