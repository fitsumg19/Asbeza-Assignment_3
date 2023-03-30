class Item {
  int id;
  String image;
  String title;
  num price;

  Item({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['price'],
    );
  }

  static List itemList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Item.fromJson(item[i]));
    }

    return items;
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['image'] = image;
    json['title'] = title;
    json['price'] = price;

    return json;
  }
}
