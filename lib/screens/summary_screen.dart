
import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class SummaryScreen extends StatefulWidget {
  final UserProfile profil;

  const SummaryScreen({
    super.key,
    required this.profil,
  });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool _conditionsAcceptees = false;

  void _confirmerInscription() {
    if (!_conditionsAcceptees) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez accepter les conditions pour continuer.',
          ),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 50,
        ),
        title: const Text('Inscription réussie !'),
        content: Text(
          'Félicitations ${widget.profil.prenom}, '
          'votre inscription est confirmée.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _ligneInfo(String titre, String valeur, IconData icone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: const Color(0xFF00A8CC)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(valeur.isEmpty ? 'Non renseigné' : valeur),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profil = widget.profil;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F9),
      appBar: AppBar(
        title: const Text('Récapitulatif - Étape 3/3'),
        backgroundColor: const Color(0xFF00A8CC),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.assignment_turned_in_outlined,
                  size: 55,
                  color: Color(0xFF00A8CC),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Vérifiez vos informations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Informations personnelles',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _ligneInfo('Nom', profil.nom, Icons.person_outline),
                _ligneInfo('Prénom', profil.prenom, Icons.person),
                _ligneInfo('Email', profil.email, Icons.email_outlined),

                const Divider(height: 30),

                const Text(
                  'Profil professionnel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _ligneInfo(
                  'Profession',
                  profil.profession,
                  Icons.work_outline,
                ),
                _ligneInfo(
                  'Expérience',
                  profil.experience == null
                      ? ''
                      : '${profil.experience} an(s)',
                  Icons.timeline,
                ),
                _ligneInfo(
                  'TJM',
                  profil.tjm == null ? '' : '${profil.tjm} DT',
                  Icons.payments_outlined,
                ),
                _ligneInfo(
                  'Biographie',
                  profil.biographie,
                  Icons.description_outlined,
                ),

                const Divider(height: 30),

                FormField<bool>(
                  initialValue: false,
                  validator: (value) {
                    if (value != true) {
                      return 'Vous devez accepter les conditions.';
                    }
                    return null;
                  },
                  builder: (field) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          value: _conditionsAcceptees,
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'J’accepte les conditions d’utilisation.',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _conditionsAcceptees = value ?? false;
                            });
                            field.didChange(value);
                          },
                        ),
                        if (field.hasError)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _confirmerInscription,
                  icon: const Icon(Icons.check),
                  label: const Text('Confirmer l’inscription'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A8CC),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
