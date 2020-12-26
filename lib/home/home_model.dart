import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedHome {
  final List<HomeModel> results;

  AutogeneratedHome({this.results});

  factory AutogeneratedHome.fromJson(Map<String, dynamic> json) {
    List<HomeModel> temp;
    if (json['results'] != null) {
      temp = <HomeModel>[];
      json['results'].forEach((v) {
        temp.add(HomeModel.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedHome(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeModel extends Equatable {
  final int id;
  final String name;

  HomeModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(json['id'] as int, json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
  
}
