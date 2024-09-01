class LocationModel {
  int? id;
  String? placeName;
  double? lat;
  double? lng;
  int? divisionId;
  String? placeNameEng;
  int? isUpazila;

  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['place_name'];
    lat = json['lat'];
    lng = json['lng'];
    divisionId = json['division_id'];
    placeNameEng = json['place_name_eng'];
    isUpazila = json['is_upazila'];
  }
}
