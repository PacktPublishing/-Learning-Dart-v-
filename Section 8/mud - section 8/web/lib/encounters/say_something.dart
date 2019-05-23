part of mud;

class SaySomething {

  final int NO_WORDS = 5;	// These constants must be static
  final int NO_SENTS = 20;	// if they are going to be used in
  final String SPACE = " ";	// a static method like main().
  final String PERIOD = ".";

  static Random r = new Random();

  String sentence(){
        List<String> article = ["the", "a", "one", "some", "any"];
        List<String> noun = ["creature", "villian", "creep", "encounter", "car"];
        List<String> verb = ["drove", "jumped", "ran", "walked", "skipped"];
        List<String> preposition = ["to", "from", "over", "under", "on"];

        String sentence;
        for (int i = 0; i < NO_SENTS; i++){
            sentence = article[rand()];
            var c = sentence[0];
            sentence = sentence.replaceAll( c, c.toUpperCase() );
            sentence += SPACE + noun[rand()] + SPACE;
            sentence += (verb[rand()] + SPACE + preposition[rand()]);
            sentence += (SPACE + article[rand()] + SPACE + noun[rand()]);
            sentence += PERIOD;
        }
        return "It says: '$sentence'";
  }

  int rand(){
      int ri = r.nextInt(5) % NO_WORDS;
      if ( ri < 0 ) {ri += NO_WORDS;}
      return ri;
  }
}
