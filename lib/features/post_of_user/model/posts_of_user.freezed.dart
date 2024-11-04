// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_of_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsOfUser _$PostsOfUserFromJson(Map<String, dynamic> json) {
  return _PostsOfUser.fromJson(json);
}

/// @nodoc
mixin _$PostsOfUser {
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;

  /// Serializes this PostsOfUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsOfUserCopyWith<PostsOfUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsOfUserCopyWith<$Res> {
  factory $PostsOfUserCopyWith(
          PostsOfUser value, $Res Function(PostsOfUser) then) =
      _$PostsOfUserCopyWithImpl<$Res, PostsOfUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body});
}

/// @nodoc
class _$PostsOfUserCopyWithImpl<$Res, $Val extends PostsOfUser>
    implements $PostsOfUserCopyWith<$Res> {
  _$PostsOfUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
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
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostsOfUserImplCopyWith<$Res>
    implements $PostsOfUserCopyWith<$Res> {
  factory _$$PostsOfUserImplCopyWith(
          _$PostsOfUserImpl value, $Res Function(_$PostsOfUserImpl) then) =
      __$$PostsOfUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'body') String? body});
}

/// @nodoc
class __$$PostsOfUserImplCopyWithImpl<$Res>
    extends _$PostsOfUserCopyWithImpl<$Res, _$PostsOfUserImpl>
    implements _$$PostsOfUserImplCopyWith<$Res> {
  __$$PostsOfUserImplCopyWithImpl(
      _$PostsOfUserImpl _value, $Res Function(_$PostsOfUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$PostsOfUserImpl(
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
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsOfUserImpl implements _PostsOfUser {
  const _$PostsOfUserImpl(
      {@JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'body') this.body});

  factory _$PostsOfUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsOfUserImplFromJson(json);

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
  @JsonKey(name: 'body')
  final String? body;

  @override
  String toString() {
    return 'PostsOfUser(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsOfUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, body);

  /// Create a copy of PostsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsOfUserImplCopyWith<_$PostsOfUserImpl> get copyWith =>
      __$$PostsOfUserImplCopyWithImpl<_$PostsOfUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsOfUserImplToJson(
      this,
    );
  }
}

abstract class _PostsOfUser implements PostsOfUser {
  const factory _PostsOfUser(
      {@JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'body') final String? body}) = _$PostsOfUserImpl;

  factory _PostsOfUser.fromJson(Map<String, dynamic> json) =
      _$PostsOfUserImpl.fromJson;

  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'body')
  String? get body;

  /// Create a copy of PostsOfUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsOfUserImplCopyWith<_$PostsOfUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
