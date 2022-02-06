import 'package:hooks_riverpod/hooks_riverpod.dart';

// CurrentTab
final currentBottomNavigation =
    StateNotifierProvider<CurrentBottomNavigationNotifier, int>(
  (ref) => CurrentBottomNavigationNotifier(),
);

class CurrentBottomNavigationNotifier extends StateNotifier<int> {
  CurrentBottomNavigationNotifier() : super(0);
  void setCurrentIndex(int index) => state = index;
}
