import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      await Supabase.instance.client
          .from('transactions')
          .insert(transaction.toMap());

      print('Record created successfully!');
    } catch (e) {
      print('Error creating record: $e');
    }
  }
}
