// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultLayout extends StatefulHookConsumerWidget {
  const DefaultLayout({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
  });

  final Widget child;
  final Color backgroundColor;
  @override
  ConsumerState<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<DefaultLayout> {
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
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: widget.child,
      ),
    );
  }
}
