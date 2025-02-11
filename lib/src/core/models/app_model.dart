import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const bool appRoleState = false;

class AppModel {
  int? currentWarehouse;
  bool isDark;
  int notificationCount;
  int orderCount;
  String role;
  String token;
  String refresh;
  String data;
  WidgetRef? ref;
  String boldFamily = "Extra-Bold";
  String regularFamily = "Regular";
  String mediumFamily = "Medium";

  bool get isAdmin => role == "admin";

  bool isMe = appRoleState;

  bool get isSeller => role == "seller";

  bool isMobile;
  bool isDesktop;
   bool isTablet;

  void console(dynamic data, {Object? error, StackTrace? stackTrace}) {
    log("$data", error: error, stackTrace: stackTrace);
  }

  AppModel({
    this.currentWarehouse,
    required this.isDark,
    required this.role,
    required this.token,
    required this.data,
    required this.notificationCount,
    required this.orderCount,
    this.isMobile = true,
     this.isDesktop = false,
    this.isTablet = false,
    this.ref,
    this.refresh = '',
    required this.isMe,
  });

  factory AppModel.fromJson(dynamic json) {
    return AppModel(
      isDark: json['isDark']??false,
      role: json['role'],
      token: json['token'],
      refresh: json['refresh'],
      data: json['data'],
      notificationCount: json['notificationCount'],
      orderCount: json['orderCount'],
      isMe: json['isMe'],
      currentWarehouse: json['currentWarehouse'],
    );
  }

  int get animationDuration => 300;

  Map<String, dynamic> toJson() {
    return {
      "isDark": isDark,
      "token": token,
      "role": role,
      "data": data,
      "refresh": refresh,
      "orderCount": orderCount,
      "isMe": isMe,
      "notificationCount": notificationCount,
      "currentWarehouse": currentWarehouse,
    };
  }
}
