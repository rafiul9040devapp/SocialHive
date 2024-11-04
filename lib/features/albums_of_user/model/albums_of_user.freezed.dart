// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'albums_of_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumsOfUser _$AlbumsOfUserFromJson(Map<String, dynamic> json) {
  return _AlbumsOfUser.fromJson(json);
}

/// @nodoc
mixin _$AlbumsOfUser {
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this AlbumsOfUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumsOfUserCopyWith<AlbumsOfUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumsOfUserCopyWith<$Res> {
  factory $AlbumsOfUserCopyWith(
          AlbumsOfUser value, $Res Function(AlbumsOfUser) then) =
      _$AlbumsOfUserCopyWithImpl<$Res, AlbumsOfUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class _$AlbumsOfUserCopyWithImpl<$Res, $Val extends AlbumsOfUser>
    implements $AlbumsOfUserCopyWith<$Res> {
  _$AlbumsOfUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumsOfUserImplCopyWith<$Res>
    implements $AlbumsOfUserCopyWith<$Res> {
  factory _$$AlbumsOfUserImplCopyWith(
          _$AlbumsOfUserImpl value, $Res Function(_$AlbumsOfUserImpl) then) =
      __$$AlbumsOfUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title});
}

/// @nodoc
class __$$AlbumsOfUserImplCopyWithImpl<$Res>
    extends _$AlbumsOfUserCopyWithImpl<$Res, _$AlbumsOfUserImpl>
    implements _$$AlbumsOfUserImplCopyWith<$Res> {
  __$$AlbumsOfUserImplCopyWithImpl(
      _$AlbumsOfUserImpl _value, $Res Function(_$AlbumsOfUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlbumsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$AlbumsOfUserImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumsOfUserImpl implements _AlbumsOfUser {
  const _$AlbumsOfUserImpl(
      {@JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title});

  factory _$AlbumsOfUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumsOfUserImplFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;

  @override
  String toString() {
    return 'AlbumsOfUser(userId: $userId, id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumsOfUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title);

  /// Create a copy of AlbumsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumsOfUserImplCopyWith<_$AlbumsOfUserImpl> get copyWith =>
      __$$AlbumsOfUserImplCopyWithImpl<_$AlbumsOfUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumsOfUserImplToJson(
      this,
    );
  }
}

abstract class _AlbumsOfUser implements AlbumsOfUser {
  const factory _AlbumsOfUser(
      {@JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title}) = _$AlbumsOfUserImpl;

  factory _AlbumsOfUser.fromJson(Map<String, dynamic> json) =
      _$AlbumsOfUserImpl.fromJson;

  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;

  /// Create a copy of AlbumsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumsOfUserImplCopyWith<_$AlbumsOfUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
