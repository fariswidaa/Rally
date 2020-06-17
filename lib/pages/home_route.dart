import 'package:Rally/pages/subPages/overView.dart';
import 'package:Rally/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  _HomeState() {
    _tabController = TabController(length: 5, vsync: this);
  }

  void initState() {
    super.initState();

    _tabController.addListener(() {
      if (_tabController.indexIsChanging &&
          _tabController.previousIndex != _tabController.index) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: TabBar(
                tabs: _buildTabs(),
                isScrollable: true,
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(style: BorderStyle.none)),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: _buildTabView(),
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabView() {
    return <Widget>[
      OverviewPage(),
      AccountsPage(),
      BillsPage(),
      BudgetsPage(),
      SettingsPage(),
    ];
  }

  List<Widget> _buildTabs() {
    return <Widget>[
      _buildTab(Icons.pie_chart, "OVERVIEW", 0),
      _buildTab(Icons.attach_money, "ACCOUNTS", 1),
      _buildTab(Icons.money_off, "BILLS", 2),
      _buildTab(Icons.table_chart, "BUDGETS", 3),
      _buildTab(Icons.settings, "SETTINGS", 4),
    ];
  }

  Widget _buildTab(IconData iconData, String title, int index) {
    return _RallyTab(Icon(iconData), title, _tabController.index == index);
  }
}

class _RallyTab extends StatefulWidget {
  Text titleText;
  Icon icon;
  bool isExpanded;

  _RallyTab(
    Icon icon,
    String title,
    bool isExpanded,
  ) {
    titleText = Text(title);
    this.icon = icon;
    this.isExpanded = isExpanded;
  }
  @override
  __RallyTabState createState() => __RallyTabState();
}

class __RallyTabState extends State<_RallyTab>
    with SingleTickerProviderStateMixin {
  Animation<double> _titleSizeAnimation;
  Animation<double> _titleFadeAnimation;
  Animation<double> _iconFadeAnimation;
  AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: Constants.defaultAnimationMillis,
        ));
    _titleSizeAnimation = CurvedAnimation(
        parent: Tween(begin: 0.0, end: 1.0).animate(_controller),
        curve: Curves.linear);

    _titleFadeAnimation = CurvedAnimation(
        parent: Tween(begin: 0.0, end: 1.0).animate(_controller),
        curve: Curves.easeOut);

    _iconFadeAnimation = CurvedAnimation(
        parent: Tween(begin: 0.6, end: 1.0).animate(_controller),
        curve: Curves.linear);

    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_RallyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 56.0,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width / 7,
            child: widget.icon,
          ),
          FadeTransition(
            child: SizeTransition(
              child: SizedBox(
                width: width / 4,
                child: Center(child: widget.titleText),
              ),
              axis: Axis.horizontal,
              axisAlignment: -1.0,
              sizeFactor: _titleSizeAnimation,
            ),
            opacity: _titleFadeAnimation,
          ),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
