import 'package:food_recipe/core/result.dart';
import 'package:food_recipe/data/data_source/procedure_data_source.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _dataSource;

  ProcedureRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      final procedures = await _dataSource.getProcedures();
      return Result.success(procedures);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<Procedure?>> getProcedureById(int id) async {
    try {
      final procedure = await _dataSource.getProcedureById(id);
      return Result.success(procedure);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<Procedure>>> getProceduresByStepNum(int stepNum) async {
    try {
      final procedures = await _dataSource.getProceduresByStepNum(stepNum);
      return Result.success(procedures);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}