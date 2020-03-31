import '../providers/journals.dart';
import '../widgets/journals_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JournalOverviewScreen extends StatefulWidget {
  @override
  _JournalOverviewScreenState createState() => _JournalOverviewScreenState();
}

class _JournalOverviewScreenState extends State<JournalOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Journals>(context).fetchAndSetJournals();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(child: JournalsList()),
    );
  }
}
