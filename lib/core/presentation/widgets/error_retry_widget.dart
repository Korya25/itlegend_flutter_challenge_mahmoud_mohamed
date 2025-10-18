import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/presentation/widgets/custom_button.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/core/style/font/font_weight_helper.dart';

class ErrorRetryWidget extends StatefulWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorRetryWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  State<ErrorRetryWidget> createState() => _ErrorRetryWidgetState();
}

class _ErrorRetryWidgetState extends State<ErrorRetryWidget> {
  bool _isLoading = false;

  Future<void> _handleRetry() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // تأخير ثانيتين
    widget.onRetry();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: _isLoading
            ? const CircularProgressIndicator(
                color: AppColors.textAndIconPrimary,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.textAndIconOrange,
                    size: 150,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'حدث خطأ أثناء تحميل البيانات',
                    style: AppTextStyles.custom(
                      size: 18,
                      weight: FontWeightHelper.bold,
                      color: AppColors.textAndIconPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.message,
                    style: AppTextStyles.font14MeduimPrimary().copyWith(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    onTap: _handleRetry,
                    child: Center(
                      child: Text(
                        'إعادة المحاولة',
                        style: AppTextStyles.font16Bold().copyWith(
                          color: AppColors.backPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
