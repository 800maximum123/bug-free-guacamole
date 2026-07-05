/datum/robolimb/bishop/knight
	company = "Bishop Knight"
	desc = "This limb has a polished metallic casing and a holographic face emitter."
	icon = 'mods/_fd/fd_assets/icons/ipc/r_ind_bishop.dmi'
	has_eyes = FALSE
	unavailable_at_fab = 1

/datum/robolimb/bishop/alt/selen
	company = "Bishop Selen"
	desc = "A seamless white monoplane covers the majority of the head, concealing various optic sensors."
	icon = 'mods/_fd/fd_assets/icons/ipc/selen.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1

/datum/robolimb/bishop/alt/sienna
	company = "Bishop Sienna"
	desc = "A delicate-looking head covered in eight state-of-the-art optic sensors."
	icon = 'mods/_fd/fd_assets/icons/ipc/sienna.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1

/datum/robolimb/bishop/alt/siseyo
	company = "Bishop Siseyo"
	desc = "A sleek vertical gap in the head opens up to allow various optical sensors, running lights and slots for additional modules."
	icon = 'mods/_fd/fd_assets/icons/ipc/siseyo.dmi'
	applies_to_part = list(BP_HEAD)
	unavailable_at_fab = 1

/datum/robolimb/morpheus/nexus
	company = "Morpheus Nexus"
	desc = "This limb is simple and functional; no effort has been made to make it look human."
	icon = 'mods/_fd/fd_assets/icons/ipc/r_machine.dmi'
	unavailable_at_fab = 1
	has_eyes = FALSE
	allowed_bodytypes = list(SPECIES_IPC)
	has_screen = TRUE

/datum/robolimb/morpheus/hoplan
	company = "Morpheus Hoplan"
	desc = "A refined helmet with an industrial lean. Extra plating seems to be applied to the top surface while the rest of the head features \
			small breaks in the armor and running lights. A polished screen hides four optic sensors behind a display."
	allowed_bodytypes = list(SPECIES_IPC)
	unavailable_at_fab = 1
	has_eyes = FALSE
	icon = 'mods/_fd/fd_assets/icons/ipc/hoplan.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/morpheus/indricus
	company = "Morpheus Indricus"
	desc = "One lens-like eye dominates this style of head, with a camera like adjustable segment, this head is entirely encased with no seams or \
			crevices bar service hatches."
	allowed_bodytypes = list(SPECIES_IPC)
	unavailable_at_fab = 1
	has_eyes = FALSE
	icon = 'mods/_fd/fd_assets/icons/ipc/indricus.dmi'
	applies_to_part = list(BP_HEAD)

/datum/robolimb/morpheus/raxus
	company = "Morpheus Raxus"
	desc = "Imposing and bold, this angled helmet features a collection of small pin-prick optic sensors to make up for its lack of inherent eyes. \
			The top of the head extends outward, where the thinner point meets halfway down the face before extending in to a similarly wide jaw, \
			giving the head a shape almost like an cubic hourglass."
	allowed_bodytypes = list(SPECIES_IPC)
	unavailable_at_fab = 1
	has_eyes = FALSE
	icon = 'mods/_fd/fd_assets/icons/ipc/raxus.dmi'
	applies_to_part = list(BP_HEAD)
