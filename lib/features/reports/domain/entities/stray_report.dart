/// Clean Architecture Rule #1:
/// The Domain Entity is 100% PURE Dart.
/// - NO Flutter UI imports.
/// - NO `fromJson` / `toJson` (The business logic doesn't care if data comes from JSON, XML, or Firebase).
/// - Immutable properties (`final`).
class StrayReport {
  final String id;
  final String animalType; // e.g. 'Dog', 'Cat', 'Bird'
  final String condition; // e.g. 'Injured', 'Sick', 'Lost', 'Stray'
  final String status; // e.g. 'Open', 'In Progress', 'Rescued'
  final String description;
  final String locationAddress; // e.g. 'Al Barsha, Dubai'
  final double distanceKm; // e.g. 3.5 km
  final String imageUrl;
  final DateTime reportedAt;
  final int likesCount;
  final int commentsCount;
  final bool isLikedByMe;

  const StrayReport({
    required this.id,
    required this.animalType,
    required this.condition,
    required this.status,
    required this.description,
    required this.locationAddress,
    required this.distanceKm,
    required this.imageUrl,
    required this.reportedAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isLikedByMe = false,
  });

  /// Helper copyWith for immutable state updates (e.g. toggling like)
  StrayReport copyWith({
    String? id,
    String? animalType,
    String? condition,
    String? status,
    String? description,
    String? locationAddress,
    double? distanceKm,
    String? imageUrl,
    DateTime? reportedAt,
    int? likesCount,
    int? commentsCount,
    bool? isLikedByMe,
  }) {
    return StrayReport(
      id: id ?? this.id,
      animalType: animalType ?? this.animalType,
      condition: condition ?? this.condition,
      status: status ?? this.status,
      description: description ?? this.description,
      locationAddress: locationAddress ?? this.locationAddress,
      distanceKm: distanceKm ?? this.distanceKm,
      imageUrl: imageUrl ?? this.imageUrl,
      reportedAt: reportedAt ?? this.reportedAt,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
    );
  }
}
