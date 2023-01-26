/obj/item/paper/fluff/alibipouch
	name = "\proper alibi instructions"
	default_raw_text = "Life as an independent on the frontier means looking out for yourself \
	and the people around you. You won't find many people willing to judiciously solve disputes or arrest someone \
	without evidence. As such, you're encouraged to employ these tools to protect your alibi and settle without a doubt \
	the presence of dangerous behavior. <br><br>\
	\
	The camera can be used to collect visual evidence. Photos can be labeled with a pen and stored in the folder provided. \
	Photos can also be scanned directly by your PDA and sent to another individual via text message. <br><br> \
	\
	The tape-recorder can be used to record up to 10 minutes of audio on either side of the preloaded tape, and a full text transcript \
	can be printed for ease of distribution. More tapes can be printed at an autolathe. Transcripts can also be stored in the \
	folder provided. <br><br> \
	\
	The hand-labeler can be used to identify objects as personal belongings, and the labels are difficult to remove. \
	Cautious individuals may want to label anything that someone might want to steal. <br><br> \
	\
	Remember: out here, the people around you are all you've got. Look out for each other."

/obj/item/folder/alibipouch

/obj/item/folder/alibipouch/Initialize(mapload)
	. = ..()
	new /obj/item/paper/fluff/alibipouch(src)
	update_appearance()

/obj/item/paper/fluff/traitor_firstaid
	name = "\proper treatment instructions"
	default_raw_text = "\
	BLEEDING TREATMENT <br>\
	1. Use Atropine injector <br>\
	2. Apply Synthflesh patch <br>\
	3. Apply gauze to wounds <br>\
	4. Take a Pentetic-Acid pill <br>\
	5. Take an iron pill as necessary. <br><br>\
	\
	TOXIN TREATMENT <br>\
	1. Take a Pentetic-Acid pill <br><br>\
	\
	BRUTE/BURN TREATMENT <br>\
	1. Apply Synthflesh patch <br>\
	2. Take a Pentetic-Acid pill <br><br>\
	\
	EMBEDDED OBJECT TREATMENT <br>\
	1. Target the embedded location <br>\
	2. Apply hemostat to carefully remove <br><br>\
	\
	SUFFOCATION TREATMENT <br>\
	1. Use Atropine injector <br>\
	2. Take an iron pill if blood levels are low <br>"

/obj/item/paper/fluff/poison_kit_guide
	name = "\proper how to poison large animals"
	default_raw_text = "\
	LETHAL <br>\
	5u Curare <br>\
	5u Coniine <br>\
	5u Initropidril <br><br>\
	\
	KNOCKOUT <br>\
	5u Sodium Thiopental <br>\
	10u Fentanyl <br><br>"
