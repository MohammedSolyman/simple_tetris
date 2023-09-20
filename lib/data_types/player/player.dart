class Player {
  late String name;
  late int score;
  int? date;
  Player({
    required this.name,
    required this.score,
    this.date,
  });

  Player.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    score = map['score'];
    date = map['date'];
  }
}
