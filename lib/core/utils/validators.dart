class Validators {
  Validators._();

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return '● Title is required';
    }
    return null;
  }

  static String? validateBody(String? value) {
    if (value == null || value.isEmpty) {
      return '● Body is required';
    }
    return null;
  }

  static String? validateField(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '● $fieldName is required';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return '● First name is required';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return '● Last name is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '● Email address is required';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return '● Please enter a valid email address';
    }
    return null;
  }

  static String? validateSignInEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '● Email address is required';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    }

    return null;
  }

  static String? validateSignInPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '● Password is required';
    }
    if (value.length < 3) {
      return '● Password must be at least 3 characters long';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '● Password is required';
    }
    if (value.length < 8) {
      return '● Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return '● Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return '● Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return '● Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return '● Password must contain at least one special character';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (password.isEmpty ) {
      return '● Password is required ';
    }
    if (confirmPassword.isEmpty) {
      return '● Confirm Password is required';
    }

    if (password != confirmPassword) {
      return '● Passwords do not match';
    }

    if (password.length < 6 || confirmPassword.length < 6) {
      return '● Password must be at least 6 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password) ||
        !RegExp(r'[A-Z]').hasMatch(confirmPassword)) {
      return '● Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password) ||
        !RegExp(r'[a-z]').hasMatch(confirmPassword)) {
      return '● Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(password) ||
        !RegExp(r'[0-9]').hasMatch(confirmPassword)) {
      return '● Password must contain at least one digit';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password) ||
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(confirmPassword)) {
      return '● Password must contain at least one special character';
    }

    return null;
  }

  static validatePasswords(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return '● Password is required';
    }
    if (password != confirmPassword) {
      return '● Passwords do not match';
    }
  }
}
