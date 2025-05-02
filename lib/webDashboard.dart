
import 'package:flutter/material.dart';

class WebDashboard extends StatefulWidget {
  @override
  State<WebDashboard> createState() => _WebDashboardState();
}

class _WebDashboardState extends State<WebDashboard> {
  String selectedTab = 'Clients'; // or 'Caregivers'
  int selectedIndex = -1;

  List<String> clients = ['Alice Reyes', 'Bob Santos', 'Carlos Dela Cruz'];
  List<String> caregivers = ['Jane Rivas', 'Mina Corpuz', 'Leo Manalo'];

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void switchTab(String tab) {
    setState(() {
      selectedTab = tab;
      selectedIndex = -1; // reset selection
    });
  }

  void addNew() {
    // placeholder for add logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Add $selectedTab')),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = selectedTab == 'Clients' ? clients : caregivers;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            FlutterLogo(),
            SizedBox(width: 20),
            TextButton(
              onPressed: () => switchTab('Caregivers'),
              child: Text('Caregivers',
                  style: TextStyle(
                      color: selectedTab == 'Caregivers'
                          ? Colors.white
                          : Colors.white70)),
            ),
            TextButton(
              onPressed: () => switchTab('Clients'),
              child: Text('Clients',
                  style: TextStyle(
                      color:
                      selectedTab == 'Clients' ? Colors.white : Colors.white70)),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    onPressed: addNew,
                    icon: Icon(Icons.add),
                    label: Text('Add ${selectedTab.substring(0, selectedTab.length - 1)}'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      final isSelected = selectedIndex == index;
                      return ListTile(
                        title: Text(items[index]),
                        selected: isSelected,
                        selectedTileColor: Colors.blue.shade100,
                        onTap: () => selectItem(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(width: 1),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(20),
              child: selectedIndex == -1
                  ? Center(child: Text('Select a $selectedTab to view details.'))
                  : Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '$selectedTab Details:\n\nName: ${items[selectedIndex]}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}