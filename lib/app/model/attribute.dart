import 'package:pazar_iraq/app/model/option.dart';

class DynamicAttribute {
  int? id;
  String? name;
  String? typeId;
  double? min;
  double? max;
  double? step;
  int? order;
  String? icon;
  String? packageId;
  List<Option>? options;

  DynamicAttribute({this.id, this.name, this.typeId, this.min, this.max, this.step, this.order,this.icon,this.options,this.packageId});

  DynamicAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    min = json['min']==null ? 0.0 :double.parse(json['min']);
    max = json['max']==null? 0.0 :double.parse(json["max"]);
    step = json['step'] ==null ? 0.0 :double.parse(json[step]);
    order = json['order'] ?? 0;
    icon = json['icon'] ?? "";
    packageId = json['package_id'] ?? "";
    if (json['options'] != null) {
      options = <Option>[];
      json['options'][0].forEach((v) { options!.add( Option.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type_id'] = this.typeId;
    data['min'] = this.min;
    data['max'] = this.max;
    data['step'] = this.step;
    data['order'] = this.order;
    data['icon'] = this.icon;
    data['package_id'] = this.packageId;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


