import 'package:flutter/material.dart';
import 'package:travel_app_02/const.dart';
import 'package:travel_app_02/models/destination_model.dart';
import 'package:travel_app_02/widgets/bgblur.dart';

class DestinationHor extends StatelessWidget {
  final Destination destination;
  const DestinationHor({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              color: black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            height: 175,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage('assets/${destination.image![0]}'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const Spacer(),
                BgBlur(
                  opacity: 0.8,
                  blur: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: white,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  destination.location!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: yellow,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '\$${destination.rate!}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
