import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiply_by_five_bloc/cubit/multiply_cubit.dart';
// import 'package:multiply_by_five_bloc/cubit/multiply_state.dart';

void main () {
  group(MultiplyCubit, (){

    MultiplyCubit multiplyCubit;

    //Initializes the necessary setup that the test will use
    setUp(() {
      multiplyCubit = MultiplyCubit();
    });

    //Dictates what will happen after the test finishes
    tearDown(() {
      multiplyCubit.close();
    });

    //Tests the initial state
    test('initial state of MultiplyCubit is MultiplyState(number: 1.0)', (){
      expect(multiplyCubit.state, MultiplyState(number: 1.0));
    });

    //Tests the methods multiply and divide
    blocTest('The cubit should emit a state of MultiplyState(number: 5.0, '
        'wasMultiplied: false) when multiply() function is called',
        build: () => multiplyCubit,
        act: (cubit) => cubit.multiply(),
        expect: () => [MultiplyState(number: 5.0, wasMultiplied: true)]
    );

    blocTest('The cubit should emit a state of MultiplyState(number: 0.2, '
        'wasMultiplied: false) when multiply() function is called',
        build: () => multiplyCubit,
        act: (cubit) => cubit.divide(),
        expect: () => [MultiplyState(number: 0.2, wasMultiplied: false)]
    );

  });
}