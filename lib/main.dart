import 'package:flutter/material.dart';
import 'package:multiply_by_five_bloc/logic/cubit/multiply_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiply_by_five_bloc/presentation/screens/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MultiplyCubit(),
      child: MaterialApp(
        home: HomeScreen(
          color: Colors.red,
          title: 'Multiply Counter App',
          
        ),
        
      ),
    );
  }
}


