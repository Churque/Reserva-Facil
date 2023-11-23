import 'package:flutter/material.dart';

class MySelectedMenu extends StatefulWidget {
  const MySelectedMenu();

  @override
  _MySelectedMenu createState() => _MySelectedMenu();
}

class _MySelectedMenu extends State<MySelectedMenu> {
  bool isItemSelected = false;
  bool juiceSelected = false;
  bool waterSelected = false;
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Column(
                children: [
                  buildHeaderImage(),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        buildMenuHeader(),
                        SizedBox(height: 30),
                        buildDescription(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildChooseWaterOrJuice(),
                  SizedBox(
                    height: 30,
                  ),
                  buildComprarButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderImage() {
    return Container(
      width: double.infinity,
      height: 195,
      child: Image.network(
        'https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMenuHeader() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menu Ejecutivo',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.15,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 2, 3),
                  child: Text(
                    'CLP',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 145, 0),
                  child: Text(
                    '3.380',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                buildCounterRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      child: Text(
        'Contiene blab Contiene blaasdasdasdsssb Contiene blab Contiene blab Contiene blab Contiene blab Contiene blab Contiene blab Contiene blab Contiene blab ',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xff858992),
        ),
      ),
    );
  }

  Widget buildCounterRow() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                itemCount = itemCount > 1 ? itemCount - 1 : 1;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF00376E),
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: Color(0xFF00376E),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$itemCount',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              setState(() {
                itemCount = itemCount + 1;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00376E),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChooseWaterOrJuice() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Elegir',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.5,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 30),
          buildItemRow(
            'https://img.freepik.com/vector-gratis/composicion-salpicaduras-jugo-naranja-imagen-aislada-vidrio-entero-ilustracion-vector-salpicadura-rebanada-liquido_1284-66133.jpg',
            'Jugo',
            juiceSelected,
            () {
              setState(() {
                isItemSelected = !isItemSelected;
                juiceSelected = !juiceSelected;
                if (waterSelected) {
                  waterSelected = false;
                }
              });
            },
          ),
          SizedBox(height: 30),
          buildItemRow(
            'https://coca-colafemsa.com/wp-content/uploads/2020/02/3-3.png',
            'Agua',
            waterSelected,
            () {
              setState(() {
                isItemSelected = !isItemSelected;
                waterSelected = !waterSelected;
                if (juiceSelected) {
                  juiceSelected = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildItemRow(
    String imageUrl,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 175),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF000000),
                width: 2,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: onTap,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isSelected ? Color(0xFF00376E) : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildComprarButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(72.5, 0, 72.5, 0),
      width: double.infinity,
      height: 60,
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
          'Comprar',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
