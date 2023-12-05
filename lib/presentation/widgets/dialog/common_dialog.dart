import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonDialog extends HookConsumerWidget {
  final String title;
  final String text;
  final String confirmText;
  final String cancelText;
  final Function() onConfirm;
  final Function() onCancel;
  const CommonDialog({
    super.key,
    required this.title,
    required this.text,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 480,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle()
                        .title2
                        .copyWith(color: greenEmotionColor),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    text,
                    style: const TextStyle().lead.copyWith(color: gray700),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: onCancel,
                        style: TextButton.styleFrom(
                          backgroundColor: gray200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          cancelText,
                          style:
                              const TextStyle().body.copyWith(color: gray700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: onConfirm,
                        style: TextButton.styleFrom(
                          backgroundColor: greenEmotionColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          confirmText,
                          style: const TextStyle()
                              .body
                              .copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
