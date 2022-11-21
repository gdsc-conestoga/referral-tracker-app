import 'package:flutter/material.dart';
import 'package:referral_tracker/screens/store_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text("Referral Tracker"),
            const SizedBox(
              width: 50,
            ),
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  StoreScreen.id,
                );
              },
              child: const Text(
                "Store",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "51 🪙",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Log Out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 40,
          ),
          width: 200,
          child: Column(
            children: [
              const Text(
                "Top Member Scores",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DataTable(
                border: TableBorder.symmetric(
                  inside: const BorderSide(
                    width: 0.5,
                  ),
                ),
                columnSpacing: 100,
                dataRowHeight: 25,
                headingRowHeight: 0,
                columns: const [
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text("Score"),
                    numeric: true,
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(
                        SingleChildScrollView(
                          child: Text(
                            "🥇 Never gonna give you up",
                            // overflow: TextOverflow.clip,
                            // softWrap: false,
                          ),
                        ),
                      ),
                      DataCell(
                        Text("31 🪙"),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
