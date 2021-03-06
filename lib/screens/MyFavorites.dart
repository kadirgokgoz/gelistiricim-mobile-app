import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:gelistiricimapp/widgets/bottom_navigation_bar.dart";
import "package:gelistiricimapp/data.dart";

import 'article_single_page.dart';
class MyFavorites extends StatelessWidget {
  const MyFavorites({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white70.withAlpha(230),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),
              title: Text("Beğendiklerim",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              backgroundColor: Colors.deepPurple[200],
              iconTheme: IconThemeData(color: Colors.deepPurple),
              actions: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(FontAwesomeIcons.bookmark))
              ],
              expandedHeight: (MediaQuery.of(context).size.height / 11.5),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/image_000.png", fit: BoxFit.cover),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(_dynamicListFunction,childCount: articles.length),
            ),
          ],
        ),

      ),
    );
  }



  Widget _dynamicListFunction(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleSinglePage()));
        },
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 10, 20, 10),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0,3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(100, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Text(
                          articles[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    articles[index].content,maxLines: 5,),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 15,
          bottom: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 110,
              image: AssetImage(
                articles[index].image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );



  }
}
