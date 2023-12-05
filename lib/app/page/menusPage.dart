import 'package:flutter/material.dart';
import 'package:reserva_facil/app/entities/menu.dart';

class MyMenusPage extends StatefulWidget {
  const MyMenusPage();

  @override
  _MyMenusPage createState() => _MyMenusPage();
}

class _MyMenusPage extends State<MyMenusPage> {
  int indexNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reserva Facil',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              BuildContainerMenus(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget BuildContainerMenus() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEligeTuAlmuerzoTitle(),
          SizedBox(
            height: 25,
          ),
          ...menus.map((menu) => buildMenu(menu.nombre, menu.descripcion,
              menu.precio, menu.imagenUrl, menu.id)),
        ],
      ),
    );
  }

  Widget BottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menús',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Scanner',
        ),
      ],
      selectedItemColor: Color(0xff00376e),
      currentIndex: indexNavigation,
      onTap: (index) {
        setState(() {
          indexNavigation = index;
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/historial');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/scanner');
          }
        });
      },
    );
  }

  Widget buildEligeTuAlmuerzoTitle() {
    return Text(
      'Elige tu almuerzo',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 26,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ),
    );
  }

  Widget buildMenu(String menuName, String description, double price,
      String imageUrl, int id) {
    return GestureDetector(
      onTap: () {
        // Aquí debes obtener el ID del menú de alguna manera
        Navigator.pushNamed(
          context,
          '/menu',
          arguments: id,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        height: 255,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.fromLTRB(8.25, 10, 8.25, 10),
              width: double.infinity,
              height: 165,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                ),
              ),
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      width: 105,
                      height: 34,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 11,
                      top: 12,
                      child: Text(
                        'CLP',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: Color(0xff00376e),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 34,
                      top: -2,
                      child: SizedBox(
                        width: 61,
                        height: 36,
                        child: Text(
                          price.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuName,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff5b5b5e),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
