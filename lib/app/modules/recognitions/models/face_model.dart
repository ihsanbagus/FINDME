class FaceModel {
  String? name;
  String? path;

  FaceModel({this.name, this.path});

  factory FaceModel.fromJson(Map<String, dynamic> json) => FaceModel(
        name: json["name"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "path": path,
      };

  @override
  String toString() {
    return 'FaceModel{name: $name, path: $path}';
  }
}
