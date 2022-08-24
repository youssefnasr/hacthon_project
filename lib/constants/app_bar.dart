import 'package:flutter/material.dart';
import 'package:hacthon_project/constants/auth_app_bar.dart';
import 'package:hacthon_project/core/utlis.dart';
import 'package:hacthon_project/screens/blog_screen.dart';
import 'package:hacthon_project/screens/cart_screen.dart';
import 'package:hacthon_project/screens/home_screen.dart';
import 'package:hacthon_project/screens/shop_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class ConstAppBar extends StatelessWidget {
  const ConstAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('FF#FBFBFB'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child: Image.asset('assets/images/La Vie.png')),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return color;
                          }
                          return Colors.black;
                        }),
                  ),
                  onPressed: ()
                  {
                    AppNavigator.customNavigator(
                      context: context,
                      screen: HomeScreen(),
                      finish: false,
                    );
                  },
                  child: const Text('Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return color;
                          }
                          return Colors.black;
                        }),
                  ),
                  onPressed: ()
                  {
                    AppNavigator.customNavigator(
                        context: context,
                        screen: ShopScreen(),
                        finish: false
                    );
                  },
                  child: const Text('Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return color;
                          }
                          return Colors.black;
                        }),
                  ),
                  onPressed: ()
                  {
                    AppNavigator.customNavigator(
                      context: context,
                      screen: BlogScreen(),
                      finish: false,
                    );
                  },
                  child: const Text('Blog',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return color;
                          }
                          return Colors.black;
                        }),
                  ),
                  onPressed: () {},
                  child: const Text('About',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return color;
                          }
                          return Colors.black;
                        }),
                  ),
                  onPressed: () {},
                  child: const Text('Community',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                IconButton(
                  icon:const Icon(Icons.shopping_cart_outlined),
                  onPressed: ()
                  {
                    AppNavigator.customNavigator(context: context, screen: CartScreen(), finish: false);
                  },
                ),
                IconButton(
                  icon:const Icon(Icons.add_alert_rounded),
                  onPressed: (){},
                ),
                   Image.asset('assets/images/Background - 2022-08-09T012830 1.png'),
              ],
            ),

          )
        ],
      ),
    );
  }
}

