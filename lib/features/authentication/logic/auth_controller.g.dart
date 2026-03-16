// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthLoadingState> {
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthLoadingState>(value),
    );
  }
}

String _$authControllerHash() => r'3968c6160140feafb371c424aeed7e5d336bd4ed';

abstract class _$AuthController extends $Notifier<AuthLoadingState> {
  AuthLoadingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthLoadingState, AuthLoadingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthLoadingState, AuthLoadingState>,
              AuthLoadingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsRecoveringPassword)
final isRecoveringPasswordProvider = IsRecoveringPasswordProvider._();

final class IsRecoveringPasswordProvider
    extends $NotifierProvider<IsRecoveringPassword, bool> {
  IsRecoveringPasswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isRecoveringPasswordProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isRecoveringPasswordHash();

  @$internal
  @override
  IsRecoveringPassword create() => IsRecoveringPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isRecoveringPasswordHash() =>
    r'79183e7209f9450ff99903744be53af9b1cd358d';

abstract class _$IsRecoveringPassword extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
