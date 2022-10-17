import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laverdi/src/features/home/domain/models/meal.dart';
import 'package:laverdi/src/features/home/domain/store/home_store.dart';

part 'home_events.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeStore _store;

  HomeBloc({required HomeStore store})
      : _store = store,
        super(
          HomeState(),
        ) {
    on<LoadMealsEvent>(_loadMeals);
    on<ShowCalendarEvent>(_showCalendar);
  }

  FutureOr<void> _loadMeals(
    LoadMealsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );
    await emit.forEach<List<Meal>>(
      _store.loadMeals(event.date),
      onData: (data) => state.copyWith(
        status: HomeStatus.success,
        meals: data,
        date: event.date,
      ),
      onError: (error, stackTrace) => state.copyWith(
        errorMessage: error.toString(),
      ),
    );
  }

  FutureOr<void> _showCalendar(
    ShowCalendarEvent event,
    Emitter<HomeState> emit,
  ) async {
    await emit.forEach<bool>(
      _store.showCalendar(),
      onData: (value) => state.copyWith(
        showCalendar: value,
      ),
      onError: (error, stackTrace) => state.copyWith(
        errorMessage: error.toString(),
      ),
    );
  }
}
