import 'package:pazar_iraq/app/model/option.dart';

class DynamicAttribute {
  int? id;
  String? nameEn;
  String? nameAr;
  String? nameKr;
  String? typeId;
  int? min;
  int? max;
  int? step;
  int? order;
  String? icon;
  String? packageId;
  List<Option>? options;

  DynamicAttribute({this.id, this.nameEn, this.nameAr, this.nameKr, this.typeId, this.min, this.max, this.step, this.order,this.icon,this.options,this.packageId});

  DynamicAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    nameKr = json['name_kr'];
    typeId = json['type_id'];
    min = json['min'] ?? 0;
    max = json['max'] ?? 0;
    step = json['step'] ?? 0;
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
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['name_kr'] = this.nameKr;
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


