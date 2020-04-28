import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/model/scan_model.dart';
import 'package:qr_scanner_app/src/pages/mapas_page.dart';
import 'package:qr_scanner_app/src/pages/direcciones_page.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner_app/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  @override
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              size: 30,
              color: Colors.red,
            ),
            onPressed: scansBloc.borrarScanTODOS,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.filter_center_focus,
          size: 40,
        ),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context) async {
    String futureString;

    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      // DBProvider.db.nuevoScan(scan);
      scansBloc.agregarScan(scan);

      // final scan2 =
      //     ScanModel(valor: 'geo:40.9675894857348467,-74.827364758692175');
      // scansBloc.agregarScan(scan2);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(context, scan);
        });
      }
      utils.abrirScan(context, scan);
    }
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.map), title: Text('Locations')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Web'))
      ],
    );
  }
}
