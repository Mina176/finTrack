// No manual colors needed here anymore!
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/features/add%20transaction/presentation/category_icon_with_label.dart';
import 'package:fintrack/widgets/category_icon.dart';

final List<CategoryIcon> spendingCategoriesList = [
  CategoryIcon(categoryType: CategoryTypes.food),
  CategoryIcon(categoryType: CategoryTypes.transport),
  CategoryIcon(categoryType: CategoryTypes.health),
  CategoryIcon(categoryType: CategoryTypes.housing),
  CategoryIcon(categoryType: CategoryTypes.entertainment),
  CategoryIcon(categoryType: CategoryTypes.shopping),
  CategoryIcon(categoryType: CategoryTypes.bills),
  CategoryIcon(categoryType: CategoryTypes.freelance),
];

final List<CategoryIcon> incomeCategoriesList = [
  CategoryIcon(categoryType: CategoryTypes.salary),
  CategoryIcon(categoryType: CategoryTypes.gifts),
];

final List<CategoryIconWithLabel> spendingCategoriesWithLabelsList = [
  CategoryIconWithLabel(categoryType: CategoryTypes.food),
  CategoryIconWithLabel(categoryType: CategoryTypes.transport),
  CategoryIconWithLabel(categoryType: CategoryTypes.health),
  CategoryIconWithLabel(categoryType: CategoryTypes.housing),
  CategoryIconWithLabel(categoryType: CategoryTypes.entertainment),
  CategoryIconWithLabel(categoryType: CategoryTypes.shopping),
  CategoryIconWithLabel(categoryType: CategoryTypes.bills),
  CategoryIconWithLabel(categoryType: CategoryTypes.freelance),
];
final List<CategoryIconWithLabel> incomeCategoriesWithLabelsList = [
  CategoryIconWithLabel(categoryType: CategoryTypes.freelance),
  CategoryIconWithLabel(categoryType: CategoryTypes.investment),
  CategoryIconWithLabel(categoryType: CategoryTypes.salary),
  CategoryIconWithLabel(categoryType: CategoryTypes.gifts),
];
