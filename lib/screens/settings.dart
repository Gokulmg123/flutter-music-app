import 'package:flutter/material.dart';
import 'package:lyrica/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Theme.of(context).colorScheme.primary,)),
        backgroundColor:Theme.of(context).colorScheme.secondary,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Manage your account settings',style: TextStyle(color:Theme.of(context).colorScheme.secondary,)),
            trailing: Icon(Icons.arrow_forward_ios),iconColor: Theme.of(context).colorScheme.secondary,
            onTap: () {
              // Navigate to account settings
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music Quality',style: TextStyle(color:Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Adjust streaming and download quality',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            trailing: Icon(Icons.arrow_forward_ios),iconColor: Theme.of(context).colorScheme.secondary,
            onTap: () {
              // Navigate to music quality settings
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Manage your notifications',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            trailing: Icon(Icons.arrow_forward_ios),iconColor:Theme.of(context).colorScheme.secondary,
            onTap: () {
              // Navigate to notifications settings
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Appearance',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Customize the look and feel',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            trailing: Icon(Icons.arrow_forward_ios),iconColor:Theme.of(context).colorScheme.secondary,
            onTap: () {
              // Navigate to appearance settings
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy',style: TextStyle(color:Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Adjust your privacy settings',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            trailing: Icon(Icons.arrow_forward_ios),iconColor:Theme.of(context).colorScheme.secondary,
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          SwitchListTile(
            secondary: Icon(Icons.dark_mode),activeColor: Theme.of(context).colorScheme.secondary,
            title: Text('Dark Mode',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            subtitle: Text('Enable or disable dark mode',style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
            value: true, // Set this to the current dark mode status
            onChanged: (bool value) {
              // Handle dark mode toggle
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
