// To parse this JSON data, do
//
//     final sleepData = sleepDataFromJson(jsonString);
class SleepData {
  int id;
  String start;
  int sleepQuality;
  int regularity;
  int? heartRate;
  String timeInBed;
  String timeAsleep;
  int remSleep;
  int deepSleep;
  int lightSleep;
  String end;

  SleepData({
    required this.id,
    required this.start,
    required this.sleepQuality,
    required this.regularity,
    this.heartRate,
    required this.timeInBed,
    required this.timeAsleep,
    required this.remSleep,
    required this.deepSleep,
    required this.lightSleep,
    required this.end,
  });

  factory SleepData.fromJson(Map<String, dynamic> json) => SleepData(
        id: json["id"],
        start: json["start"],
        sleepQuality: json["sleepQuality"],
        regularity: json["regularity"],
        heartRate: json["heartRate"],
        timeInBed: json["timeInBed"],
        timeAsleep: json["timeAsleep"],
        remSleep: json["remSleep"],
        deepSleep: json["deepSleep"],
        lightSleep: json["lightSleep"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "sleepQuality": sleepQuality,
        "regularity": regularity,
        "heartRate": heartRate,
        "timeInBed": timeInBed,
        "timeAsleep": timeAsleep,
        "remSleep": remSleep,
        "deepSleep": deepSleep,
        "lightSleep": lightSleep,
        "end": end,
      };
}
