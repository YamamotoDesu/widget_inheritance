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
