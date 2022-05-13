import 'package:Rally/charts/rally_line_chart.dart';
import 'package:Rally/dummy_data/dummy_data.dart';
import 'package:Rally/dummy_data/financial_entity.dart';
import 'package:Rally/utils/colors.dart';
import 'package:Rally/utils/formatters.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final List<DetailedEventItem> items = DummyDatas.getDetailedEventItems();

  @override
  Widget build(BuildContext context) {
    final List<_DetailedEventCard> cards = items
        .map((e) => _DetailedEventCard(
              title: e.title,
              subtitle: Formatter.dateFormat.format(e.date),
              amount: e.amount,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Checking',
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: RallyLineChart(events: items),
          ),
          Flexible(
            child: ListView(shrinkWrap: true, children: cards),
          ),
        ],
      ),
    );
  }
}

class _DetailedEventCard extends StatelessWidget {
  const _DetailedEventCard({
    @required this.title,
    @required this.subtitle,
    @required this.amount,
  });

  final String title;
  final String subtitle;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: SizedBox(
        height: 68.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 67.0,
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16.0)),
                      Text(subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: RallyColors.gray60a))
                    ],
                  ),
                  Spacer(),
                  Text('\$ ' + Formatter.usd.format(amount),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 20.0, color: RallyColors.gray)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                height: 1.0,
                child: Container(
                  color: Color(0xAA282828),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
