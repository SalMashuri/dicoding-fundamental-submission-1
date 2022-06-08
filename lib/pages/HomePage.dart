import 'package:flutter/material.dart';
import 'package:submission/models/restaurant.dart';
import 'package:submission/pages/PageDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant'),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Restaurant> restaurant =
                    parseRestaurants(snapshot.data);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildRestaurantItem(context, restaurant[index]);
                  },
                  itemCount: restaurant.length,
                );
              } else {
                return const Text('Data tidak ditemukan');
              }
            }
          },
        ));
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageDetail.routeName,
            arguments: restaurant);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xff030001),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: NetworkImage(restaurant.pictureId),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${restaurant.name}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const Icon(
                            Icons.star_rate,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Text(restaurant.rating,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${restaurant.city}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
