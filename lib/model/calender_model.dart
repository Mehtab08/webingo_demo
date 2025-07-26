class CalenderModel{
  String dayName;
  int date;
  bool hasEvent;

  CalenderModel({
    required this.dayName,
    required this.date,
    required this.hasEvent,
  });
}

List<CalenderModel> calenderList = [
  CalenderModel(dayName: 'Sun', date: 22, hasEvent: false),
  CalenderModel(dayName: 'Mon', date: 23, hasEvent: true),
  CalenderModel(dayName: 'Tue', date: 24, hasEvent: false),
  CalenderModel(dayName: 'Wed', date: 25, hasEvent: true),
  CalenderModel(dayName: 'Thu', date: 26, hasEvent: false),
  CalenderModel(dayName: 'Fri', date: 27, hasEvent: true),
  CalenderModel(dayName: 'Sat', date: 28, hasEvent: true),
];
