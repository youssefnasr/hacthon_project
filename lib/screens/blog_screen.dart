import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/bloc/blog/blog_cubit.dart';
import 'package:hacthon_project/constants/app_bar.dart';
import 'package:hacthon_project/core/utlis.dart';
import 'package:hacthon_project/screens/single_blog_screen.dart';
import '../constants/auth_app_bar.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    BlogCubit.get(context).getBlogData();

    return BlocConsumer<BlogCubit, BlogState>(
      buildWhen: (previous, current) => current is BlogSuccessState,
      listener: (context, state) {},
      builder: (context, state) {
        var blogData=BlogCubit.get(context).blogsModel;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ConstAppBar(),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Blogs',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                (blogData == null)?const Center(child: CircularProgressIndicator(),):
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                            blogData.data.plants.length + blogData.data.seeds.length +
                                blogData.data.tools.length,
                                (index) =>
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    elevation: 20,
                                    child: InkWell(
                                      onTap: () {
                                        AppNavigator.customNavigator(
                                            context: context,
                                            screen: const SingleBlogScreen(),
                                            finish: true);
                                      },
                                      child: SizedBox(
                                        width: 280,
                                        height: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/jazmin-quaynor-8ioenvmof-I-unsplash (1) 1.png',
                                                width: double.infinity,
                                                height: 160,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                blogData.data.plants[index].name,
                                                style: TextStyle(
                                                  color: color,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                '5 simple Tips Treat Plant',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                               Text(
                                                blogData.data.plants[index].description,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )))


                ),
              ],
            ),
          ),
        );
      },
    );
  }
}