import 'package:flutter/material.dart';
import 'package:travel_app_02/const.dart';
import 'package:travel_app_02/models/onboard_model.dart';
import 'package:travel_app_02/pages/home.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int pageView = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            pageView = value;
          });
        },
        children: List.generate(
            onboards.length,
            (index) => Stack(
                  children: [
                    Image.asset(
                      'assets/${onboards[index]}',
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (pageController.hasClients) {
                                pageController.animateToPage(
                                    onboards.length - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: Visibility(
                              visible:
                                  onboards.length - 1 != index ? true : false,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1.5, color: white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Explore Indonesia with us.',
                                style: TextStyle(
                                    fontSize: 72,
                                    color: white,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  'We Travelin are ready to help you on\nvacation around Indonesia',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: white,
                                      height: 1.5))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
      ),
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 190,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboards.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (pageController.hasClients) {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 5,
                    width: 20,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color:
                            pageView == index ? white : white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              child: Container(
                height: 170,
                color: white,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false);
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: black),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Let\'s Get Started',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                color: white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'already have account? ',
                          style: TextStyle(
                              color: black.withOpacity(0.6), fontSize: 12)),
                      const TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontSize: 12,
                              color: blue,
                              fontWeight: FontWeight.w600))
                    ])),
                    const SizedBox(height: 30),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
