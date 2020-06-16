import 'package:intl/intl.dart';

class Formatter {
  static final NumberFormat usd = NumberFormat.currency(name: '');
  static final NumberFormat usdWithSign = NumberFormat.currency(name: '\$') ;
  static final DateFormat dateFormat = DateFormat('MM-dd-yy');
}