import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_quran/src/core/config/app_theme.dart';
import 'package:learn_quran/src/core/models/app_model.dart';
import 'package:learn_quran/src/helpers/app_loading_screen.dart';
import 'package:learn_quran/src/provider/app_state_provider.dart';

class AppStateWrapper extends ConsumerWidget {
  final Widget Function(AppColors theme, AppModel app) builder;

  const AppStateWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateProviderListener = ref.watch(appStateProvider(context));

    return appStateProviderListener.when(
      data: (appStateData) {
        return builder(AppColors(isDark: appStateData.isDark), appStateData);
      },
      error: (error, stackTrace) => ErrorWidget(error),
      loading: () => const AppLoadingScreen(),
    );
  }
}
