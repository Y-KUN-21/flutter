import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gocorono_event.dart';
part 'gocorono_state.dart';

class GocoronoBloc extends Bloc<GocoronoEvent, GocoronoState> {
  @override
  GocoronoState get initialState => GocoronoInitial();

  @override
  Stream<GocoronoState> mapEventToState(
    GocoronoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
