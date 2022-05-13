import 'package:Rally/charts/rally_pie_chart.dart';
import 'package:Rally/dummy_data/dummy_data.dart';
import 'package:Rally/dummy_data/financial_entity.dart';
import 'package:Rally/dummy_data/financial_entity_card.dart';
import 'package:Rally/dummy_data/financial_entity_view.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage>
    with SingleTickerProviderStateMixin {

  final List<AccountItem> items = DummyDatas.getAccountItems();
  
  @override
  Widget build(BuildContext context) {
    double balanceTotal = FinancialEntities.sumPrimaryAmounts(items);
    List<RallyPieChartSegment> segments = RallyPieChartSegments.fromAccountItems(items);
    return ListView(
      children: <Widget>[
        FinancialEntitiesView(
      heroLabel: 'Total',
      heroAmount: balanceTotal,
      segments: segments,
      wholeAmount: balanceTotal,
      financialEntityCards: FinancialEntityCards.fromAccountItems(items),
    ),
      ]
    );
  }
}
