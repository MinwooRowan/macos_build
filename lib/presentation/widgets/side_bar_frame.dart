import 'dart:io';

import 'package:exe_test/presentation/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_acrylic/widgets/transparent_macos_sidebar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SidebarFrame extends StatefulHookConsumerWidget {
  final Widget child;
  final Widget sidebar;
  final MacOSBlurViewState macOSBlurViewState;

  const SidebarFrame({
    super.key,
    required this.sidebar,
    required this.child,
    required this.macOSBlurViewState,
  });

  @override
  ConsumerState<SidebarFrame> createState() => _SidebarFrameState();
}

class _SidebarFrameState extends ConsumerState<SidebarFrame> {
  @override
  Widget build(BuildContext context) {
    final isOpen = useState(true);
    if (!Platform.isMacOS) {
      return widget.child;
    }

    const sidebarWidth = 250.0;

    return Stack(
      children: [
        Row(
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn,
              tween: Tween<double>(
                begin: isOpen.value ? sidebarWidth : 0.0,
                end: isOpen.value ? sidebarWidth : 0.0,
              ),
              builder: (BuildContext context, double value, Widget? child) {
                return TransparentMacOSSidebar(
                  state: widget.macOSBlurViewState,
                  child: Container(
                    width: value,
                    padding: const EdgeInsets.only(top: 40.0),
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: OverflowBox(
                      minWidth: sidebarWidth,
                      maxWidth: sidebarWidth,
                      child: isOpen.value ? child : const SizedBox(),
                    ),
                  ),
                );
              },
              child: widget.sidebar,
            ),
            Container(
              width: 1.0,
              color: Colors.black.withOpacity(0.1),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: widget.child,
              ),
            ),
          ],
        ),
        TopBar(
          title: isOpen.value ? '사이드바 닫기' : '사이드바 열기',
          onSidebarToggleButtonPressed: () {
            isOpen.value = !isOpen.value;
          },
        ),
      ],
    );
  }
}
