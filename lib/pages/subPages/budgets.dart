import 'package:Rally/charts/rally_pie_chart.dart';
import 'package:Rally/dummy_data/dummy_data.dart';
import 'package:Rally/dummy_data/financial_entity.dart';
import 'package:Rally/dummy_data/financial_entity_card.dart';
import 'package:Rally/dummy_data/financial_entity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BudgetsPage extends StatefulWidget {
  @override
  _BudgetsPageState createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage>
    with SingleTickerProviderStateMixin {
  final List<BudgetItem> items = DummyDatas.getBudgetsModel();

  @override
  Widget build(BuildContext context) {
    double capTotal = FinancialEntities.sumPrimaryAmounts(items);
    double usedTotal = BudgetItems.sumAmountsUsed(items);

    List<RallyPieChartSegment> segments =
        RallyPieChartSegments.fromBudgetItems(items);

    return ListView(
      children: <Widget>[
        FinancialEntitiesView(
      heroLabel: 'Left',
      heroAmount: capTotal - usedTotal,
      segments: segments,
      wholeAmount: capTotal,
      financialEntityCards:
          FinancialEntityCards.fromBudgetItems(items, context),
    ),
      ]
    );
  }
}
