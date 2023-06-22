import 'package:flutter/material.dart';
import '../model/player_model.dart';

class CardWidget extends StatelessWidget {

final PlayerModel playerModel;

  const CardWidget({Key? key, required this.playerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthSize=MediaQuery.of(context).size.width;
    final double heightSize=MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset('images/gold1.png'),
        Positioned(
            right: widthSize*0.25,
            bottom: heightSize*0.615,
            child: SizedBox(
          width: widthSize*0.5,
          height: heightSize*0.3,
          child: Image.asset(playerModel.url),
        )
        ),
        Positioned(
            right: widthSize*0.18,
            bottom: heightSize*0.4,
            child: SizedBox(
              width: widthSize*0.65,
              height: heightSize*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${playerModel.fName} ${playerModel.lName}',style: TextStyle(fontSize: widthSize*0.05,color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AutofillHints.addressCity)),
                  Divider(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.total.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('total',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.gwp.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('GWP',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.goals.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('goals',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.assists.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('assists',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.yellow.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('yellow',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                      Row(children: [SizedBox(width: 40, child: Text(playerModel.red.toString(),style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),),SizedBox(width: 70, child: Text('red',style: TextStyle(fontSize: widthSize*0.047,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: AutofillHints.addressCityAndState),),)],),
                    ],
                  ),
                ],
              )
            )
        ),

      ],
    );
  }
}
