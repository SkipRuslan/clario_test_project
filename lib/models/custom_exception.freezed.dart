// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomException _$CustomExceptionFromJson(Map<String, dynamic> json) {
  return _CustomException.fromJson(json);
}

/// @nodoc
mixin _$CustomException {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this CustomException to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomExceptionCopyWith<CustomException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomExceptionCopyWith<$Res> {
  factory $CustomExceptionCopyWith(
          CustomException value, $Res Function(CustomException) then) =
      _$CustomExceptionCopyWithImpl<$Res, CustomException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CustomExceptionCopyWithImpl<$Res, $Val extends CustomException>
    implements $CustomExceptionCopyWith<$Res> {
  _$CustomExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomExceptionImplCopyWith<$Res>
    implements $CustomExceptionCopyWith<$Res> {
  factory _$$CustomExceptionImplCopyWith(_$CustomExceptionImpl value,
          $Res Function(_$CustomExceptionImpl) then) =
      __$$CustomExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CustomExceptionImplCopyWithImpl<$Res>
    extends _$CustomExceptionCopyWithImpl<$Res, _$CustomExceptionImpl>
    implements _$$CustomExceptionImplCopyWith<$Res> {
  __$$CustomExceptionImplCopyWithImpl(
      _$CustomExceptionImpl _value, $Res Function(_$CustomExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CustomExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomExceptionImpl implements _CustomException {
  _$CustomExceptionImpl({required this.message});

  factory _$CustomExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomExceptionImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'CustomException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CustomException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomExceptionImplCopyWith<_$CustomExceptionImpl> get copyWith =>
      __$$CustomExceptionImplCopyWithImpl<_$CustomExceptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomExceptionImplToJson(
      this,
    );
  }
}

abstract class _CustomException implements CustomException {
  factory _CustomException({required final String message}) =
      _$CustomExceptionImpl;

  factory _CustomException.fromJson(Map<String, dynamic> json) =
      _$CustomExceptionImpl.fromJson;

  @override
  String get message;

  /// Create a copy of CustomException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomExceptionImplCopyWith<_$CustomExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
