import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:super_labs_task/data/models/product_model.dart';

class ProductRepo {
  Future<ProductModel?> getProducts({
    String? query,
    String? brands,
    String? categories,
    String? collections,
    String? attributes,
    double? minPrice,
    double? maxPrice,
    required int currentPage,
    required int minRating,
    required String sortBy,
  }) async {
    try {
      String url =
          "https://bb3-api.ashwinsrivastava.com/store/product-search?sortBy=$sortBy&minRating=$minRating&limit=20&page=$currentPage${maxPrice == null ? "" : "&maxPrice=$maxPrice"}${minPrice == null ? "" : "&minPrice=$minPrice"}${(attributes ?? "").isEmpty ? "" : "&attributes=$attributes"}${(collections ?? "").isEmpty ? "" : "&collections=$collections"}${(categories ?? "").isEmpty ? "" : "&categories=$categories"}${(brands ?? "").isEmpty ? "" : "&brands=$brands"}${(query ?? "").isEmpty ? "" : "&q=$query"}";
      print(url);
      return await http
          .get(
        Uri.parse(
          url,
        ),
      )
          .then((value) {
        if (value.statusCode == 200) {
          ProductModel data = ProductModel.fromJson(jsonDecode(value.body));

          if (data.statusCode == 200) {
            print(value.body);
            return data;
          } else {
            print("${value.body} srivas");
          }
        }
        return null;
      });
    } catch (e, s) {
      print("Error $e, Stack $s");
    }

    return null;
  }
}
