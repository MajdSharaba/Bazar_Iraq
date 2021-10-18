class Option {
  String? id;
  String? attributeId;
  String? value;


  Option(
      {this.id,
        this.attributeId,
        this.value
      });

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    value=json["value"] ?? json["value_en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['value'] = this.value;

    return data;
  }
}
