import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:reserva_facil/app/entities/compra.dart';

class ScannerQRPage extends StatefulWidget {
  const ScannerQRPage();

  @override
  _ScannerQRPage createState() => _ScannerQRPage();
}

class _ScannerQRPage extends State<ScannerQRPage> {
  String? _qrInfo = 'Escanear Codigo QR';
  late String nombreMenu = '';
  late String precio = '';
  late String ingredientes = '';
  late String bebida = '';
  late String cantidad = '';
  bool camState = false;
  int _selectedIndex = 2;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;

      List<String> qrParts = _qrInfo!.split(' ');
      nombreMenu = qrParts[0] + qrParts[1];
      precio = qrParts[2];
      ingredientes = qrParts
          .sublist(3, qrParts.length - 2)
          .join(' ')
          .replaceAll(RegExp(r'[\[\]]'), '');
      bebida = qrParts[qrParts.length - 2];
      cantidad = qrParts[qrParts.length - 1];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escanear Codigo QR'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: camState
          ? Container(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDataRow('Cantidad:', '$cantidad', Colors.blue),
                  SizedBox(height: 50),
                  buildDataRow('Nombre del Menú:', '$nombreMenu', Colors.blue),
                  SizedBox(height: 50),
                  buildDataRow('Ingredientes:', '$ingredientes', Colors.blue),
                  SizedBox(height: 50),
                  buildDataRow('Bebestible:', '$bebida', Colors.blue),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavBar(),
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

  Widget buildDataRow(String label, String value, Color labelColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: labelColor,
          ),
        ),
        Flexible(
          child: Text(
            '$value',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
