part of 'gocorono_bloc.dart';

abstract class GocoronoState extends Equatable {
  const GocoronoState();
}

class GocoronoInitial extends GocoronoState {
  @override
  List<Object> get props => [];
}
