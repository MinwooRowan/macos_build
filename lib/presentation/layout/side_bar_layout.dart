// Flutter imports:
import 'package:exe_test/presentation/widgets/side_bar_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideBarLayout extends StatefulHookConsumerWidget {
  const SideBarLayout({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.sizebar = const SizedBox(),
  });

  final Widget child;
  final Color backgroundColor;
  final Widget sizebar;
  @override
  ConsumerState<SideBarLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<SideBarLayout> {
  @override
  void initState() {
    super.initState();
    setWindowEffect(effect);
  }

  void setWindowEffect(WindowEffect? value) {
    Window.setEffect(
      effect: value!,
      color: color,
    );

    setState(() => effect = value);
  }

  WindowEffect effect = WindowEffect.acrylic;
  Color color = Colors.transparent;

  MacOSBlurViewState macOSBlurViewState =
      MacOSBlurViewState.followsWindowActiveState;
  @override
  Widget build(BuildContext context) {
    return TitlebarSafeArea(
      child: SidebarFrame(
        sidebar: Scaffold(
          backgroundColor: Colors.transparent,
          body: widget.sizebar,
        ),
        macOSBlurViewState: macOSBlurViewState,
        child: Scaffold(
          backgroundColor: widget.backgroundColor,
          body: widget.child,
        ),
      ),
    );
  }
}
