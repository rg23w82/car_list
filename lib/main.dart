import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

abstract class Page extends StatelessWidget {
  Widget buildPage(BuildContext context);
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = false;

  void login(BuildContext context) {
    setState(() {
      isLoggedIn = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhotoPage()),
    );
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Center(
          child: isLoggedIn
              ? Container()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Пароль',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text(
                  'Войти',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final PhotoGallery photoGallery = PhotoGallery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: ListView.builder(
          itemCount: photoGallery.photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailsPage(photoGallery.photos[index]),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 1),
                        child: Image.asset(
                          photoGallery.photos[index].imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photoGallery.photos[index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PhotoGallery {
  List<PhotoItem> photos = [
    PhotoItem(
        imageUrl: 'assets/rio-7.jpg',
        price: '\$12000000',
        description: 'Стильное фото автомобиля Kia Rio',
        name: 'Kia Rio'
    ),
    PhotoItem(
        imageUrl: 'assets/solaris.jpg',
        price: '\$15000000',
        description: 'Яркое фото автомобиля Hyundai Solaris',
        name: 'Hyundai Solaris'
    ),
    PhotoItem(
        imageUrl: 'assets/01_note.jpg',
        price: '\$140',
        description: 'Элегантное фото автомобиля Nissan Note',
        name: 'Nissan Note'
    ),
    PhotoItem(
        imageUrl: 'assets/Hyundai-i30-Sport-Nav-441.jpg',
        price: '\$160',
        description: 'Спортивное фото Hyundai i30 Sport Nav',
        name: 'Hyundai i30'
    ),
    PhotoItem(
        imageUrl: 'assets/bmw.jpg',
        price: '\$180',
        description: 'Люксовое фото автомобиля BMW',
        name: 'BMW'
    ),
    PhotoItem(
        imageUrl:
        'assets/matiz.jpg',
        price: '\$200',
        description: 'Элегантный спортивный автомобиль',
        name: 'Daewoo Matiz'),
    PhotoItem(
        imageUrl:
        'assets/lacetti.jpg',
        price: '\$180',
        description: 'Популярный автомобиль с хорошими отзывами',
        name: 'Chevrolet Lacetti'),
    PhotoItem(
        imageUrl:
        'assets/modelX.jpg',
        price: '\$220',
        description: 'Стильный и оригинальный автомобиль',
        name: 'Tesla model x'),
    PhotoItem(
        imageUrl:
        'assets/modely.jpeg',
        price: '\$190',
        description: 'Уникальный автомобиль с обивкой',
        name: 'Tesla model y'),
    PhotoItem(
        imageUrl: 'assets/polo.jpg',
        price: '\$210',
        description: 'Современный автомобиль с технологиями',
        name: 'Volkswagen Polo'),
    PhotoItem(
        imageUrl: 'assets/K5.jpg',
        price: '\$230',
        description: 'Инновационный автомобиль будущего',
        name: 'Kia K5'),
    PhotoItem(
        imageUrl:
        'assets/elantra.jpg',
        price: '\$195',
        description: 'Компактный автомобиль для города',
        name: 'Hyundai Elantra'),
    PhotoItem(
        imageUrl:
        'assets/carnival.jpg',
        price: '\$240',
        description: 'Комфортный автомобиль высокого класса',
        name: 'Kia Carnival'),
    PhotoItem(
        imageUrl: 'assets/rapid.jpg',
        price: '\$205',
        description: 'Мощный спортивный автомобиль',
        name: 'Skoda Rapid'),
    PhotoItem(
        imageUrl: 'assets/yaz.jpg',
        price: '\$205',
        description: 'Комфортный автомобиль высокого класса',
        name: 'УАЗ-452')
  ];
  int currentIndex = 0;

  void showNextPhoto() {
    if (currentIndex < photos.length - 1) {
      currentIndex++;
    }
  }

  void showPreviousPhoto() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }
}

class PhotoItem {
  final String imageUrl;
  final String price;
  final String description;
  final String name;

  PhotoItem(
      {required this.imageUrl,
        required this.price,
        required this.description,
        required this.name});
}

class PhotoDetailsPage extends StatelessWidget {
  final PhotoItem photoItem;

  PhotoDetailsPage(this.photoItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали фото'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(photoItem.imageUrl),
            SizedBox(height: 20),
            Text('Цена: ${photoItem.price}'),
            Text('Описание: ${photoItem.description}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Обратно'),
            ),
          ],
        ),
      ),
    );
  }
}
