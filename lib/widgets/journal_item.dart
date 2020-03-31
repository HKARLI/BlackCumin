import 'package:black_cumin/screens/article_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/journal.dart';

class JournalItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final journal = Provider.of<Journal>(context);
    final journalDate = journal.date.split(',');
    return InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ArticleOverviewScreen(journalId: journal.id,))),
          child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        child: Text(
                          journalDate[1],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          journalDate[2], style: TextStyle(color: Colors.white)
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(journalDate[0], style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 15.0,
            bottom: 15.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                width: 110.0,
                image: NetworkImage(
                  journal.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
