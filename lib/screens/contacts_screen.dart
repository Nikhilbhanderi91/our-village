//contacts_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ourvillage/theme/app_theme.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Important Contacts'),
      ),
      body: ListView.builder(
        itemCount: importantContacts.length,
        itemBuilder: (context, index) {
          final contact = importantContacts[index];
          return Card(
            margin: const EdgeInsets.all(8),
            color: AppTheme.surface,
            child: ListTile(
              leading: Icon(
                contact['type'] == 'Emergency'
                    ? Icons.emergency
                    : Icons.contact_phone,
                color: contact['type'] == 'Emergency'
                    ? AppTheme.error
                    : AppTheme.primaryVariant,
              ),
              title: Text(
                contact['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.onBackground,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact['designation']!,
                    style: const TextStyle(color: AppTheme.onBackground),
                  ),
                  Text(
                    contact['phone']!,
                    style: const TextStyle(color: AppTheme.onBackground),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.phone, color: AppTheme.primary),
                onPressed: () => _makePhoneCall(contact['phone']!),
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, String>> importantContacts = [
  {
    'name': 'Sarpanch',
    'designation': 'Village Head',
    'phone': '+91-9876543210',
    'type': 'Official'
  },
  {
    'name': 'Police Station',
    'designation': 'Emergency',
    'phone': '100',
    'type': 'Emergency'
  },
  {
    'name': 'Ambulance',
    'designation': 'Emergency Medical',
    'phone': '108',
    'type': 'Emergency'
  },
  {
    'name': 'Fire Station',
    'designation': 'Emergency Fire Service',
    'phone': '101',
    'type': 'Emergency'
  },
  {
    'name': 'Women Helpline',
    'designation': 'Women Safety',
    'phone': '112',
    'type': 'Emergency'
  },
  {
    'name': 'Child Helpline',
    'designation': 'For Child Protection',
    'phone': '1098',
    'type': 'Emergency'
  },
  {
    'name': 'Electricity Office',
    'designation': 'Village Electricity Dept.',
    'phone': '+91-9876543213',
    'type': 'Official'
  },
  {
    'name': 'Water Supply Office',
    'designation': 'Village Water Dept.',
    'phone': '+91-9876543214',
    'type': 'Official'
  },
  {
    'name': 'Health Center',
    'designation': 'Primary Health Center',
    'phone': '+91-9876543211',
    'type': 'Medical'
  },
  {
    'name': 'School Principal',
    'designation': 'Government School',
    'phone': '+91-9876543212',
    'type': 'Education'
  },
  {
    'name': 'Post Office',
    'designation': 'Village Postal Services',
    'phone': '+91-9876543215',
    'type': 'Official'
  },
];