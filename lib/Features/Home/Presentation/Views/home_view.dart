import 'package:flutter/material.dart';

import 'Widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add'),
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
