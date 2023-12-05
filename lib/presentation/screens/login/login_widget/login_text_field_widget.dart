import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminTextFieldWidget extends HookConsumerWidget {
  final TextEditingController adminIdTextController;
  final FocusNode adminIdFocusNode;
  final ValueNotifier<String> adminIdState;
  final TextEditingController adminPasswordTextController;
  final FocusNode adminPasswordFocusNode;
  final ValueNotifier<String> adminPasswordState;

  final ValueNotifier<bool> keyboardHasFocusState;

  const AdminTextFieldWidget({
    super.key,
    required this.adminIdTextController,
    required this.adminIdFocusNode,
    required this.adminIdState,
    required this.adminPasswordTextController,
    required this.adminPasswordFocusNode,
    required this.adminPasswordState,
    required this.keyboardHasFocusState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _AdminTextFieldWidget(
          label: '아이디',
          controller: adminIdTextController,
          focusNode: adminIdFocusNode,
          onChanged: (value) {
            adminIdState.value = value;
          },
          keyboardHasFocusState: keyboardHasFocusState,
          hintText: '아이디를 입력해주세요',
          isObscure: false,
          nextFocusNode: adminPasswordFocusNode,
        ),
        const SizedBox(height: 16),
        _AdminTextFieldWidget(
          label: '비밀번호',
          controller: adminPasswordTextController,
          focusNode: adminPasswordFocusNode,
          onChanged: (value) {
            adminPasswordState.value = value;
          },
          keyboardHasFocusState: keyboardHasFocusState,
          hintText: '비밀번호를 입력해주세요',
          isObscure: true,
        ),
      ],
    );
  }
}

class _AdminTextFieldWidget extends ConsumerWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final Function(String) onChanged;
  final String hintText;
  final bool isObscure;
  final ValueNotifier<bool> keyboardHasFocusState;
  const _AdminTextFieldWidget({
    this.nextFocusNode,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.hintText,
    required this.isObscure,
    required this.keyboardHasFocusState,
  });

  static String adminLoginDialogPwObscureCharactor = '●';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle().detail.copyWith(color: gray500),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              obscureText: isObscure,
              obscuringCharacter: adminLoginDialogPwObscureCharactor,
              style: const TextStyle()
                  .detail
                  .copyWith(color: whiteColor, height: 0),
              textInputAction: nextFocusNode == null
                  ? TextInputAction.done
                  : TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: yellowEmotionColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: gray400),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                hintText: hintText,
                hintStyle: const TextStyle()
                    .detail
                    .copyWith(color: gray400, height: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: whiteColor),
                ),
              ),
              onEditingComplete: () {
                if (nextFocusNode != null) {
                  nextFocusNode!.requestFocus();
                } else {
                  focusNode.unfocus();
                  keyboardHasFocusState.value = false;
                }
              },
              onTapOutside: (value) {
                focusNode.unfocus();
                keyboardHasFocusState.value = false;
              },
            ),
          )
        ],
      ),
    );
  }
}
