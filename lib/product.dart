class Products {
  int pris, id, gender;
  String name, image;

  Products({
    required this.id,
    required this.pris,
    required this.image,
    required this.name,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'pris': pris,
        'image': image,
        'name': name,
        'gender': gender,
      };

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      pris: json['pris'],
      image: json['image'],
      name: json['name'],
      gender: json['gender'],
    );
  }
}

List<Products> parfan = [
  Products(
      id: 1, pris: 200, image: "images/prof.jpg", name: "Armani", gender: 1),
  Products(id: 2, pris: 400, image: "images/zara.jpg", name: "Zara", gender: 1),
  Products(
      id: 3, pris: 500, image: "images/laco.jpg", name: "Lacoste", gender: 1),
  Products(
      id: 4, pris: 1300, image: "images/invi.jpg", name: "Invictus", gender: 1),
  Products(id: 5, pris: 100, image: "images/1.jpg", name: "Opium", gender: 2),
  Products(id: 7, pris: 700, image: "images/6.jpg", name: "Brand", gender: 2),
  Products(id: 8, pris: 850, image: "images/5.jpg", name: "Silver", gender: 2),
  Products(
      id: 9, pris: 900, image: "images/4.jpg", name: "Invictus", gender: 2),
  Products(
      id: 10, pris: 230, image: "images/2.jpg", name: "Polo rosa", gender: 2),
  Products(
      id: 11, pris: 450, image: "images/3.jpg", name: "Invictus", gender: 2),
];
