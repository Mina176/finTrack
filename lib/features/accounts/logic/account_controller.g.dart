// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAccountsHash() => r'224ea9ed0cd26ff6cb209c2a1c35372baddf5eab';

/// See also [getAccounts].
@ProviderFor(getAccounts)
final getAccountsProvider =
    AutoDisposeFutureProvider<List<AccountModel>>.internal(
      getAccounts,
      name: r'getAccountsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getAccountsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAccountsRef = AutoDisposeFutureProviderRef<List<AccountModel>>;
String _$getNetWorthHash() => r'493c327911e8ff04011043a94aea42dc196140d9';

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
String _$accountControllerHash() => r'c343e1f610221838c9555260aaa7fd420a09b535';

/// See also [AccountController].
@ProviderFor(AccountController)
final accountControllerProvider =
    AutoDisposeAsyncNotifierProvider<AccountController, void>.internal(
      AccountController.new,
      name: r'accountControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$accountControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AccountController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
