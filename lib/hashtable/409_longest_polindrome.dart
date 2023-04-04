void main() {
  print(longestPalindrome(
      "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"));
}

int longestPalindrome(String s) {
  Map<String, int> map = {};
  for (int i = 0; i < s.length; i++) {
    if (map[s[i]] == null) {
      map[s[i]] = 1;
    } else {
      map[s[i]] = map[s[i]]! + 1;
    }
  }
  int sumEven = 0;
  bool hasOdd = false;
  map.forEach((key, value) {
    if (value % 2 == 0) {
      sumEven += value;
    } else {
      sumEven += value - 1;
      hasOdd = true;
    }
  });
  return sumEven + (hasOdd ? 1 : 0);
}
