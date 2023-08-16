import 'page_view.dart';

class PageViewModel {
  List<PageViews>? pageViews;
  int? total;

  PageViewModel({this.pageViews, this.total});

  factory PageViewModel.fromJson(Map<String, dynamic> json) => PageViewModel(
        pageViews: (json['pageViews'] as List<dynamic>?)
            ?.map((e) => PageViews.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pageViews': pageViews?.map((e) => e.toJson()).toList(),
        'total': total,
      };
}
