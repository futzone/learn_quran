import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran/quran.dart';

class AudioServices {
  final Dio _dio = Dio();

  Future<void> initPermission() async => await _requestPermission();

  Future<bool> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<String> downloadAudio(surahId, verceId) async {
    final path = await getDownloadedFilePath(surahId, verceId);

    if (path.isNotEmpty) {
      return path;
    }

    String fileName = "$surahId$verceId.mp3";

    if (await _requestPermission()) {
      Directory? dir = await getDownloadsDirectory();
      String savePath = "${dir!.path}/$fileName";

      try {
        final url = getAudioURLByVerse(surahId, verceId);

        await _dio.download(url, savePath, onReceiveProgress: (re, tot) {
          var progress = (re / tot);
          print(progress);
        });

        await saveDownloadedFile(surahId, verceId, savePath);
        return savePath;
      } on DioException catch (error, stackTrace) {
        log("On downloading error: ", error: error, stackTrace: stackTrace);
        return '';
      }
    }

    return '';
  }

  Future<void> saveDownloadedFile(surahId, verceId, filePath) async {
    final box = await Hive.openBox("audios");
    await box.put("$surahId$verceId", filePath);
    log("SAVED TO: $filePath");
  }

  Future<String> getDownloadedFilePath(surahId, verceId) async {
    final box = await Hive.openBox("audios");
    return await box.get("$surahId$verceId") ?? '';
  }
}
