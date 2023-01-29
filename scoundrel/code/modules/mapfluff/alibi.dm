// rename this file to generic fluff

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

/obj/item/paper/fluff/leadership_assignment
	name = "\proper your responsibility"
	default_raw_text = "\
	You have been entrusted with a spare leadership ID, granting access to the bridge and the \
	detective's office. The crew is depending on you to \
	make the right call with it. No one having bridge access in an emergency can be as dangerous as \
	letting it fall into the wrong hands. <br><br> \
	\
	You've been provided a command remote and a stethoscope to extract the master keycard \
	from the vault's safe, if necessary. <br><br> \
	\
	Additionally, a spare access inscriber has been included to repair or modify restrictions on \
	airlocks and devices."

/obj/item/paper/fluff/turbine_instructions
	name = "\proper turbine setup procedure"
	default_raw_text = "\
	The turbine produces power when the inlet compressor is exposed to high pressures, which is usually done \
	by igniting the burn chamber. The basic procedure for this goes as follows: <br><br> \
	\
	Pipe a mix of oxygen and plasma into the burn chamber with a ratio of 70:30 <br><br> \
	Set burn chamber scrubbers to extract anything that isn't plasma & oxygen <br><br> \
	Activate the power on the outlet gas filters, ensure they're not filtering anything out (It should all be going into space) <br><br> \
	Ignite <br><br> \
	Ensure there's a cable connected under the turbine core rotor <br><br> \
	Use a multitool on the turbine to add a link to the buffer, then use it on the turbine control console to link <br><br> \
	Turn the turbine on via the turbine control console <br><br> \
	Adjust the turbine's input pressure via pipes and intake regular via the turbine control console <br><br> \
	Or don't, that part doesn't really matter"
