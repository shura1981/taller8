import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:taller8/services/codebar_service.dart';

import '../widgets/menu.dart';

class BarcodeScannerWidget extends StatefulWidget {
  const BarcodeScannerWidget({super.key});
  static String name = "barcode";
  @override
  BarcodeScannerWidgetState createState() => BarcodeScannerWidgetState();
}

class BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  String _scanBarcode = 'Presiona el botón para escanear';
  String alarmAudioPath = "sounds/alert.mp3";
  static AudioPlayer player = AudioPlayer();

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
      if (!mounted) return;
        player.play(AssetSource(alarmAudioPath));
      _buscar(context, barcodeScanRes);
    } catch (e) {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }

  void _buscar(BuildContext context, String code) {
     setState(() {
        _scanBarcode = "";
      });
    _showMyDialog(context);
    ApiCodeBarService.codeBar(code).then((value) {
      Navigator.pop(context);
      // Navigator.pushNamed(context, '/input', arguments: value);
      setState(() {
        _scanBarcode = "Producto: ${value.itemName}";
      });
    }).catchError((e) {
      Navigator.pop(context);
      // mostrarError(context, ApiCodeBarService.handleError(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode Scanner')),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('$_scanBarcode\n',
              style: const TextStyle(fontSize: 16)),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _scanBarcode = 'Unknown';
                  });
                }),
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanQR,
        child: const Icon(Icons.filter_center_focus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
