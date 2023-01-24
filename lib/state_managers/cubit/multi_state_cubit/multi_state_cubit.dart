import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'multi_state_state.dart';

class MultiStateCubit extends Cubit<MultiStateState> {
  MultiStateCubit() : super(MultiStateInitial());
}
