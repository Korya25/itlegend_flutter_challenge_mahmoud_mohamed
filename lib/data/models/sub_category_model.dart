class SubCategoryModel {
  final int id;
  final String name;
  final String imagePath;

  const SubCategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'imagePath': imagePath,
  };

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  static List<SubCategoryModel> list = [
    SubCategoryModel(
      id: 1,
      name: 'موضة رجالى',
      imagePath: 'assets/images/men_fashion.png',
    ),
    SubCategoryModel(
      id: 2,
      name: 'ساعات',
      imagePath: 'assets/images/watch.png',
    ),
    SubCategoryModel(
      id: 3,
      name: 'موبايلات',
      imagePath: 'assets/images/mobile.png',
    ),
    SubCategoryModel(
      id: 4,
      name: 'منتجات تجميل',
      imagePath: 'assets/images/beauty.png',
    ),
    SubCategoryModel(id: 5, name: 'فلل', imagePath: 'assets/images/villa.png'),
  ];
}
