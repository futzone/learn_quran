import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learn_quran/src/helpers/app_custom_padding.dart';
import 'package:learn_quran/src/helpers/app_simple_button.dart';
import 'package:learn_quran/src/helpers/app_text_field.dart';
import 'package:learn_quran/src/helpers/app_theme_wrapper.dart';
import 'package:learn_quran/src/views/pages/surah_page.dart';
import 'package:quran_flutter/models/surah.dart';
import 'package:quran_flutter/quran.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool gridFormat = true;
  final List<Surah> _searchResultsList = [];
  final TextEditingController _controller = TextEditingController();

  void onSearchSurahs(String query) {
    _searchResultsList.clear();
    final allSurahs = Quran.getSurahAsList();
    for (var surah in allSurahs) {
      if (surah.nameEnglish.toLowerCase().contains(query.toLowerCase())) {
        _searchResultsList.add(surah);
      }
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(builder: (theme, state) {
      return CustomScrollView(
        slivers: [
          SliverPadding(padding: Dis.only(tb: 12)),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dis.only(lr: 16, bottom: 16),
              child: Text(
                'Quran Surahs',
                style: TextStyle(
                  fontSize: 30,
                  color: theme.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dis.only(lr: 16, bottom: 16),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        onChanged: onSearchSurahs,
                        radius: 8,
                        title: "Search Surahs",
                        controller: _controller,
                        theme: theme,
                        prefixIcon: Icon(
                          IconlyLight.search,
                          size: 20,
                          color: theme.secondaryTextColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    SimpleButton(
                      onPressed: () => setState(() => gridFormat = true),
                      child: Container(
                        margin: Dis.only(right: 8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: gridFormat ? theme.mainColor : theme.appBarColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: gridFormat
                              ? null
                              : [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.grid_on_outlined,
                            size: 20,
                            color: gridFormat ? Colors.white : theme.textColor,
                          ),
                        ),
                      ),
                    ),
                    SimpleButton(
                      onPressed: () => setState(() => gridFormat = false),
                      child: Container(
                        // margin: Dis.only(right: 8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: !gridFormat ? theme.mainColor : theme.appBarColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: !gridFormat
                              ? null
                              : [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.list,
                            color: !gridFormat ? Colors.white : theme.textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_controller.text.trim().isNotEmpty && _searchResultsList.isEmpty)
            SliverPadding(
              padding: Dis.only(lr: 16, tb: 16),
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Surahs found",
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (gridFormat)
            SliverPadding(
              padding: Dis.only(lr: 16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: _controller.text.trim().isEmpty ? Quran.surahCount : _searchResultsList.length,
                  (context, index) {
                    Surah surah;
                    if (_controller.text.trim().isEmpty) {
                      surah = Quran.getSurah(index + 1);
                    } else {
                      surah = _searchResultsList[index];
                    }

                    return SimpleButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SurahPage(
                              app: state,
                              theme: theme,
                              surah: surah,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.appBarColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 3.0),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        padding: Dis.only(lr: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              surah.nameEnglish,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Surah ${index + 1}",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: _controller.text.trim().isEmpty ? Quran.surahCount : _searchResultsList.length,
                (context, index) {
                  Surah surah;
                  if (_controller.text.trim().isEmpty) {
                    surah = Quran.getSurah(index + 1);
                  } else {
                    surah = _searchResultsList[index];
                  }

                  return SimpleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SurahPage(
                            app: state,
                            theme: theme,
                            surah: surah,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.appBarColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 3.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      margin: Dis.only(bottom: 12, lr: 16),
                      padding: Dis.only(lr: 16, tb: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            surah.nameEnglish,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " (${index + 1})",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      );
    });
  }
}
