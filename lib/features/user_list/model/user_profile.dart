import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') Address? address,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'website') String? website,
    @JsonKey(name: 'company') Company? company,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'street') String? street,
    @JsonKey(name: 'suite') String? suite,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'zipcode') String? zipcode,
    @JsonKey(name: 'geo') Geo? geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
  const factory Geo({
    @JsonKey(name: 'lat') String? lat,
    @JsonKey(name: 'lng') String? lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'catchPhrase') String? catchPhrase,
    @JsonKey(name: 'bs') String? bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
