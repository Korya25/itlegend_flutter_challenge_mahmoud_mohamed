class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final num originalPrice;
  final num discountedPrice;
  final num sold;

  const ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.sold,
  });
}

class ProductMockData {
  static List<ProductModel> get products => const [
    ProductModel(
      id: '1',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/sweet_shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '2',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '3',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/shoes.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '4',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/sweet_shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '5',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/shoes.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '6',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/sweet_shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '7',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/sweet_shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
    ProductModel(
      id: '8',
      name: 'جاكيت من الصوف مناسب',
      imageUrl: 'assets/images/shirt.png',
      originalPrice: 60000000,
      discountedPrice: 32000000,
      sold: 3.3,
    ),
  ];
}
