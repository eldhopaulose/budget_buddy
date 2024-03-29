import 'package:auto_route/auto_route.dart';
import 'package:budget_buddy/widgets/money_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class IncomePageScreen extends StatelessWidget {
  const IncomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " Income",
            style: GoogleFonts.rubik(),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const MoneyList(),
      ),
    );
  }
}
