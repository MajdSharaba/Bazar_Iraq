class Option {
  String? id;
  String? attributeId;
  String? valueEn;
  String? valueAr;
  String? valueKr;

  Option(
      {this.id,
        this.attributeId,
        this.valueEn,
        this.valueAr,
        this.valueKr,
      });

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    valueEn = json['value_en'];
    valueAr = json['value_ar'];
    valueKr = json['value_kr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['value_en'] = this.valueEn;
    data['value_ar'] = this.valueAr;
    data['value_kr'] = this.valueKr;
    return data;
  }
}
