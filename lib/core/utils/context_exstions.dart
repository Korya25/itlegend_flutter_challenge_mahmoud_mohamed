extension StringLimitExtension on String {
  String limit(int maxChars) {
    if (length <= maxChars) return this;
    return substring(0, maxChars);
  }
}

extension PriceFormatter on num {
  String get formattedPrice {
    String numStr = toStringAsFixed(0).replaceAll('.', '');
    if (numStr.length <= 3) return numStr;

    String result = '';
    int count = 0;
    for (int i = numStr.length - 1; i >= 0; i--) {
      result = numStr[i] + result;
      count++;
      if (count % 3 == 0 && i > 0) {
        result = ',$result';
      }
    }
    return result;
  }
}
