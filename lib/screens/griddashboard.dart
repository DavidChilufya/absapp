
import 'package:absapp/screens/create.dart';
import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {
  static const String id = 'grid_dashboard';
  GridDashboard();

  Items item1 = new Items(
      title: "New",
      total: "",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "Drafts",
    total: "200",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "Tests",
    total: "500",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "Pending",
    total: "20",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "Uploaded",
    total: "500",
    img: "assets/todo.png",
  );
  Items item6 = new Items(
    title: "All",
    total: "2000",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [this.item1, this.item2, this.item3, this.item4, this.item5, this.item6];
    var color = Theme.of(context).accentColor.withAlpha(30);
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 8, right: 8),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList.map((data) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(data.img,width: 42,),
                    SizedBox( height: 14, ),
                    Text(
                      data.title,
                      style: Theme.of(context).textTheme.headline5.copyWith(),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      data.total,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, NewInterview.id);
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String total;
  String img;
  Items({this.title, this.total, this.img});
}
