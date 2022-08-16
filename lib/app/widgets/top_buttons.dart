import 'package:flutter/material.dart';
import 'package:my_souq/app/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "My Orders",
              onClick: () {
              },
            ),
            AccountButton(
              text: "Be Seller",
              onClick: () {
              },
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(
              text: "wish list",
              onClick: () {
              },
            ),
            AccountButton(
              text: "log out",
              onClick: () {
              },
            )
          ],
        )
      ],
    );
  }
}
