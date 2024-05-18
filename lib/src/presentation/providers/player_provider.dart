//  //   ///
//  Import LIBRARIES
import 'package:riverpod_annotation/riverpod_annotation.dart';
//  Import FILES
import '../../data/players.dart';
//  PARTS
part 'player_provider.g.dart';
//  //   ///

//  playerNotifierProvider
@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  @override
  List<Map<String, String>> build() {
    return allPlayers;
  }

  void filterPlayer(String playerName) {
    List<Map<String, String>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = allPlayers
          .where((player) => player['name']!.toLowerCase().contains(playerName))
          .toList();
    }
    state = results;
  }
}  // End of PlayerNotifier Riverpod class
