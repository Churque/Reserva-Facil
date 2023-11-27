class Menu {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> ingredients;
  final int id;

  Menu({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.id,
    required this.ingredients,
  });
}

final List<Menu> menus = [
  Menu(
    id: 1,
    name: 'Menú 1',
    description: 'Descripcion del menu 1',
    price: 3499,
    imageUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredients: ['Ensalada', 'Boloñesa de ave con spaghetti', 'Postre', 'Pan'],
  ),
  Menu(
    id: 2,
    name: 'Menú 2',
    description: 'Descripción del Menú 2',
    price: 2599,
    imageUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredients: ['Ensalada', 'Boloñesa de ave con spaghetti', 'Postre', 'Pan'],
  ),
  Menu(
    id: 3,
    name: 'Menú 3',
    description: 'Descripción del Menú 3',
    price: 3499,
    imageUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredients: ['Ensalada', 'Boloñesa de ave con spaghetti', 'Postre', 'Pan'],
  ),
  Menu(
    id: 4,
    name: 'Menú 4',
    description: 'Descripción del Menú 4',
    price: 3499,
    imageUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredients: ['Ensalada', 'Boloñesa de ave con spaghetti', 'Postre', 'Pan'],
  ),
  Menu(
    id: 5,
    name: 'Menú 5',
    description: 'Descripción del Menú 5',
    price: 3499,
    imageUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredients: ['Ensalada', 'Boloñesa de ave con spaghetti', 'Postre', 'Pan'],
  ),
];

List<String> QRDataMenu = [];
