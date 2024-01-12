import 'package:budget_buddy/presntation/expense/expense.dart';
import 'package:budget_buddy/presntation/home/bloc/home_bloc.dart';
import 'package:budget_buddy/presntation/income/income.dart';
import 'package:flutter/cupertino.dart';

List<Widget> buildScreens() {
  return [const HomePageScreen(), const IncomePageScreen(), const Expense()];
}
