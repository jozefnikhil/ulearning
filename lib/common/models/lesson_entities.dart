class LessonRequestEntity {
  int? id;

  LessonRequestEntity({this.id});

  Map<String, dynamic> toJson() => {"id": id};
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListResponseEntity({this.code, this.msg, this.data});

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data:
            json['data'] == null
                ? []
                : List<LessonItem>.from(
                  json['data'].map((x) => LessonItem.fromJson(x)),
                ),
      );
}

class LessonDetailResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonDetailResponseEntity({this.code, this.msg, this.data});

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonDetailResponseEntity(
        code: json['code'],
        msg: json['msg'],
        data:
            json['data'] == null
                ? []
                : List<LessonItem>.from(
                  json['data'].map((x) => LessonItem.fromJson(x)),
                ),
      );
}

class LessonItem {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  List<LessonVideoItem>? video;

  LessonItem({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.video,
  });

  LessonItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    if (json['video'] != null) {
      video = <LessonVideoItem>[];
      json['video'].forEach((v) {
        video!.add(LessonVideoItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    if (video != null) {
      data['video'] = video!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LessonVideoItem {
  String? name;
  String? thumbnail;
  String? url;

  LessonVideoItem({this.name, this.thumbnail, this.url});

  LessonVideoItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    return data;
  }
}

class LessonVideo {
  final List<LessonVideoItem> lessonItem;
  final Future<void>? initializeVideoPlayer;
  final bool isPlaying;
  final String? url;

  LessonVideo({
    this.lessonItem = const <LessonVideoItem>[],
    this.initializeVideoPlayer,
    this.isPlaying = false,
    this.url = "",
  });

  LessonVideo copyWith({
    List<LessonVideoItem>? lessonItem,
    Future<void>? initializeVideoPlayer,
    bool? isPlaying,
    String? url
  }) {
    return LessonVideo(
      lessonItem: lessonItem ?? this.lessonItem,
      initializeVideoPlayer:
          initializeVideoPlayer ?? this.initializeVideoPlayer,
      isPlaying: isPlaying ?? this.isPlaying,
      url: url ?? this.url,
    );
  }
}
