import 'package:api_test/widget/card_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/player_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dio=Dio();
  List<PlayerModel> players=[];

  Future<void> getHttp() async {
    final response = await dio.get('https://fantasy.premierleague.com/api/bootstrap-static/');
    final List elements=await response.data['elements'];
    if(mounted){
      for(int counter=0;counter<elements.length;counter++){
        setState(() {
          players.add(PlayerModel('images/lionel-messi-png-12006.png',fName: elements[counter]['first_name'], lName: elements[counter]['second_name'], total: elements[counter]['total_points'], gwp: elements[counter]['event_points'],assists: elements[counter]['assists'],goals: elements[counter]['goals_scored'],red: elements[counter]['red_cards'],yellow: elements[counter]['yellow_cards'],type: elements[counter]['element_type']));
        });
      }
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }
  int playerNum=15;
  int goalkeepers=2;
  int defenders=5;
  int midfielders=5;
  int forwards=3;

  List<PlayerModel> exactPlayer=[];
  void insertPlayer(){
    for(int counter=players.length-1;playerNum>0;counter--){
      if(players[counter].type==1){
        if(goalkeepers!=0) {
          exactPlayer.add(players[counter]);
          goalkeepers--;
          playerNum--;
        }
      } else if(players[counter].type==2){
        if(defenders!=0) {
          exactPlayer.add(players[counter]);
          defenders--;
          playerNum--;
        }
      }else if(players[counter].type==3){
        if(midfielders!=0) {
          exactPlayer.add(players[counter]);
          midfielders--;
          playerNum--;
        }
      }else if(players[counter].type==4){
        if(forwards!=0) {
          exactPlayer.add(players[counter]);
          forwards--;
          playerNum--;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    players.sort((a, b) => a.total.compareTo(b.total));
    insertPlayer();
    final double widthSize=MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body:SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset('images/stadium.jpg',fit: BoxFit.cover),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(exactPlayer.length, (index) {
                          if(exactPlayer[index].type==1) {
                            return CardWidget(playerModel: exactPlayer[index]);
                          } else {
                            return const SizedBox();
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(exactPlayer.length, (index) {
                          if(exactPlayer[index].type==2) {
                            return CardWidget(playerModel: exactPlayer[index]);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          SizedBox(width: widthSize*0.08,),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                          SizedBox(width: widthSize*0.08,),
                          Image.asset('images/gold1.png',fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
