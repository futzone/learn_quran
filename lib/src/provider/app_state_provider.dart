import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_quran/src/core/database/app_state_database.dart';
import 'package:learn_quran/src/core/models/app_model.dart';

final appStateProvider = FutureProvider.family((ref, BuildContext context) async {
  AppStateDatabase stateDatabase = AppStateDatabase();
  AppModel initialState = await stateDatabase.getApp();
  return initialState;
});
