import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home.provider.dart';
import 'dialoge.dart';
import 'tile.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(getAppointmentProvider).value;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: appointments == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                for (final appointment in appointments)
                  AppointmentTile(appointment),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => await showModal(
          builder: (_) => const AppointmentDialog(),
          context: context,
        ),
      ),
    );
  }
}
