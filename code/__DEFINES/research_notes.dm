// Defines for research notes & species value

// Value of research notes for dissection on humans and subtypes
#define RNOTE_VALUE_BASIC 500
#define RNOTE_VALUE_MONKEY 500
#define RNOTE_VALUE_HUMAN 1000
#define RNOTE_VALUE_GOLEM 1250
#define RNOTE_VALUE_ABDUCTOR 5000
#define RNOTE_VALUE_XENO 10000

// Value of research notes for other activities
#define RNOTE_ANOMALY_REFINED 2000 // easily repeated if you've already got it set up

// How much you get by printing notes from the biogen
#define RNOTE_BIOGEN_REWARD /obj/item/research_notes/p250 // has to be a typepath because of how the biogen works
// Research notes cost in biomass
#define RNOTE_BIOGEN_REWARD_COST 500

// Chance of acquiring research notes from baking something
#define RNOTE_BAKING_CHANCE 10 // % chance
// Amount acquired from baking
#define RNOTE_BAKING_REWARD 400

// Same as above but for successful griddle cooking
#define RNOTE_GRIDDLE_CHANCE 10 // % chance
#define RNOTE_GRIDDLE_REWARD 300

#define RNOTE_FOODPROCESSOR_CHANCE 10 // % chance
#define RNOTE_FOODPROCESSOR_REWARD 400

// Research points acquired as a byproduct of mining points in the ore redemption machine
#define RNOTE_ORM_MULT 0.25

// Generic value for research notes acquired by finishing surgeries
#define RNOTE_SURGICAL_REWARD 100
#define RNOTE_SURGICAL_REWARD_UNCOMMON 400

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
