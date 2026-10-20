
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_inscription/utils/validators.dart';

void main() {
  group('Tests des validateurs', () {
    test('Nom valide', () {
      expect(Validators.nom('Ranim'), isNull);
    });

    test('Nom vide invalide', () {
      expect(Validators.nom(''), isNotNull);
    });

    test('Prénom valide', () {
      expect(Validators.prenom('Amira'), isNull);
    });

    test('Prénom vide invalide', () {
      expect(Validators.prenom(''), isNotNull);
    });

    test('Email valide', () {
      expect(Validators.email('ranim@gmail.com'), isNull);
    });

    test('Email invalide', () {
      expect(Validators.email('ranimgmail.com'), isNotNull);
    });

    test('Mot de passe valide', () {
      expect(Validators.motDePasse('Ranim123'), isNull);
    });

    test('Mot de passe trop court invalide', () {
      expect(Validators.motDePasse('Ra1'), isNotNull);
    });

    test('Mot de passe sans majuscule invalide', () {
      expect(Validators.motDePasse('ranim123'), isNotNull);
    });

    test('Confirmation correcte', () {
      expect(
        Validators.confirmation('Ranim123', 'Ranim123'),
        isNull,
      );
    });

    test('Confirmation incorrecte', () {
      expect(
        Validators.confirmation('Ranim456', 'Ranim123'),
        isNotNull,
      );
    });

    test('Profession valide', () {
      expect(Validators.profession('Développeuse'), isNull);
    });

    test('Profession vide invalide', () {
      expect(Validators.profession(''), isNotNull);
    });

    test('Expérience valide', () {
      expect(Validators.experience('3'), isNull);
    });

    test('Expérience invalide', () {
      expect(Validators.experience('75'), isNotNull);
    });

    test('Expérience non numérique invalide', () {
      expect(Validators.experience('abc'), isNotNull);
    });

    test('TJM valide', () {
      expect(Validators.tjm('200'), isNull);
    });

    test('TJM avec virgule valide', () {
      expect(Validators.tjm('350,50'), isNull);
    });

    test('TJM trop bas invalide', () {
      expect(Validators.tjm('25'), isNotNull);
    });

    test('TJM trop élevé invalide', () {
      expect(Validators.tjm('3500'), isNotNull);
    });

    test('Biographie vide acceptée', () {
      expect(Validators.biographie(''), isNull);
    });

    test('Biographie trop courte invalide', () {
      expect(Validators.biographie('Je code.'), isNotNull);
    });

    test('Biographie suffisamment longue valide', () {
      expect(
        Validators.biographie(
          'Je suis étudiante en informatique.',
        ),
        isNull,
      );
    });
  });
}

