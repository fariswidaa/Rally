import 'package:Rally/charts/rally_pie_chart.dart';
import 'package:Rally/dummy_data/dummy_data.dart';
import 'package:Rally/dummy_data/financial_entity.dart';
import 'package:Rally/dummy_data/financial_entity_card.dart';
import 'package:Rally/dummy_data/financial_entity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BillsPage extends StatefulWidget {
  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage>
    with SingleTickerProviderStateMixin {
      
  final List<BillItem> items = DummyDatas.getBillItems();

  @override
  Widget build(BuildContext context) {
    
    double dueTotal = FinancialEntities.sumPrimaryAmounts(items);

    List<RallyPieChartSegment> segments =
        RallyPieChartSegments.fromBillItems(items);

    return ListView(
      children: <Widget>[
        FinancialEntitiesView(
      heroLabel: 'Due',
      heroAmount: dueTotal,
      segments: segments,
      wholeAmount: dueTotal,
      financialEntityCards: FinancialEntityCards.fromBillItems(items),
    ),
      ]
    );
  }
}
