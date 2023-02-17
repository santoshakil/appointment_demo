import 'package:animations/animations.dart';
import 'package:appointment_demo/src/modules/home/model/home.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home.provider.dart';
import 'dialoge.dart';

class AppointmentTile extends ConsumerWidget {
  const AppointmentTile(this.appointment, {super.key});

  final Appointment appointment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(appointment.name),
      subtitle: appointment.description != null
          ? Text(appointment.description!)
          : null,
      trailing: appointment.isDone
          ? null
          : IconButton(
              icon: const Icon(Icons.done_all_rounded),
              onPressed: () async => await ref
                  .read(addAppointmentProvider(appointment).notifier)
                  .done(),
            ),
      onTap: () async => await showModal(
        builder: (_) => AppointmentDialog(appointment: appointment),
        context: context,
      ),
    );
  }
}
