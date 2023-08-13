import '2_profile_screen.dart';
import 'base_screen.dart';
import 'package:flutter/material.dart';

// 3. Easy To Extend
mixin TimeTracker<T extends BaseScreen> on State<T> {
  late DateTime _startTime;
  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
    final diff = _startTime.difference(DateTime.now());
    print(diff);
  }
}

class ProfileState extends BaseScreenState<ProfileScreen> with TimeTracker {
  @override
  Widget buildScreenBody() {
    throw Container();
  }
}
