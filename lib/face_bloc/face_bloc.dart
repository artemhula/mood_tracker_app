import 'package:bloc/bloc.dart';

class FaceCubit extends Cubit<double> {
  FaceCubit() : super(50.0);

  void updateSmileCurvature(double x) => emit(x);
}
