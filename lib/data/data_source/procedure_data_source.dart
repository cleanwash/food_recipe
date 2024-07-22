import 'package:food_recipe/data/model/procedure.dart';

abstract class ProcedureDataSource {
  Future<List<Procedure>> getProcedures();
  Future<Procedure?> getProcedureById(int id);
  Future<List<Procedure>> getProceduresByStepNum(int stepNum);
}