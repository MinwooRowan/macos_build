import 'package:exe_test/core/constant/animation_path_constant.dart';
import 'package:exe_test/presentation/layout/default_layout.dart';
import 'package:exe_test/presentation/widgets/side_bar_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
    _composition = AssetLottie(loadingIndicatorAnimationPath).load();
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
  Color color = Colors.white.withOpacity(0.3);

  MacOSBlurViewState macOSBlurViewState =
      MacOSBlurViewState.followsWindowActiveState;

  @override
  Widget build(BuildContext context) {
    return TitlebarSafeArea(
      child: SidebarFrame(
        sidebar: const SizedBox.expand(),
        macOSBlurViewState: macOSBlurViewState,
        child: DefaultLayout(
          child: Center(
            child: FutureBuilder(
                future: _composition,
                builder: (context, snapshot) {
                  final composition = snapshot.data;
                  if (composition != null) {
                    return Lottie(
                      frameRate: FrameRate.max,
                      composition: composition,
                      width: 120,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const Center();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
