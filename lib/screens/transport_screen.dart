import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TransportScreen extends StatefulWidget {
  final bool isEnglish;
  const TransportScreen({super.key, this.isEnglish = true});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  String searchQuery = "";

  // Bus data with Gujarati route names
  final List<Map<String, String>> busTimings = [
    {"busNumber": "GSRTC 101", "routeEn": "Ahmedabad → Gandhinagar", "routeGu": "અમદાવાદ → ગાંધીનગર", "time": "06:00 AM"},
    {"busNumber": "GSRTC 102", "routeEn": "Ahmedabad → Mehsana", "routeGu": "અમદાવાદ → મહેસાણા", "time": "06:30 AM"},
    {"busNumber": "GSRTC 103", "routeEn": "Ahmedabad → Anand", "routeGu": "અમદાવાદ → આનંદ", "time": "07:00 AM"},
    {"busNumber": "GSRTC 104", "routeEn": "Ahmedabad → Nadiad", "routeGu": "અમદાવાદ → નડિયાદ", "time": "07:30 AM"},
    {"busNumber": "GSRTC 105", "routeEn": "Ahmedabad → Vadodara", "routeGu": "અમદાવાદ → વડોદરા", "time": "08:00 AM"},
    {"busNumber": "GSRTC 106", "routeEn": "Ahmedabad → Surat", "routeGu": "અમદાવાદ → સુરત", "time": "08:30 AM"},
    {"busNumber": "GSRTC 107", "routeEn": "Ahmedabad → Rajkot", "routeGu": "અમદાવાદ → રાજકોટ", "time": "09:00 AM"},
    {"busNumber": "GSRTC 108", "routeEn": "Ahmedabad → Bhavnagar", "routeGu": "અમદાવાદ → ભવનગર", "time": "09:30 AM"},
    {"busNumber": "GSRTC 109", "routeEn": "Ahmedabad → Jamnagar", "routeGu": "અમદાવાદ → જામનગર", "time": "10:00 AM"},
    {"busNumber": "GSRTC 110", "routeEn": "Ahmedabad → Bhuj", "routeGu": "અમદાવાદ → ભુજ", "time": "10:30 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter bus list by search
    final filteredBuses = busTimings.where((bus) {
      final busText =
      "${bus["busNumber"]} ${bus["routeEn"]} ${bus["routeGu"]} ${bus["time"]}".toLowerCase();
      return busText.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEnglish ? "Village Bus Routes" : "ગામ બસ માર્ગો"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: widget.isEnglish ? "Search bus or route..." : "બસ અથવા માર્ગ શોધો...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),

            // Bus list
            Expanded(
              child: ListView.builder(
                itemCount: filteredBuses.length,
                itemBuilder: (context, index) {
                  final bus = filteredBuses[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primary.withOpacity(0.2),
                        child: Text(
                          bus["busNumber"]?.split(" ").last ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(widget.isEnglish ? bus["routeEn"]! : bus["routeGu"]!),
                      subtitle: Text(
                        widget.isEnglish ? "Departure: ${bus["time"]}" : "પ્રસ્થાન: ${bus["time"]}",
                      ),
                      trailing: const Icon(Icons.directions_bus, color: Colors.green),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}