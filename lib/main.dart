import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc/counter_bloc.dart';
import 'Pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batman Game Demo',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
      providers: 
      [
        BlocProvider(
          create: (context) => CounterBloc()
        )
      ], 
      child: const CounterPage(),
      )
    );
  }
}


