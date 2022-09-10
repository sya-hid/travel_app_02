import 'package:flutter/material.dart';
import 'package:travel_app_02/const.dart';
import 'package:travel_app_02/models/destination_model.dart';
import 'package:travel_app_02/pages/detail.dart';
import 'package:travel_app_02/widgets/destination_hor.dart';
import 'package:travel_app_02/widgets/destination_ver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline_rounded,
    Icons.person_outline_rounded
  ];
  List<Destination> popular =
      destinations.where((element) => element.category == 'popular').toList();
  List<Destination> recomend =
      destinations.where((element) => element.category == 'recommend').toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leadingWidth: 120,
        leading: Row(
          children: const [
            Icon(
              Icons.location_on,
              color: black,
            ),
            Text(
              'Jawa Timur',
              style: TextStyle(
                  fontSize: 18, color: black, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: black.withOpacity(0.3))),
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: black,
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration:
                        const BoxDecoration(color: red, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Popular place',
                  style: TextStyle(
                      fontSize: 16, color: black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 12, color: blue, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: List.generate(
                popular.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 10, right: 10)
                      : const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(destination: popular[index])));
                    },
                    child: DestinationHor(
                      destination: popular[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recomendation for you',
                  style: TextStyle(
                      fontSize: 16, color: black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 12, color: blue, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: List.generate(
                    recomend.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(top: 15, bottom: 15)
                              : const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          destination: recomend[index])));
                            },
                            child: DestinationVer(
                              destination: recomend[index],
                            ),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
      extendBody: false,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        icons.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              child: Icon(
                                icons[index],
                                color: selectedPage == index
                                    ? white
                                    : white.withOpacity(0.4),
                              ),
                            )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
