
import 'package:flutter/material.dart';
import 'package:hacthon_project/constants/auth_app_bar.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key, required this.imagePath, required this.name}) : super(key: key,);
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(imagePath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class BestSeller extends StatelessWidget {
  const BestSeller(
      {Key? key,
        required this.imagePath,
        required this.name,
        required this.price})
      : super(key: key);
  final String imagePath;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(imagePath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          price,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class BlogsWidget extends StatelessWidget {
  const BlogsWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.timeAgo,
  }) : super(key: key);
  final String imagePath;
  final String name;
  final String description;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$timeAgo days ago',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15,
                  color: Colors.grey),
                ),
              ]),
        ),
      ),
    );
  }
}