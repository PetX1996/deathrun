//I========================================================================I
//I                    ___  _____  _____                                   I
//I                   /   !!  __ \!  ___!                                  I
//I                  / /! !! !  \/! !_          ___  ____                  I
//I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//I                     !_/ \____/\_!     (_)  \___!/___!                  I
//I                                                                        I
//I========================================================================I
// Call of Duty 4: Modern Warfare
//I========================================================================I
// Mod      : Deathrun
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

public CUnlocksForPrestige(iPrestige)
{
	switch (iPrestige)
	{
		default:
			return;
	}
}

public CUnlocksForRankId(iRankId)
{
	switch (iRankId)
	{
		case 2:
			self C_ICUNLOCKS::CAlliesWeapon("beretta_mp");
			return;
		case 3:
			self C_ICUNLOCKS::CAlliesBody("body_complete_mp_russian_farmer");
			return;
		case 4:
			self C_ICUNLOCKS::CAlliesInvC("trail_blue_geo");
			return;
		case 5:
			self C_ICUNLOCKS::CAlliesInvA("specialty_fastreload");
			self C_ICUNLOCKS::CAlliesInvB("spray8");
			return;
		case 7:
			self C_ICUNLOCKS::CAlliesBody("body_complete_mp_zakhaev");
			return;
		case 8:
			self C_ICUNLOCKS::CAlliesWeapon("usp_mp");
			self C_ICUNLOCKS::CAlliesInvC("trail_gold_geo");
			return;
		case 9:
			self C_ICUNLOCKS::CAlliesInvB("spray9");
			return;
		case 10:
			self C_ICUNLOCKS::CAlliesInvA("specialty_rof");
			self C_ICUNLOCKS::CAxisInvA("perk_speed");
			return;
		case 11:
			self C_ICUNLOCKS::CAlliesBody("body_complete_mp_spetsnaz_boris");
			return;
		case 12:
			self C_ICUNLOCKS::CAlliesInvB("spray10");
			self C_ICUNLOCKS::CAlliesInvC("trail_green_geo");
			self C_ICUNLOCKS::CAxisBody("plr_bo_zom_mil_police");
			return;
		case 14:
			self C_ICUNLOCKS::CAlliesWeapon("colt45_mp");
			self C_ICUNLOCKS::CAlliesInvB("spray11");
			return;
		case 15:
			self C_ICUNLOCKS::CAlliesBody("playermodel_dnf_duke");
			self C_ICUNLOCKS::CAlliesInvA("specialty_extraammo");
			return;
		case 16:
			self C_ICUNLOCKS::CAlliesInvB("spray2");
			self C_ICUNLOCKS::CAlliesInvC("trail_red_geo");
			return;
		case 18:
			self C_ICUNLOCKS::CAlliesInvB("spray6");
			return;
		case 19:
			self C_ICUNLOCKS::CAlliesBody("playermodel_fifty_cent");
			return;
		case 20:
			self C_ICUNLOCKS::CAlliesWeapon("deserteagle_mp");
			self C_ICUNLOCKS::CAlliesInvA("specialty_bulletdamage");
			self C_ICUNLOCKS::CAlliesInvB("spray7");
			self C_ICUNLOCKS::CAlliesInvC("trail_white_geo");
			self C_ICUNLOCKS::CAxisWeapon("tomahawk_mp");
			return;
		case 22:
			self C_ICUNLOCKS::CAlliesInvB("spray1");
			return;
		case 24:
			self C_ICUNLOCKS::CAlliesBody("playermodel_deluca_bo2");
			self C_ICUNLOCKS::CAlliesInvB("spray3");
			return;
		case 25:
			self C_ICUNLOCKS::CAlliesInvA("specialty_bulletaccuracy");
			self C_ICUNLOCKS::CAxisBody("playermodel_css_badass_terrorist");
			self C_ICUNLOCKS::CAxisInvA("specialty_armorvest");
			return;
		case 26:
			self C_ICUNLOCKS::CAlliesWeapon("deserteaglegold_mp");
			self C_ICUNLOCKS::CAlliesInvB("spray5");
			return;
		case 28:
			self C_ICUNLOCKS::CAlliesInvB("spray4");
			self C_ICUNLOCKS::CAlliesInvC("trail_blue_pulse");
			return;
		case 29:
			self C_ICUNLOCKS::CAlliesBody("playermodel_handsome_bo2");
			return;
		case 30:
			self C_ICUNLOCKS::CAlliesInvA("perk_nightvision");
			self C_ICUNLOCKS::CAlliesInvB("spray0");
			return;
		case 32:
			self C_ICUNLOCKS::CAlliesWeapon("usp_silencer_mp");
			self C_ICUNLOCKS::CAlliesInvB("spray23");
			return;
		case 33:
			self C_ICUNLOCKS::CAlliesBody("playermodel_oleary_bo2");
			return;
		case 34:
			self C_ICUNLOCKS::CAlliesInvB("spray12");
			return;
		case 35:
			self C_ICUNLOCKS::CAlliesInvA("perk_fastrun");
			return;
		case 36:
			self C_ICUNLOCKS::CAlliesInvB("spray13");
			self C_ICUNLOCKS::CAlliesInvC("trail_gold_pulse");
			return;
		case 38:
			self C_ICUNLOCKS::CAlliesBody("Yuusha");
			self C_ICUNLOCKS::CAlliesWeapon("beretta_silencer_mp");
			self C_ICUNLOCKS::CAlliesInvB("spray15");
			return;
		case 40:
			self C_ICUNLOCKS::CAlliesInvA("perk_backstep");
			self C_ICUNLOCKS::CAlliesInvB("spray16");
			self C_ICUNLOCKS::CAxisBody("playermodel_castro_bo");
			self C_ICUNLOCKS::CAxisWeapon("gl_g3_mp");
			return;
		case 42:
			self C_ICUNLOCKS::CAlliesBody("playermodel_aot_novak_00_heavy");
			self C_ICUNLOCKS::CAlliesInvB("spray17");
			return;
		case 44:
			self C_ICUNLOCKS::CAlliesWeapon("colt45_silencer_mp");
			self C_ICUNLOCKS::CAlliesInvB("spray18");
			self C_ICUNLOCKS::CAlliesInvC("trail_green_pulse");
			return;
		case 45:
			self C_ICUNLOCKS::CAxisInvA("perk_enemyhp");
			return;
		case 46:
			self C_ICUNLOCKS::CAlliesInvB("spray19");
			return;
		case 47:
			self C_ICUNLOCKS::CAlliesBody("body_rosco_heavy");
			return;
		case 48:
			self C_ICUNLOCKS::CAlliesInvB("spray20");
			return;
		case 50:
			self C_ICUNLOCKS::CAlliesWeapon("colt44_mp");
			self C_ICUNLOCKS::CAlliesInvA("perk_rtd");
			self C_ICUNLOCKS::CAlliesInvB("spray21");
			return;
		case 51:
			self C_ICUNLOCKS::CAlliesBody("Eo");
			return;
		case 52:
			self C_ICUNLOCKS::CAlliesInvB("spray22");
			self C_ICUNLOCKS::CAlliesInvC("trail_red_pulse");
			return;
		case 54:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim0");
			return;
		case 55:
			self C_ICUNLOCKS::CAlliesBody("playermodel_aot_rosco_93_armor");
			self C_ICUNLOCKS::CAxisBody("playermodel_savimbi_bo2");
			return;
		case 56:
			self C_ICUNLOCKS::CAlliesWeapon("ak47_gl_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim1");
			return;
		case 58:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim2");
			return;
		case 59:
			self C_ICUNLOCKS::CAlliesBody("playermodel_mw3_exp_juggernaunt");
			return;
		case 60:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim3");
			self C_ICUNLOCKS::CAlliesInvC("trail_white_pulse");
			self C_ICUNLOCKS::CAxisWeapon("gl_ak47_mp");
			return;
		case 62:
			self C_ICUNLOCKS::CAlliesWeapon("m40a3_acog_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim4");
			return;
		case 64:
			self C_ICUNLOCKS::CAlliesBody("Yuusha_2");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim5");
			return;
		case 66:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim6");
			return;
		case 68:
			self C_ICUNLOCKS::CAlliesBody("playermodel_GTA_IV_NICO");
			self C_ICUNLOCKS::CAlliesWeapon("remington700_acog_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim7");
			self C_ICUNLOCKS::CAlliesInvC("trail_blue_spark");
			return;
		case 70:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim8");
			self C_ICUNLOCKS::CAxisBody("Tourrette");
			return;
		case 72:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim9");
			return;
		case 73:
			self C_ICUNLOCKS::CAlliesBody("playermodel_briggs_bo2");
			return;
		case 74:
			self C_ICUNLOCKS::CAlliesWeapon("m40a3_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim10");
			return;
		case 76:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim11");
			self C_ICUNLOCKS::CAlliesInvC("trail_color_geo");
			return;
		case 77:
			self C_ICUNLOCKS::CAlliesBody("playermodel_AoT_alice");
			return;
		case 78:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim12");
			return;
		case 80:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim13");
			self C_ICUNLOCKS::CAxisWeapon("gl_m4_mp");
			return;
		case 82:
			self C_ICUNLOCKS::CAlliesBody("playermodel_aot_novak_93");
			self C_ICUNLOCKS::CAlliesWeapon("remington700_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim14");
			return;
		case 84:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim15");
			self C_ICUNLOCKS::CAlliesInvC("trail_red_h_pulse");
			return;
		case 85:
			self C_ICUNLOCKS::CAxisBody("playermodel_baa_joker");
			return;
		case 86:
			self C_ICUNLOCKS::CAlliesBody("playermodel_ghost_recon");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim16");
			return;
		case 88:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim17");
			return;
		case 90:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim18");
			return;
		case 91:
			self C_ICUNLOCKS::CAlliesBody("playermodel_vin_diesel");
			self C_ICUNLOCKS::CAlliesWeapon("mp5_acog_mp");
			return;
		case 92:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim19");
			self C_ICUNLOCKS::CAlliesInvC("trail_white_rotor");
			return;
		case 94:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim20");
			return;
		case 95:
			self C_ICUNLOCKS::CAlliesBody("playermodel_cdc_bo2");
			return;
		case 96:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim21");
			return;
		case 98:
			self C_ICUNLOCKS::CAlliesInvB("sprayanim22");
			return;
		case 100:
			self C_ICUNLOCKS::CAlliesBody("Elysium_SC5");
			self C_ICUNLOCKS::CAlliesWeapon("gl_m14_mp");
			self C_ICUNLOCKS::CAlliesWeapon("gl_m16_mp");
			self C_ICUNLOCKS::CAlliesWeapon("tomahawk_mp");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim23");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim24");
			self C_ICUNLOCKS::CAlliesInvB("sprayanim25");
			self C_ICUNLOCKS::CAlliesInvC("trail_teddy");
			self C_ICUNLOCKS::CAxisBody("playermodel_terminator");
			self C_ICUNLOCKS::CAxisWeapon("gl_g36c_mp");
			self C_ICUNLOCKS::CAxisWeapon("gl_m16_mp");
			return;
		default:
			return;	
	}
}