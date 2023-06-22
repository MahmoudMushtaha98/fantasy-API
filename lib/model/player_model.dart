class PlayerModel{
  final String fName;
  final String lName;
  final int total;
  final int gwp;
  final int goals;
  final int assists;
  final int yellow;
  final int red;
  final String url;
  final int type;
  PlayerModel(
      this.url,
      {required this.type,
      required this.gwp,
        required this.goals,
        required this.assists,
        required this.yellow,
        required this.red,
        required this.fName,
        required this.lName,
        required this.total}
      );
}