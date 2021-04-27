import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:multiply_by_five_bloc/constants/enums.dart';
import 'package:multiply_by_five_bloc/logic/cubit/internet_cubit.dart';

part 'multiply_state.dart';

class MultiplyCubit extends Cubit<MultiplyState> {
  //method 1
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  MultiplyCubit({@required this.internetCubit})
      : super(MultiplyState(number: 1)) {
    internetStreamSubscription = monitorMultiplyCubit();
  }

  StreamSubscription<InternetState> monitorMultiplyCubit() {
    return internetCubit.stream.listen((internetState) {
    if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Wifi) {
      multiply();
    } else if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Mobile) {
      divide();
    }
  });
  }
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

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
