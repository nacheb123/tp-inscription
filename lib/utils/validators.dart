
class Validators {
  static String? nom(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le nom est obligatoire';
    }
    if (value.trim().length < 2) {
      return 'Le nom doit contenir au moins 2 caractères';
    }
    return null;
  }

  static String? prenom(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le prénom est obligatoire';
    }
    if (value.trim().length < 2) {
      return 'Le prénom doit contenir au moins 2 caractères';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'L’email est obligatoire';
    }
    final pattern = RegExp(r'^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$');
    if (!pattern.hasMatch(value.trim())) {
      return 'Veuillez saisir un email valide';
    }
    return null;
  }

  static String? motDePasse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est obligatoire';
    }
    if (value.length < 8) {
      return '8 caractères minimum';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Ajoutez au moins une majuscule';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Ajoutez au moins un chiffre';
    }
    return null;
  }

  static String? confirmation(
    String? value,
    String motDePasse,
  ) {
    if (value == null || value.isEmpty) {
      return 'Confirmez le mot de passe';
    }
    if (value != motDePasse) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  static String? profession(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'La profession est obligatoire';
    }
    if (value.trim().length < 2) {
      return '2 caractères minimum';
    }
    return null;
  }

  static String? experience(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'L’expérience est obligatoire';
    }
    final nombre = int.tryParse(value.trim());
    if (nombre == null || nombre < 0 || nombre > 50) {
      return 'Entrez un nombre entre 0 et 50';
    }
    return null;
  }

  static String? tjm(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le TJM est obligatoire';
    }
    final nombre = double.tryParse(value.trim().replaceAll(',', '.'));
    if (nombre == null || nombre < 50 || nombre > 3000) {
      return 'Entrez un montant entre 50 et 3000';
    }
    return null;
  }

  static String? biographie(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    if (value.trim().length < 20) {
      return 'La biographie doit contenir 20 caractères minimum';
    }
    if (value.trim().length > 300) {
      return '300 caractères maximum';
    }
    return null;
  }
}
