import 'package:flutter/material.dart';
import 'package:riverpod_store/features/products/presentation/pages/product_details_page.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.productId});
  final int productId;
  final String title;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            //height: 236,
            //width: 157,
            child: Image.network(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPage(productId: productId)));
      },
    );
  }
}
