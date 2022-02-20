 validateNumber(String value, String message) {
  Pattern pattern = r'^[0-9]+$';
  if(value[0]!='5'){
    return "يجب ان يبدا رقم الجوال ب5";
  }
  if(value.length!=9){
    return " يجب ان يكون 9 ارقام ";
  }
  RegExp regex = new RegExp(pattern.toString());
  if (!regex.hasMatch(value)) return message;
  return null;
}

  validatePassword(String value, String message) {
   Pattern pattern = r'^.{6,}$';
   RegExp regex = new RegExp(pattern.toString());
   if (!regex.hasMatch(value)) return message;
   return null;
 }
  validateConfirmPassword(
     String value, String other, String message, String compareMessage) {
   Pattern pattern = r'^.{6,}$';
   RegExp regex = new RegExp(pattern.toString());
   if (!regex.hasMatch(value)) return message;
   return value == other ? null : compareMessage;
 }

  validateEmail(String value, String message) {
   Pattern pattern =
       r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   RegExp regex = new RegExp(pattern.toString());
   if (!regex.hasMatch(value)) return message;
   return null;
 }