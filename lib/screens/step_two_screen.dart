
import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../utils/validators.dart';
import 'summary_screen.dart';

class StepTwoScreen extends StatefulWidget {
  final UserProfile profil;

  const StepTwoScreen({
    super.key,
    required this.profil,
  });

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _professionController = TextEditingController();
  final _experienceController = TextEditingController();
  final _tjmController = TextEditingController();
  final _biographieController = TextEditingController();

  @override
  void dispose() {
    _professionController.dispose();
    _experienceController.dispose();
    _tjmController.dispose();
    _biographieController.dispose();
    super.dispose();
  }

  void _continuer() {
    if (!_formKey.currentState!.validate()) return;

    final profilMisAJour = widget.profil.copyWith(
      profession: _professionController.text.trim(),
      experience: int.parse(_experienceController.text.trim()),
      tjm: double.parse(
        _tjmController.text.trim().replaceAll(',', '.'),
      ),
      biographie: _biographieController.text.trim(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryScreen(
          profil: profilMisAJour,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F9),
      appBar: AppBar(
        title: const Text('Inscription - Étape 2/3'),
        backgroundColor: const Color(0xFF00A8CC),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Profil professionnel',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Présentez votre expérience professionnelle.',
                    ),
                    const SizedBox(height: 24),

                    TextFormField(
                      controller: _professionController,
                      decoration: const InputDecoration(
                        labelText: 'Profession',
                        hintText: 'Ex. Développeur Flutter',
                        prefixIcon: Icon(Icons.work_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.profession,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _experienceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Années d’expérience',
                        hintText: 'Ex. 2',
                        prefixIcon: Icon(Icons.timeline),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.experience,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _tjmController,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'TJM (en DT)',
                        hintText: 'Entre 50 et 3000',
                        prefixIcon: Icon(Icons.payments_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.tjm,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _biographieController,
                      maxLines: 4,
                      maxLength: 300,
                      decoration: const InputDecoration(
                        labelText: 'Biographie (facultative)',
                        hintText: 'Présentez-vous en quelques phrases...',
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.description_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.biographie,
                    ),
                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: _continuer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A8CC),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Valider le profil'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

