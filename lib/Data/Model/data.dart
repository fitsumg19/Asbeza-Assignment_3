class Item {
  String image;
  String foodTitle;
  num foodPrice;

  Item({
    required this.image,
    required this.foodTitle,
    required this.foodPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      image: json['image'],
      foodTitle: json['title'],
      foodPrice: json['price'],
    );
  }

  static List itemList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Item.fromJson(item[i]));
    }

    return items;
  }
}
