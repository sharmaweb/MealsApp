import '../Screens/favorites_screens.dart';
import '../models/meal.dart';
import '../Screens/categories_screen.dart';
import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  TabsScreen(this.favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages=[];
  
  int _selectedPageIndex=0;
  @override
  void initState() {  // Done so that we can access widget before entering the buid method itself
    _pages=[
    {
      'page':CategoriesScreen(),
      'title': 'Categories'
    },
    {
      'page':FavoritesScreen(widget.favoriteMeal),
      'title': 'Favorites',
    }
  ];
    super.initState();
  }
  void selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),


      drawer: MainDrawer(),



      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue[300],
        
        onTap:selectPage ,
        currentIndex: _selectedPageIndex,
        items: [
                BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
      
        ]),
      
    );
  }
}