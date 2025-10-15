import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
