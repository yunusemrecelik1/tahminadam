import 'dart:async';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tahmin_adam/bet.dart';
import 'package:tahmin_adam/bet_api.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Bet> betlist = List<Bet>();
  void getData() {
    BetApi.getBets().then((response){
      setState(() {
        Iterable list = jsonDecode(response.body);
        betlist = list.map((json) => Bet.fromJson(json)).toList();
      });
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'Tahmin Adam',
                    style: TextStyle(color: Colors.black),
            ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.teal.shade800,
      body:ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: betlist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(betlist[index].sport=='Futbol'?MdiIcons.soccer:betlist[index].sport=='Basketbol'?MdiIcons.basketball:MdiIcons.tennis),
                            SizedBox(width: 10,),
                            Text(betlist[index].sport,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10,height: 50,),
                          Text(betlist[index].team1 + '-' + betlist[index].team2,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,),),
                        ],
                      ),
                      Container(
                        color: Colors.grey.shade50,
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(betlist[index].bet_date,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                            Text(betlist[index].league,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black45,
                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 5.0,right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(betlist[index].bet_guess+': '+betlist[index].bet_result,style: TextStyle(color:Colors.white,fontSize: 20.0),),
                            Text(betlist[index].bet_rate,style: TextStyle(color:Colors.white,fontSize: 20.0),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },

      ),
    );
  }


}

