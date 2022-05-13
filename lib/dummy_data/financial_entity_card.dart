import 'package:Rally/charts/vertical_fraction_bar.dart';
import 'package:Rally/dummy_data/financial_entity.dart';
import 'package:Rally/pages/subPages/details.dart';
import 'package:Rally/utils/colors.dart';
import 'package:Rally/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FinancialEntityCard extends StatelessWidget {
  FinancialEntityCard(
      {@required this.indicatorColor,
      @required this.indicatorFraction,
      @required this.title,
      @required this.subtitle,
      @required this.amount,
      @required this.suffix});

  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final double amount;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage()));
      },
      child: SizedBox(
        height: 68.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 67.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    child: VerticalFractionBar(
                        color: indicatorColor, fraction: indicatorFraction),
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
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
                  SizedBox(width: 32.0, child: suffix)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialEntityCardModel {
  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final double usdAmount;
  final Widget suffix;

  const FinancialEntityCardModel(
    this.indicatorColor,
    this.indicatorFraction,
    this.title,
    this.subtitle,
    this.usdAmount,
    this.suffix,
  );
}

class FinancialEntityCards {
  static FinancialEntityCard fromAccountItem(AccountItem model, int i) {
    return FinancialEntityCard(
      suffix: Icon(Icons.chevron_right, color: Colors.grey),
      title: model.name,
      subtitle: '• • • • • • ' + model.accountNumber.substring(6),
      indicatorColor: RallyColors.getAccountColor(i),
      indicatorFraction: 1.0,
      amount: model.primaryAmount,
    );
  }

  static FinancialEntityCard fromBillItem(BillItem model, int i) {
    return FinancialEntityCard(
      indicatorColor: RallyColors.getAccountColor(i),
      indicatorFraction: 1.0,
      title: model.name,
      subtitle: model.dueDate,
      amount: model.primaryAmount,
      suffix: Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  static FinancialEntityCard fromBudgetItem(
      BudgetItem item, int i, BuildContext context) {
    return FinancialEntityCard(
      suffix: Text(
        ' LEFT',
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: RallyColors.gray60a, fontSize: 10.0),
      ),
      title: item.name,
      subtitle: Formatter.usdWithSign.format(item.amountUsed) +
          ' / ' +
          Formatter.usdWithSign.format(item.primaryAmount),
      indicatorColor: RallyColors.getBudgetColor(i),
      indicatorFraction: item.amountUsed / item.primaryAmount,
      amount: item.primaryAmount - item.amountUsed,
    );
  }

  static List<FinancialEntityCard> fromAccountItems(List<AccountItem> items) {
    return List<FinancialEntityCard>.generate(
        items.length, (i) => FinancialEntityCards.fromAccountItem(items[i], i));
  }

  static List<FinancialEntityCard> fromBillItems(List<BillItem> items) {
    return List<FinancialEntityCard>.generate(
        items.length, (i) => FinancialEntityCards.fromBillItem(items[i], i));
  }

  static List<FinancialEntityCard> fromBudgetItems(
      List<BudgetItem> items, BuildContext context) {
    return List<FinancialEntityCard>.generate(items.length,
        (i) => FinancialEntityCards.fromBudgetItem(items[i], i, context));
  }
}
