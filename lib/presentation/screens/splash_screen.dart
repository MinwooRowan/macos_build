import 'package:exe_test/core/constant/animation_path_constant.dart';
import 'package:exe_test/presentation/layout/default_layout.dart';
import 'package:exe_test/presentation/screens/login/login_screen.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  static const routeName = 'splash';
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
    _goToLoginScreen();
  }

  void _goToLoginScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _composition,
              builder: (context, snapshot) {
                final composition = snapshot.data;
                if (composition != null) {
                  return Lottie(
                    frameRate: FrameRate.max,
                    composition: composition,
                    width: 80,
                    fit: BoxFit.cover,
                  );
                } else {
                  return const Center();
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              '코코멍을 준비중입니다...',
              style: const TextStyle().title3,
            ),
          ],
        ),
      ),
    );
  }
}
