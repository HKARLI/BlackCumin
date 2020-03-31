import 'package:black_cumin/widgets/journal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/journals.dart';

class JournalsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final journalssData = Provider.of<Journals>(context);
    return RefreshIndicator(
      onRefresh: () => journalssData.fetchAndSetJournals(),
      child: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: journalssData.journals.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: journalssData.journals[i],
          child: JournalItem(),
        ),
      ),
    );
  }
}
