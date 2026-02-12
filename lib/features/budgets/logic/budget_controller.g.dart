// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBudgetsHash() => r'3bb9880445976e3801e6c2732e5819fa6fe9a574';

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

/// See also [getBudgets].
@ProviderFor(getBudgets)
const getBudgetsProvider = GetBudgetsFamily();

/// See also [getBudgets].
class GetBudgetsFamily extends Family<AsyncValue<List<BudgetModel>>> {
  /// See also [getBudgets].
  const GetBudgetsFamily();

  /// See also [getBudgets].
  GetBudgetsProvider call(RecurrenceDuration period) {
    return GetBudgetsProvider(period);
  }

  @override
  GetBudgetsProvider getProviderOverride(
    covariant GetBudgetsProvider provider,
  ) {
    return call(provider.period);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getBudgetsProvider';
}

/// See also [getBudgets].
class GetBudgetsProvider extends AutoDisposeFutureProvider<List<BudgetModel>> {
  /// See also [getBudgets].
  GetBudgetsProvider(RecurrenceDuration period)
    : this._internal(
        (ref) => getBudgets(ref as GetBudgetsRef, period),
        from: getBudgetsProvider,
        name: r'getBudgetsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getBudgetsHash,
        dependencies: GetBudgetsFamily._dependencies,
        allTransitiveDependencies: GetBudgetsFamily._allTransitiveDependencies,
        period: period,
      );

  GetBudgetsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final RecurrenceDuration period;

  @override
  Override overrideWith(
    FutureOr<List<BudgetModel>> Function(GetBudgetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBudgetsProvider._internal(
        (ref) => create(ref as GetBudgetsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<BudgetModel>> createElement() {
    return _GetBudgetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBudgetsProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetBudgetsRef on AutoDisposeFutureProviderRef<List<BudgetModel>> {
  /// The parameter `period` of this provider.
  RecurrenceDuration get period;
}

class _GetBudgetsProviderElement
    extends AutoDisposeFutureProviderElement<List<BudgetModel>>
    with GetBudgetsRef {
  _GetBudgetsProviderElement(super.provider);

  @override
  RecurrenceDuration get period => (origin as GetBudgetsProvider).period;
}

String _$getAllBudgetsDetailsHash() =>
    r'112c1850308b03ba826d00bcd0d279e285c2aa9d';

/// See also [getAllBudgetsDetails].
@ProviderFor(getAllBudgetsDetails)
const getAllBudgetsDetailsProvider = GetAllBudgetsDetailsFamily();

/// See also [getAllBudgetsDetails].
class GetAllBudgetsDetailsFamily extends Family<AsyncValue<AllBudgetsDetails>> {
  /// See also [getAllBudgetsDetails].
  const GetAllBudgetsDetailsFamily();

  /// See also [getAllBudgetsDetails].
  GetAllBudgetsDetailsProvider call(RecurrenceDuration period) {
    return GetAllBudgetsDetailsProvider(period);
  }

  @override
  GetAllBudgetsDetailsProvider getProviderOverride(
    covariant GetAllBudgetsDetailsProvider provider,
  ) {
    return call(provider.period);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getAllBudgetsDetailsProvider';
}

/// See also [getAllBudgetsDetails].
class GetAllBudgetsDetailsProvider
    extends AutoDisposeFutureProvider<AllBudgetsDetails> {
  /// See also [getAllBudgetsDetails].
  GetAllBudgetsDetailsProvider(RecurrenceDuration period)
    : this._internal(
        (ref) => getAllBudgetsDetails(ref as GetAllBudgetsDetailsRef, period),
        from: getAllBudgetsDetailsProvider,
        name: r'getAllBudgetsDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getAllBudgetsDetailsHash,
        dependencies: GetAllBudgetsDetailsFamily._dependencies,
        allTransitiveDependencies:
            GetAllBudgetsDetailsFamily._allTransitiveDependencies,
        period: period,
      );

  GetAllBudgetsDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final RecurrenceDuration period;

  @override
  Override overrideWith(
    FutureOr<AllBudgetsDetails> Function(GetAllBudgetsDetailsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllBudgetsDetailsProvider._internal(
        (ref) => create(ref as GetAllBudgetsDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AllBudgetsDetails> createElement() {
    return _GetAllBudgetsDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllBudgetsDetailsProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllBudgetsDetailsRef
    on AutoDisposeFutureProviderRef<AllBudgetsDetails> {
  /// The parameter `period` of this provider.
  RecurrenceDuration get period;
}

class _GetAllBudgetsDetailsProviderElement
    extends AutoDisposeFutureProviderElement<AllBudgetsDetails>
    with GetAllBudgetsDetailsRef {
  _GetAllBudgetsDetailsProviderElement(super.provider);

  @override
  RecurrenceDuration get period =>
      (origin as GetAllBudgetsDetailsProvider).period;
}

String _$budgetControllerHash() => r'abab231005efa3754c888c48869667c86f4656d5';

/// See also [BudgetController].
@ProviderFor(BudgetController)
final budgetControllerProvider =
    AutoDisposeAsyncNotifierProvider<BudgetController, void>.internal(
      BudgetController.new,
      name: r'budgetControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$budgetControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BudgetController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
