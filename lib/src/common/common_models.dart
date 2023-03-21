class IconElementModel {
  IconElementModel({
    this.url,
    this.bgColor,
  });

  final String? url;
  final String? bgColor;

  factory IconElementModel.fromJson(Map<String, dynamic> json) =>
      IconElementModel(
        url: json['url'],
        bgColor: json['bg_color'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'bg_color': bgColor,
      };

  @override
  String toString() => 'IconElementModel(url: $url, bgColor: $bgColor)';
}
