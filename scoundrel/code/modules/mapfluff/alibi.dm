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
