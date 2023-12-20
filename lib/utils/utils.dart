String? validateField(String value, String? msg) {
  if (value == null || value.isEmpty) {
    return msg;
  } else {
    return null;
  }
}


String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  }
  // Regular expression for email validation
  // You can modify this pattern according to your needs
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}