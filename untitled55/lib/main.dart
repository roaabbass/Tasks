import 'package:untitled55/cubit/my_app_cubit.dart';
import 'package:untitled55/firebase_options.dart';
import 'package:untitled55/user%20inter/homescreen.dart';
import 'package:untitled55/user%20inter/screen/login.dart';

import 'BlocObserver.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider<AppCubitA>(
    create: (context) => AppCubitA()
      ..getData()
      ..getDataFromFirebase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user == null ? LoginScreen() : const HomeLayout(),
    );
  }
}
