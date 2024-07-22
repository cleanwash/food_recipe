import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';
part 'procedure.g.dart';

@freezed
class Procedure with _$Procedure {

  factory Procedure({
    required int id, 
    required int stepNum, 
    required String description, 
  }) = _Procedure;

  factory Procedure.fromJson(Map<String, dynamic> json) => _$ProcedureFromJson(json);
}