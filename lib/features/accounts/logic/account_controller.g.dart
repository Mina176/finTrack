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
String _$accountControllerHash() => r'0522dde946a608c74630f36777be050fa9dfb4f7';

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
