class ActivityLocalDTO {
  final int? id;
  final int actionId;
  final int day;
  final DateTime startOfActivity;
  final DateTime? endOfActivity;

  ActivityLocalDTO({
    this.id,
    required this.day,
    required this.actionId,
    required this.startOfActivity,
    this.endOfActivity,
  });
}
