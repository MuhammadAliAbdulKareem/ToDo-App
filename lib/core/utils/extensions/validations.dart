extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

extension NameValidator on String {
  bool isValidName() {
    return RegExp(
            r'^[a-zA-Z\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDCF\uFDF0-\uFDFF\uFE70-\uFEFF\u1EE00-\u1EEFF\u2E80-\u2FD5\u2FE0-\u2FEF\u2FF0-\u2FFF\u3000-\u303F\u3100-\u312F\u3200-\u32FF\u3300-\u33FF\u3400-\u4DBF\u4DC0-\u4DFF\u4E00-\u9FFF\uA000-\uA48F\uA490-\uA4CF\uA500-\uA60F\uA610-\uA61F\uA62A-\uA62B\uA66E-\uA6E8\uA700-\uA716\uA720-\uA721\uA728-\uA73B\uA74A-\uA74E\uA800-\uA82B\uA840-\uA873\uAA00-\uAA36\uAA40-\uAA4B\uAA60-\uAA6F\uAC00-\uD7A3\uD800-\uDFFF\uF900-\uFAFF\uFE10-\uFE1F\uFE30-\uFE52\uFE54-\uFE66\uFE68-\uFE6B\uFF00-\uFF60\uFFF0-\uFFFD]*$')
        .hasMatch(this);
  }
}
