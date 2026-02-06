import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/accounts/logic/account_supabase_service.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/logic/supabase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<void> build() {}

  Future<void> createAccount(AccountModel account) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(accountSupabaseServiceProvider);
      await service.createAccount(account);

      state = const AsyncData(null);

      ref.invalidate(getAccountsProvider);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

@riverpod
Future<List<AccountModel>> getAccounts(Ref ref) async {
  final service = ref.read(accountSupabaseServiceProvider);
  return service.getAccounts();
}
