import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SlackNoticeWidget extends StatelessWidget {
  const SlackNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: ElevatedButton(
              child: Text("http"),
              onPressed: (() async {
                Uri url = Uri.parse("Slack web hook URL");
                Map<String, String> headers = {
                  'content-type':
                      'application/x-www-form-urlencoded;charset=UTF-8',
                };

                final postData = {"text": "<!here> Flutter to Slack Test"};

                String body = jsonEncode(postData);

                http.Response resp =
                    await http.post(url, headers: headers, body: body);

                print(resp.statusCode);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
