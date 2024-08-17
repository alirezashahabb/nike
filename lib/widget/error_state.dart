import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike/common/exception.dart';

class ErrorState extends StatelessWidget {
  final AppException exception;
  final GestureTapCallback onTap;
  const ErrorState({
    super.key,
    required this.exception,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/img/ErrorState.json', height: 100, width: 100),
          Text(exception.message),
          ElevatedButton(
            onPressed: onTap,
            child: const Text('تلاش دوباره'),
          ),
        ],
      ),
    );
  }
}
