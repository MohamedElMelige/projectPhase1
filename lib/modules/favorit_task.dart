import 'package:flutter/material.dart';


import '../shared/componants/all_widget.dart';


class FavoriteTasks extends StatefulWidget {
  const FavoriteTasks({Key? key}) : super(key: key);

  @override
  State<FavoriteTasks> createState() => _FavoriteTasksState();
}

class _FavoriteTasksState extends State<FavoriteTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            const AllWidget(),
        separatorBuilder: (context, index) => const SizedBox(
          width: double.infinity,
          height: 5.5,
        ),
        itemCount: 4);
  }
}
