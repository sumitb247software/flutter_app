import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TWeb extends StatelessWidget {
  final _staticData =
      '<p><span style="font-size: 2.5em">Sumit</span></p><ol><li>Ravi<ul><li style="text-align:right">Sagar</li></ul></li></ol><p><span style="color:#a10000">Abhi</span><br><strong>Swapnil</strong><br><br><img src="https://247-software-media-dev.s3.us-west-2.amazonaws.com/undefined/Images/20200121_065207_7778ff4e06.jpg"></p>';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Card(
        elevation: 2.0,
        shape: OutlineInputBorder(),
        child: WebView(
          gestureNavigationEnabled: true,
          initialUrl:
              Uri.dataFromString(_staticData, mimeType: 'text/html').toString(),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
