import 'package:flutter/material.dart';
import 'package:multiply_by_five_bloc/logic/cubit/multiply_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiply_by_five_bloc/presentation/screens/home_screen.dart';
import 'package:multiply_by_five_bloc/presentation/screens/second_screen.dart';
import 'package:multiply_by_five_bloc/presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MultiplyCubit _multiplyCubit = MultiplyCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MultiplyCubit(),
      child: MaterialApp(
        routes: {
          '/': (context) => BlocProvider.value(
                value: _multiplyCubit,
                child: HomeScreen(
                  title: 'Home Screen',
                  color: Colors.green,
                ),
              ),
          '2nd': (context) => BlocProvider.value(
                value: _multiplyCubit,
                child: SecondScreen(
                  title: 'Second Screen',
                  color: Colors.orange,
                ),
              ),
          '3rd': (context) => BlocProvider.value(
                value: _multiplyCubit,
                child: ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.cyan,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _multiplyCubit.close();
    super.dispose();
  }
}
