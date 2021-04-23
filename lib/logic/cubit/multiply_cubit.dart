import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'multiply_state.dart';

class MultiplyCubit extends Cubit<MultiplyState> {
  MultiplyCubit() : super(MultiplyState(number: 1));

  void multiply() {
    emit(
      MultiplyState(number: state.number * 5, wasMultiplied: true),
    );
  }

  void divide() {
    emit(
      MultiplyState(number: state.number / 5, wasMultiplied: false),
    );
  }
}
