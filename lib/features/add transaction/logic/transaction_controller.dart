import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/logic/supabase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_controller.g.dart';

@riverpod
class TransactionController extends _$TransactionController {
  @override
  FutureOr<void> build() {}

  Future<void> createTransaction(TransactionModel transaction) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(supabaseServiceProvider);
      await service.createTransaction(transaction);

      state = const AsyncData(null);

      ref.invalidate(transactionsProvider);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

@riverpod
Future<List<TransactionModel>> getTransactions(Ref ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.getTransactions();
}
