import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/isar.dart';
import '../model/home.model.dart';

part 'home.provider.g.dart';

final appointmentsStreamProvider =
    StreamProvider.autoDispose((_) => db.appointments.watchLazy());

@riverpod
class GetAppointment extends _$GetAppointment {
  @override
  FutureOr<List<Appointment>> build() {
    ref.watch(appointmentsStreamProvider);
    return db.appointments.where().findAll();
  }
}

@riverpod
class AddAppointment extends _$AddAppointment {
  @override
  Appointment build(Appointment? appointment) =>
      appointment ??
      Appointment(
        name: DateTime.now().toIso8601String(),
        toWhom: '',
        isDone: false,
        description: '',
        datetime: DateTime.now(),
      );

  Future<void> save() async =>
      await db.writeTxn(() => db.appointments.put(state));

  Future<void> delete() async {
    if (state.id == null) return;
    await db.writeTxn(() => db.appointments.delete(state.id!));
  }

  Future<void> done() async {
    state.isDone = true;
    await db.writeTxn(() => db.appointments.put(state));
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: state.datetime,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;
    state.datetime = DateTime(
      date.year,
      date.month,
      date.day,
      state.datetime.hour,
      state.datetime.minute,
    );
    state = state.copyWith();
  }

  Future<void> pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(state.datetime),
    );
    if (time == null) return;
    state.datetime = DateTime(
      state.datetime.year,
      state.datetime.month,
      state.datetime.day,
      time.hour,
      time.minute,
    );
    state = state.copyWith();
  }

  void toggleDone(bool value) {
    state.isDone = value;
    state = state.copyWith();
  }
}
