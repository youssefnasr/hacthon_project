import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/bloc/products/products_cubit.dart';
import 'package:hacthon_project/bloc/products/products_cubit.dart';
import 'package:hacthon_project/constants/auth_app_bar.dart';
import '../constants/app_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

List<String> categories = [
  'All Product',
  'Plants',
  'Tools',
  'Seeds',
];

List<bool> catIsChecked = [
  false,
  false,
  false,
  false,
];

List<String> plants = [
  'All Plants',
  'Cactus',
  'Palms',
  'Indoor plants',
  'Herbs',
  'Ferns',
  'House Plants',
  'Trees',
];

List<bool> plantIsChecked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<String> tools = [
  'All Tools',
  'Irrigation',
  'Seeds',
  'Wheelbarrows ',
  'Gardening Accessories',
];
List<bool> toolsIsChecked = [
  false,
  false,
  false,
  false,
  false,
];
List<String> seeds = [
  'All Seeds',
  'Plants',
  'Tools',
  'Seeds',
  'All Products',
  'Tools',
  'Tools',
  'Seeds',
];
List<bool> seedsIsChecked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

var searchController = TextEditingController();
var cubit = ProductsCubit.get(context);

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ConstAppBar(),
            SizedBox(
              height: screenSize.height / 8.5,
            ),
            const Text(
              'Shop',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenSize.height / 8.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      FilterItem(
                          containerName: 'categories',
                          containerListCheck: catIsChecked,
                          containerListName: categories),
                      FilterItem(
                          containerName: 'Plants',
                          containerListCheck: plantIsChecked,
                          containerListName: plants),
                      FilterItem(
                          containerName: 'tools',
                          containerListCheck: toolsIsChecked,
                          containerListName: tools),
                      FilterItem(
                          containerName: 'seeds',
                          containerListCheck: seedsIsChecked,
                          containerListName: seeds),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: screenSize.width * 0.4,
                            height: 50,
                            color: Colors.grey[200],
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: color,
                                ),
                                label: const Text('Search'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: screenSize.width / 2,
                          height: 1000,
                          child: BlocConsumer<ProductsCubit, ProductsState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 18,
                                      mainAxisSpacing: 18,
                                      crossAxisCount: 2),
                                  itemCount: cubit.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Material(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        elevation: 20,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                cubit.data[index].imageUrl,
                                                width: double.infinity,
                                                height: 160,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    cubit.data[index].name,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 120,
                                                  ),
                                                  Text(
                                                    cubit.data[index].price.toString(),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: color,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                               Text(
                                                cubit.data[index].description,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 2,
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  onPrimary: Colors.white,
                                                  primary: color,
                                                  fixedSize:
                                                  const Size(550, 40),
                                                ),
                                                onPressed: () {},
                                                child:
                                                const Text('Add To Cart'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: const [
                        Text(
                          'Viewing',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'of',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'prodcut',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({Key? key,
    required this.containerName,
    required this.containerListCheck,
    required this.containerListName})
      : super(key: key);
  final String containerName;
  final List<bool> containerListCheck;
  final List<String> containerListName;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 230,
        height: 250,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.containerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.containerListName.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: widget.containerListCheck[index],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.containerListCheck[index] = value!;
                            });
                          },
                          checkColor: color,
                          activeColor: color,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.containerListName[index],
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
