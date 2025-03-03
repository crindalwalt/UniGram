import 'package:flutter/material.dart';

class HomeScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("UniGram",style: TextStyle(color: theme.colorScheme.onPrimary,fontWeight: FontWeight.bold),),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
    
  }
}