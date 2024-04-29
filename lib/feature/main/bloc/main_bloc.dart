import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<_MainEventChangeDashboard>((event, emit) {
      emit(state.copyWith(
        fullDashboard: event.fullDashboard,
        defaultVersion: event.defaultVersion,
      ));
    });
    on<_MainEventChangePage>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
