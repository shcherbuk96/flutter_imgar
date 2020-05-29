import 'package:imgar/models/companies_model.dart';
import 'package:imgar/models/names_model.dart';
import 'package:imgar/models/titles_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResponseData {
  List<Titles> titles;
  List<Names> names;
  List<Companies> companies;

  ResponseData({this.titles, this.names, this.companies});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['titles'] != null) {
      titles = new List<Titles>();
      json['titles'].forEach((v) {
        titles.add(new Titles.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.titles != null) {
      data['titles'] = this.titles.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
