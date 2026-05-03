import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Etudiants',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EtudiantsPage(),
    );
  }
}

class Etudiant {
  final int id;
  final String cin;
  final String nom;
  final String dateNaissance;

  Etudiant({
    required this.id,
    required this.cin,
    required this.nom,
    required this.dateNaissance,
  });

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      id: json['id'],
      cin: json['cin'],
      nom: json['nom'],
      dateNaissance: json['dateNaissance'],
    );
  }
}

class EtudiantsPage extends StatefulWidget {
  const EtudiantsPage({super.key});

  @override
  State<EtudiantsPage> createState() => _EtudiantsPageState();
}

class _EtudiantsPageState extends State<EtudiantsPage> {
  late Future<List<Etudiant>> futureEtudiants;

  @override
  void initState() {
    super.initState();
    futureEtudiants = fetchEtudiants();
  }

  Future<List<Etudiant>> fetchEtudiants() async {
    // Replace 10.0.2.2 with your API IP if running on physical device
    // 10.0.2.2 is the localhost alias for Android Emulator
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/etudiants'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => Etudiant.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load etudiants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Etudiants'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Etudiant>>(
        future: futureEtudiants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun étudiant trouvé.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final etudiant = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(etudiant.nom[0].toUpperCase()),
                  ),
                  title: Text(etudiant.nom, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('CIN: ${etudiant.cin}\nNé(e) le: ${etudiant.dateNaissance}'),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
