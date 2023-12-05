import 'package:exe_test/core/constant/icon_path_constant.dart';
import 'package:exe_test/core/util/images_util.dart';
import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PipeLineScreen extends ConsumerWidget {
  const PipeLineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '파이프 라인',
                  style: const TextStyle().title2,
                ),
                const SizedBox(width: 24),
                Text('관리중인 파이프라인 : 3개',
                    style: const TextStyle().body.copyWith(color: gray400)),
              ],
            ),
            const SizedBox(height: 28),
            Expanded(
              child: Row(
                children: [
                  const _CardColumn(
                    color: greenEmotionColor,
                    title: 'COCOMUNG',
                  ),
                  VerticalDivider(
                    color: whiteColor.withOpacity(0.2),
                    thickness: 0.5,
                  ),
                  const _CardColumn(
                    color: yellowEmotionColor,
                    title: 'QUOKKA',
                  ),
                  VerticalDivider(
                    color: whiteColor.withOpacity(0.2),
                    thickness: 0.5,
                  ),
                  const _CardColumn(
                    color: blueEmotionColor,
                    title: 'MAKNAE',
                  ),
                  VerticalDivider(
                    color: whiteColor.withOpacity(0.2),
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardColumn extends HookConsumerWidget {
  final Color color;
  final String title;
  const _CardColumn({required this.color, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<List<bool>> isSelected = useState([false, false]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: 360,
        child: Column(
          children: [
            Container(
              width: 360,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle().body.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  Draggable(
                    feedback: _CardWidget(
                      selected: isSelected.value[0],
                      onTap: () {},
                      title: 'COCOMUNG',
                      customer: '멍멍유치원',
                      contractorName: '최현종',
                      price: '30.0',
                      createdDate: '2023.10.01',
                      updatedDate: '18 Hours',
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: _CardWidget(
                      selected: isSelected.value[0],
                      onTap: () {
                        if (isSelected.value[0] == true) {
                          isSelected.value = [false, false];
                        } else {
                          isSelected.value = [true, false];
                        }
                      },
                      title: 'COCOMUNG',
                      customer: '멍멍유치원',
                      contractorName: '최현종',
                      price: '30.0',
                      createdDate: '2023.10.01',
                      updatedDate: '18 Hours',
                    ),
                  ),
                  Draggable(
                    feedback: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {},
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: greenEmotionColor,
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {
                        if (isSelected.value[1] == true) {
                          isSelected.value = [false, false];
                        } else {
                          isSelected.value = [false, true];
                        }
                      },
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: blueEmotionColor,
                    ),
                  ),
                  Draggable(
                    feedback: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {},
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: redEmotionColor,
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {
                        if (isSelected.value[1] == true) {
                          isSelected.value = [false, false];
                        } else {
                          isSelected.value = [false, true];
                        }
                      },
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: redEmotionColor,
                    ),
                  ),
                  Draggable(
                    feedback: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {},
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: redEmotionColor,
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    child: _CardWidget(
                      selected: isSelected.value[1],
                      onTap: () {
                        if (isSelected.value[1] == true) {
                          isSelected.value = [false, false];
                        } else {
                          isSelected.value = [false, true];
                        }
                      },
                      title: 'COCOMUNG',
                      customer: '숲속 강아지마을',
                      contractorName: '최현종',
                      price: '20.0',
                      createdDate: '2023.10.02',
                      updatedDate: '2 Hours',
                      customerColor: yellowEmotionColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends HookConsumerWidget {
  final bool selected;
  final double opacity;
  final String title;
  final String customer;
  final String contractorName;
  final String price;
  final String createdDate;
  final String updatedDate;
  final Color customerColor;
  final Function onTap;
  const _CardWidget({
    required this.selected,
    required this.customer,
    required this.contractorName,
    required this.price,
    required this.createdDate,
    required this.updatedDate,
    required this.title,
    required this.onTap,
    this.customerColor = blueEmotionColor,
    this.opacity = 1,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: 330,
          height: 228,
          decoration: BoxDecoration(
            color: gray100,
            borderRadius: BorderRadius.circular(12),
            border: selected
                ? Border.all(color: greenEmotionColor, width: 4)
                : Border.all(color: Colors.transparent, width: 4),
            boxShadow: const [
              BoxShadow(
                color: gray700,
                blurRadius: 6,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Opacity(
            opacity: opacity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle().body.copyWith(color: gray500),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: customerColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            customer,
                            style: const TextStyle()
                                .subTitle2
                                .copyWith(color: gray700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          ImageUtil().getSvgAssetWidget(
                            SvgAssetPath.userMono,
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            contractorName,
                            style:
                                const TextStyle().body.copyWith(color: gray600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'One-time \$$price',
                        style: const TextStyle().body.copyWith(color: gray600),
                      ),
                    ],
                  ),
                  const Divider(
                    color: gray400,
                    thickness: 0.5,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Created Date',
                    style: const TextStyle().detail.copyWith(color: gray400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        createdDate,
                        style: const TextStyle().body.copyWith(color: gray600),
                      ),
                      Text(
                        'updated $updatedDate ago',
                        style: const TextStyle().body.copyWith(color: gray400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
