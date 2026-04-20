import 'package:flutter/material.dart';
import 'package:flutter_application_2/loginscreen_first.dart';
import 'color_detail_screen.dart';

class SecondScreen extends StatefulWidget {
  final String thename;
  final String username;
  final String password;

  const SecondScreen({
    super.key,
    required this.thename,
    required this.username,
    required this.password,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${widget.thename}")),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (val) {
          setState(() {
            selectedindex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),

     
      body: selectedindex == 0
          ? const Gallerypage()
          : Settingpage(
              thename: widget.thename,
              username: widget.username,
              password: widget.password,
            ),
    );
  }
}
class Gallerypage extends StatefulWidget {
  const Gallerypage({super.key});

  @override
  State<Gallerypage> createState() => _GallerypageState();
}

class _GallerypageState extends State<Gallerypage> {
  List<Map<String, dynamic>> colors = [
    {"color": Colors.indigo, "name": "Indigo"},
    {"color": Colors.blueGrey, "name": "Bluegrey"},
    {"color": Colors.pink, "name": "Pink"},
    {"color": Colors.purple, "name": "Purple"},
    {"color": Colors.blue, "name": "Blue"},
    {"color": Colors.green, "name": "Green"},
    {"color": Colors.yellow, "name": "Yellow"},
    {"color": Colors.orange, "name": "Orange"},
    {"color": Colors.teal, "name": "Teal"},
    {"color": Colors.brown, "name": "Brown"},
    {"color": Colors.black, "name": "Black"},
    {"color": Colors.red, "name": "Red"},
  ];

  List<Map<String, dynamic>> filteredColors = [];

  @override
  void initState() {
    super.initState();
    filteredColors = colors;
  }

  void filterColors(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredColors = colors;
      });
      return;
    }

    final results = colors.where((item) {
      return item["name"]
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredColors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: filterColors,
        ),

        Expanded(
          child: GridView.builder(
            itemCount: filteredColors.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorDetailScreen(
                        color: filteredColors[index]["color"],
                        name: filteredColors[index]["name"],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: filteredColors[index]["color"],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      filteredColors[index]["name"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
class Settingpage extends StatefulWidget {
  final String thename;
  final String username;
  final String password;

  const Settingpage({
    super.key,
    required this.thename,
    required this.username,
    required this.password,
  });

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  late List<Map<String, String>> users;

  @override
  void initState() {
    super.initState();

    users = [
      {
        "name": widget.thename,
        "username": widget.username,
        "password": widget.password,
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> developer = [
      {
        "developername": "Rahma Akram",
        "email": "rahmaakram36@gmail.com",
      }
    ];
    return Column(
  children: [ SizedBox(height: 15),
    const Text(
      "Facing any issues?\ncontact us!",
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    ),

    Expanded(
      child: ListView.builder(
        itemCount: developer.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: Text(developer[index]["developername"]!),
            subtitle: Text(developer[index]["email"]!),
          );
        },
      ),
    ),
    SizedBox(height: 40,
    width: 200,
      child: ElevatedButton( style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black)
      ),
        onPressed: (){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
      }, 
      child: Text("Log Out",style: TextStyle(fontSize: 20,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.white),)),
    ) , SizedBox(height: 10,)
  ],
);
}
}