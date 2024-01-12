import 'dart:async';

import 'package:budget_buddy/data/data_sorce/add_data.dart';
import 'package:budget_buddy/domain/entities/model/income.dart';
import 'package:budget_buddy/domain/entities/model/money.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auto_route/auto_route.dart';
import 'package:budget_buddy/constants/constants.dart';
import 'package:budget_buddy/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';
part '../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StreamController<Moneys?> _featchDataControler =
      StreamController<Moneys?>.broadcast();

  HomeBloc() : super(_Initial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future featchData() async {
    final data = await getAllData();
    _featchDataControler.add(data);
  }
}
