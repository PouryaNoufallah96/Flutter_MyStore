class Product {
  int id;
  String name;
  String image;
  String description;
  int price;
  bool purchased;
  bool favorite;
  Product(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.favorite,
      this.purchased,
      this.description});

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['favorite'] = favorite;
    map['purchased'] = purchased;
    map['description'] = description;
    return map;
  }

  Product.fromjson(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        favorite = json['favorite'],
        purchased = json['purchased'],
        description = json['description'];

  Product.fromDB(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        favorite = json['favorite'] == 0 ? false : true,
        purchased = json['purchased'] == 0 ? false : true,
        description = json['description'];
}
