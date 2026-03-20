enum RecurrenceDuration {
  weekly(
    infoText: 'The budget will reset automatically on Monday of every week.',
  ),
  monthly(
    infoText: 'The budget will reset automatically on 1st of every month.',
  ),
  yearly(
    infoText: 'The budget will reset automatically on 1st Jan of every year.',
  )
  ;

  final String infoText;
  const RecurrenceDuration({required this.infoText});
}
