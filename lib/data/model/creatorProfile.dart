// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'creatorProfile.freezed.dart';
// part 'creatorProfile.g.dart';

// @freezed
// class CreatorProfile with _$CreatorProfile {

//   factory CreatorProfile(
//     required String imageUrl,
//     required String name, 
//     required String place, 

//   ) = _CreatorProfile;

//   factory CreatorProfile.fromJson(Map<String, dynamic> json) => _$CreatorProfileFromJson(json);
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'creatorProfile.freezed.dart';
part 'creatorProfile.g.dart';

@freezed
class CreatorProfile with _$CreatorProfile {

  factory CreatorProfile({
    required String imageUrl, 
    required String name, 
    required String place, 
  }) = _CreatorProfile;

  factory CreatorProfile.fromJson(Map<String, dynamic> json) => _$CreatorProfileFromJson(json);
}