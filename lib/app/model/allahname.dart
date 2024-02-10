class Allahname {
  int? id;
  String? arbi;
  String? bangla;
  String? meaning;
  String? faz;

 Allahname.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arbi = json['arbi'];
    bangla = json['bangla'];
    meaning = json['meaning'];
    faz = json['faz'];
  }


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['arbi'] = this.arbi;
  //   data['bangla'] = this.bangla;
  //   data['meaning'] = this.meaning;
  //   data['faz'] = this.faz;
  //   return data;
  // }
}