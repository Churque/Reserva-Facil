import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQRPage extends StatefulWidget {
  final String qrData;
  const MyQRPage({required this.qrData});
  //const MyQRPage();
  @override
  _MyQRPage createState() => _MyQRPage();
}

class _MyQRPage extends State<MyQRPage> {
  late String qr;

  @override
  void initState() {
    super.initState();
    qr = widget.qrData ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Código QR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qr,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
