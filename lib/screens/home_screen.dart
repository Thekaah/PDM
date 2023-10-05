import 'package:flutter/material.dart';
import 'package:contador/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    ExploreScreen(),
    OfferScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/sd.png', // Substitua pelo caminho correto da imagem
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.8),
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  'Super Flash Sale 50% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.category, color: Colors.blue, size: 40),
              Icon(Icons.category, color: Colors.blue, size: 40),
              Icon(Icons.category, color: Colors.blue, size: 40),
              Icon(Icons.category, color: Colors.blue, size: 40),
            ],
          ),

          SizedBox(height: 32),

          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Flash Sale',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildProduct('Product 1', 'assets/image Product.png', 4, 19.99),
          _buildProduct('Product 2', 'assets/image Product.png', 3, 29.99),

          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),

          _buildProduct('Product 3', 'assets/image Product.png', 5, 24.99),
          _buildProduct('Product 4', 'assets/image Product.png', 4, 34.99),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProduct(String title, String image, int stars, double price) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: List.generate(
                stars,
                    (index) => Icon(Icons.star, color: Colors.yellow, size: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                '\$$price',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Product',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Man Fashion',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              _buildFashionIconsRow([
                Icons.category,
                Icons.category,
                Icons.category,
                Icons.category,
              ]),
              SizedBox(height: 16.0),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Woman Fashion',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              _buildFashionIconsRow([
                Icons.category,
                Icons.category,
                Icons.category,
              ]),
              SizedBox(height: 16.0),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFashionIconsRow(List<IconData> icons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons.map((icon) {
        return Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          child: Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
        );
      }).toList(),
    );
  }
}

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 16),
        Container(
          color: Colors.blue,
          padding: EdgeInsets.all(16),
          child: Text(
            'Use "IFSP" Cupon for Get 90% off',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 16),
        Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/Promotion Image.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    'Super Flash Sale 50% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/Offer Banner 2.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    '#Birthday!!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/sd.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    'Super Sale 30% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            final user = userProvider.user;

            if (user != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/Alanzoka.png'),
                    radius: 50,
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    title: Text('Nome de Usuário'),
                    subtitle: Text('${user.username}'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    title: Text('Senha'),
                    subtitle: Text('*********'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: Text(
                      'Sair',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ],
              );
            } else {
              return Text('Nenhum usuário logado');
            }
          },
        ),
      ),
    );
  }
}
