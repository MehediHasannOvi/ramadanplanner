import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback callback;

  LocationErrorWidget({required this.error, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: TextStyle(fontSize: 16, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: callback,
            child: Text("Retry"),
          ),
        ],
      ),
    );
  }
}
