class ContentFilter {
  static final RegExp _nonWordRegex = RegExp(r'[^\w\s]');
  static final Map<String, String> _filterMap = {
    // Gender
    'ibne': '****',
    'nonoş': '*****',
    'karı': '****',
    'yelloz': '******',
    'ahlaksız': '********',
    'sapık': '*****',
    'gay': '***',
    'faggot': '******',
    'dyke': '****',
    'tranny': '******',
    'sissy': '*****',
    'queer': '*****',
    'homo': '****',

    // Racist
    'zenci': '*****',
    'kara': '****',
    'çingene': '*******',
    'yahudi': '******',
    'nigger': '******',
    'chink': '*****',
    'gypsy': '*****',
    'kike': '****',
    'wetback': '*******',

    // Religious
    'kafir': '*****',
    'gavur': '*****',
    'dinsiz': '******',
    'imansız': '*******',
    'infidel': '*******',
    'heathen': '*******',

    // Physical and Mental
    'şişko': '*****',
    'topal': '*****',
    'kör': '***',
    'sağır': '*****',
    'özürlü': '******',
    'fatso': '*****',
    'cripple': '*******',
    'retard': '******',
    'spaz': '****',

    // Socio-Economic
    'fakir': '*****',
    'amele': '*****',
    'köylü': '*****',
    'pauper': '******',
    'redneck': '*******',
    'hillbilly': '*********',

    // General Cursed Words
    'aptal': '*****',
    'salak': '*****',
    'gerizekalı': '**********',
    'ahmak': '*****',
    'stupid': '******',
    'idiot': '*****',
    'fool': '****',
    'dumb': '****',
    'moron': '*****',
  };

  static final RegExp _combinedRegex = RegExp(
    _filterMap.keys.map((word) => r'\b' + word + r'\b').join('|'),
    caseSensitive: false,
    unicode: true,
  );

  static String filterContent(String content) {
    // Delete special characters
    content = content.replaceAll(_nonWordRegex, '');

    // Filtering Action
    return content.replaceAllMapped(_combinedRegex, (match) {
      String word = match.group(0)!.toLowerCase();
      return _filterMap[word] ?? match.group(0)!;
    });
  }
}
