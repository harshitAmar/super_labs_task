import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:super_labs_task/controller/product_controller.dart';
import 'package:super_labs_task/core/constants/color_constants.dart';
import 'package:super_labs_task/presentation/widgets/custom_alert_box.dart';
import 'package:super_labs_task/presentation/widgets/product_widget.dart';

import '../../widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        await getProducts();
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await getProducts(isFirst: true);
    super.didChangeDependencies();
  }

  Future<void> getProducts({bool isFirst = false}) async {
    await Provider.of<ProductController>(context, listen: false).getProducts(
      isFirst: isFirst,
      query: searchController.text,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "SEPORA",
              style: TextStyle(letterSpacing: 6, color: Colors.black),
            ),
            Expanded(
              child: CustomTextField(
                controller: searchController,
                prefix: const Icon(
                  Feather.search,
                  color: Colors.grey,
                ),
                hintText: "Search....",
                onFieldSubmitted: (v) async {
                  await getProducts(isFirst: true);
                },
                onEditingComplete: () async {
                  await getProducts(isFirst: true);
                },
              ),
            ),
            const Icon(
              MaterialIcons.favorite_outline,
              color: Colors.black,
            ),
            const Icon(
              MaterialCommunityIcons.cart_outline,
              color: Colors.black,
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                FilterBottomSheet(
                  onApply: () {
                    Navigator.pop(context);
                    getProducts(isFirst: true);
                  },
                  onClear: () {
                    Navigator.pop(context);

                    Provider.of<ProductController>(context, listen: false)
                        .clearFilters();
                    getProducts(isFirst: true);
                  },
                ).showAlert(
                  context: context,
                );
              },
              child: const CircleAvatar(
                backgroundColor: ColorConstants.grey,
                child: Icon(Icons.sort),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(child: Text("Search Results")),
              ],
            ),
            Expanded(
              child: Consumer<ProductController>(
                  builder: (context, controller, _) {
                if (controller.productList.isEmpty) {
                  return Center(
                    child: Text(controller.isLoading
                        ? "Loading Search Results.."
                        : "No Data Found"),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: controller.productList[index],
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 360,
                    ),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
