import 'package:flutter/material.dart';
import 'package:referral_tracker/widgets/pageTitle.dart';

class RewardsScreen extends StatefulWidget {
  static const String id = '/rewards';
  static const String nameOnAppBar = "Rewards";
  static const String _nameOnTitle = "Add Extra Rewards";
  static const double _columnWidth = 220;

  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => RewardsScreenState();
}

class RewardsScreenState extends State<RewardsScreen> {
  String studentNumber = "";
  String reward_amount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards Screen"),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: RewardsScreen._columnWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: pageTitle(RewardsScreen._nameOnTitle),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: RewardsScreen._columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Student Number",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    studentNumber = value;
                  },
                ),
              ),
              SizedBox(
                width: RewardsScreen._columnWidth,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Reward Amount",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    reward_amount = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: RewardsScreen._columnWidth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () async {
                    // todo:
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
