import 'package:flutter/material.dart';
import 'package:guess_bulgaria/configs/player_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PlayerList extends StatelessWidget {
  final List<dynamic> players;
  final PlayerListTypes type;
  const PlayerList(this.players, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = generateRows(type);

    return SizedBox(
        height: 100,
        child: ScrollablePositionedList.builder(
          itemCount: rows.length,
          itemBuilder: (context, index) => rows[index],
          padding: const EdgeInsets.only(bottom: 20),
        ));
  }

  List<Widget> generateRows(PlayerListTypes type) {
    switch (type) {
      case PlayerListTypes.lobby:
        return lobby();
      case PlayerListTypes.gameResults:
        return endGameResults();
      default:
        return [];
    }
  }

  List<Widget> lobby() {
    List<Widget> rows = [];
    for (var player in players) {
      rows.add(Row(
        children: [
          Stack(children: [
            Icon(Icons.circle, color: PlayerColors.color(player['color'])),
            Icon(player['isCreator'] ? Icons.check : null, size: 24),
          ]),
          Text(player['username'] ?? player['id']),
        ],
      ));
    }
    return rows;
  }

  List<Widget> endGameResults() {
    List<Widget> rows = [];
    
    players.sort(((a, b) => b["points"] - a["points"]));
    int index = 1;
    for (var player in players) {
      rows.add(Row(
        children: [
          Stack(children: [
            Icon(Icons.circle, color: PlayerColors.color(player['color'])),
            Icon(player['isCreator'] ? Icons.check : null, size: 24),
          ]),
          Text('$index.'),
          Text(player['username'] ?? player['id']),
          const Text(" - "),
          Text(player["points"].toString()),
          if (index == 1)
            Image.asset(
              "assets/icons/gold_medal.png",
              width: 30,
              height: 30,
            ),
          if (index == 2)
            Image.asset(
              "assets/icons/silver_medal.png",
              width: 30,
              height: 30,
            ),
          if (index == 3)
            Image.asset(
              "assets/icons/bronze_medal.png",
              width: 30,
              height: 28,
            ),
        ],
      ));
      index++;
    }
    return rows;
  }
}

enum PlayerListTypes { lobby, gameResults }
