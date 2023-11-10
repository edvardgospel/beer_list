import 'package:beer_list/themes.dart';
import 'package:flutter/material.dart';

class ConnectionErrorPage extends StatelessWidget {
  final VoidCallback onTap;
  const ConnectionErrorPage({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Error',
          style: TextStyles.bold16,
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Connection error, please try again',
                style: TextStyles.bold16,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onTap,
                style: ButtonStyles.primary,
                child: const Text(
                  'Reload',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
