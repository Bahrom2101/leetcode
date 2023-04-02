void main(List<String> args) {
  print(myAtoi('+-247'));
  print(myAtoi('00 4'));
  print(myAtoi('  -41'));
  print(myAtoi('ws456'));
  print(myAtoi('-00 234'));
  print(myAtoi('345 56t'));
}

int myAtoi(String s) {
  // Read in and ignore any leading whitespace.
  int i = 0;
  while (i < s.length && s[i] == ' ') {
    i++;
  }

  // Check if the next character (if not already at the end of the string) is '-' or '+'.
  int sign = 1;
  if (i < s.length && (s[i] == '-' || s[i] == '+')) {
    sign = s[i] == '-' ? -1 : 1;
    i++;
  }

  // Read in next the characters until the next non-digit character or the end of the input is reached.
  int result = 0;
  while (i < s.length && isDigit(s[i])) {
    int digit = int.parse(s[i]);
    // Check for overflow/underflow.
    if (result > (2147483647 - digit) / 10) {
      return sign == 1 ? 2147483647 : -2147483648;
    }
    result = result * 10 + digit;
    i++;
  }

  // Change the sign as necessary (from step 2).
  return sign * result;
}

bool isDigit(String char) {
  return char == '0' ||
          char == '1' ||
          char == '2' ||
          char == '3' ||
          char == '4' ||
          char == '5' ||
          char == '6' ||
          char == '7' ||
          char == '8' ||
          char == '9'
      ? true
      : false;
}
