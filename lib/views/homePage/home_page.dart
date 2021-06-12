import 'package:flutter/material.dart';
import 'package:suche_app/model/user.dart';
import 'package:suche_app/services/storage.dart';
import 'package:suche_app/util/constants.dart';
import 'package:suche_app/views/components/bottom_navigation_component.dart';
import 'package:suche_app/views/profilePage/profile_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({required this.user, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SucheApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              // Logout
              final SecureStorage secureStorage = SecureStorage();
              await secureStorage.deleteSecureData('user');

              Navigator.pushNamedAndRemoveUntil(
                context,
                loginRoute,
                (route) => false,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationComponent.bottomNavigation(
        _currentIndex,
        (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey, child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(registerEventRoute),
                    child: Text('Cadastrar Evento', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),),
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            ProfilePage(user: widget.user,),
            // Container(color: Colors.blue,),
          ],
        ),
      ),
    );
  }
}
