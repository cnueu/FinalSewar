import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OtherDataPage extends StatefulWidget {
  final int tabIndex;
  const OtherDataPage({super.key, required this.tabIndex});

  @override
  State<OtherDataPage> createState() => _OtherDataPageState();
}

class _OtherDataPageState extends State<OtherDataPage> {
  int selectedIndex = 0;

  final List<String> filters = [
    "Sex",
    "Favorite Teams",
    "Seats",
    "Common Orders",
    "Audience rate",
    "Ages",
  ];

  final List<String> filters2 = [
    "Building",
    "Food",
    "Notifications",
    "Suggesments",
    "Followers",
    "Posts",
  ];
  final List<String> filters3 = [
    "Players",
    "Fastest Players",
    "Weather",
    "Statics",
    "Injuries",
    "Light State",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            widget.tabIndex == 0
                ? _buildTab1Content()
                : widget.tabIndex == 1
                ? _buildTab3Content()
                : widget.tabIndex == 2
                ? _buildTab2Content()
                : _buildTab4Content(), //   التبويب الرابع (Chat)
      ),
    );
  }

  List<Widget> _buildTab1Content() {
    return [
      const SizedBox(height: 10),
      _buildFilterGrid(),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Last 4 Months',
          style: TextStyle(
            fontFamily: 'Title',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: buildLineChart(),
        ),
      ),
      const SizedBox(height: 10),

      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Last  Month',
          style: TextStyle(
            fontFamily: 'Title',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: buildStackedBarChart(),
      ),
    ];
  }

  List<Widget> _buildTab2Content() {
    return [
      const SizedBox(height: 10),
      _buildFilterGrid2(),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'A/C Degree',
          style: TextStyle(
            fontFamily: 'Title',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: buildTab2Chart(),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: buildTab2StackedBarChart(),
      ),
    ];
  }

  Widget _buildFilterGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(filters.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    selectedIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  fontFamily: 'Title',
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterGrid3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(filters.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    selectedIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  fontFamily: 'Title',
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterGrid2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(filters.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    selectedIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                filters3[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  fontFamily: 'Title',
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  List<Widget> _buildTab3Content() {
    final List<Map<String, String>> players = [
      {'name': 'Khalid Saleh', 'image': 'assets/output.png'},
      {'name': 'Salem Aldosary', 'image': 'assets/output (1).png'},
      {'name': 'Hashem Alsary', 'image': 'assets/output (2).png'},
      {'name': 'Ali Alqahtani', 'image': 'assets/output (3).png'},
      {'name': 'Joman Khalid', 'image': 'assets/output (4).png'},
      {'name': 'Omar Ahmad', 'image': 'assets/output (5).png'},
    ];

    return [
      const SizedBox(height: 10),
      _buildFilterGrid2(),
      const SizedBox(height: 20),
      
      const SizedBox(height: 16),
      ListView.builder(
        itemCount: players.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final player = players[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  player['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Title',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // صورة الرادار
                      Image.asset(
                        player['image']!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      // الكلمات حول الصورة
                      const Positioned(
                        right: 0,
                        top: 80,
                        child: Text("Speed", style: _labelStyle),
                      ),
                      const Positioned(
                        right: 0,
                        top: 20,
                        child: Text("Dribbling", style: _labelStyle),
                      ),
                      const Positioned(
                        right: 0,
                        bottom: 20,
                        child: Text("Passing", style: _labelStyle),
                      ),
                      const Positioned(
                        left: 0,
                        top: 80, // نفس القيمة حق الـ Speed
                        child: Text("Vision", style: _labelStyle),
                      ),
                      const Positioned(
                        left: 0,
                        bottom: 20,
                        child: Text("Stamina", style: _labelStyle),
                      ),
                      const Positioned(
                        left: 0,
                        top: 20,
                        child: Text("Tactics", style: _labelStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ];
  }

  List<Widget> _buildTab4Content() {
    final List<Map<String, dynamic>> messages = [
      {
        'isUser': true,
        'sender': 'Company',
        'message': 'ايش صار بالدقيقة 66؟',
      },
      {
        'isUser': false,
        'sender': 'AI',
        'message': 'اللاعب سالم ضرب اللاعب علي', 
      },
    ];

    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'AI Chat',
          style: TextStyle(
            fontFamily: 'Title',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 20),

      // خلفية + الرسائل
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            //  الرسائل
            ...messages.map((msg) {
              final isUser = msg['isUser'] as bool;
              final sender = msg['sender']!;
              final message = msg['message']!;
              final bubbleImage =
                  isUser
                      ? 'assets/usermassagedark.png'
                      : 'assets/aimassagedark.png';

              return Align(
                alignment:
                    isUser ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  padding: const EdgeInsets.all(12),
                  constraints: const BoxConstraints(maxWidth: 300),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bubbleImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sender,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

            const SizedBox(height: 16),

            //  إدخال الرسالة
            Container(
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(
                    'assets/user/icons/voicechaticon.png',
                    width: 26,
                    height: 26,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.send, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildChatBubble({
    required bool isUser,
    required String sender,
    required String message,
    bool isRTL = false,
  }) {
    String bubbleImage =
        isUser ? 'assets/usermassagedark.png' : 'assets/aimassagedark.png';

    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bubbleImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: isUser ? TextDirection.ltr : TextDirection.rtl,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/robot.png'),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  sender,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(color: Colors.white, thickness: 1.0),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: isRTL ? TextAlign.right : TextAlign.left,
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ثابت لنمط النصوص حول الرادار
  static const TextStyle _labelStyle = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontFamily: 'Title',
  );

  Widget buildLineChart() {
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 40000,
        backgroundColor: Colors.transparent,
        lineTouchData: LineTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5000,
              reservedSize: 40,
              getTitlesWidget:
                  (value, _) => Text(
                    '${value ~/ 1000}k',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: 'Title',
                    ),
                  ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, _) {
                final months = ['JAN', 'FEB', 'MAR', 'APR'];
                return Padding(
                  padding: const EdgeInsets.only(top: 6, right: 10),
                  child: Text(
                    months[value.toInt()],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontFamily: 'Title',
                    ),
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 10000,
          getDrawingHorizontalLine:
              (_) => FlLine(color: Colors.white10, strokeWidth: 1),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.white24),
            bottom: BorderSide(color: Colors.white24),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 10000),
              FlSpot(1, 13000),

              FlSpot(2, 20000),

              FlSpot(3, 27000),
            ],

            isCurved: true,
            curveSmoothness: 0.8,
            barWidth: 4,
            color: Colors.pinkAccent,
            dotData: FlDotData(show: true),
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 38000),
              FlSpot(1, 37000),
              FlSpot(2, 36500),
              FlSpot(3, 37000),
            ],
            isCurved: true,
            barWidth: 3,
            color: Colors.blueAccent,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  Widget buildStackedBarChart() {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _LegendItem(color: Colors.blueAccent, label: 'Men'),
              SizedBox(width: 16),
              _LegendItem(color: Colors.pinkAccent, label: 'Women'),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(height: 1, color: Colors.white70),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(7, (index) {
                    double menHeight =
                        [50.0, 60.0, 45.0, 55.0, 30.0, 30.0, 40.0][index];
                    double womenHeight =
                        [40.0, 30.0, 55.0, 45.0, 50.0, 20.0, 60.0][index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: menHeight,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          width: 25,
                          height: womenHeight,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab2Chart() {
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 40,
        backgroundColor: Colors.transparent,
        lineTouchData: LineTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5,
              reservedSize: 20,
              getTitlesWidget:
                  (value, _) => Text(
                    '${value}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: 'Text ',
                    ),
                  ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, _) {
                final months = ['JAN', 'FEB', 'MAR', 'APR'];
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    months[value.toInt()],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Text',
                    ),
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 5,
          getDrawingHorizontalLine:
              (_) => FlLine(color: Colors.white10, strokeWidth: 1),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.white24),
            bottom: BorderSide(color: Colors.white24),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 28),
              FlSpot(1, 27),
              FlSpot(2, 25),
              FlSpot(3, 20),
            ],
            isCurved: true,
            curveSmoothness: 0.8,

            barWidth: 3,
            color: Colors.redAccent,
            dotData: FlDotData(show: true),
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 31),
              FlSpot(1, 28),
              FlSpot(2, 23),
              FlSpot(3, 18),
            ],
            isCurved: true,
            curveSmoothness: 0.8,
            barWidth: 3,
            color: Colors.green,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  Widget buildTab2StackedBarChart() {
    final data = [
      {'label': 'HotDog', 'value': 90.0, 'color': Colors.white},
      {'label': 'Fries', 'value': 75.0, 'color': const Color(0xFFD4C04A)},
      {'label': 'Burger', 'value': 60.0, 'color': Colors.redAccent},
      {'label': 'Pepsi', 'value': 50.0, 'color': Colors.lightBlue},
    ];

    final double maxValue = data
        .map((e) => e['value'] as double)
        .reduce((a, b) => a > b ? a : b);
    final double maxBarWidth = 200.0; // العرض الأقصى للبار

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Most Rated Food",
              style: TextStyle(
                fontFamily: 'Title',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...data.map((item) {
            double value = item['value'] as double;
            double normalizedWidth = (value / maxValue) * maxBarWidth;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      item['label'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Title',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    children: [
                      Container(
                        height: 18,
                        width: maxBarWidth,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 18,
                        width: normalizedWidth,
                        decoration: BoxDecoration(
                          color: item['color'] as Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget buildTab3Chart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Scroll خارجي
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
        children: List.generate(6, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //   أيقونة أو صورة
                  Image.asset(
                    'assets/company/icons/sampleicon.png', // غيّر المسار حسب الصورة
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Title ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Title',
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildPlayerRadarCard({
    required String playerName,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            playerName,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Title',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(imagePath, width: 150, height: 150),
              // المعايير الستة
              Positioned(top: 0, child: radarLabel("Speed")),
              Positioned(right: 0, child: radarLabel("Dribbling")),
              Positioned(bottom: 10, right: 0, child: radarLabel("Passing")),
              Positioned(bottom: 0, child: radarLabel("Vision")),
              Positioned(bottom: 10, left: 0, child: radarLabel("Stamina")),
              Positioned(left: 0, child: radarLabel("Tactics")),
            ],
          ),
        ],
      ),
    );
  }

  Widget radarLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontFamily: 'Title',
      ),
    );
  }
}
