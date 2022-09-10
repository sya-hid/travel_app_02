import 'package:flutter/material.dart';
import 'package:travel_app_02/const.dart';
import 'package:travel_app_02/models/destination_model.dart';
import 'package:travel_app_02/widgets/bgblur.dart';

class DetailPage extends StatefulWidget {
  final Destination destination;
  const DetailPage({Key? key, required this.destination}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PageController pageController = PageController();
  int pageView = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade200,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: black.withOpacity(0.3))),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: black,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Detail Place',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: black),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: black.withOpacity(0.3))),
            child: const Icon(
              Icons.bookmark_outline_rounded,
              color: black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.5),
                            offset: const Offset(0, 5),
                            spreadRadius: 1,
                            blurRadius: 5)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        PageView(
                          controller: pageController,
                          onPageChanged: (value) {
                            setState(() {
                              pageView = value;
                            });
                          },
                          children: List.generate(
                              widget.destination.image!.length,
                              (index) => Image.asset(
                                    'assets/${widget.destination.image![index]}',
                                    fit: BoxFit.cover,
                                  )),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (pageController.hasClients) {
                                  pageController.animateToPage(
                                      pageView ==
                                              widget.destination.image!.length -
                                                  1
                                          ? 0
                                          : pageView + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(
                                    right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: white),
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: widget.destination.image!
                                                        .length -
                                                    1 !=
                                                pageView
                                            ? AssetImage(
                                                'assets/${widget.destination.image![pageView + 1]}')
                                            : AssetImage(
                                                'assets/${widget.destination.image![0]}'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            BgBlur(
                              opacity: 0.8,
                              blur: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        widget.destination.image!.length,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            if (pageController.hasClients) {
                                              pageController.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOut);
                                            }
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            height: 5,
                                            width: 20,
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                                color: pageView == index
                                                    ? white
                                                    : white.withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.destination.name!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: white,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  widget.destination.location!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_rounded,
                                                  color: yellow,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '\$${widget.destination.rate!}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: white),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              '(${widget.destination.review} reviews)',
                                              style: const TextStyle(
                                                  color: white, fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const TabBar(
                                  labelColor: blue,
                                  unselectedLabelColor: black,
                                  indicatorColor: blue,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabs: [
                                    Tab(
                                      text: 'Overview',
                                    ),
                                    Tab(
                                      text: 'Review',
                                    ),
                                  ]),
                            ),
                            Expanded(
                              child: TabBarView(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    widget.destination.description!,
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: black.withOpacity(0.6),
                                        fontSize: 12,
                                        height: 1.5),
                                  ),
                                ),
                                const Center(child: Text('Review'))
                              ]),
                            )
                          ],
                        )))
              ],
            )),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  offset: Offset.zero,
                  color: black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10)
            ],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            color: black.withOpacity(0.6), fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '\$${widget.destination.price}',
                            style: const TextStyle(
                                color: blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' / Person',
                            style: TextStyle(
                                fontSize: 14, color: black.withOpacity(0.6)))
                      ]))
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.confirmation_number_outlined,
                                color: white,
                              ),
                              SizedBox(width: 5),
                              Text('Book Ticket',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
