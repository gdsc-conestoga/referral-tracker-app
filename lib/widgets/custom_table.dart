import 'package:flutter/material.dart';
import 'package:referral_tracker/values.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  List<TableRow> generateRows() {
    List<TableRow> tableRows = [];

    for (var element in users) {
      tableRows.add(TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(element['username'].toString()),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(element['total_coins'].toString()),
            ),
          ),
        ],
      ));
    }

    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Table(
        border: TableBorder.symmetric(
          inside: const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        children: generateRows(),
      ),
    );
  }
}
