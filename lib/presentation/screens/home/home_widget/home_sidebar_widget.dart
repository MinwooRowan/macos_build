import 'package:exe_test/core/constant/icon_path_constant.dart';
import 'package:exe_test/core/util/images_util.dart';
import 'package:exe_test/presentation/screens/home/provider/home_content_index_provider.dart';
import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSideBarWidget extends HookConsumerWidget {
  const HomeSideBarWidget({super.key});
  static List<String> list = [
    '코코멍 원장님',
    '코코멍 선생님',
    '코코멍 관리자',
    '코코멍 방문자',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItemIndex = ref.watch(homeContentIndexProvider);
    final homeContent = ref.watch(homeContentProvider);

    return Column(
      children: [
        const _UserProfile(),
        const SizedBox(height: 40),
        Column(
          children: homeContent.asMap().entries.map((e) {
            final index = e.key;
            final item = e.value;
            return _SideMenu(
              imagePath: item.imagePath,
              title: item.title,
              isSelected: item.index == selectedItemIndex,
              onTap: () {
                _setSelectedIndex(index: index, ref: ref);
              },
              notificationCount: item.notificationCount,
            );
          }).toList(),
        ),
      ],
    );
  }

  void _setSelectedIndex({required int index, required WidgetRef ref}) {
    ref.read(homeContentIndexProvider.notifier).setIndex(index);
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageUtil().getSvgAssetWidget(
                  SvgAssetPath.userMono,
                  width: 20,
                  height: 20,
                  color: whiteColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'COCO_Admin',
                  style: const TextStyle().title4,
                ),
              ],
            ),
            ImageUtil().getSvgAssetWidget(
              SvgAssetPath.arrowDecreaseMono,
              width: 16,
              height: 16,
              color: gray400,
            ),
          ],
        ));
  }
}

class _SideMenu extends ConsumerWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final int? notificationCount;
  const _SideMenu({
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? greenEmotionColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextButton(
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageUtil().getSvgAssetWidget(
                    imagePath,
                    width: 16,
                    height: 16,
                    color: whiteColor,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle().body,
                  ),
                ],
              ),
              if (notificationCount != null)
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle()
                          .detailBold
                          .copyWith(color: greenEmotionTextColor),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
