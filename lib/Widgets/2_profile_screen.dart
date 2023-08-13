import 'package:flutter/material.dart';

import 'base_screen.dart';

// 2. More control
class ProfileScreen extends BaseScreen {
  const ProfileScreen({super.key}) : super(title: 'Profile');
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends BaseScreenState<ProfileScreen> {
  @override
  Widget buildScreenBody() {
    return Container(width: 10, height: 10, color: Colors.red);
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
