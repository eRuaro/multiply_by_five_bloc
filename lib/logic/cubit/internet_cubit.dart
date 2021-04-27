import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:multiply_by_five_bloc/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  //method 1 of bloc communication;

  InternetCubit({@required this.connectivity}) : super(InternetLoading());

  void emitInternetConnected(ConnectionType _connectionType) {
    emit(InternetConnected(connectionType: _connectionType));
  }

  void emitInternetDisconnected() {
    emit(InternetDisconnected());
  }
}
