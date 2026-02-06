import 'package:fintrack/features/accounts/data/account_model.dart';
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'account_supabase_service.g.dart';

@Riverpod(keepAlive: true)
AccountSupabaseService accountSupabaseService(Ref ref) {
  return AccountSupabaseService();
}

class AccountSupabaseService {
  final SupabaseClient client = Supabase.instance.client;
  Future<void> createAccount(AccountModel account) async {
    await client.from('accounts').insert(account.toMap());
  }

  Future<List<AccountModel>> getAccounts() async {
    final response = await client.from('accounts').select();
    final data = response as List<dynamic>;

    return data.map((item) => AccountModel.fromMap(item)).toList();
  }

  Future<void> deleteAllAccounts() async {
    await client.from('accounts').delete().neq('id', 0);
  }

  Future<double> getNetWorth() async {
    final response = await client.from('accounts').select('balance');

    final data = response as List<dynamic>;

    double totalBalance = 0.0;

    for (var item in data) {
      totalBalance += (item['balance'] as num).toDouble();
    }

    return totalBalance;
  }
}
