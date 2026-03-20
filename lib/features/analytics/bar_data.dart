import 'individual_bar.dart';

class BarData {
  final List<double> amounts;

  BarData({required this.amounts});

  List<IndividualBar> getBarData() {
    return List.generate(
      amounts.length,
      (i) => IndividualBar(x: i, y: amounts[i]),
    );
  }
}
