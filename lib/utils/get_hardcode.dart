extension HardcodeStringExtension on String {
  String get hardcoded => this;
}

String getInfoText(int selectedRecurrenceIndex) {
  if (selectedRecurrenceIndex == 0) {
    return 'The budget will reset automatically on Monday of every week.';
  } else if (selectedRecurrenceIndex == 1) {
    return 'The budget will reset automatically on 1st of every month';
  } else {
    return 'The budget will reset automatically on 1st Jan of every year.';
  }
}
