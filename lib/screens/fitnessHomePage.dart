import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webingo_demo/model/calender_model.dart';

class FitnessHomePage extends StatefulWidget {

  const FitnessHomePage({super.key});

  @override
  State<FitnessHomePage> createState() => _FitnessHomePageState();
}

class _FitnessHomePageState extends State<FitnessHomePage> {

  int selectedDay = 25;

  final List<String> images = [
    'images/profile1.jpg',
    'images/profile2.png',
    'images/profile3.jpg',
  ];

  final iconList = [
    "images/instagram.jpg",
    "images/youtube.png",
    "images/twitter.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/sandra.jpg'),
                ),
                Column(
                  children: [
                    Text("Hello, Sandra", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Today 25 Nov.", style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 0.2)
                  ),
                  child: IconButton(
                    onPressed: (){

                    },
                    icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),

          // Daily Challenge
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFB2A1FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Daily\nchallenge", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Do your plan before 09:00 AM", style: TextStyle(fontSize: 12),),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 40,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: images.length * 25.0,
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Color(0xFFB2A1FF),
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Color(0xff5847a0),
                                          child: Text(
                                            '+4',
                                            style: TextStyle(color: Colors.white, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),

                                    for (int i = 0; i < images.length; i++)
                                      Positioned(
                                        left: i * 25.0,
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xFFB2A1FF),
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage(images[i]),
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: Image.asset('images/daily_challenge.png', height: 200),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Date Selector
          SizedBox(
            height: 80,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: calenderList.length,
              itemBuilder: (context, index) {
                final isSelected = calenderList[index].date == selectedDay;
                final day = calenderList[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: (){
                    setState(() {
                      selectedDay = day.date;
                    });
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : null,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(width: 0.5, color: Colors.black)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
                            child: Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected && day.hasEvent
                                    ? Colors.white
                                    : day.hasEvent ? Colors.black : null,
                              ),
                            ),
                          ),
                          Text(day.dayName,
                              style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text('${day.date}',
                              style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
            ),
          ),

          SizedBox(height: 25),

          // Your Plan
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Your plan",
              style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold,
                fontFamily: "Poppins"
              ),
            ),
          ),
          SizedBox(height: 15),

          // Yoga Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFBE58),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text("Medium"),
                        ),
                        SizedBox(height: 20),
                        Text("Yoga Group",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("25 Nov.\n14:00–15:00\nA5 room",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(height: 55),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('images/profile4.jpg'),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Trainer", style: TextStyle(fontSize: 14),),
                                Text("Tiffany Way"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // Balance Card
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xFFA9CCFE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                    child: Text("Light"),
                                  ),
                                  SizedBox(height: 20),
                                  Text("Balance",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins"
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("28 Nov.\n18:00–19:30\nA2 room",
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: Image.asset('images/balance.png', height: 110,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFFFB9EFD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: iconList.map((item) {
                            return Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFdc83db),
                              ),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(item),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 65,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navIcon(Icons.cottage_outlined, 0),
            navIcon(Icons.grid_view_outlined, 1),
            navIcon(Icons.poll_outlined, 2),
            navIcon(Icons.person_outlined, 3),
          ],
        ),
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    final isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: isSelected ? BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ) : null,
        child: Icon(icon, size: 24,
          color: isSelected ? Colors.black : Colors.white70,
        ),
      ),
    );
  }
}
