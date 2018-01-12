
;   __ Binds ____________________________________
	
	/*
	iteration := 2
	Loop
	{
		if (iteration > spellCnt)
			break
		b_spell%iteration%:
			UseSpell(%iteration%, spellCnt, spell%iteration%, spell%iteration%_hold, spell%iteration%_UP, spell%iteration%_hand, spell%iteration%_typeOverride)
			Return
		b_spell%iteration%a:
			UseSpell(%iteration%, spellCnt, spell%iteration%a, spell%iteration%a_hold, spell%iteration%a_UP, spell%iteration%a_hand, spell%iteration%a_typeOverride)
			Return
		
		iteration++
	}
	
	iteration := 1
	Loop
	{
		if (iteration > spellCnt)
			break
		b_item%iteration%:
			UseItem(%iteration%, itemCnt, item%iteration%)
			Return	
		b_item%iteration%a:
			UseItem(%iteration%, itemCnt, item%iteration%a)
			Return
		
		iteration++
	}
	*/
	
	
	b_spell1:
		UseSpell("1", spellCnt, spell1, spell1_hold, spell1_UP, spell1_hand, spell1_typeOverride)
		Return
	b_spell1a:
		UseSpell("1", spellCnt, spell1a, spell1a_hold, spell1a_UP, spell1a_hand, spell1a_typeOverride)
		Return
	
	b_spell2:
		UseSpell("2", spellCnt, spell2, spell2_hold, spell2_UP, spell2_hand, spell2_typeOverride)
		Return	
	b_spell2a:
		UseSpell("2", spellCnt, spell2a, spell2a_hold, spell2a_UP, spell2a_hand, spell2a_typeOverride)
		Return
	
	b_spell3:
		UseSpell("3", spellCnt, spell3, spell3_hold, spell3_UP, spell3_hand, spell3_typeOverride)
		Return	
	b_spell3a:
		UseSpell("3", spellCnt, spell3a, spell3a_hold, spell3a_UP, spell3a_hand, spell3a_typeOverride)
		Return

	b_spell4:
		UseSpell("4", spellCnt, spell4, spell4_hold, spell4_UP, spell4_hand, spell4_typeOverride)
		Return	
	b_spell4a:
		UseSpell("4", spellCnt, spell4a, spell4a_hold, spell4a_UP, spell4a_hand, spell4a_typeOverride)
		Return

	b_spell5:
		UseSpell("5", spellCnt, spell5, spell5_hold, spell5_UP, spell5_hand, spell5_typeOverride)
		Return	
	b_spell5a:
		UseSpell("5", spellCnt, spell5a, spell5a_hold, spell5a_UP, spell5a_hand, spell5a_typeOverride)
		Return

	b_spell6:
		UseSpell("6", spellCnt, spell6, spell6_hold, spell6_UP, spell6_hand, spell6_typeOverride)
		Return	
	b_spell6a:
		UseSpell("6", spellCnt, spell6a, spell6a_hold, spell6a_UP, spell6a_hand, spell6a_typeOverride)
		Return

	b_spell7:
		UseSpell("7", spellCnt, spell7, spell7_hold, spell7_UP, spell7_hand, spell7_typeOverride)
		Return	
	b_spell7a:
		UseSpell("7", spellCnt, spell7a, spell7a_hold, spell7a_UP, spell7a_hand, spell7a_typeOverride)
		Return

	b_spell8:
		UseSpell("8", spellCnt, spell8, spell8_hold, spell8_UP, spell8_hand, spell8_typeOverride)
		Return	
	b_spell8a:
		UseSpell("8", spellCnt, spell8a, spell8a_hold, spell8a_UP, spell8a_hand, spell8a_typeOverride)
		Return

	b_spell9:
		UseSpell("9", spellCnt, spell9, spell9_hold, spell9_UP, spell9_hand, spell9_typeOverride)
		Return	
	b_spell9a:
		UseSpell("9", spellCnt, spell9a, spell9a_hold, spell9a_UP, spell9a_hand, spell9a_typeOverride)
		Return

	b_spell10:
		UseSpell("10", spellCnt, spell10, spell10_hold, spell10_UP, spell10_hand, spell10_typeOverride)
		Return	
	b_spell10a:
		UseSpell("10", spellCnt, spell10a, spell10a_hold, spell10a_UP, spell10a_hand, spell10a_typeOverride)
		Return
		
	b_item1:
		UseItem("1", itemCnt, item1)
		Return	
	b_item1a:
		UseItem("1", itemCnt, item1a)
		Return
	
	b_item2:
		UseItem("2", itemCnt, item2)
		Return	
	b_item2a:
		UseItem("2", itemCnt, item2a)
		Return
	
	b_item3:
		UseItem("3", itemCnt, item3)
		Return	
	b_item3a:
		UseItem("3", itemCnt, item3a)
		Return
	
	b_item4:
		UseItem("4", itemCnt, item4)
		Return	
	b_item4a:
		UseItem("4", itemCnt, item4a)
		Return
	
	b_item5:
		UseItem("5", itemCnt, item5)
		Return	
	b_item5a:
		UseItem("5", itemCnt, item5a)
		Return
	
	b_item6:
		UseItem("6", itemCnt, item6)
		Return	
	b_item6a:
		UseItem("6", itemCnt, item6a)
		Return
	
	b_item7:
		UseItem("7", itemCnt, item7)
		Return	
	b_item7a:
		UseItem("7", itemCnt, item7a)
		Return
	
	b_item8:
		UseItem("8", itemCnt, item8)
		Return	
	b_item8a:
		UseItem("8", itemCnt, item8a)
		Return
	
	b_item9:
		UseItem("9", itemCnt, item9)
		Return	
	b_item9a:
		UseItem("9", itemCnt, item9a)
		Return
	
	b_item10:
		UseItem("10", itemCnt, item10)
		Return	
	b_item10a:
		UseItem("10", itemCnt, item10a)
		Return