import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class AuthAppBar extends StatelessWidget {
  const AuthAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
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
                {},
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
                onPressed: () {},
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
                onPressed: () {},
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary:color,
                ),
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

final color=HexColor('FF#1ABC00');
