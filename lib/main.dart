import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:dragon_jump/controllers/score_controller.dart';
import 'package:dragon_jump/controllers/server_client_controller.dart';
import 'package:dragon_jump/models/multiplayer_game_data.dart';
import 'package:dragon_jump/screens/main_menu.dart';
import 'package:get_storage/get_storage.dart';

late ScoreController scoreController;
late MultiplayerGameData multiplayerGameData;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  scoreController = ScoreController();
  await scoreController.start();
  Flame.device.fullScreen(); // run app in fullscreen
  // initialize server-client class
  multiplayerGameData = MultiplayerGameData();
  await GetStorage.init();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GamePlay',
      ),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MainMenu(
      scoreController: scoreController,
      multiplayerGameData: multiplayerGameData,
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'GamePlay',
//       ),
//       home: MainMenu(
//           scoreController: scoreController,
//           serverClientController: serverClientController),
//     );
//   }
// }
