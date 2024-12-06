import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_labs_task/controller/product_controller.dart';
import 'package:super_labs_task/core/constants/color_constants.dart';
import 'package:super_labs_task/data/models/product_model.dart';
import 'package:super_labs_task/presentation/widgets/button/custom_button.dart';
import 'package:super_labs_task/presentation/widgets/custom_text_field.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
    required this.onClear,
    required this.onApply,
  });
  final VoidCallback onClear, onApply;

  Future<dynamic> showAlert({required BuildContext context}) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        isScrollControlled: true,
        context: context,
        builder: (context) => FilterBottomSheet(
              key: key,
              onClear: onClear,
              onApply: onApply,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 650,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomModalHeader(),
          Expanded(
            child:
                Consumer<ProductController>(builder: (context, controller, _) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    RadioSelector(
                      title: "Ratings",
                      onChanged: (String? value) {
                        try {
                          controller.setMinRating(
                              int.parse(value?.substring(0, 1) ?? "0"));
                        } catch (e) {
                          print("$e");
                        }
                      },
                      selectedOption: "${controller.minRating} star and up",
                      options: const [
                        "1 star and up",
                        "2 star and up",
                        "3 star and up",
                        "4 star and up",
                      ],
                    ),
                    RadioSelector(
                      title: "Sort By",
                      onChanged: (String? value) {
                        controller.setSortBy(value ?? "");
                      },
                      selectedOption: controller.sortBy,
                      options: const [
                        "Relevance",
                        "Best Selling",
                        "Top Rated",
                        "Price Low to High",
                        "Price High to Low",
                        "New"
                      ],
                    ),
                    CheckboxSelector(
                      hint: "Search Brand..",
                      title: "Brand",
                      options: controller.brandOptions,
                    ),
                    ...List.generate(
                      controller.attributOptions.length,
                      (index) => CheckboxSelector(
                          hint:
                              "Search ${controller.attributOptions[index].title}",
                          title: "${controller.attributOptions[index].title}",
                          options:
                              controller.attributOptions[index].values ?? []),
                    ),
                    const PriceRangeFilter(),
                  ],
                ),
              );
            }),
          ),
          FilterWidget(
            onApply: onApply,
            onClear: onClear,
          ),
        ],
      ),
    );
  }
}

class CustomModalHeader extends StatelessWidget {
  const CustomModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: const Center(
        child: Text(
          'Filters and Sort',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.onClear, required this.onApply});
  final VoidCallback onClear, onApply;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const TagList(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                onTap: onClear,
                text: "Clear All",
              ),
            ),
            Expanded(
              child: CustomButton(
                onTap: onApply,
                text: "Apply Filters",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(builder: (context, controller, _) {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          ...controller.brandOptions
              .where((element) => element.selected ?? false)
              .map((e) => TagItem(tag: e.name ?? ""))
              .toList(),
          for (var attribute in controller.attributOptions)
            ...(attribute.values
                    ?.where((element) => element.selected ?? false)
                    .map((e) => TagItem(tag: e.name ?? e.value ?? ""))
                    .toList() ??
                []),
        ],
      );
    });
  }
}

class TagItem extends StatelessWidget {
  final String tag;

  const TagItem({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ClearAllButton extends StatelessWidget {
  const ClearAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Clear All',
        style: TextStyle(fontSize: 12, color: Colors.blue),
      ),
    );
  }
}

class ShowResultsButton extends StatelessWidget {
  const ShowResultsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: const Text(
        'Show Results',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CheckboxSelector extends StatefulWidget {
  const CheckboxSelector(
      {super.key,
      required this.hint,
      required this.title,
      required this.options});

  final List<Brands> options;
  final String title, hint;

  @override
  _CheckboxSelectorState createState() => _CheckboxSelectorState();
}

class _CheckboxSelectorState extends State<CheckboxSelector> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(builder: (context, controller, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionTile(
            iconColor: ColorConstants.buttonColor,
            title: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14),
            ),
            initiallyExpanded: false,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: searchController,
                  prefix: const Icon(Icons.search),
                  hintText: widget.hint,
                  onChanged: (v) {
                    setState(() {});
                  },
                ),
              ),
              Builder(builder: (context) {
                List<Brands> options = (searchController.text.isEmpty
                    ? widget.options
                    : widget.options
                        .where((element) =>
                            (element.name ?? element.value ?? "")
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                        .toList());

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60,
                      mainAxisSpacing: 3),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    var brand = options[index];

                    return CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: ColorConstants.buttonColor,
                      title: Text(
                        '${brand.name ?? brand.value} (${brand.productCount})',
                        style: TextStyle(
                            fontSize: 13,
                            decoration: brand.selected ?? false
                                ? TextDecoration.underline
                                : null,
                            fontWeight: brand.selected ?? false
                                ? FontWeight.bold
                                : null),
                      ),
                      value: brand.selected ?? false,
                      onChanged: (bool? value) {
                        if (brand.name != null) {
                          controller.selectBrand(
                              brand.id ?? "", value ?? false);
                        } else {
                          controller.selectAttributeOptions(
                              widget.title, brand.value ?? "", value ?? false);
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                );
              }),
            ],
          ),
        ],
      );
    });
  }
}

class RadioSelector extends StatefulWidget {
  const RadioSelector(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.selectedOption,
      required this.options});

  final List<String> options;
  final String title;
  final String selectedOption;
  final void Function(String?)? onChanged;

  @override
  _RadioSelectorState createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(builder: (context, controller, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpansionTile(
            iconColor: ColorConstants.buttonColor,
            title: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14),
            ),
            initiallyExpanded: false,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 60, mainAxisSpacing: 3),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    activeColor: ColorConstants.buttonColor,
                    title: Text(
                      widget.options[index],
                      style: TextStyle(
                          fontSize: 13,
                          decoration:
                              widget.selectedOption == widget.options[index]
                                  ? TextDecoration.underline
                                  : null,
                          fontWeight:
                              widget.selectedOption == widget.options[index]
                                  ? FontWeight.bold
                                  : null),
                    ),
                    value: widget.options[index],
                    groupValue: widget.selectedOption,
                    onChanged: widget.onChanged,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}

class PriceRangeFilter extends StatefulWidget {
  const PriceRangeFilter({super.key});

  @override
  _PriceRangeFilterState createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(builder: (context, controller, _) {
      return ExpansionTile(
        title: const Text(
          'Price Range',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          // Radio options
          RadioListTile<String>(
            title: const Text('Under Rs. 25'),
            value: 'Under Rs. 25',
            groupValue: controller.selectedPricerange,
            onChanged: (value) {
              controller.selectPriceRange(value ?? "");
              controller.setMinPrice(0);
              controller.setMaxPrice(25);
            },
          ),
          RadioListTile<String>(
            title: const Text('Rs. 25 to Rs. 50'),
            value: 'Rs. 25 to Rs. 50',
            groupValue: controller.selectedPricerange,
            onChanged: (value) {
              controller.selectPriceRange(value ?? "");
              controller.setMinPrice(25);
              controller.setMaxPrice(50);
            },
          ),
          RadioListTile<String>(
            title: const Text('Rs. 50 to Rs. 100'),
            value: 'Rs. 50 to Rs. 100',
            groupValue: controller.selectedPricerange,
            onChanged: (value) {
              controller.selectPriceRange(value ?? "");
              controller.setMinPrice(50);
              controller.setMaxPrice(100);
            },
          ),
          RadioListTile<String>(
            title: const Text('Rs. 100 and above'),
            value: 'Rs. 100 and above',
            groupValue: controller.selectedPricerange,
            onChanged: (value) {
              controller.selectPriceRange(value ?? "");
              controller.setMinPrice(100);
              controller.setMaxPrice(100000);
            },
          ),
          // Custom range input
          RadioListTile<String>(
            title: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: minPriceController,
                    keyboardType: TextInputType.number,
                    hintText: 'Rs.  Min',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: maxPriceController,
                    keyboardType: TextInputType.number,
                    hintText: 'Rs.  Max',
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: (minPriceController.text.isNotEmpty &&
                          maxPriceController.text.isNotEmpty)
                      ? () {
                          controller.selectPriceRange("Custom");
                          controller.setMinPrice(
                              double.parse(minPriceController.text));
                          controller.setMaxPrice(
                              double.parse(maxPriceController.text));
                        }
                      : null,
                  child: const Text('Apply'),
                ),
              ],
            ),
            value: 'Custom',
            groupValue: controller.selectedPricerange,
            onChanged: (value) {
              controller.selectPriceRange(value ?? "");
            },
          ),
        ],
      );
    });
  }
}
