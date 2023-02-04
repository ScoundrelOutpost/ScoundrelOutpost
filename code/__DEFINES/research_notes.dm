// Defines for research notes & species value

// Value of research notes for humans and subtypes
#define RNOTE_VALUE_BASIC 500
#define RNOTE_VALUE_MONKEY 500
#define RNOTE_VALUE_HUMAN 1000
#define RNOTE_VALUE_GOLEM 1250
#define RNOTE_VALUE_ABDUCTOR 5000
#define RNOTE_VALUE_XENO 10000


// Multiplier for cash provided when research notes are turned in
#define RNOTE_CASH_MULT 0.1
// Creates some variance in how much of a reward you get, to break up the monotony
#define RNOTE_CASH_RANDOMIZER (rand(9000, 11000) / 10000)

GLOBAL_LIST_INIT(rnote_descriptor, sort_list(list(
		"exotic physics",
		"unusual biology",
		"unforeseen thermodynamic principles",
		"the nature of magnets",
		"dark matter",
		"psionic theory",
		"matter-energy conversion",
		"entropic theory",
		"the nature of life",
)))
