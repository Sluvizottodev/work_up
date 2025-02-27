class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha não pode estar vazia.';
    }

    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    // Verifica se a senha contém pelo menos uma letra maiúscula
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula.';
    }

    // Verifica se a senha contém pelo menos um número
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'A senha deve conter pelo menos um número.';
    }

    // Verifica se a senha contém pelo menos um caractere especial (opcional)
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'A senha deve conter pelo menos um caractere especial.';
    }

    return null; // Retorna null se a senha for válida
  }
}