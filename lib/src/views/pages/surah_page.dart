import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:learn_quran/src/core/config/app_theme.dart';
import 'package:learn_quran/src/core/models/app_model.dart';
import 'package:learn_quran/src/core/services/audio_services.dart';
import 'package:learn_quran/src/helpers/app_custom_padding.dart';
import 'package:learn_quran/src/helpers/app_simple_button.dart';
import 'package:learn_quran/src/views/screens/verse_card.dart';
import 'package:quran_flutter/enums/quran_language.dart';
import 'package:quran_flutter/models/surah.dart';
import 'package:quran_flutter/models/verse.dart';
import 'package:quran_flutter/quran.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  final AppModel app;
  final AppColors theme;

  const SurahPage({
    super.key,
    required this.surah,
    required this.app,
    required this.theme,
  });

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  Surah get surah => widget.surah;

  AppModel get app => widget.app;

  AppColors get theme => widget.theme;

  List<Verse> get surahVersesList => Quran.getSurahVersesAsList(surah.number);

  Verse? _selectedVerse;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1.0),
              blurRadius: 5.0,
            )
          ]),
          child: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: theme.textColor),
            title: Text(
              surah.nameEnglish,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: theme.textColor,
                fontSize: 24,
                // fontFamily: state.boldFamily,
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(padding: Dis.only(tb: 4)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: surahVersesList.length,
              (context, index) {
                final verse = surahVersesList[index];
                return SimpleButton(
                  onPressed: () => setState(() => _selectedVerse = verse),
                  child: VerseCard(
                    selected: verse == _selectedVerse,
                    app: app,
                    theme: theme,
                    surah: surah,
                    verse: verse,
                    playing: true,
                    saved: false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
