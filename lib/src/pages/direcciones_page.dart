import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/model/scan_model.dart';
import 'package:qr_scanner_app/utils/utils.dart' as utils;
// import 'package:qr_scanner_app/src/providers/db_provider.dart';

class DireccionesPage extends StatelessWidget {
  final scansBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    scansBloc.obtenerScans();
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final scans = snapshot.data;
        if (scans.length == 0) {
          return Center(
            child: Text('Nothing saved.'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) => scansBloc.borrarScan(scans[i].id),
            child: ListTile(
              leading: Icon(Icons.cloud_done,
                  color: Theme.of(context).accentColor, size: 25.0),
              title: Text(scans[i].valor),
              // subtitle: Text('id : ${scans[i].id}'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).accentColor,
                size: 35,
              ),
              onTap: () => utils.abrirScan(context, scans[i]),
            ),
          ),
          itemCount: scans.length,
        );
      },
    );
  }
}
