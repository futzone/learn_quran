import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:learn_quran/src/core/config/app_theme.dart';
import 'package:learn_quran/src/core/models/app_model.dart';
import 'package:learn_quran/src/core/services/audio_services.dart';
import 'package:learn_quran/src/helpers/app_custom_padding.dart';
import 'package:learn_quran/src/helpers/app_simple_button.dart';
import 'package:quran/quran.dart';
import 'package:quran_flutter/models/surah.dart';
import 'package:quran_flutter/quran_flutter.dart';

class VerseCard extends HookWidget {
  final bool selected;
  final Surah surah;
  final AppColors theme;
  final AppModel app;
  final Verse verse;
  final bool playing;
  final bool saved;

  const VerseCard({
    super.key,
    required this.selected,
    required this.surah,
    required this.theme,
    required this.app,
    required this.verse,
    required this.playing,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    final initialReplay = useState(1);
    final playing = useState(false);
    final saved = useState(false);

    useEffect(() {
      return () {};
    });

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.appBarColor,
        border: Border.all(color: selected ? theme.mainColor : theme.appBarColor),
        boxShadow: selected
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 3.0),
                  blurRadius: 2.0,
                ),
              ],
      ),
      padding: Dis.all(16),
      margin: Dis.only(lr: 16, tb: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: Dis.only(right: 6),
                child: Text(
                  verse.verseNumber.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: theme.secondaryTextColor,
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => initialReplay.value = 20,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: initialReplay.value == 20 ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: Text(
                        "20x",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.0,
                          color: initialReplay.value == 20 ? Colors.white : theme.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => initialReplay.value = 15,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: initialReplay.value == 15 ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: Text(
                        "15x",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.0,
                          color: initialReplay.value == 15 ? Colors.white : theme.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => initialReplay.value = 10,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: initialReplay.value == 10 ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: Text(
                        "10x",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.0,
                          color: initialReplay.value == 10 ? Colors.white : theme.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => initialReplay.value = 5,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: initialReplay.value == 5 ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: Text(
                        "5x",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.0,
                          color: initialReplay.value == 5 ? Colors.white : theme.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () async {
                    final player = AudioPlayer();

                    await player.stop();

                    final AudioServices audioServices = AudioServices();
                    var path = await audioServices.downloadAudio(verse.surahNumber, verse.verseNumber);
                    if (path.isEmpty) {
                      path = await audioServices.downloadAudio(verse.surahNumber, verse.verseNumber);
                    }
                    await player.play(DeviceFileSource(path));
                    playing.value = !playing.value;
                  },
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: playing.value ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: playing.value
                          ? Icon(
                              Ionicons.pause,
                              size: 18,
                              color: Colors.white,
                            )
                          : Icon(
                              Ionicons.play_outline,
                              size: 18,
                              color: theme.textColor,
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => playing.value = !playing.value,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: playing.value ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                        child: Icon(
                      Ionicons.extension_puzzle_outline,
                      size: 18,
                    )),
                  ),
                ),
              ),
              Expanded(
                child: SimpleButton(
                  onPressed: () => saved.value = !saved.value,
                  child: Container(
                    height: 32,
                    // padding: Dis.only(tb: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: theme.scaffoldBgColor),
                      color: saved.value ? theme.mainColor : theme.appBarColor,
                    ),
                    child: Center(
                      child: saved.value
                          ? Icon(
                              Ionicons.bookmark,
                              size: 18,
                              color: Colors.white,
                            )
                          : Icon(
                              Ionicons.bookmark_outline,
                              size: 18,
                              color: theme.textColor,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  verse.text,
                  style: TextStyle(
                    color: theme.textColor,
                    fontFamily: app.mediumFamily,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            Quran.getVerse(
              surahNumber: verse.verseNumber,
              verseNumber: verse.verseNumber,
              language: QuranLanguage.english,
            ).text,
            style: TextStyle(color: theme.secondaryTextColor, fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            Quran.getVerse(
              surahNumber: verse.verseNumber,
              verseNumber: verse.verseNumber,
              language: QuranLanguage.russian,
            ).text,
            style: TextStyle(color: theme.secondaryTextColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
