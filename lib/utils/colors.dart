import 'package:flutter/material.dart';

class RallyColors {
  static const List<Color> accountColors = <Color>[
    Color(0xFF005D57),
    Color(0xFF04B97F),
    Color(0xFF37EFBA),
    Color(0xFF007D51),
  ];

  static const List<Color> billColors = <Color>[
    Color(0xFFFFDC78),
    Color(0xFFFF6951),
    Color(0xFFFFD7D0),
    Color(0xFFFFAC12),
  ];

  static const List<Color> budgetColors = <Color>[
    Color(0xFFB2F2FF),
    Color(0xFFB15DFF),
    Color(0xFF72DEFF),
    Color(0xFF0082FB),
  ];

  static Color gray = Color(0xFFD8D8D8);
  static Color gray60a = Color(0x99D8D8D8);
  static Color gray25a = Color(0x40D8D8D8);
  static Color pageBg = Color(0xFF33333D);
  static Color inputBg = Color(0xFF26282F);

  static Color getCycledColor(List<Color> colors, int i) {
    return colors[i % colors.length];
  }

  /// Convenience method to get a single account color with position i.
  static Color getAccountColor(int i) {
    return getCycledColor(accountColors, i);
  }

  /// Convenience method to get a single bill color with position i.
  static Color getBillColor(int i) {
    return getCycledColor(billColors, i);
  }

  /// Convenience method to get a single budget color with position i.
  static Color getBudgetColor(int i) {
    return getCycledColor(budgetColors, i);
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
