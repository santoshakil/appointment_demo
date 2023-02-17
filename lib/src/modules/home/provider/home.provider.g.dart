// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAppointmentHash() => r'97299f558448cc4605c85ec7ad603a9a4a2c77b7';

/// See also [GetAppointment].
@ProviderFor(GetAppointment)
final getAppointmentProvider = AutoDisposeAsyncNotifierProvider<GetAppointment,
    List<Appointment>>.internal(
  GetAppointment.new,
  name: r'getAppointmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAppointmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetAppointment = AutoDisposeAsyncNotifier<List<Appointment>>;
String _$addAppointmentHash() => r'eccf48d06d86fb529d795ad87e2d0c71220c5a5e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AddAppointment
    extends BuildlessAutoDisposeNotifier<Appointment> {
  late final Appointment? appointment;

  Appointment build(
    Appointment? appointment,
  );
}

/// See also [AddAppointment].
@ProviderFor(AddAppointment)
const addAppointmentProvider = AddAppointmentFamily();

/// See also [AddAppointment].
class AddAppointmentFamily extends Family<Appointment> {
  /// See also [AddAppointment].
  const AddAppointmentFamily();

  /// See also [AddAppointment].
  AddAppointmentProvider call(
    Appointment? appointment,
  ) {
    return AddAppointmentProvider(
      appointment,
    );
  }

  @override
  AddAppointmentProvider getProviderOverride(
    covariant AddAppointmentProvider provider,
  ) {
    return call(
      provider.appointment,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addAppointmentProvider';
}

/// See also [AddAppointment].
class AddAppointmentProvider
    extends AutoDisposeNotifierProviderImpl<AddAppointment, Appointment> {
  /// See also [AddAppointment].
  AddAppointmentProvider(
    this.appointment,
  ) : super.internal(
          () => AddAppointment()..appointment = appointment,
          from: addAppointmentProvider,
          name: r'addAppointmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAppointmentHash,
          dependencies: AddAppointmentFamily._dependencies,
          allTransitiveDependencies:
              AddAppointmentFamily._allTransitiveDependencies,
        );

  final Appointment? appointment;

  @override
  bool operator ==(Object other) {
    return other is AddAppointmentProvider && other.appointment == appointment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appointment.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Appointment runNotifierBuild(
    covariant AddAppointment notifier,
  ) {
    return notifier.build(
      appointment,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
