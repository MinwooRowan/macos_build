import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopBar extends HookConsumerWidget {
  final void Function() onSidebarToggleButtonPressed;
  final String title;

  const TopBar({
    super.key,
    required this.onSidebarToggleButtonPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 32.0,
        child: Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: OutlinedButton(
                onPressed: onSidebarToggleButtonPressed,
                child: Row(
                  children: [
                    const Icon(
                      Icons.view_sidebar_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6.0),
                    Text(title, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
