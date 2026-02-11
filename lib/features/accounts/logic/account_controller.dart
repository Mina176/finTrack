import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/accounts/logic/account_supabase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  Future<AccountModel> updateAccountBalance({
    required AccountModel account,
    required double amount,
    required bool isExpense,
  }) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(accountSupabaseServiceProvider);
      AccountModel accountToUpdate = account;
      if (account.id == null) {
        final allAccounts = await ref.read(getAccountsProvider.future);
        try {
          accountToUpdate = allAccounts.firstWhere(
            (a) =>
                a.accountType == account.accountType &&
                a.accountName == account.accountName,
          );
        } catch (e) {
          throw Exception(
            "Could not find account to update. Ensure the account exists and has an ID.",
          );
        }
      }
      final updatedAccount = await service.updateAccountBalance(
        accountToUpdate,
        amount,
        isExpense,
      );

      state = const AsyncData(null);
      ref.invalidate(getAccountsProvider);

      return updatedAccount;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}

@riverpod
Future<List<AccountModel>> getAccounts(Ref ref) async {
  final service = ref.read(accountSupabaseServiceProvider);
  return service.getAccounts();
}
