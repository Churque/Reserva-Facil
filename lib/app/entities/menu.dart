class Menu {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagenUrl;
  final List<String> ingredientes;
  final int id;

  Menu({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagenUrl,
    required this.id,
    required this.ingredientes,
  });
}

final List<Menu> menus = [
  Menu(
    id: 1,
    nombre: 'Menú 1',
    descripcion: 'Descripcion del menu 1',
    precio: 3499,
    imagenUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredientes: [
      'Ensalada',
      'Boloñesa de ave con spaghetti',
      'Postre',
      'Pan'
    ],
  ),
  Menu(
    id: 2,
    nombre: 'Menú 2',
    descripcion: 'Descripción del Menú 2',
    precio: 2599,
    imagenUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredientes: [
      'Ensalada',
      'Boloñesa de ave con spaghetti',
      'Postre',
      'Pan'
    ],
  ),
  Menu(
    id: 3,
    nombre: 'Menú 3',
    descripcion: 'Descripción del Menú 3',
    precio: 3499,
    imagenUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredientes: [
      'Ensalada',
      'Boloñesa de ave con spaghetti',
      'Postre',
      'Pan'
    ],
  ),
  Menu(
    id: 4,
    nombre: 'Menú 4',
    descripcion: 'Descripción del Menú 4',
    precio: 3499,
    imagenUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredientes: [
      'Ensalada',
      'Boloñesa de ave con spaghetti',
      'Postre',
      'Pan'
    ],
  ),
  Menu(
    id: 5,
    nombre: 'Menú 5',
    descripcion: 'Descripción del Menú 5',
    precio: 3499,
    imagenUrl:
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
    ingredientes: [
      'Ensalada',
      'Boloñesa de ave con spaghetti',
      'Postre',
      'Pan'
    ],
  ),
];

List<String> QRDataMenu = [];
