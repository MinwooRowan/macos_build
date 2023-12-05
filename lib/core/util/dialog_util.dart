import 'package:exe_test/presentation/widgets/dialog/common_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showAddCustomerDialog({
  required BuildContext context,
  required String title,
  required String text,
  required String confirmText,
  required String cancelText,
  required Function() onConfirm,
  required Function() onCancel,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return CommonDialog(
          title: title,
          text: text,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirm: onConfirm,
          onCancel: onCancel);
    },
  );
}

Future<void> showSearchDialog({
  required BuildContext context,
  required String title,
  required String text,
  required String confirmText,
  required String cancelText,
  required Function() onConfirm,
  required Function() onCancel,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return CommonDialog(
          title: title,
          text: text,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirm: onConfirm,
          onCancel: onCancel);
    },
  );
}
