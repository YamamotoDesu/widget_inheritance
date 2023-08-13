# [widget inheritance](https://medium.com/flutter-community/flutter-level-up-widget-inheritance-6761899f3974)

## 👔 Base Widget
```dart
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  final String title;
  const BaseScreen({required this.title, super.key});
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: buildBodyWrapper(),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(onPressed: () {});
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(title: Text(widget.title));
  }

  Widget buildBodyWrapper() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: buildScreenBody(),
    );
  }

  Widget buildScreenBody();
}
```

### ✨ 1. Re-useable Widgets
```dart
class LoginScreen extends BaseScreen {
  const LoginScreen({super.key}) : super(title: 'Login');
  @override
  LoginState createState() => LoginState();
}

class LoginState extends BaseScreenState<LoginScreen> {
  @override
  Widget buildScreenBody() {
    return Container(width: 10, height: 10, color: Colors.red);
  }
}
```

### ✨ 2. More control
```dart
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
```

### ✨ 3. Easy To Extend
```dart
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
  ...  
}
```

