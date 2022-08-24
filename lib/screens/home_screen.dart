import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hacthon_project/constants/app_bar.dart';
import 'package:hacthon_project/constants/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final color=HexColor('FF#1ABC00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConstAppBar(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 180),
                          child: SizedBox(
                              height: 400,
                              child: Image.asset('assets/images/tree.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 120, 10, 0),
                          child: SizedBox(
                              height: 600,
                              child: Image.asset('assets/images/semi_circ.png')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.fromLTRB(350, 0, 10, 50),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: color,
                                  radius: 25,
                                  child: const Icon(Icons.question_mark,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Perfect way to plant in house',
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 500,
                            child: Text(
                              'leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals. Botanically, leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients, water, and end products of photosynthesis',
                              style: TextStyle(fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: color,
                            ),
                            onPressed: () {},
                            child: const Text('Explore Now'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const MyTitle(title: 'Popular____\nCategories'),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 350,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoriesWidget(
                            imagePath: 'assets/images/image 64.png',
                            name: 'tools'
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 60,
                      ),
                      itemCount: 20),
                ),
              ),
            ),
            const SizedBox(height: 100),
            const MyTitle(title: 'Best seller___'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 450,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: index % 2 != 0 ? 60 : 0),
                          child: const BestSeller(
                            imagePath: 'assets/images/image 75.png',
                            name: 'SPIDER PLANT',
                            price: '190 EG',
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 60,
                      ),
                      itemCount: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyTitle(title: 'Blogs___'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 450,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const BlogsWidget(
                          timeAgo: '2',
                          imagePath: 'assets/images/test.png',
                          name: '5 Simple Tips treat plant',
                          description:
                          'leaf, in botany, any usually flattened green outgrowth from the stem of   ',
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 60,
                      ),
                      itemCount: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const MyTitle(title:'About us____'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children:[
                const Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: SizedBox(
                    width: 500.0,
                    child: Text(
                      'Welcome to La Vie, your number one source for planting. Were dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness.Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ',
                      style: TextStyle(fontSize: 18,
                          color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 500,
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children:[
                    Container(
                      height: 280,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: color, width: 3),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 380,
                        width: 430,
                        child: Image.asset(
                          'assets/images/about.png',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/Rectangle (2).png'),
                    ),
                    Positioned(
                      left: 50,
                      child: SizedBox(
                        child: Image.asset('assets/images/Rectangle.png'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 98, 0),
                        child: MyTitle(title: 'Mobile Application _____'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(46, 40, 0, 0),
                        child: SizedBox(
                          width: 400,
                          child: Text(
                            'You can install La Vie mobile application and enjoy with new featurs, earn more points and get discounts Also you can scan QR codes in your plants’ pots so that you can get discount on everything in the website up to 70%',
                            style: TextStyle(fontSize: 18,
                            color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 96, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       customBtn(
                      //           width: 120,
                      //           hight: 50,
                      //           text: 'Play Store',
                      //           onpress: () {},
                      //           radius: 20),
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       customBtn(
                      //           width: 120,
                      //           hight: 50,
                      //           text: 'App Store',
                      //           onpress: () {},
                      //           radius: 20),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}