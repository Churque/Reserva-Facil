import 'package:flutter/material.dart';
import 'package:reservafacil/app/entities/menu.dart';

class MyMenusPage extends StatefulWidget {
  const MyMenusPage();

  @override
  _MyMenusPage createState() => _MyMenusPage();
}

class _MyMenusPage extends State<MyMenusPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TopAppBar(),
              buildAllMenus(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Color(0xff00376e),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget TopAppBar() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            height: 70,
          ),
          Spacer(),
          Spacer(),
          Text(
            'Reserva Facil',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Color(0xff00376e),
            ),
          ),
          Spacer(),
          buildUserProfile(),
        ],
      ),
    );
  }

  Widget buildAllMenus() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEligeTuAlmuerzoTitle(),
          SizedBox(
            height: 25,
          ),
          ...menus.map((menu) => buildMenu(
              menu.name, menu.description, menu.price, menu.imageUrl, menu.id)),
        ],
      ),
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
        print('Menu clickeado: $menuName   id: $id');
        Navigator.pushNamed(context, '/menu/$id');
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
                      top: 13,
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
                      top: 0,
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

  Widget buildUserProfile() {
    return Container(
      width: 52,
      height: 50.24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/512/1674/1674400.png',
        ),
      ),
    );
  }
}
