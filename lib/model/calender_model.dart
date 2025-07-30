class CalenderModel{
  String dayName;
  String date;
  bool hasEvent;

  CalenderModel({
    required this.dayName,
    required this.date,
    required this.hasEvent,
  });
}

List<CalenderModel> calenderList = [
  CalenderModel(dayName: 'Sun', date: "2025-11-22", hasEvent: false),
  CalenderModel(dayName: 'Mon', date: "2025-11-23", hasEvent: true),
  CalenderModel(dayName: 'Tue', date: "2025-11-24", hasEvent: false),
  CalenderModel(dayName: 'Wed', date: "2025-11-25", hasEvent: true),
  CalenderModel(dayName: 'Thu', date: "2025-11-26", hasEvent: false),
  CalenderModel(dayName: 'Fri', date: "2025-11-27", hasEvent: true),
  CalenderModel(dayName: 'Sat', date: "2025-11-28", hasEvent: true),
];
