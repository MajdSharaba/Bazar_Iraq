class JsonList {
  var attributeId;
  var attributeValue;

  JsonList({required this.attributeId, required this.attributeValue});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_id'] = this.attributeId;
    data['attribute_value'] = this.attributeValue;
    return data;
  }
}