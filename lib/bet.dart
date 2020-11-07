class Bet{
  String id;
  String sport;
  String team1;
  String team2;
  String bet_date;
  String league;
  String bet_guess;
  String bet_result;
  String bet_rate;

  Bet(this.id,this.sport,this.team1,this.team2,this.bet_date,this.league,this.bet_guess,this.bet_result,this.bet_rate);


     Bet.fromJson(Map<String,dynamic> json){
     Bet(
      id=json['id'],
      sport=json['sport'],
      team1=json['team1'],
      team2=json['team2'],
      bet_date=json['bet_date'],
      league=json['league'],
      bet_guess=json['bet_guess'],
      bet_result=json["bet_result"],
      bet_rate=json["bet_rate"],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "sport": sport,
      "team1": team1,
      "team2": team2,
      "bet_rate": bet_rate,
      "league": league,
      "bet_guess": bet_guess,
      "bet_result": bet_result,
      "bet_date": bet_date,
    };
  }
}

// Bet.fromJson(Map json){
//
//   }