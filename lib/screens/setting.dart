import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ListTile(
            title: Text('Account Settings'),
          ),
          ListTile(
            title: const Text('Profile Picture'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle profile picture settings
            },
          ),
          ListTile(
            title: const Text('Personal Information'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle personal information settings
            },
          ),
          ListTile(
            title: const Text('Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle password settings
            },
          ),
          ListTile(
            title: const Text('Notification Preferences'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle notification preferences settings
            },
          ),
          ListTile(
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle language settings
            },
          ),
          const ListTile(
            title: Text('Payment Settings'),
          ),
          ListTile(
            title: const Text('Payment Methods'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle payment methods settings
            },
          ),
          ListTile(
            title: const Text('Billing Address'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle billing address settings
            },
          ),
          // Add more settings options as needed
        ],
      ),
    );
  }
}
