// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNetWorthHash() => r'59708e229c35a89cd6d29c4e71fdf313fa06b211';

/// See also [getNetWorth].
@ProviderFor(getNetWorth)
final getNetWorthProvider = AutoDisposeFutureProvider<double>.internal(
  getNetWorth,
  name: r'getNetWorthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNetWorthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetNetWorthRef = AutoDisposeFutureProviderRef<double>;
String _$netWorthStatsHash() => r'a8913cc7930f4d25e1f15ad36464d052ab3fcf82';

/// See also [netWorthStats].
@ProviderFor(netWorthStats)
final netWorthStatsProvider = AutoDisposeFutureProvider<NetWorthStats>.internal(
  netWorthStats,
  name: r'netWorthStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$netWorthStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetWorthStatsRef = AutoDisposeFutureProviderRef<NetWorthStats>;
String _$accountControllerHash() => r'57f054fb4f02fd0024e3ecab0851af3d035ca18c';

/// See also [AccountController].
@ProviderFor(AccountController)
final accountControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      AccountController,
      List<AccountModel>
    >.internal(
      AccountController.new,
      name: r'accountControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$accountControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AccountController = AutoDisposeAsyncNotifier<List<AccountModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
