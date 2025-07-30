class WorkoutModel {
  final int id;
  final String title;
  final String level;
  final String date;
  final String time;
  final String room;
  final String trainer;
  final String createdAt;

  WorkoutModel({
    required this.id,
    required this.title,
    required this.level,
    required this.date,
    required this.time,
    required this.room,
    required this.trainer,
    required this.createdAt,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      title: json['title'],
      level: json['level'],
      date: json['date'],
      time: json['time'],
      room: json['room'],
      trainer: json['trainer'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'level': level,
      'date': date,
      'time': time,
      'room': room,
      'trainer': trainer,
      'created_at': createdAt,
    };
  }
}
