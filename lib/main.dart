import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/src/core/routes/app_pages.dart';
import 'package:chat_application/src/dependency_injection.dart' as Di;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instanceFor(app: app);
  FirebaseFirestore.instanceFor(app: app);
  FirebaseDatabase.instanceFor(app: app);

  Di.initialize();

  usePathUrlStrategy();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Talk-Track',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF4E5CA)),
        useMaterial3: true,
      ),
      routerConfig: AppPages.routes,
    );
  }
}
