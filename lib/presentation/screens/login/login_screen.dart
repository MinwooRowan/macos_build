import 'package:exe_test/core/constant/animation_path_constant.dart';
import 'package:exe_test/core/constant/image_path_constant.dart';
import 'package:exe_test/core/util/images_util.dart';
import 'package:exe_test/presentation/layout/default_layout.dart';
import 'package:exe_test/presentation/screens/home/home_screen.dart';
import 'package:exe_test/presentation/screens/login/login_widget/login_text_field_widget.dart';
import 'package:exe_test/presentation/screens/login/provider/auth_provider.dart';
import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
    _composition = AssetLottie(loadingIndicatorAnimationPath).load();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController adminIdTextController =
        useTextEditingController();
    final FocusNode adminIdFocusNode = useFocusNode();
    final ValueNotifier<String> adminIdState = useState('');
    final TextEditingController adminPasswordTextController =
        useTextEditingController();
    final FocusNode adminPasswordFocusNode = useFocusNode();
    final ValueNotifier<String> adminPasswordState = useState('');
    final ValueNotifier<bool> keyboardHasFocusState = useState(false);

    final authState = ref.watch(authStateProvider);

    return DefaultLayout(
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageUtil().getImageAssetWidget(
                  PngImageConstant.logo,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                Text(
                  'COCOMUNG',
                  style: const TextStyle().title2,
                ),
                const SizedBox(height: 4),
                Text(
                  '모든 강아지 유치원을 위한 통합 관리 시스템',
                  textAlign: TextAlign.center,
                  style: const TextStyle().body.copyWith(color: gray400),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 280,
                  child: AdminTextFieldWidget(
                    adminIdTextController: adminIdTextController,
                    adminIdFocusNode: adminIdFocusNode,
                    adminIdState: adminIdState,
                    adminPasswordTextController: adminPasswordTextController,
                    adminPasswordFocusNode: adminPasswordFocusNode,
                    adminPasswordState: adminPasswordState,
                    keyboardHasFocusState: keyboardHasFocusState,
                  ),
                ),
                const SizedBox(height: 28),
                _LoginButton(
                  onPressed: () async {
                    await ref.read(authStateProvider.notifier).login();
                    if (context.mounted) {
                      _goToHomeScreen(context: context);
                    }
                  },
                ),
              ],
            ),
          ),
          if (authState == AuthStatus.loading)
            Stack(
              children: [
                const Opacity(
                  opacity: 0.5,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black,
                  ),
                ),
                Center(
                  child: FutureBuilder(
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
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _goToHomeScreen({required BuildContext context}) {
    context.goNamed(HomeScreen.routeName);
  }
}

class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _LoginButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 48,
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return yellowEmotionColor.withOpacity(0.1);
              } else {
                return Colors.transparent;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return gray300;
              } else {
                return whiteColor;
              }
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
          elevation: MaterialStateProperty.all(
            0,
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '로그인',
                style: const TextStyle().title5.copyWith(
                      color: gray850,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
