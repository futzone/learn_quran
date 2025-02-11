import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:learn_quran/src/helpers/app_theme_wrapper.dart';

import 'home_page.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final initialPage = useState(0);
    return AppStateWrapper(builder: (theme, state) {
      return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomePage(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ],
        ),
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
              title: Text(
                "Quran Learn",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.mainColor,
                  fontSize: 24,
                  // fontFamily: state.boldFamily,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 20.0,
            currentIndex: initialPage.value,
            onTap: (index) {
              controller.jumpToPage(index);
              initialPage.value = index;
            },
            selectedItemColor: theme.mainColor,
            unselectedItemColor: theme.secondaryTextColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.home_outline),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.help_circle_outline),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.book_outline),
                label: 'Vocabulary',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.bookmark_outline),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.settings_outline),
                label: 'Home',
              ),
            ],
          ),
        ),
      );
    });
  }
}
