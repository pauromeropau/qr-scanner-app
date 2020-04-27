import 'package:qr_scanner_app/src/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(ScanModel scan) async {
  if (scan.tipo == 'http') {
    const url = 'https://flutter.dev';
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  } else {
    print('geo');
  }
}
