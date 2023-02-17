import 'package:appointment_demo/src/extensions/extensions.dart';
import 'package:appointment_demo/src/modules/home/model/home.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home.provider.dart';

class AppointmentDialog extends ConsumerWidget {
  const AppointmentDialog({super.key, this.appointment});
  final Appointment? appointment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(addAppointmentProvider(appointment));
    return AlertDialog(
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Name'),
            controller: TextEditingController(text: provider.name),
            onChanged: (value) => provider.name = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'To Whom'),
            controller: TextEditingController(text: provider.toWhom),
            onChanged: (value) => provider.toWhom = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Description'),
            controller: TextEditingController(text: provider.description),
            onChanged: (value) => provider.description = value,
          ),
          ListTile(
            title: const Text('Appointment Date'),
            subtitle: Text(provider.datetime.formattedDate),
            onTap: () async => await ref
                .read(addAppointmentProvider(appointment).notifier)
                .pickDate(context),
          ),
          ListTile(
            title: const Text('Appointment Time'),
            subtitle: Text(provider.datetime.formattedTime),
            onTap: () async => await ref
                .read(addAppointmentProvider(appointment).notifier)
                .pickTime(context),
          ),
          SwitchListTile.adaptive(
            title: const Text('Is Done'),
            value: provider.isDone,
            onChanged: (value) => ref
                .read(addAppointmentProvider(appointment).notifier)
                .toggleDone(value),
          ),
        ],
      ),
      actions: [
        if (provider.id != null)
          TextButton(
            child: const Text('Delete'),
            onPressed: () async => await ref
                .read(addAppointmentProvider(appointment).notifier)
                .delete()
                .then((_) => Navigator.of(context).pop()),
          ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () async => await ref
              .read(addAppointmentProvider(appointment).notifier)
              .save()
              .then((_) => Navigator.of(context).pop()),
        ),
      ],
    );
  }
}
