// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_of_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsOfPost _$CommentsOfPostFromJson(Map<String, dynamic> json) {
  return _CommentsOfPost.fromJson(json);
}

/// @nodoc
mixin _$CommentsOfPost {
  @JsonKey(name: 'postId')
  int? get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;

  /// Serializes this CommentsOfPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsOfPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsOfPostCopyWith<CommentsOfPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsOfPostCopyWith<$Res> {
  factory $CommentsOfPostCopyWith(
          CommentsOfPost value, $Res Function(CommentsOfPost) then) =
      _$CommentsOfPostCopyWithImpl<$Res, CommentsOfPost>;
  @useResult
  $Res call(
      {@JsonKey(name: 'postId') int? postId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'body') String? body});
}

/// @nodoc
class _$CommentsOfPostCopyWithImpl<$Res, $Val extends CommentsOfPost>
    implements $CommentsOfPostCopyWith<$Res> {
  _$CommentsOfPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsOfPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsOfPostImplCopyWith<$Res>
    implements $CommentsOfPostCopyWith<$Res> {
  factory _$$CommentsOfPostImplCopyWith(_$CommentsOfPostImpl value,
          $Res Function(_$CommentsOfPostImpl) then) =
      __$$CommentsOfPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'postId') int? postId,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'body') String? body});
}

/// @nodoc
class __$$CommentsOfPostImplCopyWithImpl<$Res>
    extends _$CommentsOfPostCopyWithImpl<$Res, _$CommentsOfPostImpl>
    implements _$$CommentsOfPostImplCopyWith<$Res> {
  __$$CommentsOfPostImplCopyWithImpl(
      _$CommentsOfPostImpl _value, $Res Function(_$CommentsOfPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsOfPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? body = freezed,
  }) {
    return _then(_$CommentsOfPostImpl(
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$CommentsOfPostImpl implements _CommentsOfPost {
  _$CommentsOfPostImpl(
      {@JsonKey(name: 'postId') this.postId,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'body') this.body});

  factory _$CommentsOfPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsOfPostImplFromJson(json);

  @override
  @JsonKey(name: 'postId')
  final int? postId;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'body')
  final String? body;

  @override
  String toString() {
    return 'CommentsOfPost(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsOfPostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId, id, name, email, body);

  /// Create a copy of CommentsOfPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsOfPostImplCopyWith<_$CommentsOfPostImpl> get copyWith =>
      __$$CommentsOfPostImplCopyWithImpl<_$CommentsOfPostImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsOfPostImplToJson(
      this,
    );
  }
}

abstract class _CommentsOfPost implements CommentsOfPost {
  factory _CommentsOfPost(
      {@JsonKey(name: 'postId') final int? postId,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'body') final String? body}) = _$CommentsOfPostImpl;

  factory _CommentsOfPost.fromJson(Map<String, dynamic> json) =
      _$CommentsOfPostImpl.fromJson;

  @override
  @JsonKey(name: 'postId')
  int? get postId;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'body')
  String? get body;

  /// Create a copy of CommentsOfPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsOfPostImplCopyWith<_$CommentsOfPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
