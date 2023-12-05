import 'package:exe_test/core/constant/icon_path_constant.dart';
import 'package:exe_test/core/util/dialog_util.dart';
import 'package:exe_test/core/util/images_util.dart';
import 'package:exe_test/data/model/customer_model.dart';
import 'package:exe_test/presentation/widgets/toast/toast_widget.dart';
import 'package:exe_test/theme/color_style.dart';
import 'package:exe_test/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerScreen extends HookConsumerWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '고객관리',
                style: const TextStyle().subTitle2,
              ),
              const SizedBox(width: 28),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await showAddCustomerDialog(
                      context: context,
                      title: '고객 추가하기',
                      text: '고객을 얼른 추가하세요!',
                      confirmText: '추가하기',
                      cancelText: '취소',
                      onConfirm: () {
                        context.pop();
                      },
                      onCancel: () {
                        context.pop();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      '직접추가하기',
                      style: const TextStyle().button2,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await showSearchDialog(
                      context: context,
                      title: '찾고 싶은 내용을 입력해주세요',
                      text: '',
                      confirmText: '검색하기',
                      cancelText: '취소',
                      onConfirm: () {
                        context.pop();
                      },
                      onCancel: () {
                        context.pop();
                      },
                    );
                  },
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageUtil().getSvgAssetWidget(SvgAssetPath.searchMono,
                            width: 20, height: 20, color: whiteColor),
                        const SizedBox(width: 8),
                        Text(
                          '검색',
                          style: const TextStyle()
                              .subTitle2
                              .copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: screenWidth - 80,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 28,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCategoryText(text: '고객명', width: 120),
                            Container(width: 1, height: 24, color: gray200),
                            _buildCategoryText(text: '고객 연락처', width: 180),
                            Container(width: 1, height: 24, color: gray200),
                            _buildCategoryText(text: '고객 이메일', width: 360),
                            Container(width: 1, height: 24, color: gray200),
                            _buildCategoryText(text: '고객 주소', width: 200),
                            Container(width: 1, height: 24, color: gray200),
                            _buildCategoryText(text: '담당자', width: 120),
                          ],
                        ),
                      ),
                      Container(
                        width: 1200,
                        height: 0.5,
                        color: gray400,
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SizedBox(
                          width: 1200,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: customerDemoList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == customerDemoList.length) {
                                return const SizedBox(height: 280);
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: _CustomerListWidget(
                                  customerModel: customerDemoList[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                width: 1000,
                                height: 0.5,
                                color: gray300,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryText(
      {required String text, bool isCenter = false, required double width}) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SelectionArea(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: const TextStyle().subTitle3.copyWith(color: gray700),
          ),
        ),
      ),
    );
  }
}

class _CustomerListWidget extends StatefulHookConsumerWidget {
  final CustomerModel customerModel;
  const _CustomerListWidget({required this.customerModel});

  @override
  ConsumerState<_CustomerListWidget> createState() =>
      _CustomerListWidgetState();
}

class _CustomerListWidgetState extends ConsumerState<_CustomerListWidget> {
  FToast? fToast;
  ToastWidget toastWidget = const ToastWidget(text: '복사가 완료됐습니다!');

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _CustomerInfoWidget(
          text: widget.customerModel.customerName,
          isName: true,
          width: 120,
        ),
        _CustomerInfoWidget(
          text: widget.customerModel.customerPhone,
          width: 180,
        ),
        _CustomerInfoWidget(
          text: widget.customerModel.customerEmail,
          isOfferCopy: true,
          onCopyTap: () {
            Clipboard.setData(
                ClipboardData(text: widget.customerModel.customerEmail));
            ToastWidget toastWidget = const ToastWidget(text: '복사가 완료됐습니다!');
            toastWidget.showCustomToast(fToast: fToast!);
          },
          width: 360,
        ),
        _CustomerInfoWidget(
          text: widget.customerModel.customerAddress,
          width: 200,
        ),
        _CustomerInfoWidget(
          text: widget.customerModel.assignedContractor[0].toString(),
          width: 120,
          isName: true,
        ),
      ],
    );
  }
}

class _CustomerInfoWidget extends HookConsumerWidget {
  final String text;

  final bool isCenter;
  final bool isOfferCopy;
  final double width;
  final VoidCallback? onCopyTap;
  final bool? isName;
  const _CustomerInfoWidget({
    required this.text,
    required this.width,
    this.isCenter = false,
    this.isOfferCopy = false,
    this.onCopyTap,
    this.isName = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copyPressed = useState(false);
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: isName! ? 64 : null,
                  child: SelectionArea(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      textAlign: isCenter ? TextAlign.center : TextAlign.start,
                      style: const TextStyle().body.copyWith(color: gray700),
                    ),
                  ),
                ),
                if (isOfferCopy)
                  InkWell(
                    onTap: () {
                      onCopyTap?.call();
                      if (!copyPressed.value == true) {
                        copyPressed.value = !copyPressed.value;
                      }
                    },
                    child: copyPressed.value
                        ? ImageUtil().getSvgAssetWidget(
                            SvgAssetPath.checkMono,
                            color: greenEmotionColor,
                            width: 16,
                            height: 16,
                          )
                        : ImageUtil().getSvgAssetWidget(
                            SvgAssetPath.copyMono,
                            width: 16,
                            height: 16,
                          ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
