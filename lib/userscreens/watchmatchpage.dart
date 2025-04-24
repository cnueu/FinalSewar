import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';

class WatchMatch extends StatefulWidget {
  final String team1;
  final String team2;
  final String team1Image;
  final String team2Image;
  final String time;
  final String location;

  const WatchMatch({
    super.key,
    required this.team1,
    required this.team2,
    required this.team1Image,
    required this.team2Image,
    required this.time,
    required this.location,
  });

  @override
  State<WatchMatch> createState() => _WatchMatchState();
}

class _WatchMatchState extends State<WatchMatch> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.backgroundDecoration(isDark: isDark),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        '${widget.team1} VS ${widget.team2}',
                        style: const TextStyle(
                          fontFamily: 'Title',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(widget.team1Image, width: 50),
                                Text(widget.team1, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '1 - 0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.time,
                                  style: const TextStyle(color: Colors.white60, fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(widget.team2Image, width: 50),
                                Text(widget.team2, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(widget.location, style: const TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Deaf/Blind Vibration', style: TextStyle(color: Colors.white60)),
                      Switch(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2.6,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildOptionButton('Statistics', 0),
                      _buildOptionButton('Menu', 1),
                      _buildOptionButton('Cameras', 2),
                      _buildOptionButton('AI Chat', 3),
                      _buildOptionButton('Events', 4),
                      _buildOptionButton('Votes', 5),
                      _buildOptionButton('Games', 6),
                      _buildOptionButton('Map', 7),
                      _buildOptionButton('Tickets', 8),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(91, 0, 0, 0),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        child: Builder(
                          builder: (_) {
                            if (selectedIndex == 0) {
                              return ListView(
                                children: [
                                  _buildUnifiedStatRow('Shots on Target', 1, 1),
                                  _buildUnifiedStatRow('Shots off Target', 3, 2),
                                  _buildUnifiedStatRow('Blocked Shots', 3, 3),
                                  _buildUnifiedStatRow('Possession (%)', 44, 56),
                                  _buildUnifiedStatRow('Corner Kicks', 4, 6),
                                  _buildUnifiedStatRow('Offsides', 3, 1),
                                  _buildUnifiedStatRow('Fouls', 44, 56),
                                  _buildUnifiedStatRow('Throw-ins', 4, 6),
                                  _buildUnifiedStatRow('Yellow Cards', 3, 1),
                                ],
                              );
                            } else if (selectedIndex == 1) {
                              return ListView(
                                children: [
                                  _buildFoodCard(
                                    imagePath: 'assets/user/icons/Ticketicon.png',
                                    dishName: 'Fries',
                                    price: '25 ريال',
                                    prepTime: '20 دقيقة',
                                    
                                  ),
                                ],
                              );
                            } else if (selectedIndex == 2) {
                              return GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 1,
                                children: List.generate(9, (index) {
                                  return _buildCameraBox(index);
                                }),
                              );
                            } else if (selectedIndex == 4) {
                              return ListView(
                                children: [
                                  _buildTimelineEvent("12:00", " لعبة افضل تيفو"),
                                  _buildTimelineEvent("12:00", "بداية المباراة"),
                                  _buildTimelineEvent("12:10", "اعلان افضل صرخة جماهير"),
                                  _buildTimelineEvent("12:30", "استراحة"),
                                  _buildTimelineEvent("12:45", "استئناف الشوط الثاني"),
                                  _buildTimelineEvent("13:15", "سحب على سيارة"),
                                  _buildTimelineEvent("13:45", "نهاية المباراة"),
                                ],
                              );
                            } else if (selectedIndex == 5) {
                              return ListView(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: const [
                                                Icon(Icons.thumb_down, color: Colors.redAccent, size: 30),
                                                SizedBox(height: 6),
                                                Text("رافض", style: TextStyle(color: Colors.white)),
                                                SizedBox(height: 6),
                                                Text("80", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                            Column(
                                              children: const [
                                                Text(
                                                  '120 - 80',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  'مجموع الأصوات',
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: const [
                                                Icon(Icons.thumb_up, color: Colors.greenAccent, size: 30),
                                                SizedBox(height: 6),
                                                Text("موافق", style: TextStyle(color: Colors.white)),
                                                SizedBox(height: 6),
                                                Text("120", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'سجل التصويتات',
                                    style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 12),
                                  _buildVoteHistory(" 18درجة الحرارة ", 100, 30),
                                  _buildVoteHistory("اسرع لاعب هو سالم  ", 90, 60),
                                  _buildVoteHistory("افضل اكلة هي فرايز ", 70, 40),
                                  _buildVoteHistory("تسديدة الحارس كانت قوية ", 120, 80),
                                ],
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'قريبًا...',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildOptionButton(String title, int index) {
    final isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.white : const Color.fromARGB(23, 0, 0, 0),
        foregroundColor: isSelected ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      child: Center(child: Text(title, textAlign: TextAlign.center)),
    );
  }

  Widget _buildUnifiedStatRow(String title, int team1, int team2) {
    int total = team1 + team2;
    double t1Ratio = total == 0 ? 0.5 : team1 / total;
    double t2Ratio = total == 0 ? 0.5 : team2 / total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 50, 73, 74),
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: (t1Ratio * 100).toInt(),
                child: Container(
                  height: 23,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(121, 141, 8, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                flex: (t2Ratio * 100).toInt(),
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(121, 141, 8, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 106, 1, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$team1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 106, 1, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$team2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCard({
    required String imagePath,
    required String dishName,
    required String price,
    required String prepTime,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/usermassagedark.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dishName,
                  style: const TextStyle(
                    fontFamily: 'Title',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'السعر: $price',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Title',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'التحضير: $prepTime',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Title',
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 16),
                    const SizedBox(width: 6),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraBox(int index) {
    bool isVR = index == 2;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white24),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isVR ? Icons.vrpano : Icons.videocam,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 8),
              Text(
                isVR ? 'VR Camera' : 'Camera ${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineEvent(String time, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 6),
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.white24,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 250,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Title',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVoteHistory(String title, int agree, int disagree) {
    int total = agree + disagree;
    double agreeRatio = total == 0 ? 0.5 : agree / total;
    double disagreeRatio = total == 0 ? 0.5 : disagree / total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: (disagreeRatio * 100).toInt(),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Expanded(
                flex: (agreeRatio * 100).toInt(),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("رافض: $disagree", style: const TextStyle(color: Colors.white54, fontSize: 12)),
              Text("موافق: $agree", style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
