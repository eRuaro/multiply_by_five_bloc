import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiply_by_five_bloc/logic/cubit/multiply_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            // SizedBox(
            //   height: 20,
            // ),
            // MaterialButton(
            //   color: widget.color,
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: Text('Go back to 1st screen'),
            // ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Text('Go to Home screen'),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('3rd');
              },
              child: Text('Go to third screen'),
            ),
          ],
        ),
      ),
    );
  }
}
