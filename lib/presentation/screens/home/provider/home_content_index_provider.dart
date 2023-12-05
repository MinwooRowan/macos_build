import 'package:exe_test/core/constant/icon_path_constant.dart';
import 'package:exe_test/data/model/home_content_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_content_index_provider.g.dart';

enum HomeIndexEnum {
  email,
  voc,
  costomer,
  pet,
  pipeLine,
}

@riverpod
List<HomeContentModel> homeContent(HomeContentRef ref) {
  return [
    HomeContentModel(
      title: '이메일',
      imagePath: SvgAssetPath.folderMono,
      index: HomeIndexEnum.email.index,
      notificationCount: 5,
      isSelected: true,
    ),
    HomeContentModel(
      title: 'VOC',
      imagePath: SvgAssetPath.headphoneMono,
      index: HomeIndexEnum.voc.index,
      notificationCount: null,
      isSelected: false,
    ),
    HomeContentModel(
      title: '고객관리',
      imagePath: SvgAssetPath.userTwoMono,
      index: HomeIndexEnum.costomer.index,
      notificationCount: null,
      isSelected: false,
    ),
    HomeContentModel(
      title: '반려동물 정보',
      imagePath: SvgAssetPath.crownMono,
      index: HomeIndexEnum.pet.index,
      notificationCount: null,
      isSelected: false,
    ),
    HomeContentModel(
      title: '파이프 라인',
      imagePath: SvgAssetPath.linkMono,
      index: HomeIndexEnum.pipeLine.index,
      notificationCount: null,
      isSelected: false,
    ),
  ];
}

@Riverpod(keepAlive: true)
class HomeContentIndex extends _$HomeContentIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    switch (index) {
      case 0:
        setIndexToEmail();
        break;
      case 1:
        setIndexToVOC();
        break;
      case 2:
        setIndexToCostomer();
        break;
      case 3:
        setIndexToPet();
        break;
      case 4:
        setIndexToPipeLine();
        break;

      default:
    }
  }

  void setIndexToEmail() {
    state = 0;
  }

  void setIndexToVOC() {
    state = 1;
  }

  void setIndexToCostomer() {
    state = 2;
  }

  void setIndexToPet() {
    state = 3;
  }

  void setIndexToPipeLine() {
    state = 4;
  }
}
