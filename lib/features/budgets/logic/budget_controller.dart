import 'package:fintrack/features/budgets/data/budget_model.dart';
import 'package:fintrack/features/budgets/logic/budget_supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_controller.g.dart';

@riverpod
class BudgetController extends _$BudgetController {
  @override
  FutureOr<void> build() {}

  Future<void> createBudget(BudgetModel budget) async {
    state = const AsyncLoading();

    try {
      final service = ref.read(budgetSupabaseServiceProvider);
      await service.createBudget(budget);

      state = const AsyncData(null);

    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

