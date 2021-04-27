import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiply_by_five_bloc/logic/cubit/multiply_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
            //     // Navigator.of(context).push(
            //     //   MaterialPageRoute(
            //     //       builder: (_) => BlocProvider.value(
            //     //               value: BlocProvider.of<MultiplyCubit>(context),
            //     //               child: SecondScreen(
            //     //               title: 'Second Screen',
            //     //               color: Colors.greenAccent,
            //     //             ),
            //     //       ),
            //     //     ),
            //     // );
            //   },
            //   child: Text('Go to 2nd screen'),
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
                Navigator.of(context).pushNamed('2nd');
              },
              child: Text('Go to Second screen'),
            ),
          ],
        ),
      ),
    );
  }
}
