import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'supabase.g.dart';

@Riverpod(keepAlive: true)
SupabaseService supabaseService(Ref ref) {
  return SupabaseService();
}

class SupabaseService {
  Future<void> createTransaction(TransactionModel transaction) async {
    await Supabase.instance.client
        .from('transactions')
        .insert(transaction.toMap());
  }

  Future<List<TransactionModel>> getTransactions() async {
    final response = await Supabase.instance.client
        .from('transactions')
        .select()
        .order('id', ascending: false);

    final data = response as List<dynamic>;

    return data.map((item) => TransactionModel.fromMap(item)).toList();
  }
}
