import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:multiply_by_five_bloc/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());
}

