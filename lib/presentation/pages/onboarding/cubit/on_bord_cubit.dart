import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_bord_state.dart';

class OnBordCubit extends Cubit<OnBordState> {
  OnBordCubit() : super(OnBordInitial());
}
