import 'package:rester/middleware.dart';
import 'package:rester/rester/rester.dart';
import 'package:rester/rester/rester_request.dart';
import 'package:rester/rester/rester_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rester =
        Rester(baseUrl: "https://google.com/", middleware: MiddleWare());
    ResterRequest request = const ResterRequest(
      endpoint: '/peoples/get',
      type: ResterType.head,
      uuid: 'UUID',
    );
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await rester(request);
          },
          child: const Text('fetch'),
        ),
      ),
    );
  }
}
