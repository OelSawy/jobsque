class Datum {
    int id;
    int userId;
    int like;
    int jobId;
    String image;
    String name;
    String location;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.like,
        required this.jobId,
        required this.image,
        required this.name,
        required this.location,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        like: json["like"],
        jobId: json["job_id"],
        image: json["image"],
        name: json["name"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "like": like,
        "job_id": jobId,
        "image": image,
        "name": name,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}