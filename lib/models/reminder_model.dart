class ReminderModel {
  final String reminder;
  final int minutes;
  ReminderModel({required this.minutes, required this.reminder});

  factory ReminderModel.formJson(Map<String, dynamic> json) {
    return ReminderModel(
        reminder: json['reminder'] as String, minutes: json['minutes'] as int);
  }

}
