import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({Key? key}) : super(key: key);
  static const double _rowHeight = 60;
  static final NumberFormat _coinCountFormat = NumberFormat("#,##0", "en_US");
  static const _colWidths = <int, TableColumnWidth>{
    0: FlexColumnWidth(1),
    1: FlexColumnWidth(10),
    2: FlexColumnWidth(4),
  };

  TableRow _leaderboardRow(String medal, String name, int coinCount) {
    return TableRow(
      children: <Widget>[
        Container(
          height: _rowHeight,
          alignment: Alignment.centerRight,
          child: Text(medal),
        ),
        Container(
          height: _rowHeight,
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: _rowHeight,
          alignment: Alignment.centerRight,
          child: TableCell(
            child: Text("${_coinCountFormat.format(coinCount)} 🪙"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(),
      ),
      columnWidths: _colWidths,
      children: <TableRow>[
        _leaderboardRow(
            "🥇",
            "Johann Gambolputty de von Ausfern-schplenden-schlitter-crasscrenbon-fried-digger-dingle-dangle-dongle-dungle-burstein-von-knacker-thrasher-apple-banger-horowitz-ticolensic-grander-knotty-spelltinkle-grandlich-grumblemeyer-spelterwasser-kurstlich-himbleeisen-bahnwagen-gutenabend-bitte-ein-nürnburger-bratwustle-gerspurten-mitzweimache-luber-hundsfut-gumberaber-shönendanker-kalbsfleisch-mittler-aucher von Hautkopft of Ulm ",
            69420000),
        _leaderboardRow(
            "🥈", "Never gonna give you up, never gonna let you down", 30),
        _leaderboardRow("🥉", "aefhay89eyg9egaeg", 29),
        _leaderboardRow("", "12414", 5),
        _leaderboardRow("", "test", 4),
      ],
    );
  }
}
