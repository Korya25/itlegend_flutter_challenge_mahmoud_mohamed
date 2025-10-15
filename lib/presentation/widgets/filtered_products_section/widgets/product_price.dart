import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/core/utils/context_exstions.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';

class ProductPrices extends StatelessWidget {
  final ProductModel product;

  const ProductPrices({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                '${product.discountedPrice.formattedPrice}جم/',
                style: AppTextStyles.font14MeduimPrimary().copyWith(
                  color: const Color(0xffFF4144),
                  fontSize: 13,
                ),
              ),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Text(
                          product.originalPrice.formattedPrice.toString().limit(
                            3,
                          ),
                          style: AppTextStyles.font12RegularPrimary().copyWith(
                            color: AppColors.textAndIconGrey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Positioned(
                          top: 6,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1,
                            color: const Color(0xff7e7e7e),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '...',
                      style: AppTextStyles.font14MeduimPrimary().copyWith(
                        color: const Color(0xffFF4144),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(AppAssets.favorite, height: 24, width: 24),
      ],
    );
  }
}
