import 'package:reserva_facil/app/entities/menu.dart';

class Compra {
  final String qrData;
  final Menu? menu;
  bool escaneado;

  Compra({
    required this.qrData,
    required this.menu,
    this.escaneado = false,
  });

  void marcarComoEscaneado() {
    escaneado = true;
  }
}

final List<Compra> historialCompras = [];
