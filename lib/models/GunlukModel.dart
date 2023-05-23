class GunlukModel {
  int id;
  DateTime? date;
  DateTime? start;
  DateTime? end;
  int? sleepQuality;
  String timeInBed;
  String wakeup;
  String sleepNotes;
  int? heartRate;
  int? steps;

  GunlukModel({
    required this.id,
    required this.date,
    required this.start,
    required this.end,
    this.sleepQuality,
    required this.timeInBed,
    required this.wakeup,
    required this.sleepNotes,
    this.heartRate,
    this.steps,
  });

  factory GunlukModel.fromJson(Map<String, dynamic> json) => GunlukModel(
        id: json["id"],
        date: json["date"],
        start: json["start"],
        end: json["end"],
        sleepQuality: json["sleepQuality"],
        timeInBed: json["timeInBed"],
        wakeup: json["wakeup"],
        sleepNotes: json["sleepNotes"],
        heartRate: json["heartRate"],
        steps: json["steps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gun": date,
        "start": start,
        "end": end,
        "sleepQuality": sleepQuality,
        "timeInBed": timeInBed,
        "wakeup": wakeup,
        "sleepNotes": sleepNotes,
        "heartRate": heartRate,
        "steps": steps,
      };
}
