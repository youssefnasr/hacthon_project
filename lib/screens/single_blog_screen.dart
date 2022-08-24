import 'package:flutter/material.dart';
import 'package:hacthon_project/constants/app_bar.dart';
import 'package:hacthon_project/constants/auth_app_bar.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              const ConstAppBar(),
              const SizedBox(
                height: 40,
              ),
              const Text('Blogs',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/singleblog.png',
                width: 1000,
                height: 600,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2 days ago',
                      style:TextStyle(
                        color: color,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('5 simple Tips Treat Plant',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 1000,
                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy textever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only fivecenturies, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like AldusPageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 1000,
                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy textever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only fivecenturies, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like AldusPageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
