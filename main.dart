import "package:flutter/material.dart";

void main() => runApp(const SniperTipsApp());

const Color _gold = Color(0xFFD4AF37);

class SniperTipsApp extends StatelessWidget {
  const SniperTipsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SniperTips",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          surface: Colors.black,
          onSurface: _gold,
          primary: _gold,
          onPrimary: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class Pick {
  final IconData sportIcon;
  final String player;
  final String line;
  const Pick({required this.sportIcon, required this.player, required this.line});
}

class ArchiveRow {
  final String title;
  final bool won;
  const ArchiveRow({required this.title, required this.won});
}

const List<Pick> _picks = [
  Pick(
    sportIcon: Icons.sports_basketball,
    player: "Nickeil Alexander-Walker",
    line: "17.5 Points Over",
  ),
  Pick(
    sportIcon: Icons.sports_basketball,
    player: "Bennedict Mathurin",
    line: "19.5 Points Over",
  ),
];

const List<ArchiveRow> _archive = [];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "🎯 SNIPERTIPS PICKS",
                style: TextStyle(
                  color: _gold, 
                  fontSize: 26, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: _picks.isEmpty 
                ? const Center(child: Text("No picks for today.", style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _picks.length,
                    itemBuilder: (context, i) {
                      final p = _picks[i];
                      return Card(
                        color: Colors.grey.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: _gold, width: 1.5),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          leading: Icon(p.sportIcon, color: _gold, size: 40),
                          title: Text(
                            p.player, 
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                          subtitle: Text(
                            p.line, 
                            style: const TextStyle(color: _gold, fontSize: 16, fontWeight: FontWeight.w500)
                          ),
                        ),
                      );
                    },
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gold, 
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const ArchiveScreen()));
                  },
                  child: const Text("VIEW WINNING HISTORY"),
                ),
              ),
            ),
            const AdMobBannerPlaceholder(),
          ],
        ),
      ),
    );
  }
}

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SNIPERTIPS HISTORY")),
      body: _archive.isEmpty 
        ? const Center(
            child: Text(
              "Archive is empty. New era starts now!", 
              style: TextStyle(color: Colors.grey, fontSize: 16)
            )
          )
        : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: _archive.length,
            itemBuilder: (context, i) {
              final a = _archive[i];
              return Card(
                color: Colors.grey.shade900,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(a.title, style: const TextStyle(color: Colors.white)),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: a.won ? Colors.green : Colors.red),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(
                      a.won ? "WIN" : "LOSS", 
                      style: TextStyle(color: a.won ? Colors.green : Colors.red, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}

class AdMobBannerPlaceholder extends StatelessWidget {
  const AdMobBannerPlaceholder({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.grey.shade900,
      alignment: Alignment.center,
      child: const Text("REKLAMA (GOOGLE ADMOB)", style: TextStyle(color: Colors.grey, fontSize: 10)),
    );
  }
}