import 'dart:math';

import 'package:flutter/material.dart';
import 'package:submission/models/restaurant.dart';
import 'package:submission/widgets/pill_widget.dart';
import 'package:submission/widgets/sliver_sub_header.dart';

class PageDetail extends StatelessWidget {
  static const routeName = '/detail_screen';

  final Restaurant restaurant;

  const PageDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            restaurant.name,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.black.withOpacity(0.2),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
            decoration: BoxDecoration(
                color: const Color(0xff030001),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: NetworkImage(restaurant.pictureId),
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          )),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location : ${restaurant.city}"),
                  Text("rating ${restaurant.rating}"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(restaurant.description),
                ],
              )),
        ),
        SliverSubHeader(
          text: 'Foods',
        ),
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverGrid.count(
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: restaurant.menus.foods
                  .map((e) => PillWidget(e.name))
                  .toList()),
        ),
        SliverSubHeader(
          text: 'Drinks',
        ),
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverGrid.count(
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: restaurant.menus.drinks
                  .map((e) => PillWidget(e.name))
                  .toList()),
        ),
      ],
    ));
  }
}
