// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/core/utils/context_exstions.dart';
import 'package:itlegend_flutter_challenge/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xffdbdbdd), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 145,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 12,
                      bottom: 8,
                    ),
                    child: ProductCardInfo(product: product),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProductCardInfo extends StatelessWidget {
  const ProductCardInfo({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Text(
                  '${product.name.limit(16)}...',
                  style: AppTextStyles.font14MeduimPrimary(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    AppAssets.percentage,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
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
                                    product.originalPrice.formattedPrice
                                        .toString()
                                        .limit(3),
                                    style: AppTextStyles.font12RegularPrimary()
                                        .copyWith(
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
                                style: AppTextStyles.font14MeduimPrimary()
                                    .copyWith(
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
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.fire, width: 12, height: 12),
                  Text(
                    'تم بيع+${product.sold}k',
                    style: AppTextStyles.font10RegularPrimary().copyWith(
                      color: AppColors.textAndIconGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.company, height: 26, width: 26),
              Row(
                spacing: 16,
                children: [
                  Container(
                    width: 32,
                    height: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.cart,

                        colorFilter: const ColorFilter.mode(
                          AppColors.textAndIconPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.talaetMostafaPng,
                    width: 15,
                    height: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
