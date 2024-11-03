import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              const SidePanel(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 350,
                              height: 350,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('images/valeria.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Container(
                              width: 350,
                              height: 100,
                              alignment: Alignment.center,
                              color: Colors.black,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Валерия, 20',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Учусь на ФПМИ БГУ, изучаю ТП и очень\nлюблю аббревиатуры!!!',
                                      style: TextStyle(
                                        height: 1.2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ActionButtons(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.48,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final double height;
  final double width;
  const ActionButtons({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          const Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 35,
              child: Icon(
                size: 40,
                Icons.undo_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: width - 70,
            child: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.black,
              child: Icon(
                size: 40,
                Icons.star_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.25,
            left: width * 0.14,
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: Icon(
                size: 70,
                Icons.close_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.25,
            right: width * 0.14,
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: Icon(
                size: 70,
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SidePanel extends StatelessWidget {
  const SidePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.8),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  maxRadius: 25,
                  child: Icon(
                    Icons.pets,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Мой профиль',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(112, 21, 202, 1),
                    Color.fromRGBO(207, 98, 234, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFBF8733),
                            Color(0xFFBF8733),
                            Color(0xFFC2C17A),
                            Color(0xFFBF8733),
                            Color(0xFFB48148),
                            Color(0xFFD9B767),
                          ],
                          stops: [0, 0.09, 0.37, 0.64, 0.79, 1],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.casino,
                          size: 55,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Находи новые мэтчи',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Начни свайпать, чтобы\nпознакомиться!',
                          style: TextStyle(
                            height: 1.1,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Сообщения',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (_, __) => Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
