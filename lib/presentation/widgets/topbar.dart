import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final void Function() onSidebarToggleButtonPressed;

  const TopBar({Key? key, required this.onSidebarToggleButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      child: Row(
        children: [
          const SizedBox(width: 4.0),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: onSidebarToggleButtonPressed,
              child: const Row(
                children: [
                  Icon(
                    Icons.view_sidebar_outlined,
                  ),
                  SizedBox(width: 6.0),
                  Text('Toggle sidebar'),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
