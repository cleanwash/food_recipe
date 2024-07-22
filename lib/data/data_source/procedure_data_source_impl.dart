// procedure_data_source_impl.dart
import 'package:food_recipe/data/data_source/procedure_data_source.dart';
import 'package:food_recipe/data/model/procedure.dart';

class ProcedureDataSourceImpl implements ProcedureDataSource {
  final Map<String, dynamic> proceduresData = {
    "procedures": [
      {
        "id": 1,
        "stepNum": 1,
        "description": "Preheat the oven to 350°F (175°C)."
      },
      {
        "id": 2,
        "stepNum": 2,
        "description": "Mix all dry ingredients in a large bowl."
      },
      {
        "id": 3,
        "stepNum": 3,
        "description": "Add wet ingredients and stir until well combined."
      },
      {
        "id": 4,
        "stepNum": 4,
        "description": "Pour the batter into a greased baking pan."
      }
    ]
  };

  late final List<Procedure> _procedures;

  ProcedureDataSourceImpl() {
    _procedures = _initProcedures();
  }

  List<Procedure> _initProcedures() {
    return (proceduresData['procedures'] as List)
        .map((json) => Procedure.fromJson(json))
        .toList();
  }

  @override
  Future<List<Procedure>> getProcedures() async {
    return _procedures;
  }

  @override
  Future<Procedure?> getProcedureById(int id) async {
    try {
      return _procedures.firstWhere((procedure) => procedure.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Procedure>> getProceduresByStepNum(int stepNum) async {
    return _procedures
        .where((procedure) => procedure.stepNum == stepNum)
        .toList();
  }
}