import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:multiply_by_five_bloc/logic/cubit/internet_cubit.dart';
import 'package:multiply_by_five_bloc/logic/cubit/multiply_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiply_by_five_bloc/presentation/screens/home_screen.dart';
import 'package:multiply_by_five_bloc/presentation/screens/second_screen.dart';
import 'package:multiply_by_five_bloc/presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final MultiplyCubit _multiplyCubit = MultiplyCubit();
  final Connectivity connectivity;

   MyApp({
    Key key,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<MultiplyCubit>(
          create: (multiplyCubitContext) => MultiplyCubit(),
        ),
      ],
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
}
