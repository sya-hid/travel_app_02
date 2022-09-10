import 'package:flutter/material.dart';
import 'package:travel_app_02/const.dart';
import 'package:travel_app_02/models/destination_model.dart';

class DestinationVer extends StatelessWidget {
  final Destination destination;
  const DestinationVer({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: black.withOpacity(0.25))),
      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage('assets/${destination.image![0]}'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  destination.name!,
                  style: const TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: black,
                      size: 16,
                    ),
                    Text(
                      destination.location!,
                      style: TextStyle(
                          fontSize: 12, color: black.withOpacity(0.6)),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '${destination.rate!}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black)),
                      TextSpan(
                          text: ' (${destination.review} reviews)',
                          style: TextStyle(
                              color: black.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ])),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '\$${destination.price!}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blue)),
                TextSpan(
                    text: ' / Person',
                    style:
                        TextStyle(color: black.withOpacity(0.6), fontSize: 12))
              ])),
            ],
          ),
        ],
      ),
    );
  }
}
