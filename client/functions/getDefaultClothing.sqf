// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);


	_BLUEFOR_defaultHeadgear = "H_HelmetSpecB";
	_BLUEFOR_defaultUniform = "U_B_CTRG_1";
	_BLUEFOR_defaultVest = "V_PlateCarrierH_CTRG";
	_BLUEFOR_defaultBackpack = "B_Carryall_cbr";
	_BLUEFOR_DiverUniform = "U_B_Wetsuit";
	_BLUEFOR_DiverVest = "V_RebreatherB";
	_BLUEFOR_DiverGoggles = "G_Diving";
	_BLUEFOR_SniperUniform = "U_B_T_FullGhillie_tna_F";
	
	_OPFOR_defaultHeadgear = "H_HelmetSpecB_paint1";
	_OPFOR_defaultUniform = "U_O_CombatUniform_ocamo";
	_OPFOR_defaultVest = "V_HarnessO_gry";
	_OPFOR_defaultBackpack = "B_Carryall_ocamo";
	_OPFOR_DiverUniform = "U_O_Wetsuit";
	_OPFOR_DiverVest = "V_RebreatherIR";
	_OPFOR_DiverGoggles = "G_Diving";
	_OPFOR_SniperUniform = "U_O_FullGhillie_lsh";
	
	_INDEP_defaultHeadgear = "H_HelmetB_Enh_tna_F";
	_INDEP_defaultUniform = "U_I_CombatUniform";
	_INDEP_defaultVest = "V_PlateCarrierIA2_dgtl";
	_INDEP_defaultBackpack = "B_Carryall_oli";
	_INDEP_DiverUniform = "U_I_Wetsuit";
	_INDEP_DiverVest = "V_RebreatherIA";
	_INDEP_DiverGoggles = "G_Diving";
	_INDEP_SniperUniform = "U_I_FullGhillie_lsh";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = _BLUEFOR_SniperUniform };
				if (_item == "vest") then { _result = _BLUEFOR_defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = _BLUEFOR_DiverUniform };
				if (_item == "vest") then { _result = _BLUEFOR_DiverVest };
				if (_item == "goggles") then { _result = _BLUEFOR_DiverGoggles };
			};
			default
			{
				if (_item == "uniform") then { _result = _BLUEFOR_defaultUniform };
				if (_item == "vest") then { _result = _BLUEFOR_defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _BLUEFOR_defaultHeadgear };
		if (_item == "backpack") then { _result = _BLUEFOR_defaultBackpack };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = _OPFOR_SniperUniform };
				if (_item == "vest") then { _result = _OPFOR_defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = _OPFOR_DiverUniform };
				if (_item == "vest") then { _result = _OPFOR_DiverVest };
				if (_item == "goggles") then { _result = _OPFOR_DiverGoggles };
			};
			default
			{
				if (_item == "uniform") then { _result = _OPFOR_defaultUniform };
				if (_item == "vest") then { _result = _OPFOR_defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _OPFOR_defaultHeadgear };
		if (_item == "backpack") then { _result = _OPFOR_defaultBackpack };
	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = _INDEP_SniperUniform };
				if (_item == "vest") then { _result = _INDEP_defaultVest };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = _INDEP_DiverUniform };
				if (_item == "vest") then { _result = _INDEP_DiverVest };
				if (_item == "goggles") then { _result = _INDEP_DiverGoggles };
			};
			default
			{
				if (_item == "uniform") then { _result = _INDEP_defaultUniform };
				if (_item == "vest") then { _result = _INDEP_defaultVest };
			};
		};

		if (_item == "headgear") then { _result = _INDEP_defaultHeadgear };
		if (_item == "backpack") then { _result = _INDEP_defaultBackpack };
	};
};

_result
