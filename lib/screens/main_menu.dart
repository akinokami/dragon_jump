import 'package:flutter/material.dart';
import 'package:dragon_jump/controllers/score_controller.dart';
import 'package:dragon_jump/controllers/server_client_controller.dart';
import 'package:dragon_jump/helpers/constant.dart';
import 'package:dragon_jump/models/multiplayer_game_data.dart';
import 'package:dragon_jump/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  final ScoreController scoreController;
  final MultiplayerGameData multiplayerGameData;
  const MainMenu({
    Key? key,
    required this.scoreController,
    required this.multiplayerGameData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2ee),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('assets/images/parallax/logooo.png'),
            height: 200,
          ),
          Text(
            'Butterfly',
            style: kGameTitleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Highest Score : ',
                style: kGameSubTitleStyle,
              ),
              Text(
                scoreController.getHighestScore().toString(),
                style: kGameSubTitleStyle,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Second Highset Score : ',
                style: kGameSubTitleStyle,
              ),
              Text(
                scoreController.getseconedScore().toString(),
                style: kGameSubTitleStyle,
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: 150,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GamePlay(
                      scoreController: scoreController,
                      multiplayerGameData: multiplayerGameData,
                      isMultiPlayer: false,
                    ),
                  ),
                );
              },
              child: Image.asset('assets/images/buttons/play_button.png'),
            ),
          ),
        ],
      ),
    );
  }
}
