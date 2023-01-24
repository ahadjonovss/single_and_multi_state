part of 'single_state_bloc.dart';

class SingleState extends Equatable {
  Status? status;
  String? error;
  List? cards;

  SingleState({
     this.status,
     this.error,
     this.cards,
  });

  SingleState copyWith({
    Status? status,
    String? error,
    List? cards,
  }) {
    return SingleState(
        error: error ?? this.error,
        cards: cards ?? this.cards,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, cards];
}

enum Status { PURE, LOADING, ERROR, SUCCESS }
