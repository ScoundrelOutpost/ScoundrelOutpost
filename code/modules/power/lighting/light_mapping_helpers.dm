/obj/machinery/light/broken
	status = LIGHT_BROKEN
	icon_state = "tube-broken"

/obj/machinery/light/built
	icon_state = "tube-empty"
	start_with_cell = FALSE

/obj/machinery/light/built/Initialize(mapload)
	. = ..()
	status = LIGHT_EMPTY
	update(0)

/obj/machinery/light/no_nightlight
	nightshift_enabled = FALSE

/obj/machinery/light/warm
	bulb_colour = "#fae5c1"

/obj/machinery/light/warm/no_nightlight
	nightshift_allowed = FALSE

/obj/machinery/light/cold
	bulb_colour = "#deefff"
	nightshift_light_color = "#deefff"

/obj/machinery/light/cold/no_nightlight
	nightshift_allowed = FALSE

/*/obj/machinery/light/red
	bulb_colour = "#FF3232"
//	nightshift_allowed = FALSE
	no_low_power = TRUE*/ // moved down

/obj/machinery/light/red/dim
	brightness = 4
	bulb_power = 0.7

/obj/machinery/light/blacklight
	bulb_colour = "#A700FF"
	nightshift_allowed = FALSE
	brightness = 8

/obj/machinery/light/dim
	nightshift_allowed = FALSE
	bulb_colour = "#FFDDCC"
	bulb_power = 0.6

// the smaller bulb light fixture

/obj/machinery/light/small
	icon_state = "bulb"
	base_state = "bulb"
	fitting = "bulb"
	brightness = 4
	nightshift_brightness = 4
	bulb_colour = "#FFD6AA"
	desc = "A small lighting fixture."
	light_type = /obj/item/light/bulb

/obj/machinery/light/small/broken
	status = LIGHT_BROKEN
	icon_state = "bulb-broken"

/obj/machinery/light/small/built
	icon_state = "bulb-empty"
	start_with_cell = FALSE

/obj/machinery/light/small/built/Initialize(mapload)
	. = ..()
	status = LIGHT_EMPTY
	update(0)

/obj/machinery/light/small/red
	bulb_colour = "#FF3232"
	no_low_power = TRUE
//	nightshift_allowed = FALSE

/obj/machinery/light/small/red/dim
	brightness = 2
	bulb_power = 0.8

/obj/machinery/light/small/blacklight
	bulb_colour = "#A700FF"
	nightshift_allowed = FALSE
	brightness = 4

// -------- Directional presets
// The directions are backwards on the lights we have now
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light, 0)

// ---- Broken tube
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/broken, 0)

// ---- Tube construct
MAPPING_DIRECTIONAL_HELPERS(/obj/structure/light_construct, 0)

// ---- Tube frames
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/built, 0)

// ---- No nightlight tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/no_nightlight, 0)

// ---- Warm light tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/warm, 0)

// ---- No nightlight warm light tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/warm/no_nightlight, 0)

// ---- Cold light tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/cold, 0)

// ---- No nightlight cold light tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/cold/no_nightlight, 0)

// ---- Red tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/red, 0)

// ---- Red dim tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/red/dim, 0)

// ---- Blacklight tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/blacklight, 0)

// ---- Dim tubes
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/dim, 0)


// -------- Bulb lights
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small, 0)

// ---- Bulb construct
MAPPING_DIRECTIONAL_HELPERS(/obj/structure/light_construct/small, 0)

// ---- Bulb frames
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/built, 0)

// ---- Broken bulbs
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/broken, 0)

// ---- Red bulbs
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/red, 0)

// ---- Red dim bulbs
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/red/dim, 0)

// ---- Blacklight bulbs
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/blacklight, 0)

// scoundrel content
/obj/machinery/light/blue
	bulb_colour = "#5252FF"
	bulb_emergency_colour = "#5252FF"
	bulb_low_power_colour = "#5252FF"
	nightshift_light_color = "#5252FF"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/blue, 0)

/obj/machinery/light/orange
	bulb_colour = "#FF6A00"
	bulb_emergency_colour = "#FF6A00"
	bulb_low_power_colour = "#FF6A00"
	nightshift_light_color = "#FF6A00"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/orange, 0)

/obj/machinery/light/cyan
	bulb_colour = "#00FFFF"
	bulb_emergency_colour = "#00FFFF"
	bulb_low_power_colour = "#00FFFF"
	nightshift_light_color = "#00FFFF"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/cyan, 0)

/obj/machinery/light/fuschia
	bulb_colour = "#FF006E"
	bulb_emergency_colour = "#FF006E"
	bulb_low_power_colour = "#FF006E"
	nightshift_light_color = "#FF006E"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/fuschia, 0)

/obj/machinery/light/pink
	bulb_colour = "#FF60E9"
	bulb_emergency_colour = "#FF60E9"
	bulb_low_power_colour = "#FF60E9"
	nightshift_light_color = "#FF60E9"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/pink, 0)

/obj/machinery/light/yellow
	bulb_colour = "#FFD800"
	bulb_emergency_colour = "#FFD800"
	bulb_low_power_colour = "#FFD800"
	nightshift_light_color = "#FFD800"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/yellow, 0)

/obj/machinery/light/lime
	bulb_colour = "#B6FF00"
	bulb_emergency_colour = "#B6FF00"
	bulb_low_power_colour = "#B6FF00"
	nightshift_light_color = "#B6FF00"
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/lime, 0)

/obj/machinery/light/red
	bulb_colour = "#FF3232"
	bulb_emergency_colour = "#FF3232"
	bulb_low_power_colour = "#FF3232"
	nightshift_light_color = "#FF3232"


/obj/machinery/light/nightshift // permanent nightshift light
	nightshift_allowed = FALSE
/obj/machinery/light/nightshift/Initialize(mapload)
	. = ..()

	bulb_colour = nightshift_light_color
	bulb_power = (bulb_power * nightshift_light_power)
	brightness = nightshift_brightness

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/nightshift, 0)

/obj/machinery/light/small/nightshift // permanent nightshift light
	nightshift_allowed = FALSE
/obj/machinery/light/small/nightshift/Initialize(mapload)
	. = ..()

	bulb_colour = nightshift_light_color
	bulb_power = (bulb_power * nightshift_light_power)
	brightness = nightshift_brightness

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/nightshift, 0)

/obj/machinery/light/emergency // permanent emergency light
	nightshift_allowed = FALSE
/obj/machinery/light/emergency/Initialize(mapload)
	. = ..()

	bulb_colour = bulb_low_power_colour
	bulb_power = bulb_power * bulb_low_power_pow_mul
	brightness = brightness * bulb_low_power_brightness_mul
	bulb_low_power_brightness_mul = 1
	bulb_low_power_pow_mul = 1

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/emergency, 0)
