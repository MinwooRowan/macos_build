class HomeContentModel {
  final String title;
  final String imagePath;
  final int index;
  final int? notificationCount;
  bool isSelected;

  HomeContentModel({
    required this.title,
    required this.imagePath,
    required this.index,
    required this.notificationCount,
    required this.isSelected,
  });

  set setSelected(bool value) {
    isSelected = value;
  }

  HomeContentModel copyWith({
    String? title,
    String? imagePath,
    int? index,
    int? notificationCount,
    bool? isSelected,
  }) {
    return HomeContentModel(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      index: index ?? this.index,
      notificationCount: notificationCount ?? this.notificationCount,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
