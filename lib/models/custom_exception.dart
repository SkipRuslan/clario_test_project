import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_exception.freezed.dart';
part 'custom_exception.g.dart';

@freezed
class CustomException with _$CustomException {
  factory CustomException({
    required String message,
  }) = _CustomException;

  factory CustomException.fromJson(Map<String, dynamic> json) => _$CustomExceptionFromJson(json);
}
