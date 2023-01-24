import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_state_state.dart';

class SingleStateCubit extends Cubit<SingleStateState> {
  SingleStateCubit() : super(SingleStateInitial());
}
