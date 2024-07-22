import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/model/procedure.dart';

abstract class ProcedureRepository {
  Future<Result<List<Procedure>>> getProcedures();
  Future<Result<Procedure?>> getProcedureById(int id);
  Future<Result<List<Procedure>>> getProceduresByStepNum(int stepNum);
}