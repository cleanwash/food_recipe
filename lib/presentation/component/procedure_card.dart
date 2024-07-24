import 'package:flutter/material.dart';
import 'package:food_recipe/data/model/procedure.dart';
import 'package:food_recipe/data/data_source/procedure_data_source_impl.dart';

class ProcedureScreen extends StatefulWidget {
  @override
  _ProcedureScreenState createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
  final ProcedureDataSourceImpl _dataSource = ProcedureDataSourceImpl();
  List<Procedure> _procedures = [];

  @override
  void initState() {
    super.initState();
    _loadProcedures();
  }

  Future<void> _loadProcedures() async {
    final procedures = await _dataSource.getProcedures();
    setState(() {
      _procedures = procedures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _procedures.length,
        itemBuilder: (context, index) {
          return ProcedureCard(procedure: _procedures[index]);
        },
      ),
    );
  }
}

class ProcedureCard extends StatelessWidget {
  final Procedure procedure;

  const ProcedureCard({Key? key, required this.procedure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step ${procedure.stepNum}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              procedure.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
