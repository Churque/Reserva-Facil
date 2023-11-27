import 'package:flutter/material.dart';
import 'package:reserva_facil/app/entities/compra.dart';
import 'package:reserva_facil/app/entities/menu.dart';
import 'package:reserva_facil/app/page/qrpage.dart';

class MyHistorialPage extends StatefulWidget {
  const MyHistorialPage();

  @override
  _MyHistorialPage createState() => _MyHistorialPage();
}

class _MyHistorialPage extends State<MyHistorialPage> {
  int _selectedIndex = 1;
  List<Compra> compras = historialCompras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Ordenes',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    BuildFechaCompra(),
                    SizedBox(
                      height: 25,
                    ),
                    BuildContainerHistorialMenu(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget BuildFechaCompra() {
    return Container(
      width: double.infinity,
      child: Text(
        'Hoy',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: Color(0xff000000),
        ),
      ),
    );
  }

  Widget BuildContainerHistorialMenu() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: historialCompras.length,
      itemBuilder: (context, index) {
        Compra compra = historialCompras[index];
        Menu? menu = compra.menu;

        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildImagenMenuHistorial(compra.menu!.imageUrl),
                  BuildInfoMenu(compra.menu!),
                  ButtonEnableOrNot(),
                ],
              ),
              BuildButtonVerCodigoQr(compra.qrData!),
            ],
          ),
        );
      },
    );
  }

  Widget BuildImagenMenuHistorial(String? imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  Widget BuildInfoMenu(Menu menu) {
    return Container(
      width: 141,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7),
            width: double.infinity,
            child: Text(
              menu.name,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 4, 4),
                  child: Text(
                    'CLP',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Text(
                  menu.price.toStringAsFixed(0),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.15,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildButtonVerCodigoQr(String? dataqr) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 25, 50, 0),
      width: double.infinity,
      height: 43,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyQRPage(qrData: dataqr!),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff00376e),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Ver Codigo QR',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.15,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ButtonEnableOrNot() {
    return Container(
      margin: EdgeInsets.fromLTRB(95, 0, 0, 30),
      height: 25,
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green, // Color verde
          ),
        ),
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
          icon: Icon(Icons.person),
          label: 'Scanner',
        ),
      ],
      selectedItemColor: Color(0xff00376e),
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
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
}
