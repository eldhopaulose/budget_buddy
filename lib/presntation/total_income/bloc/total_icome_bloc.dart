import 'package:budget_buddy/presntation/home/bloc/home_bloc.dart';
import 'package:budget_buddy/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_buddy/data/data_sorce/add_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auto_route/auto_route.dart';
import 'package:budget_buddy/widgets/add.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part '../total_icome.dart';

part 'total_icome_event.dart';
part 'total_icome_state.dart';
part 'total_icome_bloc.freezed.dart';

class TotalIcomeBloc extends Bloc<TotalIcomeEvent, TotalIcomeState> {
  TotalIcomeBloc() : super(_Initial()) {
    on<_OnBtnCliked>((event, emit) async {
      emit(_Loading());
      try {
        await addExpance(money: event.money, topic: event.topic);
        emit(_Success());
      } catch (e) {
        emit(_Faield(erorr: 'Error adding expense: $e'));
        print(e);
      }
    });
  }
}
