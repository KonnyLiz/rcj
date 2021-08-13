import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Donaciones extends StatefulWidget {
  Donaciones({Key? key}) : super(key: key);

  @override
  _DonacionesState createState() => _DonacionesState();
}

class _DonacionesState extends State<Donaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donaciones'),
      ),
      body: WebView(
        initialUrl: 'https://lk.wompi.sv/UQrU',
        javascriptMode: JavascriptMode.unrestricted,
      ) ,
    );
  }
}