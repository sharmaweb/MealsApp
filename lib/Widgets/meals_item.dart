
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../Screens/category_detail_screen.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
 
  MealsItem(
    
      {@required this.id,
        @required this.title,
      @required this.affordability,
      @required this.duration,
      @required this.imageUrl,
      @required this.complexity,
      });
  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simeple';
        break;
      
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
         return 'Hard';
         break;
      default:
        return 'Unknown';
        break;
      
    }
  }
  String get affordText{
      switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
         return 'Luxurious';
         break;
      default:
        return 'Unknown';
        break;
    }
  }
    
  void selecteditem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryDetailScreen.routeName,
    arguments:id ).then((result) {
      if(result!=null){
        // removeItem(result);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selecteditem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children:[
                 Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    width: 300,
                    color: Colors.black54,
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.red[200],
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            
              Row(children:[
                Icon(Icons.schedule),
                SizedBox(width:  6,),
                Text('$duration min'),
              ]),
               Row(children:[
                Icon(Icons.work),
                SizedBox(width:  6,),
                Text(complexityText),
              ]),
               Row(children:[
                Icon(Icons.attach_money),
                SizedBox(width:  6,),
                Text(affordText),
              ])
            ],),
          )
          ],
        ),
      
        
      ),
    );
  }
}
