import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedProfile {
  final List<ProfileModel> results;

  AutogeneratedProfile({this.results});

  factory AutogeneratedProfile.fromJson(Map<String, dynamic> json) {
    List<ProfileModel> temp;
    if (json['results'] != null) {
      temp = <ProfileModel>[];
      json['results'].forEach((v) {
        temp.add(ProfileModel.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedProfile(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileModel extends Equatable {
  final int id;
  final String name;

  ProfileModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(json['id'] as int, json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
  
}
