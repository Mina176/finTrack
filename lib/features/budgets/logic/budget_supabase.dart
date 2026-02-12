import 'package:fintrack/features/budgets/data/budget_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'budget_supabase.g.dart';

@Riverpod(keepAlive: true)
BudgetSupabaseService budgetSupabaseService(Ref ref) {
  return BudgetSupabaseService();
}

class BudgetSupabaseService {
  Future<void> createBudget(BudgetModel budget) async {
    await Supabase.instance.client.from('budgets').insert(budget.toMap());
  }

  Future<List<BudgetModel>> getBudgets() async {
    final response = await Supabase.instance.client.from('budgets').select();
    final data = response as List<dynamic>;
    return data.map((item) => BudgetModel.fromMap(item)).toList();
  }
}
