part of 'multiply_cubit.dart';

class MultiplyState extends Equatable{
  double number;
  bool wasMultiplied;

  MultiplyState({@required this.number, this.wasMultiplied});

  @override
  // Needed to trick Dart into thinking that the expected and actual test values are in the same memory
  List<Object> get props => [this.number, this.wasMultiplied];
}
