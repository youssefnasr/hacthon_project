import 'package:flutter/material.dart';
import 'package:hacthon_project/constants/app_bar.dart';
import 'package:hacthon_project/constants/auth_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ConstAppBar(),
            const SizedBox(
              height: 50,
            ),
            const Text('My Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: screenSize.size.height * 1,
                      width: 1050,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 78),
                          child: Row(
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                      ),
                                      height: screenSize.size.height * 0.2,
                                      width: screenSize.size.width * .55,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: (Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/image 57.png',
                                                width: 158,
                                                height: 158,
                                                fit: BoxFit.contain,
                                                alignment: AlignmentDirectional
                                                    .topStart),
                                            SizedBox(
                                                width: screenSize.size.width * 0.010,
                                            ),
                                            const Text(
                                              'Indoor House plant',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            ),
                                            SizedBox(
                                                width: screenSize.size.width * 0.050
                                            ),
                                            Container(
                                              height: 46.2,
                                              width: 125,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(7)),
                                              ),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                      onTap: () {},
                                                      child: Image.asset(
                                                        'assets/images/-.png',
                                                        width: 18,
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Text('1',
                                                      textAlign:
                                                          TextAlign.justify),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                      onTap: () {},
                                                      child: Image.asset(
                                                        'assets/images/+.png',
                                                        width: 18,
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenSize.size.width * 0.050,
                                            ),
                                            const Text(
                                              '300',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: screenSize.size.width * 0.050,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.delete_rounded,
                                                  color: color,
                                                )),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: 3,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        height: 265,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sub Total',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text('200 Egp',
                                      style: TextStyle(
                                          color: color,
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Shipping ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text('0.00 Egp',
                                      style: TextStyle(
                                          color: color,
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text('200 Egp',
                                      style: TextStyle(
                                          color: color)),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(
                                    fontSize: 9,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(300, 40),
                                  onPrimary: Colors.white,
                                  primary: color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text('Enter your Coupon'),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(80, 40),
                            onPrimary: Colors.white,
                            primary: color,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
