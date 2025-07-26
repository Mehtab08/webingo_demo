import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SeatStatus { available, selected, reserved }

class ChooseSeatsPage extends StatefulWidget {
  const ChooseSeatsPage({super.key});

  @override
  State<ChooseSeatsPage> createState() => _ChooseSeatsPageState();
}

class _ChooseSeatsPageState extends State<ChooseSeatsPage> {

  double seatPrice = 17.75;
  final int rows = 8;
  final int cols = 4;

  // Colors for different seat type
  final Color selectedColor = Color(0xFFB29BFF);
  final Color reservedColor = Colors.black;
  final Color availableColor = Color(0xFFE5E1DA);

  // 2D List of seats per part
  late List<List<SeatStatus>> leftSeats;
  late List<List<SeatStatus>> rightSeats;

  @override
  void initState() {
    super.initState();

    // Initialize all seats as available
    leftSeats = List.generate(rows, (r) => List.generate(cols, (c) => SeatStatus.available));
    rightSeats = List.generate(rows, (r) => List.generate(cols, (c) => SeatStatus.available));

    // Mark seats as per status
    leftSeats[1][1] = SeatStatus.selected;
    leftSeats[6][1] = SeatStatus.reserved;
    rightSeats[1][1] = SeatStatus.reserved;
    rightSeats[1][3] = SeatStatus.reserved;
    rightSeats[4][1] = SeatStatus.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F2E9),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/sandra.jpg'),
                      ),
                      SizedBox(width: 10),
                      Text("Samantha", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Icon(FontAwesomeIcons.magnifyingGlass),
                ],
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: 30,),
                  ),
                  Text("Choose Seats", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            //Custom Seats
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  /// Left Block
                  Expanded(
                    child: Column(
                      children: List.generate(rows, (row) {
                        return Row(
                          children: List.generate(cols, (col) {
                            bool isMissing = (row == 0 && col == 0) || (row == 7 && col == 0);
                            if (isMissing) {
                              return Padding(
                                padding: EdgeInsets.all(2.0),
                                child: SizedBox(width: 40, height: 40),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (leftSeats[row][col] == SeatStatus.reserved) return;
                                  setState(() {
                                    leftSeats[row][col] =
                                    leftSeats[row][col] == SeatStatus.selected
                                        ? SeatStatus.available
                                        : SeatStatus.selected;
                                  });
                                },
                                child: seatCircle(leftSeats[row][col]),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(width: 32),

                  /// Right Block
                  Expanded(
                    child: Column(
                      children: List.generate(rows, (row) {
                        return Row(
                          children: List.generate(cols, (col) {
                            bool isMissing = (row == 0 && col == 3) || (row == 7 && col == 3);
                            if (isMissing) {
                              return Padding(
                                padding: EdgeInsets.all(2.0),
                                child: SizedBox(width: 40, height: 40),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (rightSeats[row][col] == SeatStatus.reserved) return;
                                  setState(() {
                                    rightSeats[row][col] =
                                    rightSeats[row][col] == SeatStatus.selected
                                        ? SeatStatus.available
                                        : SeatStatus.selected;
                                  });
                                },
                                child: seatCircle(rightSeats[row][col]),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  legendDot(selectedColor, "Selected"),
                  legendDot(reservedColor, "Reserved"),
                  legendDot(availableColor, "Available"),
                ],
              ),
            ),

            // Bottom Card
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 8),
                        Text("Cinema Max", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        seatInfo("08.04", "Date"),
                        seatInfo("21:55", "Hour", highlight: true),
                        seatInfo("2,3", "Seats"),
                        seatInfo("2,5", "Row"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Price", style: TextStyle(color: Colors.grey)),
                            Text("\$35,50", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            const snackBar = SnackBar(content: Text('Yay! Ticket Purchased!'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB29BFF),
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                          ),
                          child: Text("Buy", style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6),
        Text(label),
      ],
    );
  }

  Widget seatInfo(String title, String subtitle, {bool highlight = false}) {
    return InkWell(
      onTap: (){
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: highlight ? Colors.grey[800] : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white)),
            SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget seatCircle(SeatStatus status) {
    Color color;
    switch (status) {
      case SeatStatus.selected:
        color = selectedColor;
        break;
      case SeatStatus.reserved:
        color = reservedColor;
        break;
      default:
        color = availableColor;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        // border: Border.all(color: Colors.black12),
      ),
    );
  }
}
