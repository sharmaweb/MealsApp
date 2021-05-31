import 'package:flutter/material.dart';
import '../Screens/filtered_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget bulidListTile(String title, IconData icon,Function changePage) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: changePage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
          child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!!',
              style: TextStyle(
                fontSize: 26,
               fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          bulidListTile('Meal', 
          Icons.restaurant,
          (){
            Navigator.of(context).pushReplacementNamed('/'); //pushReplacementNamed is so that we replace instead of pushing.
          }),
          bulidListTile('Filters', 
          Icons.settings,
          (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);


          }),
        ],
      ),
    );
  }
}
