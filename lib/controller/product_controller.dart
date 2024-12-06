import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_labs_task/data/repo/product_repo.dart';

import '../data/models/product_model.dart';

class ProductController extends ChangeNotifier {
  List<Products> productList = [];
  List<Brands> brandOptions = [];
  List<Attributes> attributOptions = [];
  String? categories;
  String? collections;
  double? minPrice;
  double? maxPrice;
  int currentPage = 1;
  int minRating = 3;
  bool isLoading = false;
  String sortBy = "Relevance";
  String? selectedPricerange = "";

  selectPriceRange(String priceRange) {
    selectedPricerange = priceRange;
    notifyListeners();
  }

  setSortBy(String sort) {
    sortBy = sort;
    notifyListeners();
  }

  setMinRating(int rating) {
    minRating = rating;
    notifyListeners();
  }

  setMinPrice(double price) {
    minPrice = price;
    notifyListeners();
  }

  setMaxPrice(double price) {
    maxPrice = price;
    notifyListeners();
  }

  void selectBrand(String id, bool selected) {
    brandOptions.firstWhereOrNull((element) => element.id == id)?.selected =
        selected;
    notifyListeners();
  }

  void selectAttributeOptions(String title, String name, bool selected) {
    attributOptions
        .firstWhereOrNull((element) => element.title == title)
        ?.values
        ?.firstWhere((element) => element.value == name)
        .selected = selected;
    notifyListeners();
  }

  void clearFilters() {
    for (Brands element in brandOptions) {
      element.selected = false;
      notifyListeners();
    }

    for (Attributes element in attributOptions) {
      for (Brands val in element.values ?? []) {
        val.selected = false;
        notifyListeners();
      }
    }
  }

  Future<void> getProducts({
    String? query,
    bool isFirst = false,
  }) async {
    if (isFirst) {
      isLoading = true;
      notifyListeners();
      currentPage = 1;
      productList = [];
      notifyListeners();
    }

    try {
      await ProductRepo()
          .getProducts(
        query: query,
        brands: brandOptions
            .where((e) => e.selected ?? false)
            .map((e) => e.handle ?? "")
            .join(", "),
        categories: categories,
        collections: collections,
        attributes: attributOptions
            .map((e) => e.values
                ?.where((element) => element.selected ?? false)
                .map((e) => e.value ?? '')
                .join(", "))
            .where((element) => element?.isNotEmpty ?? false)
            .join(", "),
        minPrice: minPrice,
        maxPrice: maxPrice,
        currentPage: currentPage,
        minRating: minRating,
        sortBy: sortBy,
      )
          .then((value) {
        isLoading = false;
        notifyListeners();
        if (value is ProductModel) {
          if (brandOptions.isEmpty) {
            brandOptions = value.data?.brands ?? [];
          }
          if (attributOptions.isEmpty) {
            attributOptions = value.data?.attributes ?? [];
          }

          currentPage++;
          productList.addAll(value.data?.products ?? []);
          notifyListeners();
        }
      });
    } catch (e, s) {
      print("Error $e, Stack $s");
    }
  }
}
