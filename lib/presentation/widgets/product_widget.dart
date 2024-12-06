import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:super_labs_task/core/constants/color_constants.dart';

import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://wsrv.nl/?url=https%3A%2F%2Feu2.contabostorage.com%2Feabb361130e04e0c98e8b88a22721601%3Abb2%2F${product.thumbnail ?? ""}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 164,
                  ),
                ),
                // Like Button (Positioned)
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Add to favorites
                    },
                  ),
                ),
              ],
            ),
            // Product Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Product Variant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${product.variants?.length} Variants",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            // Rating and Price
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedRatingStars(
                  initialRating: product.averageRating ?? 0,
                  minRating: 0.0,
                  maxRating: 5.0,
                  filledColor: ColorConstants.buttonColor,
                  emptyColor: ColorConstants.buttonColor,
                  filledIcon: Icons.star,
                  halfFilledIcon: Icons.star_half,
                  emptyIcon: Icons.star_border,
                  displayRatingValue: true,
                  interactiveTooltips: true,
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 10.0,
                  animationDuration: const Duration(milliseconds: 300),
                  animationCurve: Curves.easeInOut,
                  readOnly: false,
                  onChanged: (double b) {},
                )),

            // Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rs. ${product.priceStart ?? 0}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
