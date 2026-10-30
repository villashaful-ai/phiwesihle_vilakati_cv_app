import 'package:flutter/material.dart';

void main() {
  runApp(MyCVApp());
}

class MyCVApp extends StatefulWidget {
  @override
  State<MyCVApp> createState() => _MyCVAppState();
}

class _MyCVAppState extends State<MyCVApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My CV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDark ? Brightness.dark : Brightness.light,
        useMaterial3: true,
      ),
      home: CVScreen(
        isDark: isDark,
        onThemeChanged: () => setState(() => isDark = !isDark),
      ),
    );
  }
}

class CVScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeChanged;
  CVScreen({required this.isDark, required this.onThemeChanged});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onThemeChanged,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER / PROFILE - Requirement
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Text('PV', style: TextStyle(fontSize: 40)),
                  ),
                  SizedBox(height: 12),
                  Text('Phiwesihle Vilakati', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Text('Flutter Developer | IT Student', style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Passionate IT student at Eswatini, focused on mobile development with Flutter and building solutions for local communities including Tinkhundla systems.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // CONTACT INFORMATION - Requirement
            Text('Contact Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.email), title: Text('phiwesihle.vilakati@email.com'), onTap: () => _launch('mailto:phiwesihle.vilakati@email.com')),
                  ListTile(leading: Icon(Icons.phone), title: Text('+268 76988901'), onTap: () => _launch('tel:+26876000000')),
                  ListTile(leading: Icon(Icons.link), title: Text('LinkedIn'), onTap: () => _launch('https://linkedin.com/in/phiwesihle')),
                  ListTile(leading: Icon(Icons.code), title: Text('GitHub'), onTap: () => _launch('https://github.com/phiwesihle')),
                ],
              ),
            ),
            SizedBox(height: 20),

            // SKILLS SECTION - Requirement: Chip, LinearProgressIndicator
            Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Python')),
                Chip(label: Text('Firebase')),
                Chip(label: Text('Git')),
                Chip(label: Text('Teamwork')),
                Chip(label: Text('Communication')),
              ],
            ),
            SizedBox(height: 12),
            Text('Flutter'), LinearProgressIndicator(value: 0.85),
            SizedBox(height: 8),
            Text('Dart'), LinearProgressIndicator(value: 0.8),
            SizedBox(height: 8),
            Text('UI/UX'), LinearProgressIndicator(value: 0.7),
            SizedBox(height: 20),

            // WORK EXPERIENCE - Requirement
            Text('Work Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(child: ListTile(title: Text('Class Exercise Developer'), subtitle: Text('2026 - Present\nBuilt Tinkhundla Ministry System & Mobile CV App using Flutter. Implemented CRUD, search with BETWEEN/IN/LIKE.'), isThreeLine: true)),
            Card(child: ListTile(title: Text('IT Intern - School Project'), subtitle: Text('2025\nAssisted in developing community app for Mbabane region.'))),
            SizedBox(height: 20),

            // EDUCATION & CERTIFICATIONS - Requirement
            Text('Education & Certifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(child: ListTile(leading: Icon(Icons.school), title: Text('Diploma in IT'), subtitle: Text('University of Eswatini - 2023-2026'))),
            Card(child: ListTile(leading: Icon(Icons.card_membership), title: Text('Flutter Certified'), subtitle: Text('Google - 2026'))),
          ],
        ),
      ),
    );
  }
}