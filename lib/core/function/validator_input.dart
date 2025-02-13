import 'package:get/get.dart';

validatorInput(String input, int main, int max, String type) {
  if (type == "name") {
    if (!GetUtils.isUsername(input)) {
      return "not volid name";
    }
  }
  if (type == "txt") {
    if (!GetUtils.isTxt(input)) {
      return "not volid text";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(input)) {
      return "not voild email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(input)) {
      return "not voild phoen";
    }
  }
  if (type == "password") {
    if (!GetUtils.isPassport(input)) {
      return "not voild password";
    }
  }
  if (type.isEmpty) {
    return "can't be empty";
  }
  if (type.length < main) {
    return "can't be less then $main";
  }
  if (type.length > max) {
    return "can't be less then $max";
  }
}
