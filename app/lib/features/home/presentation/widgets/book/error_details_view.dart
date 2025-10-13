import 'package:flutter/material.dart';

import 'package:app/core/network/errors/failures.dart';

class ErrorDetailsView extends StatelessWidget {
  final Failure failure;
  const ErrorDetailsView({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 40),
          const SizedBox(height: 8),
          Text(
            failure.message,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
