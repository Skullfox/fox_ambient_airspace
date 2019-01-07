#define DOUBLES(var1,var2) ##var1##_##var2
#define ADDON DOUBLES(PREFIX,COMPONENT)
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define QUOTE(var1) #var1
#define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))
#define VNAME(var1)  QUOTE( DOUBLES(ADDON,var1) )
#define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3

//#define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE( ADDON\functions\DOUBLES(fnc,fncName).sqf) )

#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
    weapon = #WEAPON; \
    count = COUNT; \
}
#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
}
#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
    magazine = #MAGAZINE; \
    count = COUNT; \
}
#define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
    backpack = #BACKPACK; \
    count = COUNT; \
}

#define mag_1(a) a
#define mag_2(a) a, a
#define mag_3(a) a, a, a
#define mag_4(a) a, a, a, a
#define mag_5(a) a, a, a, a, a
#define mag_6(a) a, a, a, a, a, a
#define mag_7(a) a, a, a, a, a, a, a
#define mag_8(a) a, a, a, a, a, a, a, a
#define mag_9(a) a, a, a, a, a, a, a, a, a
#define mag_10(a) a, a, a, a, a, a, a, a, a, a
#define mag_11(a) a, a, a, a, a, a, a, a, a, a, a
#define mag_12(a) a, a, a, a, a, a, a, a, a, a, a, a