class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'O email não pode estar vazio.';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um email válido.';
    }

    return null;
  }
}