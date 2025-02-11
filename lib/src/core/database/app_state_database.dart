import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:learn_quran/src/core/models/app_model.dart';

class AppStateDatabase {
  Future<AppModel> getApp() async {
    final box = await Hive.openBox("app");
    final app = await box.get("data");

    if (app == null) {
      return AppModel(
        isDark: false,
        role: "admin",
        token: "",
        data: "",

        notificationCount: 0,
        orderCount: 0,
        isMe: false,
      );
    }
    return AppModel.fromJson(jsonDecode(app));
  }

  Future<void> updateApp(AppModel app) async {
    final box = await Hive.openBox("app");
    await box.put("data", jsonEncode(app.toJson()));
  }

  Future<void> deleteApp() async {
    final box = await Hive.openBox("app");
    await box.clear();
    // await box.put("data", jsonEncode(app.toJson()));
  }
}
