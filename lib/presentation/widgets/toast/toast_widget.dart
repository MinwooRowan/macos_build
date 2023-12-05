import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget extends StatelessWidget {
  final String text;
  const ToastWidget({super.key, required this.text});

  void showCustomToast({required FToast fToast}) {
    // 큐에 담겨져 있는 토스트 리스트 제거
    fToast.removeQueuedCustomToasts();
    // 토스트 팝업
    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      child: ToastWidget(text: text),
      toastDuration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFF252525).withOpacity(0.7),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle().title4,
      ),
    );
  }
}
