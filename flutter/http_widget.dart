import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpWidget extends StatelessWidget {
  const HttpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: ElevatedButton(
              child: Text("http"),
              onPressed: (() async {
                Uri url = Uri.parse("https://api.notion.com/v1/pages");
                Map<String, String> headers = {
                  'content-type': 'application/json',
                  "Authorization": "Bearer token",
                  "Notion-Version": "2022-06-28"
                };

                final postData = {
                  "parent": {"database_id": "table_id"},
                  "properties": {
                    "title": {
                      "title": [
                        {
                          "text": {
                            "content": "test",
                          },
                        },
                      ],
                    },
                    "contactType": {
                      "select": {"name": "機種変更によるデータ移行"}
                    },
                    "status": {
                      "select": {"name": "open"}
                    },
                    "mailAddress": {
                      "rich_text": [
                        {
                          "text": {"content": "hoge@mail"}
                        }
                      ]
                    },
                    "userId": {
                      "rich_text": [
                        {
                          "text": {"content": "abcdefg"}
                        }
                      ]
                    }
                  },
                  "children": [
                    // {
                    //   "object": "block",
                    //   "type": "paragraph",
                    //   "paragraph": {
                    //     "rich_text": [
                    //       {
                    //         "type": "text",
                    //         "text": {"content": "hoge\n\nfoo"},
                    //       },
                    //     ],
                    //   },
                    // }
                    {
                      "type": "code",
                      "code": {
                        "rich_text": [
                          {
                            "type": "text",
                            "text": {"content": "hoge foo"}
                          }
                        ],
                        "language": "python"
                      }
                    }
                  ]
                };

                String body = jsonEncode(postData);

                http.Response resp =
                    await http.post(url, headers: headers, body: body);

                print(resp.body);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
