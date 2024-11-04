// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos_of_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotosOfUser _$PhotosOfUserFromJson(Map<String, dynamic> json) {
  return _PhotosOfUser.fromJson(json);
}

/// @nodoc
mixin _$PhotosOfUser {
  @JsonKey(name: 'albumId')
  int? get albumId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnailUrl')
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Serializes this PhotosOfUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotosOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotosOfUserCopyWith<PhotosOfUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosOfUserCopyWith<$Res> {
  factory $PhotosOfUserCopyWith(
          PhotosOfUser value, $Res Function(PhotosOfUser) then) =
      _$PhotosOfUserCopyWithImpl<$Res, PhotosOfUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'albumId') int? albumId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'thumbnailUrl') String? thumbnailUrl});
}

/// @nodoc
class _$PhotosOfUserCopyWithImpl<$Res, $Val extends PhotosOfUser>
    implements $PhotosOfUserCopyWith<$Res> {
  _$PhotosOfUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotosOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_value.copyWith(
      albumId: freezed == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosOfUserImplCopyWith<$Res>
    implements $PhotosOfUserCopyWith<$Res> {
  factory _$$PhotosOfUserImplCopyWith(
          _$PhotosOfUserImpl value, $Res Function(_$PhotosOfUserImpl) then) =
      __$$PhotosOfUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'albumId') int? albumId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'thumbnailUrl') String? thumbnailUrl});
}

/// @nodoc
class __$$PhotosOfUserImplCopyWithImpl<$Res>
    extends _$PhotosOfUserCopyWithImpl<$Res, _$PhotosOfUserImpl>
    implements _$$PhotosOfUserImplCopyWith<$Res> {
  __$$PhotosOfUserImplCopyWithImpl(
      _$PhotosOfUserImpl _value, $Res Function(_$PhotosOfUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotosOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_$PhotosOfUserImpl(
      albumId: freezed == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosOfUserImpl implements _PhotosOfUser {
  const _$PhotosOfUserImpl(
      {@JsonKey(name: 'albumId') this.albumId,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'thumbnailUrl') this.thumbnailUrl});

  factory _$PhotosOfUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosOfUserImplFromJson(json);

  @override
  @JsonKey(name: 'albumId')
  final int? albumId;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'thumbnailUrl')
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'PhotosOfUser(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosOfUserImpl &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, albumId, id, title, url, thumbnailUrl);

  /// Create a copy of PhotosOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosOfUserImplCopyWith<_$PhotosOfUserImpl> get copyWith =>
      __$$PhotosOfUserImplCopyWithImpl<_$PhotosOfUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosOfUserImplToJson(
      this,
    );
  }
}

abstract class _PhotosOfUser implements PhotosOfUser {
  const factory _PhotosOfUser(
          {@JsonKey(name: 'albumId') final int? albumId,
          @JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'url') final String? url,
          @JsonKey(name: 'thumbnailUrl') final String? thumbnailUrl}) =
      _$PhotosOfUserImpl;

  factory _PhotosOfUser.fromJson(Map<String, dynamic> json) =
      _$PhotosOfUserImpl.fromJson;

  @override
  @JsonKey(name: 'albumId')
  int? get albumId;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'thumbnailUrl')
  String? get thumbnailUrl;

  /// Create a copy of PhotosOfUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotosOfUserImplCopyWith<_$PhotosOfUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
