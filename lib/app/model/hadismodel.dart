class HadisModel {
  final int id;
  final String name;
  final String description;
  final String references;
  final String grade;

  // Constructor
  HadisModel({
    required this.id,
    required this.name,
    required this.description,
    required this.references,
    required this.grade,
  });

  // Factory method to create an instance from JSON
  factory HadisModel.fromJson(Map<String, dynamic> json) {
    return HadisModel(
      id: json['id'] ?? 0, // Fallback to 0 if id is null
      name: json['name'] ?? 'Unknown', // Fallback to 'Unknown' if name is null
      description: json['description'] ?? 'No description', // Handle null
      references: json['references'] ?? 'No references', // Handle null
      grade: json['grade'] ?? 'Not graded', // Handle null
    );
  }
}

