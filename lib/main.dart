import 'package:flutter/material.dart';
import 'package:multiply_by_five_bloc/cubit/multiply_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: HomePage(
          title: 'Multiply Counter App',
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The number is currently',
            ),
            BlocConsumer<MultiplyCubit, MultiplyState>(
              listener: (context, state) {
                if (state.wasMultiplied == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Multiplied'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Divided'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.number.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<MultiplyCubit>(context).divide();
                  },
                  child: Text('/'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<MultiplyCubit>(context).multiply();
                  },
                  child: Text('*'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
