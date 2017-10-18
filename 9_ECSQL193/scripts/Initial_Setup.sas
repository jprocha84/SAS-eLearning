%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

/*++++++++++++++++++++++++++++++++++++++++++++++*/
/* THIS CODE CREATES PRACTICE DATA FOR ECSQL193 */
/* WARNING: DO NOT ALTER CODE BELOW THIS LINE   */
/*++++++++++++++++++++++++++++++++++++++++++++++*/

data _null_;
   if "&sysscp"="WIN" then do;
     call symputx('rawdata',"&path\"); 
	 end;
   else do;
     call symputx('rawdata',"&path/"); 
     end;
run;


data ORION.CUSTOMER;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Country length=$2 label='Customer Country';
   attrib Gender length=$1 label='Customer Gender';
   attrib Personal_ID length=$15 label='Personal ID';
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Customer_FirstName length=$20 label='Customer First Name';
   attrib Customer_LastName length=$30 label='Customer Last Name';
   attrib Birth_Date length=8 label='Customer Birth Date' format=DATE9.;
   attrib Customer_Address length=$45 label='Customer Address';
   attrib Street_ID length=8 label='Street ID' format=12.;
   attrib Street_Number length=$8 label='Street Number';
   attrib Customer_Type_ID length=8 label='Customer Type ID' format=8.;

   infile datalines dsd;
   input
      Customer_ID
      Country
      Gender
      Personal_ID
      Customer_Name
      Customer_FirstName
      Customer_LastName
      Birth_Date
      Customer_Address
      Street_ID
      Street_Number
      Customer_Type_ID
   ;
datalines4;
4,US,M,,James Kvarniq,James,Kvarniq,6752,4382 Gralyn Rd,9260106519,4382,1020
5,US,F,,Sandrina Stephano,Sandrina,Stephano,8590,6468 Cog Hill Ct,9260114570,6468,2020
9,DE,F,,Cornelia Krahl,Cornelia,Krahl,6632,Kallstadterstr. 9,3940106659,9,2020
10,US,F,,Karen Ballinger,Karen,Ballinger,10518,425 Bryant Estates Dr,9260129395,425,1040
11,DE,F,,Elke Wallstab,Elke,Wallstab,6802,Carl-Zeiss-Str. 15,3940108592,15,1040
12,US,M,,David Black,David,Black,4850,1068 Haithcock Rd,9260103713,1068,1030
13,DE,M,,Markus Sepke,Markus,Sepke,11890,Iese 1,3940105189,1,2010
16,DE,M,,Ulrich Heyde,Ulrich,Heyde,-6194,Oberstr. 61,3940105865,61,3010
17,US,M,,Jimmie Evans,Jimmie,Evans,-502,391 Greywood Dr,9260123306,391,1030
18,US,M,,Tonie Asmussen,Tonie,Asmussen,-698,117 Langtree Ln,9260112361,117,1020
19,DE,M,,Oliver S. Füßling,Oliver S.,Füßling,2975,Hechtsheimerstr. 18,3940106547,18,2030
20,US,M,,Michael Dineley,Michael,Dineley,1202,2187 Draycroft Pl,9260118934,2187,1030
23,US,M,,Tulio Devereaux,Tulio,Devereaux,-2221,1532 Ferdilah Ln,9260126679,1532,3010
24,US,F,,Robyn Klem,Robyn,Klem,1248,435 Cambrian Way,9260115784,435,3010
27,US,F,,Cynthia Mccluney,Cynthia,Mccluney,4853,188 Grassy Creek Pl,9260105670,188,3010
29,AU,F,,Candy Kinsey,Candy,Kinsey,-7847,21 Hotham Parade,1600103020,21,3010
31,US,F,,Cynthia Martinez,Cynthia,Martinez,1314,42 Arrowood Ln,9260128428,42,2020
33,DE,M,,Rolf Robak,Rolf,Robak,-6155,Münsterstraße 67,3940102376,67,1030
34,US,M,,Alvan Goheen,Alvan,Goheen,10244,844 Glen Eden Dr,9260111379,844,1020
36,US,M,,Phenix Hill,Phenix,Hill,3014,417 Halstead Cir,9260128237,417,3010
39,US,M,,Alphone Greenwald,Alphone,Greenwald,10433,4386 Hamrick Dr,9260123099,4386,2030
41,AU,M,,Wendell Summersby,Wendell,Summersby,3258,9 Angourie Court,1600101527,9,1030
42,DE,M,,Thomas Leitmann,Thomas,Leitmann,8440,Carl Von Linde Str. 13,3940109715,13,1020
45,US,F,,Dianne Patchin,Dianne,Patchin,8526,7818 Angier Rd,9260104847,7818,2010
49,US,F,,Annmarie Leveille,Annmarie,Leveille,10424,185 Birchford Ct,9260104510,185,2030
50,DE,M,,Gert-Gunter Mendler,Gert-Gunter,Mendler,-8020,Humboldtstr. 1,3940105781,1,2030
52,US,M,,Yan Kozlowski,Yan,Kozlowski,4844,1233 Hunters Crossing,9260116235,1233,1030
53,AU,F,,Dericka Pockran,Dericka,Pockran,-560,131 Franklin St,1600103258,131,1040
56,US,M,,Roy Siferd,Roy,Siferd,-8004,334 Kingsmill Rd,9260111871,334,1030
60,US,F,,Tedi Lanzarone,Tedi,Lanzarone,4891,2429 Hunt Farms Ln,9260101262,2429,1030
61,DE,M,,Carsten Maestrini,Carsten,Maestrini,-4194,Münzstr. 28,3940108887,28,2030
63,US,M,,James Klisurich,James,Klisurich,5107,25 Briarforest Pl,9260125492,25,2020
65,DE,F,,Ines Deisser,Ines,Deisser,4949,Bahnweg 1,3940100176,1,1020
69,US,F,,Patricia Bertolozzi,Patricia,Bertolozzi,8533,4948 Dargan Hills Dr,9260116402,4948,1020
71,US,F,,Viola Folsom,Viola,Folsom,5014,290 Glenwood Ave,9260124130,290,2020
75,US,M,,Mikel Spetz,Mikel,Spetz,10396,101 Knoll Ridge Ln,9260108068,101,1020
79,US,F,,Najma Hicks,Najma,Hicks,10979,9658 Dinwiddie Ct,9260101874,9658,1030
88,US,M,,Attila Gibbs,Attila,Gibbs,1145,3815 Askham Dr,9260100179,3815,1030
89,US,F,,Wynella Lewis,Wynella,Lewis,-7765,2572 Glenharden Dr,9260116551,2572,1040
90,US,F,,Kyndal Hooks,Kyndal,Hooks,3135,252 Clay St,9260111614,252,2030
92,US,M,,Lendon Celii,Lendon,Celii,-4126,421 Blue Horizon Dr,9260117676,421,1020
111,AU,F,,Karolina Dokter,Karolina,Dokter,6936,28 Munibung Road,1600102072,28,1030
171,AU,M,,Robert Bowerman,Robert,Bowerman,6627,21 Parliament House c/- Senator t,1600101555,21,1040
183,AU,M,,Duncan Robertshawe,Duncan,Robertshawe,-4299,18 Fletcher Rd,1600100760,18,1020
195,AU,M,,Cosi Rimmington,Cosi,Rimmington,-4068,4 Burke Street Woolloongabba,1600101663,4,1020
215,AU,M,,Ramesh Trentholme,Ramesh,Trentholme,-2421,23 Benjamin Street,1600102721,23,2020
544,TR,M,,Avni Argac,Avni,Argac,3062,A Blok No: 1,9050100008,1,1040
908,TR,M,,Avni Umran,Avni,Umran,8740,Mayis Cad. Nova Baran Plaza Ka 11,9050100023,11,2030
928,TR,M,,Bulent Urfalioglu,Bulent,Urfalioglu,4971,Turkcell Plaza Mesrutiyet Cad. 142,9050100016,142,1020
1033,TR,M,,Selim Okay,Selim,Okay,8687,Fahrettin Kerim Gokay Cad. No. 24,9050100001,24,1020
1100,TR,M,,Ahmet Canko,Ahmet,Canko,2940,A Blok No: 1,9050100008,1,1020
1684,TR,M,,Carglar Aydemir,Carglar,Aydemir,6864,A Blok No: 1,9050100008,1,1020
2550,ZA,F,,Sanelisiwe Collier,Sanelisiwe,Collier,11876,Bryanston Drive 122,8010100009,122,2010
2618,ZA,M,,Theunis Brazier,Theunis,Brazier,-2477,Arnold Road 2,8010100125,2,1030
2788,TR,M,,Serdar Yucel,Serdar,Yucel,-4382,Fahrettin Kerim Gokay Cad. No. 30,9050100001,30,1040
2806,ZA,F,,Raedene Van Den Berg,Raedene,Van Den Berg,11947,Quinn Street 11,8010100089,11,1030
3959,ZA,F,,Rita Lotz,Rita,Lotz,2976,Moerbei Avenue 120,8010100151,120,2030
11171,CA,M,,Bill Cuddy,Bill,Cuddy,11246,69 chemin Martin,2600100032,69,2010
12386,IL,M,,Avinoam Zweig,Avinoam,Zweig,1227,Mivtza Kadesh St 16,4750100001,16,3010
14104,IL,M,,Avinoam Zweig,Avinoam,Zweig,3205,Mivtza Kadesh St 25,4750100001,25,1030
14703,IL,M,,Eyal Bloch,Eyal,Bloch,5015,Mivtza Boulevard 17,4750100002,17,1040
17023,CA,F,,Susan Krasowski,Susan,Krasowski,1285,837 rue Lajeunesse,2600100021,837,2030
19444,IL,M,,Avinoam Zweig,Avinoam,Zweig,1366,Mivtza Kadesh St 61,4750100001,61,1040
19873,IL,M,,Avinoam Tuvia,Avinoam,Tuvia,10392,Mivtza Kadesh St 18,4750100001,18,2030
26148,CA,M,,Andreas Rennie,Andreas,Rennie,-7837,41 Main St,2600100010,41,1030
46966,CA,F,,Lauren Krasowski,Lauren,Krasowski,11254,17 boul Wallberg,2600100011,17,1040
54655,CA,F,,Lauren Marx,Lauren,Marx,4978,512 Gregoire Dr,2600100013,512,3010
70046,CA,M,,Tommy Mcdonald,Tommy,Mcdonald,1115,818 rue Davis,2600100017,818,1020
70059,CA,M,,Colin Byarley,Colin,Byarley,-8016,580 Howe St,2600100047,580,1030
70079,CA,F,,Lera Knott,Lera,Knott,11149,304 Grand Lake Rd,2600100039,304,1030
70100,CA,F,,Wilma Yeargan,Wilma,Yeargan,10401,614 Route 199,2600100015,614,1030
70108,CA,M,,Patrick Leach,Patrick,Leach,-6106,1001 Burrard St,2600100046,1001,1020
70165,CA,F,,Portia Reynoso,Portia,Reynoso,2963,873 rue Bosse,2600100006,873,1020
70187,CA,F,,Soberina Berent,Soberina,Berent,11227,1835 boul Laure,2600100035,1835,1030
70201,CA,F,,Angel Borwick,Angel,Borwick,5101,319 122 Ave NW,2600100012,319,2010
70210,CA,M,,Alex Santinello,Alex,Santinello,11069,40 Route 199,2600100015,40,1030
70221,CA,M,,Kenan Talarr,Kenan,Talarr,2962,9 South Service Rd,2600100019,9,1040
;;;;
run;

data ORION.CUSTOMER2;
   attrib ID length=8;
   attrib Name length=$5;
   infile datalines dsd;
   input
      ID
      Name
   ;
datalines4;
101,Jones
101,Jones
102,Kent
102,Kent
104,Avery
;;;;
run;

data ORION.CUSTOMERS;
   attrib ID length=8;
   attrib Name length=$5;
   infile datalines dsd;
   input
      ID
      Name
   ;
datalines4;
101,Smith
104,Jones
102,Blank
;;;;
run;

data ORION.CUSTOMER_TYPE;
   attrib Customer_Type_ID length=8 label='Customer Type ID' format=12.;
   attrib Customer_Type length=$40 label='Customer Type Name';
   attrib Customer_Group_ID length=8 label='Customer Group ID' format=12.;
   attrib Customer_Group length=$40 label='Customer Group Name';
   infile datalines dsd;
   input
      Customer_Type_ID
      Customer_Type
      Customer_Group_ID
      Customer_Group
   ;
datalines4;
1010,Orion Club members inactive,10,Orion Club members
1020,Orion Club members low activity,10,Orion Club members
1030,Orion  Club members medium activity,10,Orion Club members
1040,Orion  Club members high activity,10,Orion Club members
2010,Orion Club Gold members low activity,20,Orion Club Gold members
2020,Orion Club Gold members medium activity,20,Orion Club Gold members
2030,Orion Club Gold members high activity,20,Orion Club Gold members
3010,Internet/Catalog Customers,30,Internet/Catalog Customers
;;;;
run;

data ORION.EMPLOYEES;
   attrib Employee_ID length=8;
   attrib Hire_Date length=8 format=MMDDYY10.;
   attrib Salary length=8 format=COMMA12.2;
   attrib Birth_Date length=8 format=MMDDYY10.;
   attrib Gender length=$1;
   attrib Country length=$2;
   attrib City length=$30;
   infile datalines dsd;
   input
      Employee_ID
      Hire_Date
      Salary
      Birth_Date
      Gender
      Country
      City
   ;
datalines4;
121141,6575,194885,-4213,M,US,Philadelphia
120659,6575,161290,-2360,M,US,Philadelphia
120103,6575,87975,-2535,M,AU,Sydney
120712,6575,63640,-2394,F,US,Miami-Dade
120804,6575,55400,-4342,M,US,Miami-Dade
120765,6575,51950,-380,F,US,San Diego
120691,6575,49240,-4125,M,AU,Sydney
120270,6575,48435,-647,M,US,Miami-Dade
120809,6575,47155,-4370,F,US,Miami-Dade
120763,6575,45100,-4084,M,US,San Diego
120669,6575,36370,-4179,M,US,Philadelphia
120741,6575,36365,-4051,F,US,Philadelphia
120673,6575,35935,-4205,F,AU,Melbourne
120732,6575,35870,-2331,M,US,Miami-Dade
120272,6575,34390,-4309,M,US,Philadelphia
120723,6575,33950,-2335,F,US,Philadelphia
120786,6575,32650,-4306,F,US,Miami-Dade
120713,6575,31630,-4330,M,US,San Diego
120114,6575,31285,-4345,F,AU,Sydney
120742,6575,31020,-4349,M,US,Philadelphia
121004,6575,30895,-4168,M,US,San Diego
120154,6575,30490,-4182,F,AU,Sydney
120107,6606,30475,-2536,F,AU,Melbourne
120738,6575,30025,-2370,F,US,Philadelphia
121053,6606,29955,-4117,F,US,San Diego
120721,6575,29870,-4089,F,US,Philadelphia
121060,6575,28800,-4224,F,US,Miami-Dade
121075,6575,28395,-4026,F,US,San Diego
120172,6575,28345,-4292,M,AU,Sydney
120120,6575,27645,-4258,F,AU,Sydney
121138,6575,27265,-2498,M,US,Philadelphia
120160,6848,27115,-479,M,AU,Sydney
121073,6575,27100,-2422,M,US,Miami-Dade
121135,6787,27010,-573,F,US,Philadelphia
120106,6575,26960,-4026,M,AU,Sydney
120111,6879,26895,-2353,M,AU,Sydney
120113,6575,26870,-4253,F,AU,Melbourne
121086,6575,26820,-4033,M,US,Miami-Dade
120686,6575,26690,-4256,F,US,San Diego
120121,6575,26600,-4169,F,AU,Sydney
120151,6575,26520,-4058,F,AU,Sydney
121035,6575,26460,-4299,M,US,San Diego
120178,6665,26165,-404,M,AU,Sydney
121041,6575,26120,-4349,F,US,San Diego
121011,6575,25735,-4313,M,US,Miami-Dade
120664,7060,47605,-682,M,US,Philadelphia
121025,7183,28295,-2274,M,US,Miami-Dade
121044,7152,25660,-386,M,US,Miami-Dade
121145,7396,84260,-2231,M,US,Miami-Dade
120771,7640,36435,-515,F,US,Miami-Dade
121081,7396,30235,-2470,F,US,San Diego
121054,7610,29805,-415,M,US,San Diego
121100,7396,28135,-2440,M,US,San Diego
121001,7914,43615,1116,M,US,Miami-Dade
120797,8005,43385,-410,F,US,Miami-Dade
121071,7914,28625,1348,M,US,Miami-Dade
121082,7944,28510,-2371,M,US,Miami-Dade
120735,8156,61985,-567,F,US,Miami-Dade
120668,8370,47785,-2261,M,US,Miami-Dade
120803,8036,43630,-574,M,US,San Diego
120132,8309,28525,-2462,F,AU,Sydney
120148,8187,28480,-2301,M,AU,Sydney
121078,8340,27485,-2436,M,US,Miami-Dade
120122,8217,27475,-523,F,AU,Melbourne
120180,8370,26970,-553,M,AU,Melbourne
121094,8279,26555,-724,M,US,San Diego
121051,8340,26025,-2435,F,US,San Diego
120814,8644,59140,1249,M,US,San Diego
120110,8705,28615,-2233,M,AU,Sydney
121083,8460,27245,1165,F,US,Miami-Dade
120693,8552,26625,1217,M,AU,Sydney
120124,8460,26480,1228,M,AU,Sydney
120810,8826,58375,-454,M,US,Miami-Dade
120116,8797,29250,1259,M,AU,Sydney
121039,8887,27460,-577,M,US,Miami-Dade
121090,8797,26600,-561,F,US,San Diego
121057,9101,25125,1455,M,US,Philadelphia
120104,9132,46230,-600,F,AU,Sydney
120658,9163,42485,-377,M,US,San Diego
120717,9344,30155,-722,M,US,Miami-Dade
120773,9222,27370,1148,F,US,Miami-Dade
120728,9497,35070,-393,F,US,Miami-Dade
120692,9587,32485,-405,M,AU,Sydney
121040,9801,29525,1282,F,US,Philadelphia
120164,9528,27450,1425,F,AU,Melbourne
120143,9770,26790,1232,M,AU,Sydney
120796,9921,47030,-599,M,US,Philadelphia
120671,9893,40080,-584,M,US,Philadelphia
120755,10074,36440,3158,F,US,San Diego
120759,9862,36230,3230,M,US,San Diego
120731,10105,34150,1169,M,US,San Diego
120260,10532,207885,3258,F,US,San Diego
120808,10379,44425,3074,M,US,San Diego
120778,10258,43650,-389,F,US,Philadelphia
120275,10501,32195,1456,F,US,San Diego
121061,10409,29815,-534,M,US,Miami-Dade
120118,10409,28090,1249,M,AU,Sydney
120999,10318,27215,1457,F,US,San Diego
120722,10866,32460,1360,M,US,Miami-Dade
121031,10805,28060,3112,M,US,Philadelphia
120145,10744,26060,2943,M,AU,Melbourne
120791,11231,61115,3129,M,US,San Diego
120271,11201,43635,3140,F,US,Miami-Dade
120727,11109,34925,3098,M,US,San Diego
120117,11048,31670,3176,M,AU,Melbourne
120159,11139,30765,2976,F,AU,Sydney
120261,11535,243190,4800,M,US,Miami-Dade
120798,11323,80755,1269,F,US,Miami-Dade
120767,11413,32965,3051,M,US,Philadelphia
121080,11566,32235,1119,M,US,Miami-Dade
121147,11566,29145,4896,F,US,Miami-Dade
121139,11504,27700,1326,F,US,San Diego
121007,11354,27290,3207,M,US,Philadelphia
120262,11932,268455,5042,M,US,Philadelphia
120737,11993,63605,1182,F,US,San Diego
120751,11901,58200,3017,M,US,Miami-Dade
120730,11962,30195,3272,M,US,San Diego
121074,11962,26990,1155,M,US,San Diego
120259,12297,433800,2946,M,US,Miami-Dade
120102,12205,108255,4971,M,AU,Melbourne
120266,12144,31750,4930,F,US,San Diego
121091,12054,27325,4798,M,US,Philadelphia
121029,12388,27225,3278,M,US,San Diego
121027,12388,26165,3047,M,US,San Diego
120657,12723,36110,2928,F,US,San Diego
120733,12723,31760,3015,M,US,Miami-Dade
120718,12539,29190,3111,M,US,Philadelphia
120112,12600,26550,4796,F,AU,Melbourne
121069,12692,26195,4826,M,US,San Diego
121109,12539,26035,5057,M,US,San Diego
121144,13088,83505,3101,F,US,Miami-Dade
120736,13057,63985,3253,F,US,Miami-Dade
120780,13057,62995,4992,F,US,Philadelphia
121095,12965,28010,4852,F,US,San Diego
120680,12904,27295,4985,F,US,Philadelphia
120163,12784,26735,3064,M,AU,Melbourne
121064,13027,25110,2949,M,US,San Diego
121084,12784,22710,3150,M,US,San Diego
120724,13240,63705,2948,M,US,San Diego
120672,13209,60980,3159,M,AU,Sydney
120806,13180,47285,6630,F,US,Miami-Dade
120720,13240,46580,3049,M,US,Philadelphia
120758,13423,34040,3217,M,US,Miami-Dade
121043,13209,28225,5061,F,US,Philadelphia
121068,13393,27550,5084,M,US,San Diego
121142,13635,156065,4793,M,US,Philadelphia
120677,13546,65555,4993,F,US,Miami-Dade
120760,13635,53475,4754,F,US,San Diego
120716,13727,53015,6779,M,US,Philadelphia
121000,13849,48600,2946,M,US,Miami-Dade
120785,13666,48335,4769,F,US,San Diego
120811,13696,43985,5017,M,US,Miami-Dade
120816,13727,30485,4871,F,US,Miami-Dade
121008,13727,27875,4932,M,US,Philadelphia
120274,13849,26840,2930,F,US,Philadelphia
120149,13515,26390,6899,F,AU,Melbourne
120711,13939,59130,4896,F,US,Philadelphia
120753,14092,47000,7471,M,US,Miami-Dade
120777,14000,40955,4833,M,US,San Diego
120788,14214,33530,4912,M,US,San Diego
121021,13939,32985,6918,F,US,San Diego
120994,14184,31645,6741,F,us,San Diego
120790,14365,53740,6915,F,US,Philadelphia
120747,14457,43590,6745,F,us,San Diego
121097,14518,26830,6870,F,US,Philadelphia
121096,14365,26335,4886,M,US,Miami-Dade
120719,14641,87420,4770,F,US,San Diego
120756,14792,52295,6625,F,US,Philadelphia
120769,14701,47990,6718,M,US,Miami-Dade
120793,14762,47155,4968,M,US,Miami-Dade
120783,14610,42975,6928,M,US,Philadelphia
120775,14915,41580,4790,F,US,Miami-Dade
120787,14610,34000,4982,M,US,San Diego
120279,14731,32925,5041,F,US,San Diego
120997,14854,27420,6899,F,us,Philadelphia
120682,14701,26760,5102,F,US,Philadelphia
120749,14884,26545,6837,M,US,San Diego
121106,14641,25880,4781,M,US,Miami-Dade
121143,15157,95090,5078,M,US,Miami-Dade
120268,15096,76105,6818,M,US,Philadelphia
120663,15035,56385,4833,F,US,Miami-Dade
120792,15188,54760,7383,F,US,Philadelphia
120779,15035,43690,7582,F,US,Miami-Dade
120743,15127,34620,4780,F,US,San Diego
120993,15035,26260,5100,F,US,San Diego
121079,15280,25770,6728,M,US,Philadelphia
120714,15584,62625,7399,M,US,Miami-Dade
120710,15341,54840,6902,M,US,Philadelphia
120119,15341,30255,5103,M,AU,Sydney
120799,15645,29070,8482,M,US,Philadelphia
120177,15372,28745,8495,F,AU,Sydney
120127,15645,28100,8404,F,AU,Sydney
120782,15857,63915,6907,F,US,Philadelphia
120656,15765,42570,6602,F,US,San Diego
120801,15887,40040,6639,F,US,Philadelphia
121009,15918,32955,8738,M,US,San Diego
121042,16010,28845,8494,M,US,San Diego
121014,15918,28510,6695,F,US,Miami-Dade
120105,15826,27110,6929,F,AU,Melbourne
120805,16162,58530,8213,M,US,Philadelphia
121099,16192,32725,8478,M,US,Philadelphia
120992,16284,26940,8448,F,US,Miami-Dade
121013,16162,26675,8518,M,US,Philadelphia
121015,16315,26140,8747,M,US,San Diego
120766,16496,53400,6883,F,US,Miami-Dade
120812,16649,45810,6624,M,US,Miami-Dade
120776,16527,32580,8664,M,US,Miami-Dade
121030,16468,26745,8716,M,US,Miami-Dade
120665,16861,80070,6871,F,US,San Diego
120679,16983,46190,7616,F,US,San Diego
120746,16892,46090,6857,M,US,Philadelphia
120764,17136,40450,6930,M,US,San Diego
120996,17045,32745,6776,M,US,San Diego
121020,16922,31750,10280,F,US,Philadelphia
121037,16861,28310,6737,M,US,Miami-Dade
121058,17075,26270,6767,M,US,San Diego
121092,17014,25680,6641,F,US,San Diego
120101,17348,163040,7535,M,AU,Sydney
120794,17348,51265,8400,F,US,Miami-Dade
120748,17226,48380,7491,F,US,Miami-Dade
121105,17167,29545,8529,F,US,Miami-Dade
120267,17198,28585,11110,F,US,San Diego
121056,17287,28325,10413,F,US,San Diego
120131,17167,26910,8668,M,AU,Sydney
120136,17198,26605,8659,M,AU,Sydney
121016,17776,48075,7323,F,US,Miami-Dade
120784,17776,35715,8514,F,US,Philadelphia
120681,17623,30950,8624,M,US,Miami-Dade
121033,17684,29775,11267,F,US,Philadelphia
121024,17653,26600,10491,M,US,San Diego
120690,17867,25185,10243,F,US,Philadelphia
121005,17563,25020,10423,M,US,Miami-Dade
120660,17957,61125,8192,M,US,Miami-Dade
121063,18110,35990,8608,M,US,Miami-Dade
121017,17957,29225,10232,M,US,San Diego
120715,17929,28535,8563,F,US,San Diego
120152,17988,26515,8521,M,AU,Sydney
120115,18110,26500,10355,M,AU,Sydney
120998,17988,26330,8740,F,US,San Diego
120264,18597,37510,10249,F,US,San Diego
120739,18383,36970,11176,M,US,Miami-Dade
120995,18475,34850,10391,F,US,Philadelphia
120754,18383,34760,11841,M,US,Miami-Dade
120734,18322,34270,8516,M,US,Philadelphia
120815,18353,31590,12049,M,US,Miami-Dade
121026,18353,31515,11269,M,US,Philadelphia
121107,18444,31380,11071,F,US,Philadelphia
120745,18414,31365,11143,F,US,Philadelphia
121032,18322,31335,11742,M,US,San Diego
120761,18444,30960,11319,F,US,Philadelphia
120128,18567,30890,11152,F,AU,Melbourne
120161,18536,30785,11754,F,AU,Melbourne
120762,18322,30625,8706,M,US,Philadelphia
121062,18475,30305,10528,F,US,San Diego
120144,18536,30265,11023,M,AU,Sydney
121055,18475,30185,11695,M,US,Miami-Dade
120155,18353,29990,10339,F,AU,Melbourne
120667,18294,29980,8572,M,US,Miami-Dade
120137,18322,29715,8471,F,AU,Melbourne
120142,18444,29695,11122,M,AU,Melbourne
120697,18414,29625,11866,F,AU,Melbourne
121070,18294,29385,10535,F,US,Miami-Dade
121146,18353,29320,11300,F,US,Philadelphia
121077,18536,28585,10475,M,US,Miami-Dade
120273,18322,28455,11115,F,US,Miami-Dade
120169,18383,28135,10228,M,AU,Melbourne
121065,18353,28040,10475,F,US,San Diego
120198,18597,28025,11708,F,AU,Sydney
120157,18597,27860,11009,M,AU,Sydney
120689,18444,27780,8601,F,US,Philadelphia
120278,18475,27685,11308,M,US,San Diego
120108,18475,27660,10280,F,AU,Melbourne
121098,18383,27475,11769,M,US,Philadelphia
120141,18383,27465,11759,F,AU,Sydney
120133,18536,27440,11069,F,AU,Melbourne
120726,18506,27380,11870,F,US,Philadelphia
120772,18475,27365,11786,M,US,Miami-Dade
120694,18353,27365,11916,F,AU,Sydney
121103,18506,27260,11806,M,US,San Diego
120162,18294,27215,11936,M,AU,Melbourne
121102,18414,27115,8577,F,us,San Diego
121137,18353,27055,11705,M,US,Miami-Dade
120165,18322,27050,10305,M,AU,Sydney
120662,18567,27045,11864,M,US,Miami-Dade
120140,18536,26970,11903,M,AU,Sydney
120684,18567,26960,11287,F,US,Miami-Dade
120130,18383,26955,10575,M,AU,Sydney
121049,18597,26930,11002,F,US,San Diego
121052,18567,26900,10966,M,US,Philadelphia
120139,18506,26810,11187,F,AU,Sydney
120126,18475,26780,11951,M,AU,Sydney
121028,18567,26585,11805,M,US,Miami-Dade
120147,18536,26580,11706,F,AU,Sydney
120109,18536,26495,11306,F,AU,Sydney
120156,18322,26445,11932,F,AU,Sydney
120171,18506,26205,10427,F,AU,Sydney
120176,18567,26095,11270,M,AU,Melbourne
121050,18597,26080,10969,F,US,San Diego
121003,18444,26000,11813,M,US,Philadelphia
120138,18444,25795,8592,F,AU,Melbourne
120175,18536,25745,11918,M,AU,Sydney
121101,18567,25390,11197,F,US,San Diego
120168,18567,25275,10310,F,AU,Melbourne
121010,18322,25195,10453,M,US,Miami-Dade
120685,18567,25130,10287,F,US,Philadelphia
121085,18628,32235,11273,M,US,San Diego
121088,18628,27240,11849,M,US,Philadelphia
121034,18628,27110,11923,M,US,Miami-Dade
;;;;
run;

data ORION.EMPLOYEE_ADDRESSES;
   attrib Employee_ID length=8;
   attrib Employee_Name length=$40;
   attrib Street_ID length=8;
   attrib Street_Number length=8;
   attrib Street_Name length=$40;
   attrib City length=$30;
   attrib State length=$2;
   attrib Postal_Code length=$10;
   attrib Country length=$2;

   infile datalines dsd;
   input
      Employee_ID
      Employee_Name
      Street_ID
      Street_Number
      Street_Name
      City
      State
      Postal_Code
      Country
   ;
datalines4;
121044,"Abbott, Ray",9260116912,2267,Edwards Mill Rd,Miami-Dade,FL,33135,US
120145,"Aisbitt, Sandy",1600101803,30,Bingera Street,Melbourne,,2001,AU
120761,"Akinfolarin, Tameaka",9260121030,5,Donnybrook Rd,Philadelphia,PA,19145,US
120656,"Amos, Salley",9260123736,3524,Calico Ct,San Diego,CA,92116,US
121107,"Anger, Rose",9260120989,744,Chapwith Rd,Philadelphia,PA,19142,US
121038,"Anstey, David",9260116991,939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US
120273,"Antonini, Doris",9260116925,681,Ferguson Rd,Miami-Dade,FL,33141,US
120759,"Apr, Nishan",9260123711,105,Brack Penny Rd,San Diego,CA,92071,US
120798,"Ardskin, Elizabeth",9260116954,701,Glenridge Dr,Miami-Dade,FL,33177,US
121030,"Areu, Jeryl",9260116937,265,Fyfe Ct,Miami-Dade,Fl,33133,US
121017,"Arizmendi, Gilbert",9260123825,379,Englehardt Dr,San Diego,CA,91950,US
121062,"Armant, Debra",9260123787,10398,Crown Forest Ct,San Diego,CA,92025,US
121119,"Armogida, Bruce",9260121159,1914,Lansing St,Philadelphia,PA,19119,US
120812,"Arruza, Fauver",9260116937,265,Fyfe Ct,Miami-Dade,FL,33133,US
120756,"Asta, Wendy",9260121146,3565,Lake Park Dr,Philadelphia,PA,19145,US
120754,"Atkins, John",9260116816,6137,Blue Water Ct,Miami-Dade,FL,33161,US
120185,"Bahlman, Sharon",1600103028,24,LaTrobe Street,Sydney,,2165,AU
120109,"Baker, Gabriele",1600103074,166,Toorak Road,Sydney,,2119,AU
120710,"Baltzell, Timothy",9260120981,31,Castalia Dr,Philadelphia,PA,19140,US
121007,"Banaszak, John",9260121148,77,Lake Tillery Dr,Philadelphia,PA,19139,US
121011,"Banchi, Steven",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120188,"Baran, Shanmuganathan",1600102985,207,Canterbury Road,Sydney,,1225,AU
120144,"Barbis, Viney",1600102974,3,Alice Street,Sydney,,2114,AU
120168,"Barcoe, Selina",1600101850,435,Sherwood Rd,Melbourne,,8003,AU
120182,"Barreto, Geok-Seng",1600103062,241,Royal Perade,Sydney,,1115,AU
121049,"Bataineh, Perrior",9260123694,892,Birchland Dr,San Diego,CA,92126,US
120998,"Benedicto, Tondelayo",9260123862,2902,Gable Ridge Ln,San Diego,CA,92118,US
120800,"Benyami, Fred",9260123837,1498,Falconwood Dr,San Diego,CA,92069,US
120811,"Bergeron-Jeter, Dale",9260116773,2356,Aileen Dr,Miami-Dade,FL,33010,US
120733,"Bezinque, Michael",9260116798,2732,Bell Dr,Miami-Dade,FL,33033,US
120104,"Billington, Kareen",1600103066,40,Smith Street,Sydney,,1670,AU
120735,"Bilobran, Brenda",9260116785,11217,Avent Ferry Rd,Miami-Dade,FL,33160,US
121035,"Blackley, James",9260123811,41,Dubose St,San Diego,CA,92110,US
120183,"Blanton, Brig",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121141,"Bleu, Henri Le",9260121129,29,Joliesse Ln,Philadelphia,PA,19103,US
120993,"Boatright, Lorraine",9260123871,110,Glascock St,San Diego,CA,91950,US
120198,"Body, Meera",1600103038,51,Martin Place,Sydney,,1131,AU
121006,"Bolster, Bernard",9260123715,77,Braswell Ct,San Diego,CA,91950,US
121116,"Bond-Teague, Mary",9260123677,24,Bashford Rd,San Diego,CA,92106,US
121137,"Boocks, Michael. R.",9260117046,1555,Laurdane Rd,Miami-Dade,FL,33183,US
120728,"Borge, Kathryn",9260116823,360,Bridgepath Dr,Miami-Dade,FL,33150,US
121109,"Boulus, Harold",9260123772,4320,Colony Woods Dr,San Diego,CA,92054,US
120265,"Branly, Wanda",9260121147,21,Lake Pine Dr,Philadelphia,PA,19135,US
121140,"Briggi, Saunders",9260123917,991,Holman St,San Diego,CA,92021,US
121012,"Broome, Carmelo",9260116832,368,Buck Jones Rd,Miami-Dade,FL,33144,US
120724,"Brown, Hampie",9260123770,1951,Cobble Creek Ln,San Diego,CA,92054,US
121101,"Buckner, Burnetta",9260123893,3385,Hampton Ridge Rd,San Diego,CA,92114,US
120114,"Buddery, Jeannette",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120662,"Burroughs, Lemonica",9260116814,2565,Bledsoe Ave,Miami-Dade,FL,33176,US
120730,"Burt, Woodson",9260123853,136,Fox Rd,San Diego,CA,92128,US
120713,"Campbell, Carston",9260123835,19,Fairwinds Dr,San Diego,CA,92069,US
120181,"Cantatore, Lorian",1600102985,207,Canterbury Road,Sydney,,1225,AU
121144,"Capachietti, Renee",9260116911,379,Edgeside Ct,Miami-Dade,FL,33012,US
120763,"Capps, Ramond",9260123777,3384,Cotton Mill Dr,San Diego,CA,92113,US
121050,"Capristo-Abramczyk, Patricia",9260123928,157,Ithaca Ln,San Diego,CA,91950,US
120688,"Carcaterra, Lisa",9260123971,91,Langstonshire Ln,San Diego,Ca,92119,US
121059,"Carhide, Jacqulin",9260123889,5637,Greenfield Dr,San Diego,CA,91911,US
121025,"Cassey, Barnaby",9260116769,1609,Abbey Ln,Miami-Dade,FL,33134,US
121121,"Cassone, Halouise",9260121067,6,Frissell Ave,Philadelphia,PA,19142,US
120187,"Catenacci, Reyne",1600101829,44,Gow Street,Melbourne,,2066,AU
120146,"Cederlund, Wendall",1600103054,1,Pacific Rise Mount Wellington,Sydney,,20000,AU
120149,"Chantharasy, Judy",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
121097,"Chernega, Willeta",9260121008,17,Cottonwood Ln,Philadelphia,PA,19111,US
121080,"Chinnis, Kumar",9260116996,60,Hodge Rd,Miami-Dade,FL,33138,US
120791,"Chiseloff, Richard",9260123830,1726,Evans Rd,San Diego,CA,92067,US
121048,"Clark, Lawrie",9260116885,5716,Deacons Bend Ct,Miami-Dade,FL,33184,US
121002,"Clark, Terry-Ann",9260123906,57,Hickory Dr,San Diego,CA,92104,US
120127,"Clarkson, Sharryn",1600102972,21,Albert St,Sydney,,1170,AU
120263,"Cleverley, Bobby",9260123710,622,Boylan Ave,San Diego,CA,92054,US
121076,"Cobb, Micah",9260121074,37,Glencoe Dr,Philadelphia,Pa,19138,US
120172,"Comber, Edwin",1600102978,121,Blackburn Road,Sydney,,2580,AU
120175,"Conolly, Andrew",1600103049,79,Old Port Road,Sydney,,2144,AU
120739,"Cooper, Bryon",9260116770,5857,Academy St,Miami-Dade,FL,33133,US
121100,"Cormell, Tzue-Ing",9260123700,4104,Blackwolf Run Ln,San Diego,CA,92114,US
121113,"Costine, Karen",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
121073,"Court, Donald",9260116842,4498,Calumet Dr,Miami-Dade,FL,33144,US
120741,"Court, Keisha",9260121135,88,Kershaw Dr,Philadelphia,PA,19130,US
120264,"Croome, Latonya",9260123737,1722,Calm Winds Ct,San Diego,CA,91941,US
120794,"Cross, Samantha",9260116833,699,Buck Rowland Rd,Miami-Dade,FL,33169,US
120262,"Crown, Max",9260120929,1823,Ashley Rd,Philadelphia,PA,19111,US
120679,"Cutucache, Chrisy",9260123909,1541,Highland Trl,San Diego,CA,92103,US
120190,"Czernezkyi, Ivor",1600103037,21,Market Street,Sydney,,2113,AU
120687,"Dannin, Freda",9260116935,674,Friar Tuck Rd,Miami-Dade,FL,33193,US
121040,"Darrohn, Brienne",9260120944,3941,Belford Valley Ln,Philadelphia,PA,19103,US
121055,"Davis, Clement",9260117037,1305,Kyle Dr,Miami-Dade,FL,33172,US
120103,"Dawes, Wilson",1600103074,166,Toorak Road,Sydney,,2119,AU
120124,"Daymond, Lucian",1600103024,1,Julius Avenue,Sydney,,2233,AU
120795,"Deacon, David",9260116960,1636,Gorman St,Miami-Dade,FL,33012,US
121082,"Debank, Richard",9260116843,608,Campbell Rd,Miami-Dade,FL,33129,US
120786,"Delafuente, Chris-Anne",9260116875,1329,Cross Link Rd,Miami-Dade,FL,33016,US
120789,"Denhollem, Julius",9260116863,147,Clearport Dr,Miami-Dade,FL,33135,US
120126,"Denny, Satyakam",1600102981,7,Boundary Street,Sydney,,2099,AU
121003,"Der Wiele, Troyce Van",9260120967,1787,Brushy Meadows Dr,Philadelphia,PA,19148,US
121019,"Desanctis, Scott",9260121087,765,Greenhaven Ln,Philadelphia,PA,19102,us
120680,"Desaulniers, Raymondria",9260120977,2409,Carnegie Ln,Philadelphia,PA,19145,US
121132,"Digiorgio, Shia-Ling",9260123870,97,Gentlewoods Dr,San Diego,CA,92040,US
120197,"Dillin, Kerrin",1600101821,29,Emily Bullock Cres,Melbourne,,8007,AU
120714,"Dinley, Robert",9260116931,182,Fort Sumter Rd,Miami-Dade,FL,33160,US
120152,"Dives, Sean",1600102982,69,Bourke St,Sydney,,1460,AU
120668,"Dolan, Thyland",9260116922,744,Farmington Grove Dr,Miami-Dade,FL,33141,US
120997,"Donathan, Mary",9260121069,4923,Gateridge Dr,Philadelphia,PA,19152,us
120785,"Donnell, Damesha",9260123725,1947,Bromley Way,San Diego,CA,92024,US
120711,"Drew, Gloria",9260121132,17,Kempwood Dr,Philadelphia,PA,19119,US
120667,"Droste, Edwin",9260116974,1661,Hanna Ln,Miami-Dade,FL,33014,US
120803,"Droste, Victor",9260123737,1722,Calm Winds Ct,San Diego,CA,91941,US
120138,"Duckett, Shani",1600101841,9,Northgate Drive,Melbourne,,3168,AU
120279,"Dunlap, Kareema",9260123839,181,Falls River Ave,San Diego,CA,92021,US
120808,"Dupree, Marcel",9260123656,3231,Amity Hill Ct,San Diego,CA,92064,US
120142,"Eastley, Vincent",1600101816,4,Dalmore Drive,Melbourne,,3095,AU
120779,"Eggleston, Jennifer",9260116997,140,Hollow Ct,Miami-Dade,FL,33032,US
120774,"El-Amin, Sue",9260121123,1030,Indigo Dr,Philadelphia,PA,19122,US
120119,"Elleman, Lal",1600103015,1021,Haupapa Street,Sydney,,1219,AU
121015,"Elmoslamy, Wilson",9260123927,3118,Iris Dr,San Diego,CA,92105,US
120121,"Elvish, Irenie",1600103044,3,Mundi Place,Sydney,,1232,AU
120110,"Entwisle, Dennis",1600103011,9,Grayson Avenue Papatoetoe,Sydney,,1226,AU
120810,"Esguerra, Loyal",9260116917,2726,Fairfax Woods Dr,Miami-Dade,FL,33162,US
121103,"Farnsworth, Brian",9260123783,8458,Crispwood Ct,San Diego,Ca,91901,US
121021,"Farren, Priscilla",9260123790,1538,Dacian Rd,San Diego,CA,92124,US
120747,"Farthing, Zashia",9260123756,763,Chatterson Dr,San Diego,CA,92116,us
121143,"Favaron, Louis",9260117004,163,Horseshoe Bend,Miami-Dade,FL,33176,US
121052,"Fay, Richard",9260120973,7660,Calvary Dr,Philadelphia,PA,19107,US
120744,"Feigenbaum, Alden",9260123874,43,Glen Bonnie Ln,San Diego,CA,92122,US
120753,"Ferrari, Ralph",9260116946,309,Gilliam Ln,Miami-Dade,FL,33172,US
121031,"Filan, Scott",9260121065,375,Foxmoor Ct,Philadelphia,PA,19142,US
120150,"Filo, John",1600101856,5,Sun Pl,Melbourne,,3001,AU
120195,"Fiocca, Jina",1600101807,81,Burwood Road,Melbourne,,3155,AU
121102,"Flammia, Rocheal",9260123922,1201,Hoyle Dr,San Diego,CA,91978,us
120260,"Fletcher, Christine",9260123780,2416,Cove Point Dr,San Diego,CA,91910,US
120272,"Flow, Febin",9260121137,461,Kimberly Dr,Philadelphia,PA,19121,US
120697,"Fouche, Madelaine",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
121023,"Fuller, Shawn",9260123819,1195,Echo Glen Ln,San Diego,CA,92028,US
121136,"Galarneau, Lesia",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120778,"Gardner, Angela",9260121040,349,Eason Cir,Philadelphia,PA,19104,US
120180,"George, Vino",1600101796,9,Adelaide Terrace,Melbourne,,3000,AU
120112,"Glattback, Ellis",1600101868,7,Vulture Street,Melbourne,,3174,AU
121124,"Gonzalez, Deginald",9260117036,1611,Kronos Ln,Miami-Dade,FL,33054,US
121009,"Goodwin, Robert",9260123860,31,Friendly Dr,San Diego,CA,92116,US
120995,"Gordo, Lily-Ann",9260121130,545,Jones Sausage Rd,Philadelphia,PA,19144,US
120191,"Graham-Rowe, Jannene",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
120108,"Gromek, Gladys",1600101827,6,George Street,Melbourne,,3000,AU
121047,"Grzebien, Karen",9260123757,627,Chenworth Dr,San Diego,CA,92082,US
120672,"Guscott, Verne",1600102990,249,Collins Street,Sydney,,2009,AU
120691,"Habres, Sek",1600103058,11,Reid Street,Sydney,,1005,AU
121129,"Hafley, Yusef",9260116796,192,Beaufort St,Miami-Dade,FL,33133,US
121045,"Hampton, Cascile",9260123748,8560,Carlton Ave,San Diego,CA,92027,US
121013,"Hargrave, Seco",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120743,"Harrison, Chimena",9260123715,77,Braswell Ct,San Diego,CA,91950,US
120816,"Hart, Tessia",9260116839,2170,Buttercup Ln,Miami-Dade,FL,33055,US
120118,"Hartshorn, Darshi",1600103076,1,Waterloo Street,Sydney,,2065,AU
120745,"Harvill, Barbara",9260120919,23,Alderman Cir,Philadelphia,PA,19129,US
120194,"Harwood, Reece",1600101807,81,Burwood Road,Melbourne,,3155,AU
121061,"Hassam, Lauris",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120659,"Havasy, Jay",9260120924,1930,Apple Meadow Dr,Philadelphia,PA,19145,US
120154,"Hayawardhana, Caterina",1600102972,21,Albert St,Sydney,,1170,AU
121098,"Heatwole, Hal",9260120994,1543,Cherrycrest Ct,Philadelphia,PA,19154,US
120999,"Heilmann, Sherelyn",9260123969,3750,Langley Cir,San Diego,CA,92025,US
120813,"Heinsler, John",9260116828,39,Brush Stream Dr,Miami-Dade,FL,33179,US
121123,"Helyar, Randy",9260121031,3313,Dothan Ct,Philadelphia,PA,19107,US
120718,"Hennington, Charles",9260121043,40,Elsbeth Ct,Philadelphia,PA,19144,US
121130,"Herndon, Gary",9260121156,11,Langdale Pl,Philadelphia,PA,19143,US
120196,"Hieds, Merle",1600101856,5,Sun Pl,Melbourne,,3001,AU
120261,"Highpoint, Harry",9260116777,18,Antler Ct,Miami-Dade,FL,33135,US
121106,"Hilburger, James",9260116793,139,Barton Pines Rd,Miami-Dade,FL,33189,US
120669,"Hill, Ronald",9260121037,2823,Eagles Landing Dr,Philadelphia,PA,19146,US
120125,"Hofmeister, Fong",1600102996,17,Druitt Street,Sydney,,2122,AU
121125,"Holt, Michael",9260121127,270,Johnson St,Philadelphia,PA,19138,US
121070,"Holthouse, Agnieszka",9260116982,41,Hawthorne Way,Miami-Dade,FL,33018,US
120815,"Honore, Craig",9260116824,7766,Brimfield Ct,Miami-Dade,FL,33141,US
121071,"Hoppmann, John",9260116922,744,Farmington Grove Dr,Miami-Dade,FL,33141,US
120773,"Horne, Entrisse",9260117000,7497,Holly Pointe Dr,Miami-Dade,FL,33133,US
120792,"Horne, Omeba",9260121126,4750,Jet Ln,Philadelphia,PA,19119,US
120106,"Hornsey, John",1600103064,325,Sherwood Road,Sydney,,1100,AU
120113,"Horsey, Riu",1600101859,45,Talavera Road,Melbourne,,3146,AU
120123,"Hotstone, Kimiko",1600103050,54,Overseas Drive,Sydney,,2066,AU
121001,"House, Tony",9260116817,1,Bona Ct,Miami-Dade,FL,33140,US
120685,"Howard, Anita",9260121044,1455,Emerywood Dr,Philadelphia,PA,19124,US
120729,"Howell, Kimberly",9260117044,260,Langstonshire Ln,Miami-Dade,FL,33134,US
121085,"Huslage, Rebecca",9260123814,1984,Dunhill Ter,San Diego,CA,92008,US
120137,"Iyengar, Marina",1600101814,9,Crusin Place,Melbourne,,3086,AU
121026,"Jaime, Terrill",9260121098,697,Harcourt Dr,Philadelphia,PA,19136,US
120155,"James, Narelle",1600101861,30,Thorncraft Parade,Melbourne,,2113,AU
121104,"Johnson, Leoma",9260120956,4002,Brassfield Rd,Philadelphia,PA,19134,US
120797,"Jones, Sherrie",9260116902,19,Dutch Creek Dr,Miami-Dade,FL,33186,US
120278,"Jongleux, Binit",9260123699,3053,Blackpine Ct,San Diego,CA,91910,US
120716,"Juif, Kenneth",9260121085,881,Green Downs Dr,Philadelphia,PA,19143,US
121091,"Kadiri, Ernest",9260121067,6,Frissell Ave,Philadelphia,Pa,19142,US
121043,"Kagarise, Sigrid",9260121031,3313,Dothan Ct,Philadelphia,PA,19107,US
120269,"Kagolanu, Shrimatee",9260120925,65,Applecross Cir,Philadelphia,PA,19131,US
120132,"Kaiser, Fancine",1600103012,33,Great South Road Riccarton,Sydney,,2000,AU
120157,"Karavdic, Leonid",1600102978,121,Blackburn Road,Sydney,,2580,AU
120783,"Karp, Davis",9260121117,458,Huckleberry Dr,Philadelphia,PA,19104,US
120796,"Kellis, Philip",9260121043,40,Elsbeth Ct,Philadelphia,PA,19144,US
120766,"Kempster, Janelle",9260116780,8,Ashwood Dr,Miami-Dade,FL,33173,US
120682,"Kennedy, Barbara",9260120930,1635,Auburn Church Rd,Philadelphia,PA,19119,US
120801,"Kennedy, Kathryn",9260120975,353,Cameron Woods Dr,Philadelphia,PA,19148,US
120658,"Kennedy, Kenneth",9260123927,3118,Iris Dr,San Diego,CA,92105,US
121088,"Kernitzki, Momolu",9260120959,422,Brentwood Rd,Philadelphia,PA,19134,US
120992,"Kicak, Lisa",9260116861,1974,Clear Brook Dr,Miami-Dade,FL,33172,US
120736,"Kiemle, Parie",9260116999,26,Holly Park Dr,Miami-Dade,FL,33130,US
120177,"Kierce, Franca",1600103075,120,Walkers Road,Sydney,,2015,AU
120746,"Kimmerle, Kevie",9260121115,162,Horsetrail Way,Philadelphia,PA,19121,US
120170,"Kingston, Alban",1600102984,5,Buffalo Road,Sydney,,1042,AU
121063,"Kinol, Regi",9260116933,63,Fountainhead Dr,Miami-Dade,FL,33180,US
121034,"Kirkman, John",9260116898,40,Dry Fork Ln,Miami-Dade,FL,33193,US
120698,"Kistanna, Geoff",1600103007,28,Fonceca Street,Sydney,,1171,au
120128,"Kletschkus, Monica",1600101800,26,Bay Street,Melbourne,,3050,AU
121090,"Klibbe, Betty",9260123969,3750,Langley Cir,San Diego,CA,92025,US
121110,"Knapp, Albert",9260116923,4368,Farrington Dr,Miami-Dade,FL,33165,US
120757,"Knopfmacher, Paul",9260123735,804,Calebra Way,San Diego,CA,92104,US
121081,"Knudson, Susie",9260123871,110,Glascock St,San Diego,CA,91950,US
120721,"Knust, Dlutomi",9260120955,744,Brannigan Pl,Philadelphia,PA,19141,US
120683,"Kochneff, Deven",9260121087,765,Greenhaven Ln,Philadelphia,PA,19102,US
121058,"Kohake, Del",9260123839,181,Falls River Ave,San Diego,CA,92021,US
120765,"Kokoszka, Nikeisha",9260123780,2416,Cove Point Dr,San Diego,Ca,91910,US
120740,"Koonce, Lisa",9260116960,1636,Gorman St,Miami-Dade,FL,33012,US
120663,"Kornblith, Anglar",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120266,"Krafve, Bao",9260123722,12,Brigadoon Dr,San Diego,CA,92040,US
121095,"Kratzke, Sara",9260123796,4137,Deer Haven Dr,San Diego,CA,92101,US
121120,"Labach, Susan",9260121063,1624,Fox Trail Ln,Philadelphia,PA,19146,US
120189,"Lachlan, Mihailo",1600103000,17,Elsie St,Sydney,,2154,AU
121010,"Lamp, Donald",9260116965,509,Green Level To Durham Rd,Miami-Dade,FL,33142,US
120274,"Landry, Angela",9260121115,162,Horsetrail Way,Philadelphia,PA,19121,US
120690,"Langston, Taronda",9260120930,1635,Auburn Church Rd,Philadelphia,PA,19119,US
121145,"Lansberry, Dennis",9260116886,7508,Declaration Dr,Miami-Dade,FL,33012,US
121069,"Lapsley, Jason",9260123763,2148,Circlebank Dr,San Diego,CA,92064,US
120275,"Lattimer, Brandy",9260123733,56,Cahill Rd,San Diego,CA,92065,US
120671,"Latty, William",9260120959,422,Brentwood Rd,Philadelphia,PA,19134,US
120280,"Laurer, Jaime",9260121097,211,Hamstead Crossing Dr,Philadelphia,PA,19124,US
121118,"Lawson, Paul",9260121145,598,Lake Ct,Philadelphia,Pa,19122,US
120665,"Leacock, Jill",9260123932,1288,Joe Leach Rd,San Diego,CA,91945,US
120694,"Leazer, Sharon",1600103030,29,Lawson Ave,Sydney,,1220,AU
120762,"Leone, Marvin",9260121005,2898,Cookshire Dr,Philadelphia,PA,19121,US
120731,"Lerew, Robert",9260123660,2254,Appledown Dr,San Diego,CA,92008,US
121108,"Levi, Libby",9260116791,1713,Barham Siding Rd,Miami-Dade,FL,33013,US
120136,"Leyden, Atul",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120141,"Liebman, Amanda",1600103010,46,George Street,Sydney,,2012,AU
120769,"Lightbourne, Abelino",9260116816,6137,Blue Water Ct,Miami-Dade,FL,33161,US
121014,"Liguori, Donelle",9260116940,6,Gamelyn Walk,Miami-Dade,FL,33183,US
120788,"Lisowe, Smitty",9260123664,1058,Atchison St,San Diego,CA,92120,US
120101,"Lu, Patrick",1600102980,51,Botany Road,Sydney,,1230,AU
120130,"Lyon, Kevin",1600103019,2,Hill St,Sydney,,1044,AU
121056,"Lyszyk, Stacey",9260123927,3118,Iris Dr,San Diego,CA,92105,US
121067,"Macnair, Jeanilla",9260123814,1984,Dunhill Ter,San Diego,CA,92008,US
121018,"Magolan, Julienne",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120163,"Magrath, Brett",1600101846,253,Princess Hwy,Melbourne,,3000,AU
121111,"Maholo, Salim",9260123866,91,Gardner St,San Diego,CA,92057,US
121065,"Malta, Corneille",9260123836,1793,Falcon Rest Cir,San Diego,CA,92113,US
120793,"Mamo, William",9260116878,183,Dacus Pl,Miami-Dade,FL,33055,US
121046,"Mandzak, Roger",9260121106,443,High Country Dr,Philadelphia,PA,19147,US
121127,"Mangini, Keyna",9260123867,9,Garner Rd,San Diego,CA,91910,US
120809,"Marion, Chiorene",9260116782,89,Atchison St,Miami-Dade,FL,33129,US
120727,"Marples, Donald",9260123734,2227,Calais Ct,San Diego,CA,92122,US
120161,"Martines, Rosette",1600101840,147,North Clark Street,Melbourne,,3156,AU
120117,"Mccleary, Bill",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121053,"Mcdade, Tywanna",9260123761,87,Christofle Ln,San Diego,CA,92082,US
121029,"Mcelwee, Kuo-Chung",9260123790,1538,Dacian Rd,San Diego,CA,92124,US
121139,"Mckee, Diosdado",9260123895,81,Hanska Way,San Diego,CA,92014,US
121008,"Mckenzie, Eron",9260121071,131,Gem Dr,Philadelphia,PA,19122,US
121005,"Mclamb, Yuh-Lang",9260116949,9891,Glendower Rd,Miami-Dade,FL,33154,US
120751,"Mea, Azavi0us",9260116836,649,Buckboard Ln,Miami-Dade,FL,33014,US
121079,"Mees, Azmi",9260120942,824,Beaufort St,Philadelphia,PA,19128,US
121036,"Mesley, Teresa",9260121101,967,Hearthside Ct,Philadelphia,PA,19148,US
121074,"Michonski, Eric",9260123951,1921,Kingston Ridge Rd,San Diego,CA,92129,US
121037,"Miketa, Muthukumar",9260117011,2185,Ileagnes Rd,Miami-Dade,FL,33176,US
120259,"Miller, Anthony",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120760,"Miller, Pamela",9260123823,108,Elmview Dr,San Diego,CA,92111,US
120140,"Minas, Michael",1600103041,95,Miller St,Sydney,,2125,AU
120695,"Moffat, Trent",1600101835,8,Learmonth Road,Melbourne,,3101,au
120171,"Moody, Alena",1600103057,248,Port Road,Sydney,,2020,AU
120184,"Moore, Ari",1600103062,241,Royal Perade,Sydney,,1115,AU
120712,"Motashaw, Elisabeth",9260116823,360,Bridgepath Dr,Miami-Dade,FL,33150,US
121099,"Mrvichin, Royall",9260120976,31,Cantwell Ct,Philadelphia,PA,19141,US
121051,"Myers, Glorina",9260123851,335,Fox Ct,San Diego,CA,92029,US
121128,"Nazar, Glacia",9260123950,1250,Kingston Ridge Rd,San Diego,CA,92128,US
120715,"Neal, Angelia",9260123661,6278,Aqua Marine Ln,San Diego,CA,92054,US
121096,"Newstead, Robert",9260117041,683,Lake Hill Dr,Miami-Dade,FL,33176,US
120122,"Ngan, Christina",1600101847,11,Prospect Hill Road,Melbourne,,3001,AU
120192,"Nichollas, Anthony",1600103056,66,Phillip Street,Sydney,,2124,AU
120115,"Nichollas, Hugh",1600103020,30,Hotham Parade,Sydney,,2600,AU
120749,"Niemann, Kevin",9260123704,651,Bluebird Ct,San Diego,CA,92027,US
121066,"Norman, Ceresh",9260121149,251,Lake Tillery Dr,Philadelphia,PA,19148,US
121072,"North, Christer",9260121038,2765,Eaglesham Way,Philadelphia,PA,19121,US
120166,"Nowd, Fadi",1600103000,17,Elsie St,Sydney,,2154,AU
120270,"Nuss, Grezegorz",9260116986,1916,Hebron Church Rd,Miami-Dade,FL,33186,US
121115,"O'Carroll, Aquilla",9260123738,5194,Calm Winds Ct,San Diego,CA,92071,US
121087,"O'Suilleabhain, Virtina",9260117018,219,Ivydale Dr,Miami-Dade,FL,33178,US
120790,"O'Toole, Tara",9260121137,461,Kimberly Dr,Philadelphia,Pa,19121,US
120726,"Obermeyer, Lutezenia",9260120979,3246,Cartier Dr,Philadelphia,PA,19140,US
120678,"Octetree, Lucretta",9260123841,433,Farmington Woods Dr,San Diego,CA,92054,US
120723,"Olsen, Deanna",9260121109,218,Hillsford Ln,Philadelphia,PA,19146,US
120666,"Onuscheck, John",9260123652,215,Alercia Ct,San Diego,CA,92029,US
120173,"Osborn, Hernani",1600101808,8,Cannon Lane Whitby,Melbourne,,3350,AU
121068,"Osuba, Salaheloin",9260123681,2546,Belford Valley Ln,San Diego,CA,91932,US
121084,"Ould, Tulsidas",9260123776,1025,Coronado Dr,San Diego,Ca,92028,US
120806,"Ousley, Lorna",9260117027,881,Kettlebridge Dr,Miami-Dade,FL,33183,US
120772,"Overdorff, Erich",9260116868,1407,Coorsdale Dr,Miami-Dade,FL,33161,US
120176,"Pa, Koavea",1600101822,1,Endeavour Road,Melbourne,,3225,AU
121131,"Pantages, William",9260123709,198,Botany Bay Dr,San Diego,CA,92021,US
120802,"Parker, U'Vonda",9260121139,11,Kinderston Dr,Philadelphia,PA,19104,US
120770,"Pascoe, Julia",9260116858,973,Chris Dr,Miami-Dade,FL,33183,US
120787,"Peachey, Carl",9260123750,175,Carteret Dr,San Diego,CA,92025,US
120120,"Peiris, Krishna",1600103010,46,George Street,Sydney,,2012,AU
121126,"Penhale, James",9260120951,142,Bluffridge Dr,Philadelphia,PA,19141,US
120807,"Peppers, Gerlinde",9260123858,1209,Fraternity Court Dr,San Diego,CA,92173,US
120696,"Pettolino, Peter",1600101822,1,Endeavour Road,Melbourne,,3225,AU
120151,"Phaiyakounh, Julianna",1600103002,3,Evans St,Sydney,,2011,AU
120159,"Phoumirath, Lynelle",1600103074,166,Toorak Road,Sydney,,2119,AU
120158,"Pilgrim, Daniel",1600103048,8,Nicholson Street,Sydney,,4720,AU
120784,"Pinol, Jennifer",9260120993,9,Chastain Dr,Philadelphia,PA,19132,US
120135,"Platts, Alexei",1600103071,39,Station Street,Sydney,,2000,au
120178,"Plested, Billy",1600103038,51,Martin Place,Sydney,,1131,AU
121086,"Plybon, John-Michael",9260116892,890,Dinwiddie Ct,Miami-Dade,FL,33174,US
120276,"Plybon, Nicholas",9260121064,2975,Foxbury Dr,Philadelphia,Pa,19120,US
121064,"Polky, Asishana",9260123811,41,Dubose St,San Diego,CA,92110,US
120689,"Pongor, Katherine",9260121009,4750,Cottonwood Ln,Philadelphia,PA,19148,US
120748,"Post, Nahliah",9260117043,52,Landor Rd,Miami-Dade,FL,33169,US
120105,"Povey, Liz",1600101825,23,Garden Street,Melbourne,,8004,AU
120165,"Pretorius, Tadashi",1600103020,30,Hotham Parade,Sydney,,2600,AU
121133,"Pringley, Peter",9260120956,4002,Brassfield Rd,Philadelphia,PA,19134,US
121092,"Pritt, Gynell",9260123941,8112,Kenna Ct,San Diego,CA,92116,US
121054,"Pulliam, Daniel",9260123704,651,Bluebird Ct,San Diego,CA,92027,US
120186,"Quinby, Merryn",1600102997,54,Dunning Street,Sydney,,2120,AU
120661,"Racine, Cynthia",9260123745,63,Cane Creek Dr,San Diego,CA,92131,US
120116,"Ralston, Austen",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120768,"Rayburn, Roland",9260120981,31,Castalia Dr,Philadelphia,PA,19140,US
121020,"Ridley, Cherda",9260120918,30,Aiken Pkwy,Philadelphia,PA,19142,US
120719,"Ridley, Roya",9260123695,6121,Birklands Dr,San Diego,CA,92025,US
120267,"Rink, Belanda",9260123891,43,Grist Mill Rd,San Diego,CA,92122,US
121042,"Robbin-Coker, Joseph",9260123688,2645,Berkshire Downs Dr,San Diego,CA,92008,US
120129,"Roebuck, Alvin",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121027,"Rudder, Allan",9260123806,941,Dixon Dr,San Diego,CA,91911,US
120147,"Rusli, Skev",1600103069,26,St Kilda Road,Sydney,,2022,AU
121135,"Ruta, Tammy",9260120927,89,Ashley Brook Ct,Philadelphia,PA,19131,US
120777,"Sacher, Kary",9260123653,2547,Allenby Dr,San Diego,CA,91913,US
121148,"Sadig, Shane",9260116770,5857,Academy St,Miami-Dade,FL,33133,US
121146,"Sangiorgio, Julieanne",9260121055,6042,Farmstone Dr,Philadelphia,PA,19125,US
120673,"Santomaggio, Pearl",1600101855,2,Stephen Road,Melbourne,,3181,AU
121089,"Sauder, Gregory",9260117020,974,Joel Ct,Miami-Dade,FL,33030,US
121105,"Savacool, Jessica",9260116883,618,Darlington Pl,Miami-Dade,FL,33143,US
120734,"Saylor, Svein",9260121110,3707,Hillside Dr,Philadelphia,PA,19144,US
121122,"Scarbrough, Stancey",9260116954,701,Glenridge Dr,Miami-Dade,FL,33177,US
120162,"Scordia, Randal",1600101859,45,Talavera Road,Melbourne,,3146,AU
120814,"Scroggin, Victor",9260123664,1058,Atchison St,San Diego,CA,92120,US
120160,"Segrave, Chuck",1600103065,1,Sleigh Street,Sydney,,1164,AU
120664,"Senchak, Brock",9260121088,1779,Greymist Ln,Philadelphia,PA,19142,US
120994,"Sergeant, Danelle",9260123959,734,Ladys Slipper Ct,San Diego,CA,92105,us
121117,"Sergi, Teresa",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120134,"Shannan, Sian",1600103061,5,Rosebery Ave,Sydney,,2010,AU
120107,"Sheedy, Sherie",1600101851,12,Sir William Pickering Drive,Melbourne,,3175,AU
120722,"Sheffield, Ishmar",9260116991,939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US
120742,"Shewitz, Ronald",9260120978,507,Carriage Pine Dr,Philadelphia,PA,19125,US
120277,"Shirts, Wesley",9260116873,710,Crawford Rd,Miami-Dade,FL,33015,US
120776,"Silverthorne, Ratna",9260116930,284,Forest Dr,Miami-Dade,FL,33142,US
120174,"Simms, Doungkamol",1600101828,30,Goodall Ave,Melbourne,,3053,AU
120782,"Sines, Rilma",9260120951,142,Bluffridge Dr,Philadelphia,PA,19141,US
120781,"Sitnik, Sarah",9260123872,6846,Glastonbury Rd,San Diego,CA,91941,US
120717,"Sleva, Jon",9260116806,472,Big Bend Ct,Miami-Dade,FL,33155,US
120143,"Sloey, Phu",1600103054,1,Pacific Rise Mount Wellington,Sydney,,20000,AU
121028,"Smades, William",9260116940,6,Gamelyn Walk,Miami-Dade,FL,33183,US
121004,"Smith, Kellen",9260123920,1466,Horne St,San Diego,CA,92117,US
121032,"Smith, Nasim",9260123683,340,Bellevue Rd,San Diego,CA,92027,US
120660,"Smith, Robert",9260117010,4156,Hwy 42,Miami-Dade,FL,33180,US
121077,"Smotherly, Bryce",9260116838,4396,Burntwood Cir,Miami-Dade,FL,33193,US
121147,"Sneed, Christine",9260116938,151,Gail Ridge Ln,Miami-Dade,FL,33182,US
120156,"Snellings, Gerry",1600103069,26,St Kilda Road,Sydney,,2022,AU
121033,"Snitzer, Kristie",9260121026,2157,Denberg Ln,Philadelphia,PA,19140,US
120677,"Sochacki, Suad",9260116775,3519,Amersham Ln,Miami-Dade,FL,33160,US
120133,"Soltau, Petrea",1600101818,105,East St,Melbourne,,8060,AU
120111,"Spillane, Ubaldo",1600103064,325,Sherwood Road,Sydney,,1100,AU
120720,"Spingola, John",9260121100,1219,Hawkshead Rd,Philadelphia,PA,19139,US
121060,"Spofford, Elizabeth",9260116923,4368,Farrington Dr,Miami-Dade,FL,33165,US
120164,"Stamalis, Ranj",1600101850,435,Sherwood Rd,Melbourne,,8003,AU
120799,"Stefandonovan, Jeffery",9260121028,47,Dixie Trl,Philadelphia,PA,19136,US
121142,"Steiber, Reginald",9260121136,15,Kilmorack Dr,Philadelphia,PA,19136,US
121022,"Stevens, Robert",9260123921,224,Horsham Way,San Diego,CA,91950,US
121112,"Stouchko, Lee",9260116786,101,Avent Ferry Rd,Miami-Dade,FL,33178,US
120193,"Streit, Russell",1600101824,176,Exhibition Street,Melbourne,,3170,AU
121075,"Sugg, Kasha",9260123796,4137,Deer Haven Dr,San Diego,CA,92101,US
121016,"Sullivan, Lutezenia",9260116789,4758,Barbara Dr,Miami-Dade,FL,33180,US
121000,"Supple, Herman",9260117030,4,Kimbrook Dr,Miami-Dade,Fl,33187,US
120131,"Surawski, Marinus",1600103046,163,Nebo Road,Sydney,,1117,AU
121083,"Sutton, Tingmei",9260117007,6940,Hunt Farms Ln,Miami-Dade,FL,33147,US
120738,"Swaiti, Huilun",9260121097,211,Hamstead Crossing Dr,Philadelphia,PA,19124,US
121134,"Tacosa, Paul",9260123671,2733,Balfour Downs Cir,San Diego,CA,92109,US
120169,"Tannous, Cos",1600101857,13,Symonds Street,Melbourne,,3005,AU
121094,"Tate, Larry",9260123961,2704,Lake Wheeler Rd,San Diego,CA,92082,US
120693,"Tellam, Diaz",1600102970,8,Aboukis Street,Sydney,,1223,AU
120767,"Terricciano, Legette",9260121032,6348,Draper Rd,Philadelphia,PA,19131,US
120755,"Thoits, Elizabeth",9260123885,5,Green Lantern St,San Diego,CA,92128,US
120775,"Thompson, Tanya",9260116965,509,Green Level To Durham Rd,Miami-Dade,FL,33142,US
120167,"Tilley, Kimiko",1600103018,153,High St,Sydney,,2006,AU
120681,"Tolbet, Elery",9260116808,63,Bishops Park Dr,Miami-Dade,FL,33016,US
121138,"Tolley, Hershell",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120737,"Toner, Brenner",9260123826,36,Enka Dr,San Diego,CA,92037,US
120692,"Tregonning, Rit",1600102983,26,Brisbane Avenue,Sydney,,2064,AU
120686,"Tucker, Berether",9260123670,1999,Avery St,San Diego,CA,91941,US
120732,"Uenking, Kent",9260116807,2853,Birchford Ct,Miami-Dade,FL,33142,US
120752,"Van Damme, Jean-Claude",9260116858,973,Chris Dr,Miami-Dade,FL,33183,US
121093,"Vasconcellos, Carl",9260123738,5194,Calm Winds Ct,San Diego,CA,92071,US
120268,"Villeneuve, Jacques",9260121139,11,Kinderston Dr,Philadelphia,PA,19104,US
120758,"Voltz, Sal",9260116929,34,Flicker Ct,Miami-Dade,FL,33168,US
121057,"Voron, Tachaun",9260120986,990,Center Pointe Dr,Philadelphia,PA,19143,US
120153,"Waal, Samantha",1600102978,121,Blackburn Road,Sydney,,2580,AU
120996,"Wade, Johannes",9260123797,139,Deer Hunter Ct,San Diego,CA,91950,US
120780,"Walcott, Kimberly",9260121101,967,Hearthside Ct,Philadelphia,PA,19148,US
120805,"Walker, Robert",9260121022,153,Dawson Mill Run,Philadelphia,PA,19143,US
121039,"Washington, Donald",9260116813,1668,Bladen St,Miami-Dade,FL,33055,US
120657,"Weisbarth, Theresa",9260123821,1571,Edenton St,San Diego,CA,92114,US
121078,"Wende, Lionel",9260117043,52,Landor Rd,Miami-Dade,FL,33169,US
121024,"Westlund, Michael",9260123709,198,Botany Bay Dr,San Diego,CA,92021,US
121041,"Wetherington, Jaime",9260123714,1428,Brandywine Dr,San Diego,CA,92071,US
121114,"Whipkey, Okema",9260123718,7834,Briar Oaks Ln,San Diego,CA,92104,US
120725,"Whitlock, Robert",9260123669,456,Avent Hill,San Diego,CA,92117,US
120179,"Wills, Matsuoka",1600101830,5059,Great Eastern Highway,Melbourne,,8010,AU
120139,"Wilson, Fang",1600103068,354,St Kilda Rd,Sydney,,2145,AU
120271,"Winge, Kenisha",9260117015,94,Irelan Dr,Miami-Dade,FL,33144,US
120750,"Woods, Connie",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120764,"Worton, Steven",9260123827,3100,Erinsbrook Dr,San Diego,CA,92026,US
120684,"Woyach, Suzon",9260116853,1107,Caswell Ct,Miami-Dade,FL,33141,US
120771,"Xing Moore, Wei",9260117001,84,Holt Dr,Miami-Dade,FL,33183,US
120102,"Zhou, Tom",1600101795,1,Adelaide Street MIC Court,Melbourne,,3125,AU
120804,"Zied, Ahmed",9260116786,101,Avent Ferry Rd,Miami-Dade,FL,33178,US
120670,"Zisek, Odudu",9260121153,114,Lakerun Ct,Philadelphia,PA,19146,US
120148,"Zubak, Michael",1600102992,51,Court Crescent Panmure,Sydney,,2041,AU
;;;;
run;

data ORION.EMPLOYEE_DONATIONS;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Qtr1 length=8;
   attrib Qtr2 length=8;
   attrib Qtr3 length=8;
   attrib Qtr4 length=8;
   attrib Recipients length=$65;
   attrib Paid_By length=$17;

   infile datalines dsd;
   input
      Employee_ID
      Qtr1
      Qtr2
      Qtr3
      Qtr4
      Recipients
      Paid_By
   ;
datalines4;
120265,,,,25,"Mitleid International 90%, Save the Baby Animals 10%",Cash or Check
120267,15,15,15,15,"Disaster Assist, Inc. 80%, Cancer Cures, Inc. 20%",Payroll Deduction
120269,20,20,20,20,"Cancer Cures, Inc. 10%, Cuidadores Ltd. 90%",Payroll Deduction
120270,20,10,5,,"AquaMissions International 10%, Child Survivors 90%",Cash or Check
120271,20,20,20,20,"Cuidadores Ltd. 80%, Mitleid International 20%",Payroll Deduction
120272,10,10,10,10,"AquaMissions International 10%, Child Survivors 90%",Payroll Deduction
120275,15,15,15,15,"AquaMissions International 60%, Child Survivors 40%",Credit Card
120660,25,25,25,25,"Disaster Assist, Inc.",Credit Card
120662,10,,5,5,"Cancer Cures, Inc.",Cash or Check
120663,,,5,,"EarthSalvors 30%, Vox Victimas 70%",Cash or Check
120668,10,10,10,10,"AquaMissions International 80%, Child Survivors 20%",Credit Card
120669,15,15,15,15,"AquaMissions International 60%, Child Survivors 40%",Payroll Deduction
120671,20,20,20,20,"Conserve Nature, Inc. 20%, AquaMissions International 80%",Credit Card
120677,25,25,25,25,"EarthSalvors 60%, Vox Victimas 40%",Credit Card
120678,10,10,,,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Payroll Deduction
120679,,20,5,15,"Cancer Cures, Inc.",Cash or Check
120680,15,15,15,15,"Cancer Cures, Inc. 20%, Cuidadores Ltd. 80%",Credit Card
120681,10,10,5,15,"EarthSalvors 60%, Vox Victimas 40%",Cash or Check
120684,5,5,5,5,"Vox Victimas 60%, Conserve Nature, Inc. 40%",Payroll Deduction
120686,15,15,15,15,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Payroll Deduction
120689,15,15,15,15,"Disaster Assist, Inc. 40%, Cancer Cures, Inc. 60%",Credit Card
120713,15,15,15,15,"Save the Baby Animals 90%, EarthSalvors 10%",Payroll Deduction
120715,10,10,10,10,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
120721,5,5,5,5,"Conserve Nature, Inc. 60%, AquaMissions International 40%",Payroll Deduction
120726,10,10,10,10,"Child Survivors 70%, Disaster Assist, Inc. 30%",Payroll Deduction
120734,,,15,10,"EarthSalvors 40%, Vox Victimas 60%",Cash or Check
120736,25,,,20,Cuidadores Ltd.,Cash or Check
120740,15,15,15,15,"Cancer Cures, Inc.",Credit Card
120742,,,10,10,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Cash or Check
120745,15,15,15,15,"Conserve Nature, Inc. 80%, AquaMissions International 20%",Payroll Deduction
120746,20,20,20,20,"Child Survivors 90%, Disaster Assist, Inc. 10%",Payroll Deduction
120747,20,20,20,20,"Child Survivors 90%, Disaster Assist, Inc. 10%",Credit Card
120748,20,20,20,20,Save the Baby Animals,Payroll Deduction
120752,10,,,,"Cuidadores Ltd. 60%, Mitleid International 40%",Payroll Deduction
120753,25,25,25,25,"Conserve Nature, Inc. 50%, AquaMissions International 50%",Payroll Deduction
120754,10,10,10,10,"Cancer Cures, Inc. 60%, Cuidadores Ltd. 40%",Payroll Deduction
120757,,,15,5,AquaMissions International,Cash or Check
120759,15,20,5,,Child Survivors,Cash or Check
120760,,15,20,,"Cancer Cures, Inc. 40%, Cuidadores Ltd. 60%",Cash or Check
120761,10,10,10,10,"EarthSalvors 40%, Vox Victimas 60%",Payroll Deduction
120762,,,5,5,Cuidadores Ltd.,Cash or Check
120764,15,15,15,15,"Vox Victimas 30%, Conserve Nature, Inc. 70%",Payroll Deduction
120766,25,25,25,25,"Mitleid International 80%, Save the Baby Animals 20%",Payroll Deduction
120767,15,15,15,15,"Vox Victimas 50%, Conserve Nature, Inc. 50%",Payroll Deduction
120768,20,20,20,,Save the Baby Animals,Payroll Deduction
120771,20,20,20,20,Cuidadores Ltd.,Credit Card
120773,10,10,10,10,Vox Victimas,Payroll Deduction
120777,5,15,5,15,"Cuidadores Ltd. 80%, Mitleid International 20%",Cash or Check
120778,15,15,15,15,"Cuidadores Ltd. 90%, Mitleid International 10%",Payroll Deduction
120783,20,20,20,20,"Disaster Assist, Inc. 10%, Cancer Cures, Inc. 90%",Payroll Deduction
120789,5,,,,"Save the Baby Animals 90%, EarthSalvors 10%",Credit Card
120790,20,20,20,20,"AquaMissions International 30%, Child Survivors 70%",Credit Card
120791,30,30,30,30,Child Survivors,Payroll Deduction
120792,20,20,20,20,"Mitleid International 40%, Save the Baby Animals 60%",Payroll Deduction
120793,15,15,15,15,Child Survivors,Credit Card
120794,,,20,20,Vox Victimas,Payroll Deduction
120799,5,5,5,5,"Cuidadores Ltd. 40%, Mitleid International 60%",Credit Card
120801,20,20,20,20,Cuidadores Ltd.,Payroll Deduction
120807,20,20,20,20,"AquaMissions International 70%, Child Survivors 30%",Credit Card
120808,,,10,,"AquaMissions International 40%, Child Survivors 60%",Cash or Check
120813,20,20,20,,"Disaster Assist, Inc. 20%, Cancer Cures, Inc. 80%",Credit Card
120814,25,25,25,25,"Child Survivors 80%, Disaster Assist, Inc. 20%",Payroll Deduction
120815,15,15,15,15,"Disaster Assist, Inc.",Payroll Deduction
120994,5,5,10,10,"Cancer Cures, Inc. 80%, Cuidadores Ltd. 20%",Cash or Check
120995,15,15,15,15,"AquaMissions International 40%, Child Survivors 60%",Payroll Deduction
120996,15,15,15,15,"Vox Victimas 70%, Conserve Nature, Inc. 30%",Credit Card
120999,5,5,5,5,"Disaster Assist, Inc. 70%, Cancer Cures, Inc. 30%",Credit Card
121000,20,20,20,20,"AquaMissions International 80%, Child Survivors 20%",Credit Card
121002,10,10,10,10,"Vox Victimas 50%, Conserve Nature, Inc. 50%",Payroll Deduction
121008,10,10,10,10,"Mitleid International 30%, Save the Baby Animals 70%",Payroll Deduction
121009,15,15,15,15,"Cancer Cures, Inc.",Payroll Deduction
121010,10,10,10,10,"Cuidadores Ltd. 60%, Mitleid International 40%",Credit Card
121012,,,5,5,"Child Survivors 10%, Disaster Assist, Inc. 90%",Cash or Check
121013,10,5,,5,"Child Survivors 60%, Disaster Assist, Inc. 40%",Cash or Check
121014,15,15,15,15,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
121018,10,,,,"Conserve Nature, Inc.",Credit Card
121022,15,15,15,15,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
121025,10,10,10,10,"Cuidadores Ltd. 70%, Mitleid International 30%",Payroll Deduction
121030,10,10,10,10,"Mitleid International 30%, Save the Baby Animals 70%",Payroll Deduction
121031,10,10,10,10,Save the Baby Animals,Payroll Deduction
121033,15,15,15,15,Mitleid International,Payroll Deduction
121036,,,,10,Mitleid International,Credit Card
121037,10,10,10,10,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Payroll Deduction
121039,10,10,10,10,"Save the Baby Animals 20%, EarthSalvors 80%",Payroll Deduction
121040,10,10,10,10,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Credit Card
121044,10,10,10,10,Vox Victimas,Payroll Deduction
121053,5,,5,,"Child Survivors 20%, Disaster Assist, Inc. 80%",Cash or Check
121054,15,15,15,15,Save the Baby Animals,Credit Card
121056,,10,10,10,"Cancer Cures, Inc.",Payroll Deduction
121058,10,10,10,10,"Disaster Assist, Inc. 90%, Cancer Cures, Inc. 10%",Credit Card
121061,10,10,10,10,"Child Survivors 20%, Disaster Assist, Inc. 80%",Payroll Deduction
121062,15,15,15,15,"Cancer Cures, Inc.",Payroll Deduction
121063,15,15,15,15,"AquaMissions International 30%, Child Survivors 70%",Payroll Deduction
121065,10,10,10,10,"EarthSalvors 90%, Vox Victimas 10%",Payroll Deduction
121069,10,10,10,10,Cuidadores Ltd.,Credit Card
121074,10,10,10,10,"Disaster Assist, Inc. 30%, Cancer Cures, Inc. 70%",Payroll Deduction
121077,15,15,15,15,EarthSalvors,Credit Card
121078,15,15,15,15,"Mitleid International 80%, Save the Baby Animals 20%",Credit Card
121079,10,10,10,10,"EarthSalvors 20%, Vox Victimas 80%",Payroll Deduction
121083,15,15,15,15,"AquaMissions International 90%, Child Survivors 10%",Payroll Deduction
121086,,10,10,,"Mitleid International 30%, Save the Baby Animals 70%",Cash or Check
121089,15,15,15,15,"AquaMissions International 70%, Child Survivors 30%",Payroll Deduction
121093,5,,,,"Conserve Nature, Inc.",Cash or Check
121097,10,10,10,10,"Cuidadores Ltd. 80%, Mitleid International 20%",Credit Card
121100,5,5,5,5,"Cuidadores Ltd. 60%, Mitleid International 40%",Payroll Deduction
121101,5,,10,5,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Cash or Check
121102,5,5,5,5,"Cancer Cures, Inc.",Credit Card
121103,10,10,10,10,Save the Baby Animals,Payroll Deduction
121105,15,15,15,15,"Disaster Assist, Inc.",Payroll Deduction
121125,10,,,,"Cancer Cures, Inc. 70%, Cuidadores Ltd. 30%",Credit Card
121126,10,,,,"Save the Baby Animals 60%, EarthSalvors 40%",Payroll Deduction
121128,10,,,,"Cancer Cures, Inc.",Credit Card
121129,10,,,,"Cuidadores Ltd. 60%, Mitleid International 40%",Cash or Check
121131,10,,,,"Vox Victimas 40%, Conserve Nature, Inc. 60%",Payroll Deduction
121132,10,,,,"EarthSalvors 50%, Vox Victimas 50%",Credit Card
121133,5,,,,"Disaster Assist, Inc.",Payroll Deduction
121134,5,,,,"Save the Baby Animals 40%, EarthSalvors 60%",Cash or Check
121136,5,5,5,5,"Disaster Assist, Inc. 10%, Cancer Cures, Inc. 90%",Cash or Check
121138,10,10,10,10,Cuidadores Ltd.,Payroll Deduction
121140,10,10,10,10,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Credit Card
121142,35,35,35,35,"AquaMissions International 10%, Child Survivors 90%",Payroll Deduction
121143,35,35,35,35,"Mitleid International 60%, Save the Baby Animals 40%",Payroll Deduction
121145,35,35,35,35,Save the Baby Animals,Payroll Deduction
121147,10,10,10,10,"Cuidadores Ltd. 50%, Mitleid International 50%",Payroll Deduction
;;;;
run;

data ORION.EMPLOYEE_INFORMATION;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Department length=$40;
   attrib Job_Title length=$25 label='Employee Job Title';
   attrib Salary length=8 label='Employee Annual Salary' format=DOLLAR12.;
   attrib Employee_Gender length=$1 label='Employee Gender';
   attrib Birth_Date length=8 label='Employee Birth Date' format=DATE9.;
   attrib Employee_Hire_Date length=8 label='Employee Hire Date' format=DATE9. informat=DATE9.;
   attrib Employee_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=
DATE9.;
   attrib Manager_ID length=8 label='Manager for Employee' format=12.;

   infile datalines dsd;
   input
      Employee_ID
      Start_Date
      End_Date
      Department
      Job_Title
      Salary
      Employee_Gender
      Birth_Date
      Employee_Hire_Date:BEST32.
      Employee_Term_Date:BEST32.
      Manager_ID
   ;
datalines4;
120101,17348,2936547,Sales Management,Director,163040,M,7535,17348,,120261
120102,12205,2936547,Sales Management,Sales Manager,108255,M,4971,12205,,120101
120103,6575,2936547,Sales Management,Sales Manager,87975,M,-2535,6575,,120101
120104,9132,2936547,Administration,Administration Manager,46230,F,-600,9132,,120101
120105,15826,2936547,Administration,Secretary I,27110,F,6929,15826,,120101
120106,6575,2936547,Administration,Office Assistant II,26960,M,-4026,6575,,120104
120107,6606,2936547,Administration,Office Assistant III,30475,F,-2536,6606,,120104
120108,18475,2936547,Administration,Warehouse Assistant II,27660,F,10280,18475,,120104
120109,18536,2936547,Administration,Warehouse Assistant I,26495,F,11306,18536,,120104
120110,8705,2936547,Administration,Warehouse Assistant III,28615,M,-2233,8705,,120104
120111,6879,2936547,Administration,Security Guard II,26895,M,-2353,6879,,120104
120112,12600,2936547,Administration,Security Guard I,26550,F,4796,12600,,120104
120113,6575,2936547,Administration,Security Guard II,26870,F,-4253,6575,,120104
120114,6575,2936547,Administration,Security Manager,31285,F,-4345,6575,,120104
120115,18110,2936547,Administration,Service Assistant I,26500,M,10355,18110,,120104
120116,8797,2936547,Administration,Service Assistant II,29250,M,1259,8797,,120104
120117,11048,2936547,Engineering,Cabinet Maker III,31670,M,3176,11048,,120104
120118,10409,2936547,Engineering,Cabinet Maker II,28090,M,1249,10409,,120104
120119,15341,2936547,Engineering,Electrician IV,30255,M,5103,15341,,120104
120120,6575,2936547,Engineering,Electrician II,27645,F,-4258,6575,,120104
120121,6575,2936547,Sales,Sales Rep. II,26600,F,-4169,6575,,120102
120122,8217,2936547,Sales,Sales Rep. II,27475,F,-523,8217,,120102
120123,10866,17928,Sales,Sales Rep. I,26190,F,3193,10866,17928,120102
120124,8460,2936547,Sales,Sales Rep. I,26480,M,1228,8460,,120102
120125,8460,17744,Sales,Sales Rep. IV,32040,M,-391,8460,17744,120102
120126,18475,2936547,Sales,Sales Rep. II,26780,M,11951,18475,,120102
120127,15645,2936547,Sales,Sales Rep. II,28100,F,8404,15645,,120102
120128,18567,2936547,Sales,Sales Rep. IV,30890,F,11152,18567,,120102
120129,10866,17256,Sales,Sales Rep. III,30070,M,3248,10866,17256,120102
120130,18383,2936547,Sales,Sales Rep. I,26955,M,10575,18383,,120102
120131,17167,2936547,Sales,Sales Rep. I,26910,M,8668,17167,,120102
120132,8309,2936547,Sales,Sales Rep. III,28525,F,-2462,8309,,120102
120133,18536,2936547,Sales,Sales Rep. II,27440,F,11069,18536,,120102
120134,6575,18443,Sales,Sales Rep. II,28015,M,-2400,6575,18443,120102
120135,15249,17652,Sales,Sales Rep. IV,32490,M,4774,15249,17652,120102
120136,17198,2936547,Sales,Sales Rep. I,26605,M,8659,17198,,120102
120137,18322,2936547,Sales,Sales Rep. III,29715,F,8471,18322,,120102
120138,18444,2936547,Sales,Sales Rep. I,25795,F,8592,18444,,120102
120139,18506,2936547,Sales,Sales Rep. II,26810,F,11187,18506,,120102
120140,18536,2936547,Sales,Sales Rep. I,26970,M,11903,18536,,120103
120141,18383,2936547,Sales,Sales Rep. II,27465,F,11759,18383,,120103
120142,18444,2936547,Sales,Sales Rep. III,29695,M,11122,18444,,120103
120143,9770,2936547,Sales,Sales Rep. II,26790,M,1232,9770,,120103
120144,18536,2936547,Sales,Sales Rep. III,30265,M,11023,18536,,120103
120145,10744,2936547,Sales,Sales Rep. II,26060,M,2943,10744,,120103
120146,8979,18170,Sales,Sales Rep. I,25985,M,1370,8979,18170,120103
120147,18536,2936547,Sales,Sales Rep. II,26580,F,11706,18536,,120103
120148,8187,2936547,Sales,Sales Rep. III,28480,M,-2301,8187,,120103
120149,13515,2936547,Sales,Sales Rep. I,26390,F,6899,13515,,120103
120150,9709,17652,Sales,Sales Rep. III,29965,M,-541,9709,17652,120103
120151,6575,2936547,Sales,Sales Rep. II,26520,F,-4058,6575,,120103
120152,17988,2936547,Sales,Sales Rep. I,26515,M,8521,17988,,120102
120153,15341,18293,Sales,Sales Rep. I,27260,F,8527,15341,18293,120102
120154,6575,2936547,Sales,Sales Rep. III,30490,F,-4182,6575,,120102
120155,18353,2936547,Sales,Sales Rep. III,29990,F,10339,18353,,120102
120156,18322,2936547,Sales,Sales Rep. I,26445,F,11932,18322,,120102
120157,18597,2936547,Sales,Sales Rep. II,27860,M,11009,18597,,120102
120158,11504,18140,Sales,Sales Rep. III,36605,M,3117,11504,18140,120102
120159,11139,2936547,Sales,Sales Rep. IV,30765,F,2976,11139,,120102
120160,6848,2936547,Sales,Sales Rep. I,27115,M,-479,6848,,120102
120161,18536,2936547,Sales,Sales Rep. III,30785,F,11754,18536,,120102
120162,18294,2936547,Sales,Sales Rep. I,27215,M,11936,18294,,120102
120163,12784,2936547,Sales,Sales Rep. II,26735,M,3064,12784,,120102
120164,9528,2936547,Sales,Sales Rep. II,27450,F,1425,9528,,120102
120165,18322,2936547,Sales,Sales Rep. I,27050,M,10305,18322,,120102
120166,6575,18505,Sales,Sales Rep. IV,30660,M,-4218,6575,18505,120102
120167,6606,18352,Sales,Sales Rep. I,25185,F,-607,6606,18352,120102
120168,18567,2936547,Sales,Sales Rep. I,25275,F,10310,18567,,120102
120169,18383,2936547,Sales,Sales Rep. III,28135,M,10228,18383,,120102
120170,13423,18566,Sales,Sales Rep. III,28830,M,6630,13423,18566,120102
120171,18506,2936547,Sales,Sales Rep. II,26205,F,10427,18506,,120102
120172,6575,2936547,Sales,Sales Rep. III,28345,M,-4292,6575,,120102
120173,7822,17744,Sales,Sales Rep. I,26715,M,-677,7822,17744,120102
120174,6575,18200,Sales,Sales Rep. I,26850,F,-4374,6575,18200,120102
120175,18536,2936547,Sales,Sales Rep. I,25745,M,11918,18536,,120102
120176,18567,2936547,Sales,Sales Rep. I,26095,M,11270,18567,,120102
120177,15372,2936547,Sales,Sales Rep. III,28745,F,8495,15372,,120102
120178,6665,2936547,Sales,Sales Rep. II,26165,M,-404,6665,,120102
120179,17532,17775,Sales,Sales Rep. III,28510,M,6648,17532,17775,120102
120180,8370,2936547,Sales,Sales Rep. II,26970,M,-553,8370,,120102
120181,18597,18717,Sales,Temp. Sales Rep.,27065,F,12020,18597,18717,120103
120182,18597,18627,Sales,Temp. Sales Rep.,25020,M,10505,18597,18627,120103
120183,18597,18627,Sales,Temp. Sales Rep.,26910,M,5001,18597,18627,120103
120184,18597,18747,Sales,Temp. Sales Rep.,25820,M,-2222,18597,18747,120103
120185,18597,18658,Sales,Temp. Sales Rep.,25080,F,6671,18597,18658,120103
120186,18597,18808,Sales,Temp. Sales Rep.,26795,F,8509,18597,18808,120103
120187,18597,18778,Sales,Temp. Sales Rep.,26665,F,10571,18597,18778,120103
120188,18597,18627,Sales,Temp. Sales Rep.,26715,F,-671,18597,18627,120103
120189,18597,18717,Sales,Temp. Sales Rep.,25180,M,10411,18597,18717,120103
120190,17837,18017,Sales,Trainee,24100,M,10566,17837,18017,120103
120191,17167,17347,Sales,Trainee,24015,F,1112,17167,17347,120103
120192,18049,18231,Sales,Trainee,26185,M,10355,18049,18231,120103
120193,18141,18321,Sales,Trainee,24515,M,10567,18141,18321,120103
120194,17929,18109,Sales,Trainee,25985,M,10493,17929,18109,120103
120195,18444,18627,Sales,Trainee,24990,F,10586,18444,18627,120103
120196,17167,17347,Sales,Trainee,24025,F,10257,17167,17347,120103
120197,17167,17347,Sales,Trainee,25580,F,-511,17167,17347,120103
120198,18597,2936547,Sales,Sales Rep. III,28025,F,11708,18597,,120103
120259,12297,2936547,Executives,Chief Executive Officer,433800,M,2946,12297,,
120260,10532,2936547,Executives,Chief Marketing Officer,207885,F,3258,10532,,120259
120261,11535,2936547,Executives,Chief Sales Officer,243190,M,4800,11535,,120259
120262,11932,2936547,Executives,Chief Financial Officer,268455,M,5042,11932,,120259
120263,10135,17531,Group Financials,Financial Analyst III,42605,M,2962,10135,17531,120262
120264,18597,2936547,Group Financials,Financial Analyst II,37510,F,10249,18597,,120262
120265,6575,17166,Group Financials,Auditor III,51950,F,-4106,6575,17166,120262
120266,12144,2936547,Secretary of the Board,Secretary IV,31750,F,4930,12144,,120259
120267,17198,2936547,Secretary of the Board,Secretary III,28585,F,11110,17198,,120259
120268,15096,2936547,Strategy,Senior Strategist,76105,M,6818,15096,,120260
120269,6575,17652,Strategy,Strategist II,52540,F,-4113,6575,17652,120260
120270,6575,2936547,Concession Management,Concession Director,48435,M,-647,6575,,120261
120271,11201,2936547,Concession Management,Concession Manager,43635,F,3140,11201,,120270
120272,6575,2936547,Concession Management,Concession Consultant II,34390,M,-4309,6575,,120271
120273,18322,2936547,Concession Management,Concession Assistant III,28455,F,11115,18322,,120271
120274,13849,2936547,Concession Management,Concession Assistant I,26840,F,2930,13849,,120271
120275,10501,2936547,Concession Management,Concession Consultant II,32195,F,1456,10501,,120271
120276,6575,17317,Concession Management,Concession Assistant II,28090,M,-4033,6575,17317,120271
120277,17653,18048,Concession Management,Concession Consultant I,32645,F,11916,17653,18048,120271
120278,18475,2936547,Concession Management,Concession Assistant III,27685,M,11308,18475,,120271
120279,14731,2936547,Concession Management,Concession Consultant I,32925,F,5041,14731,,120271
120280,11809,16982,Concession Management,Concession Consultant III,36930,F,3237,11809,16982,120271
120656,15765,2936547,Logistics Management,Logistics Coordinator II,42570,F,6602,15765,,120660
120657,12723,2936547,Logistics Management,Logistics Coordinator I,36110,F,2928,12723,,120660
120658,9163,2936547,Logistics Management,Logistics Coordinator II,42485,M,-377,9163,,120660
120659,6575,2936547,Logistics Management,Director,161290,M,-2360,6575,,120259
120660,17957,2936547,Logistics Management,Logistics Manager,61125,M,8192,17957,,120659
120661,10227,17347,Logistics Management,Senior Logistics Manager,85495,F,-400,10227,17347,120659
120662,18567,2936547,Logistics Management,Secretary II,27045,M,11864,18567,,120659
120663,15035,2936547,Logistics Management,Pricing Manager,56385,F,4833,15035,,120659
120664,7060,2936547,Logistics Management,Pricing Specialist,47605,M,-682,7060,,120663
120665,16861,2936547,Logistics Management,Senior Logistics Manager,80070,F,6871,16861,,120659
120666,13118,17652,Logistics Management,Logistics Manager,64555,M,4921,13118,17652,120659
120667,18294,2936547,Logistics Management,Office Assistant III,29980,M,8572,18294,,120666
120668,8370,2936547,Logistics Management,Services Manager,47785,M,-2261,8370,,120659
120669,6575,2936547,Logistics Management,Services Assistant IV,36370,M,-4179,6575,,120668
120670,6575,17166,Stock & Shipping,Shipping Manager,65420,M,-4298,6575,17166,120659
120671,9893,2936547,Stock & Shipping,Shipping Agent III,40080,M,-584,9893,,120670
120672,13209,2936547,Stock & Shipping,Shipping Manager,60980,M,3159,13209,,120659
120673,6575,2936547,Stock & Shipping,Shipping Agent II,35935,F,-4205,6575,,120672
120677,13546,2936547,Stock & Shipping,Shipping Manager,65555,F,4993,13546,,120659
120678,8156,17409,Stock & Shipping,Shipping Agent III,40035,F,-2545,8156,17409,120677
120679,16983,2936547,Stock & Shipping,Shipping Manager,46190,F,7616,16983,,120659
120680,12904,2936547,Stock & Shipping,Shipping Agent I,27295,F,4985,12904,,120679
120681,17623,2936547,Stock & Shipping,Shipping Agent II,30950,M,8624,17623,,120679
120682,14701,2936547,Stock & Shipping,Shipping Agent I,26760,F,5102,14701,,120679
120683,6575,17225,Stock & Shipping,Shipping Agent III,36315,F,-415,6575,17225,120679
120684,18567,2936547,Stock & Shipping,Warehouse Assistant I,26960,F,11287,18567,,120679
120685,18567,2936547,Stock & Shipping,Warehouse Assistant I,25130,F,10287,18567,,120679
120686,6575,2936547,Stock & Shipping,Warehouse Assistant II,26690,F,-4256,6575,,120679
120687,17745,17928,Stock & Shipping,Warehouse Assistant I,26800,F,8545,17745,17928,120679
120688,6575,17044,Stock & Shipping,Warehouse Assistant I,25905,F,-2198,6575,17044,120679
120689,18444,2936547,Stock & Shipping,Warehouse Assistant III,27780,F,8601,18444,,120679
120690,17867,2936547,Stock & Shipping,Warehouse Assistant I,25185,F,10243,17867,,120679
120691,6575,2936547,Stock & Shipping,Shipping Manager,49240,M,-4125,6575,,120659
120692,9587,2936547,Stock & Shipping,Shipping Agent II,32485,M,-405,9587,,120691
120693,8552,2936547,Stock & Shipping,Shipping Agent I,26625,M,1217,8552,,120691
120694,18353,2936547,Stock & Shipping,Warehouse Assistant I,27365,F,11916,18353,,120691
120695,12235,18474,Stock & Shipping,Warehouse Assistant II,28180,M,3116,12235,18474,120691
120696,6634,18352,Stock & Shipping,Warehouse Assistant I,26615,M,-505,6634,18352,120691
120697,18414,2936547,Stock & Shipping,Warehouse Assistant IV,29625,F,11866,18414,,120691
120698,7518,17956,Stock & Shipping,Warehouse Assistant I,26160,M,-594,7518,17956,120691
120710,15341,2936547,Marketing,Business Analyst II,54840,M,6902,15341,,120719
120711,13939,2936547,Marketing,Business Analyst III,59130,F,4896,13939,,120719
120712,6575,2936547,Marketing,Marketing Manager,63640,F,-2394,6575,,120719
120713,6575,2936547,Marketing,Marketing Assistant III,31630,M,-4330,6575,,120712
120714,15584,2936547,Marketing,Marketing Manager,62625,M,7399,15584,,120719
120715,17929,2936547,Marketing,Marketing Assistant II,28535,F,8563,17929,,120714
120716,13727,2936547,Marketing,Events Manager,53015,M,6779,13727,,120719
120717,9344,2936547,Marketing,Marketing Assistant II,30155,M,-722,9344,,120716
120718,12539,2936547,Marketing,Marketing Assistant II,29190,M,3111,12539,,120716
120719,14641,2936547,Marketing,Senior Marketing Manager,87420,F,4770,14641,,120260
120720,13240,2936547,Marketing,Corp. Comm. Manager,46580,M,3049,13240,,120719
120721,6575,2936547,Marketing,Marketing Assistant II,29870,F,-4089,6575,,120720
120722,10866,2936547,Marketing,Corp. Comm. Specialist I,32460,M,1360,10866,,120720
120723,6575,2936547,Marketing,Corp. Comm. Specialist II,33950,F,-2335,6575,,120720
120724,13240,2936547,Marketing,Marketing Manager,63705,M,2948,13240,,120719
120725,17684,17897,Marketing,Marketing Assistant II,29970,M,8697,17684,17897,120724
120726,18506,2936547,Marketing,Marketing Assistant I,27380,F,11870,18506,,120724
120727,11109,2936547,Marketing,Marketing Assistant IV,34925,M,3098,11109,,120724
120728,9497,2936547,Purchasing,Purchasing Agent II,35070,F,-393,9497,,120735
120729,17281,18163,Purchasing,Purchasing Agent I,31495,F,11781,17281,18163,120735
120730,11962,2936547,Purchasing,Purchasing Agent I,30195,M,3272,11962,,120735
120731,10105,2936547,Purchasing,Purchasing Agent II,34150,M,1169,10105,,120735
120732,6575,2936547,Purchasing,Purchasing Agent III,35870,M,-2331,6575,,120736
120733,12723,2936547,Purchasing,Purchasing Agent I,31760,M,3015,12723,,120736
120734,18322,2936547,Purchasing,Purchasing Agent III,34270,M,8516,18322,,120736
120735,8156,2936547,Purchasing,Purchasing Manager,61985,F,-567,8156,,120261
120736,13057,2936547,Purchasing,Purchasing Manager,63985,F,3253,13057,,120261
120737,11993,2936547,Purchasing,Purchasing Manager,63605,F,1182,11993,,120261
120738,6575,2936547,Purchasing,Purchasing Agent I,30025,F,-2370,6575,,120737
120739,18383,2936547,Purchasing,Purchasing Agent III,36970,M,11176,18383,,120737
120740,6575,17409,Purchasing,Purchasing Agent II,35110,F,-2265,6575,17409,120737
120741,6575,2936547,Purchasing,Purchasing Agent III,36365,F,-4051,6575,,120737
120742,6575,2936547,Purchasing,Purchasing Agent I,31020,M,-4349,6575,,120737
120743,15127,2936547,Purchasing,Purchasing Agent II,34620,F,4780,15127,,120737
120744,17714,18200,Purchasing,Purchasing Agent II,33490,F,11858,17714,18200,120737
120745,18414,2936547,Purchasing,Purchasing Agent I,31365,F,11143,18414,,120737
120746,16892,2936547,Accounts,Account Manager,46090,M,6857,16892,,120262
120747,14457,2936547,Accounts,Financial Controller I,43590,F,6745,14457,,120746
120748,17226,2936547,Accounts,Building Admin. Manager,48380,F,7491,17226,,120262
120749,14884,2936547,Accounts,Office Assistant II,26545,M,6837,14884,,120748
120750,8432,16832,Accounts,Accountant I,32675,F,-573,8432,16832,120751
120751,11901,2936547,Accounts,Finance Manager,58200,M,3017,11901,,120262
120752,7152,17286,Accounts,Accountant I,30590,M,-683,7152,17286,120751
120753,14092,2936547,Accounts,Financial Controller II,47000,M,7471,14092,,120751
120754,18383,2936547,Accounts,Accountant II,34760,M,11841,18383,,120751
120755,10074,2936547,Accounts,Accountant III,36440,F,3158,10074,,120751
120756,14792,2936547,Accounts,Financial Controller III,52295,F,6625,14792,,120751
120757,6575,17713,Accounts,Accountant III,38545,M,-4306,6575,17713,120751
120758,13423,2936547,Accounts,Accountant II,34040,M,3217,13423,,120751
120759,9862,2936547,Accounts,Accountant II,36230,M,3230,9862,,120746
120760,13635,2936547,Accounts,Financial Controller III,53475,F,4754,13635,,120746
120761,18444,2936547,Accounts,Accountant I,30960,F,11319,18444,,120746
120762,18322,2936547,Accounts,Accountant I,30625,M,8706,18322,,120746
120763,6575,2936547,Accounts Management,Auditor II,45100,M,-4084,6575,,120766
120764,17136,2936547,Accounts Management,Auditor I,40450,M,6930,17136,,120766
120765,6575,2936547,Accounts Management,Financial Controller III,51950,F,-380,6575,,120766
120766,16496,2936547,Accounts Management,Auditing Manager,53400,F,6883,16496,,120262
120767,11413,2936547,Accounts Management,Accountant I,32965,M,3051,11413,,120766
120768,9405,17500,Accounts Management,Accountant II,44955,M,-528,9405,17500,120766
120769,14701,2936547,Accounts Management,Auditor II,47990,M,6718,14701,,120766
120770,11413,17286,Accounts Management,Auditor I,43930,F,3036,11413,17286,120766
120771,7640,2936547,Accounts Management,Accountant II,36435,F,-515,7640,,120766
120772,18475,2936547,Group HR Management,HR Generalist I,27365,M,11786,18475,,120780
120773,9222,2936547,Group HR Management,HR Generalist II,27370,F,1148,9222,,120780
120774,16861,18201,Group HR Management,HR Specialist II,45155,F,8295,16861,18201,120780
120775,14915,2936547,Group HR Management,HR Analyst II,41580,F,4790,14915,,120780
120776,16527,2936547,Group HR Management,HR Generalist III,32580,M,8664,16527,,120780
120777,14000,2936547,Group HR Management,HR Specialist I,40955,M,4833,14000,,120780
120778,10258,2936547,Group HR Management,HR Specialist I,43650,F,-389,10258,,120780
120779,15035,2936547,Group HR Management,HR Analyst II,43690,F,7582,15035,,120780
120780,13057,2936547,Group HR Management,HR Manager,62995,F,4992,13057,,120262
120781,17867,18262,Group HR Management,Recruiter I,32620,F,11710,17867,18262,120782
120782,15857,2936547,Group HR Management,Recruitment Manager,63915,F,6907,15857,,120262
120783,14610,2936547,Group HR Management,Recruiter III,42975,M,6928,14610,,120782
120784,17776,2936547,Group HR Management,Recruiter II,35715,F,8514,17776,,120782
120785,13666,2936547,Group HR Management,Training Manager,48335,F,4769,13666,,120780
120786,6575,2936547,Group HR Management,Trainer I,32650,F,-4306,6575,,120785
120787,14610,2936547,Group HR Management,Trainer II,34000,M,4982,14610,,120785
120788,14214,2936547,Group HR Management,Trainer I,33530,M,4912,14214,,120785
120789,9831,17317,Group HR Management,Trainer III,39330,M,3117,9831,17317,120785
120790,14365,2936547,IS,ETL Specialist II,53740,F,6915,14365,,120791
120791,11231,2936547,IS,Systems Architect IV,61115,M,3129,11231,,120798
120792,15188,2936547,IS,Systems Architect II,54760,F,7383,15188,,120791
120793,14762,2936547,IS,ETL Specialist I,47155,M,4968,14762,,120791
120794,17348,2936547,IS,Applications Developer IV,51265,F,8400,17348,,120800
120795,11901,17197,IS,Applications Developer II,49105,M,4764,11901,17197,120794
120796,9921,2936547,IS,Applications Developer II,47030,M,-599,9921,,120794
120797,8005,2936547,IS,Applications Developer I,43385,F,-410,8005,,120794
120798,11323,2936547,IS,Senior Project Manager,80755,F,1269,11323,,120800
120799,15645,2936547,IS,Office Assistant III,29070,M,8482,15645,,120800
120800,15127,17197,IS,IS Director,80210,M,6928,15127,17197,120262
120801,15887,2936547,IS,Applications Developer I,40040,F,6639,15887,,120798
120802,8036,17713,IS,Applications Developer IV,65125,F,-2426,8036,17713,120798
120803,8036,2936547,IS,Applications Developer I,43630,M,-574,8036,,120798
120804,6575,2936547,IS,IS Administrator III,55400,M,-4342,6575,,120798
120805,16162,2936547,IS,BI Administrator IV,58530,M,8213,16162,,120798
120806,13180,2936547,IS,IS Administrator II,47285,F,6630,13180,,120798
120807,9497,17775,IS,IS Administrator I,43325,F,1443,9497,17775,120798
120808,10379,2936547,IS,BI Specialist II,44425,M,3074,10379,,120798
120809,6575,2936547,IS,BI Architect II,47155,F,-4370,6575,,120798
120810,8826,2936547,IS,IS Architect III,58375,M,-454,8826,,120798
120811,13696,2936547,IS,Applications Developer I,43985,M,5017,13696,,120814
120812,16649,2936547,IS,Applications Developer II,45810,M,6624,16649,,120814
120813,13515,17531,IS,Applications Developer IV,50865,M,5005,13515,17531,120814
120814,8644,2936547,IS,Project Manager,59140,M,1249,8644,,120800
120815,18353,2936547,Marketing,Service Administrator III,31590,M,12049,18353,,120719
120816,13727,2936547,Marketing,Service Administrator I,30485,F,4871,13727,,120719
120992,16284,2936547,Administration,Office Assistant I,26940,F,8448,16284,,120996
120993,15035,2936547,Administration,Office Assistant I,26260,F,5100,15035,,120996
120994,14184,2936547,Administration,Office Administrator I,31645,F,6741,14184,,120996
120995,18475,2936547,Administration,Office Administrator II,34850,F,10391,18475,,120996
120996,17045,2936547,Administration,Office Assistant IV,32745,M,6776,17045,,121000
120997,14854,2936547,Administration,Shipping Administrator I,27420,F,6899,14854,,121000
120998,17988,2936547,Administration,Clerk I,26330,F,8740,17988,,120997
120999,10318,2936547,Administration,Clerk I,27215,F,1457,10318,,120997
121000,13849,2936547,Administration,Administration Manager,48600,M,2946,13849,,121141
121001,7914,2936547,Administration,Warehouse Manager,43615,M,1116,7914,,121000
121002,8735,17775,Administration,Warehouse Assistant II,26650,F,-470,8735,17775,121001
121003,18444,2936547,Administration,Warehouse Assistant I,26000,M,11813,18444,,121001
121004,6575,2936547,Administration,Security Manager,30895,M,-4168,6575,,121000
121005,17563,2936547,Administration,Security Guard I,25020,M,10423,17563,,121004
121006,17837,18201,Administration,Security Guard I,26145,M,11242,17837,18201,121004
121007,11354,2936547,Administration,Security Guard II,27290,M,3207,11354,,121004
121008,13727,2936547,Administration,Security Guard II,27875,M,4932,13727,,121004
121009,15918,2936547,Administration,Service Administrator I,32955,M,8738,15918,,121000
121010,18322,2936547,Administration,Service Assistant I,25195,M,10453,18322,,121009
121011,6575,2936547,Administration,Service Assistant I,25735,M,-4313,6575,,121009
121012,17410,17866,Administration,Service Assistant II,29575,M,10983,17410,17866,121009
121013,16162,2936547,Engineering,Electrician II,26675,M,8518,16162,,121016
121014,15918,2936547,Engineering,Electrician III,28510,F,6695,15918,,121016
121015,16315,2936547,Engineering,Technician I,26140,M,8747,16315,,121016
121016,17776,2936547,Engineering,Technical Manager,48075,F,7323,17776,,121000
121017,17957,2936547,Engineering,Technician II,29225,M,10232,17957,,121016
121018,6575,17286,Sales,Sales Rep. II,27560,F,-4381,6575,17286,121144
121019,17684,18109,Sales,Sales Rep. IV,31320,M,11133,17684,18109,121144
121020,16922,2936547,Sales,Sales Rep. IV,31750,F,10280,16922,,121144
121021,13939,2936547,Sales,Sales Rep. IV,32985,F,6918,13939,,121144
121022,16833,17775,Sales,Sales Rep. IV,32210,M,8701,16833,17775,121144
121023,12174,18140,Sales,Sales Rep. I,26010,M,2994,12174,18140,121144
121024,17653,2936547,Sales,Sales Rep. II,26600,M,10491,17653,,121144
121025,7183,2936547,Sales,Sales Rep. II,28295,M,-2274,7183,,121144
121026,18353,2936547,Sales,Sales Rep. IV,31515,M,11269,18353,,121144
121027,12388,2936547,Sales,Sales Rep. II,26165,M,3047,12388,,121144
121028,18567,2936547,Sales,Sales Rep. I,26585,M,11805,18567,,121144
121029,12388,2936547,Sales,Sales Rep. I,27225,M,3278,12388,,121144
121030,16468,2936547,Sales,Sales Rep. I,26745,M,8716,16468,,121144
121031,10805,2936547,Sales,Sales Rep. III,28060,M,3112,10805,,121144
121032,18322,2936547,Sales,Sales Rep. IV,31335,M,11742,18322,,121144
121033,17684,2936547,Sales,Sales Rep. III,29775,F,11267,17684,,121144
121034,18628,2936547,Sales,Sales Rep. II,27110,M,11923,18628,,121144
121035,6575,2936547,Sales,Sales Rep. II,26460,M,-4299,6575,,121144
121036,17440,18201,Sales,Sales Rep. I,25965,F,11887,17440,18201,121144
121037,16861,2936547,Sales,Sales Rep. III,28310,M,6737,16861,,121144
121038,18475,18659,Sales,Sales Rep. I,25285,M,11731,18475,18659,121144
121039,8887,2936547,Sales,Sales Rep. II,27460,M,-577,8887,,121144
121040,9801,2936547,Sales,Sales Rep. III,29525,F,1282,9801,,121144
121041,6575,2936547,Sales,Sales Rep. II,26120,F,-4349,6575,,121144
121042,16010,2936547,Sales,Sales Rep. III,28845,M,8494,16010,,121144
121043,13209,2936547,Sales,Sales Rep. II,28225,F,5061,13209,,121144
121044,7152,2936547,Sales,Sales Rep. I,25660,M,-386,7152,,121144
121045,13880,17591,Sales,Sales Rep. II,28560,F,3086,13880,17591,121143
121046,18444,18628,Sales,Sales Rep. I,25845,M,10477,18444,18628,121143
121047,18506,18687,Sales,Sales Rep. I,25820,F,8730,18506,18687,121143
121048,18506,18687,Sales,Sales Rep. I,26560,F,10402,18506,18687,121143
121049,18597,2936547,Sales,Sales Rep. I,26930,F,11002,18597,,121143
121050,18597,2936547,Sales,Sales Rep. II,26080,F,10969,18597,,121143
121051,8340,2936547,Sales,Sales Rep. I,26025,F,-2435,8340,,121143
121052,18567,2936547,Sales,Sales Rep. II,26900,M,10966,18567,,121143
121053,6606,2936547,Sales,Sales Rep. III,29955,F,-4117,6606,,121143
121054,7610,2936547,Sales,Sales Rep. III,29805,M,-415,7610,,121143
121055,18475,2936547,Sales,Sales Rep. III,30185,M,11695,18475,,121143
121056,17287,2936547,Sales,Sales Rep. II,28325,F,10413,17287,,121143
121057,9101,2936547,Sales,Sales Rep. I,25125,M,1455,9101,,121143
121058,17075,2936547,Sales,Sales Rep. I,26270,M,6767,17075,,121143
121059,9222,17531,Sales,Sales Rep. II,27425,F,1393,9222,17531,121143
121060,6575,2936547,Sales,Sales Rep. III,28800,F,-4224,6575,,121143
121061,10409,2936547,Sales,Sales Rep. III,29815,M,-534,10409,,121143
121062,18475,2936547,Sales,Sales Rep. IV,30305,F,10528,18475,,121145
121063,18110,2936547,Sales,Sales Rep. II,35990,M,8608,18110,,121145
121064,13027,2936547,Sales,Sales Rep. I,25110,M,2949,13027,,121145
121065,18353,2936547,Sales,Sales Rep. III,28040,F,10475,18353,,121145
121066,6575,18201,Sales,Sales Rep. II,27250,F,-4148,6575,18201,121145
121067,18322,18506,Sales,Sales Rep. IV,31865,F,10975,18322,18506,121145
121068,13393,2936547,Sales,Sales Rep. II,27550,M,5084,13393,,121145
121069,12692,2936547,Sales,Sales Rep. II,26195,M,4826,12692,,121145
121070,18294,2936547,Sales,Sales Rep. III,29385,F,10535,18294,,121145
121071,7914,2936547,Sales,Sales Rep. III,28625,M,1348,7914,,121145
121072,17776,18201,Sales,Sales Rep. I,26105,M,8410,17776,18201,121145
121073,6575,2936547,Sales,Sales Rep. I,27100,M,-2422,6575,,121145
121074,11962,2936547,Sales,Sales Rep. I,26990,M,1155,11962,,121145
121075,6575,2936547,Sales,Sales Rep. II,28395,F,-4026,6575,,121145
121076,9862,17683,Sales,Sales Rep. II,26685,M,3204,9862,17683,121143
121077,18536,2936547,Sales,Sales Rep. III,28585,M,10475,18536,,121143
121078,8340,2936547,Sales,Sales Rep. I,27485,M,-2436,8340,,121143
121079,15280,2936547,Sales,Sales Rep. I,25770,M,6728,15280,,121143
121080,11566,2936547,Sales,Sales Rep. I,32235,M,1119,11566,,121143
121081,7396,2936547,Sales,Sales Rep. III,30235,F,-2470,7396,,121143
121082,7944,2936547,Sales,Sales Rep. III,28510,M,-2371,7944,,121143
121083,8460,2936547,Sales,Sales Rep. I,27245,F,1165,8460,,121143
121084,12784,2936547,Sales,Sales Rep. I,22710,M,3150,12784,,121143
121085,18628,2936547,Sales,Sales Rep. IV,32235,M,11273,18628,,121143
121086,6575,2936547,Sales,Sales Rep. I,26820,M,-4033,6575,,121143
121087,15765,18352,Sales,Sales Rep. II,28325,F,6915,15765,18352,121143
121088,18628,2936547,Sales,Sales Rep. I,27240,M,11849,18628,,121143
121089,6756,18566,Sales,Sales Rep. II,28095,M,-498,6756,18566,121143
121090,8797,2936547,Sales,Sales Rep. I,26600,F,-561,8797,,121143
121091,12054,2936547,Sales,Sales Rep. II,27325,M,4798,12054,,121143
121092,17014,2936547,Sales,Sales Rep. I,25680,F,6641,17014,,121143
121093,13880,17347,Sales,Sales Rep. I,27410,M,3121,13880,17347,121143
121094,8279,2936547,Sales,Sales Rep. I,26555,M,-724,8279,,121143
121095,12965,2936547,Sales,Sales Rep. II,28010,F,4852,12965,,121143
121096,14365,2936547,Sales,Sales Rep. I,26335,M,4886,14365,,121143
121097,14518,2936547,Sales,Sales Rep. II,26830,F,6870,14518,,121143
121098,18383,2936547,Sales,Sales Rep. I,27475,M,11769,18383,,121143
121099,16192,2936547,Sales,Sales Rep. IV,32725,M,8478,16192,,121143
121100,7396,2936547,Sales,Sales Rep. II,28135,M,-2440,7396,,121143
121101,18567,2936547,Sales,Sales Rep. I,25390,F,11197,18567,,121143
121102,18414,2936547,Sales,Sales Rep. I,27115,F,8577,18414,,121143
121103,18506,2936547,Sales,Sales Rep. I,27260,M,11806,18506,,121143
121104,11048,16832,Sales,Sales Rep. II,28315,F,3238,11048,16832,121143
121105,17167,2936547,Sales,Sales Rep. III,29545,F,8529,17167,,121143
121106,14641,2936547,Sales,Sales Rep. I,25880,M,4781,14641,,121143
121107,18444,2936547,Sales,Sales Rep. IV,31380,F,11071,18444,,121143
121108,18567,18748,Sales,Sales Rep. I,25930,F,11873,18567,18748,121143
121109,12539,2936547,Sales,Sales Rep. I,26035,M,5057,12539,,121143
121110,18597,18627,Sales,Temp. Sales Rep.,26370,M,-4279,18597,18627,121145
121111,18597,18747,Sales,Temp. Sales Rep.,26885,M,-4185,18597,18747,121145
121112,18597,18627,Sales,Temp. Sales Rep.,26855,M,11304,18597,18627,121145
121113,18597,18658,Sales,Temp. Sales Rep.,27480,F,-679,18597,18658,121145
121114,18597,18808,Sales,Temp. Sales Rep.,26515,F,-4075,18597,18808,121145
121115,18597,18747,Sales,Temp. Sales Rep.,26430,M,1139,18597,18747,121145
121116,18597,18717,Sales,Temp. Sales Rep.,26670,F,3188,18597,18717,121145
121117,18597,18627,Sales,Temp. Sales Rep.,26640,F,6651,18597,18627,121145
121118,18597,18778,Sales,Temp. Sales Rep.,25725,M,8460,18597,18778,121145
121119,18597,18686,Sales,Temp. Sales Rep.,25205,M,3229,18597,18686,121145
121120,18597,18686,Sales,Temp. Sales Rep.,25020,F,6872,18597,18686,121145
121121,18597,18778,Sales,Temp. Sales Rep.,25735,F,11021,18597,18778,121145
121122,18597,18717,Sales,Temp. Sales Rep.,26265,M,11017,18597,18717,121145
121123,18597,18717,Sales,Temp. Sales Rep.,26410,M,-4266,18597,18717,121145
121124,18597,18627,Sales,Temp. Sales Rep.,26925,M,4794,18597,18627,121145
121125,17167,17347,Sales,Trainee,25315,M,6681,17167,17347,121145
121126,17167,17347,Sales,Trainee,26015,M,-432,17167,17347,121145
121127,18049,18231,Sales,Trainee,25435,F,11203,18049,18231,121145
121128,17167,17347,Sales,Trainee,25405,F,6751,17167,17347,121145
121129,17167,17347,Sales,Trainee,30945,M,3043,17167,17347,121145
121130,17563,17744,Sales,Trainee,25255,M,10247,17563,17744,121145
121131,17167,17347,Sales,Trainee,25445,M,4929,17167,17347,121145
121132,17167,17347,Sales,Trainee,24390,M,-692,17167,17347,121145
121133,17167,17347,Sales,Trainee,25405,M,8714,17167,17347,121145
121134,17167,17347,Sales,Trainee,25585,M,3105,17167,17347,121145
121135,6787,2936547,Sales,Sales Rep. I,27010,F,-573,6787,,121145
121136,17136,17805,Sales,Sales Rep. I,27460,F,6770,17136,17805,121145
121137,18353,2936547,Sales,Sales Rep. I,27055,M,11705,18353,,121145
121138,6575,2936547,Sales,Sales Rep. I,27265,M,-2498,6575,,121145
121139,11504,2936547,Sales,Sales Rep. II,27700,F,1326,11504,,121145
121140,16527,18293,Sales,Sales Rep. I,26335,M,8423,16527,18293,121145
121141,6575,2936547,Sales Management,Vice President,194885,M,-4213,6575,,120261
121142,13635,2936547,Sales Management,Director,156065,M,4793,13635,,121141
121143,15157,2936547,Sales Management,Senior Sales Manager,95090,M,5078,15157,,121142
121144,13088,2936547,Sales Management,Sales Manager,83505,F,3101,13088,,121142
121145,7396,2936547,Sales Management,Sales Manager,84260,M,-2231,7396,,121142
121146,18353,2936547,Sales Management,Secretary III,29320,F,11300,18353,,121141
121147,11566,2936547,Sales Management,Secretary II,29145,F,4896,11566,,121142
121148,15341,17197,Sales Management,Business Analyst II,52930,M,4749,15341,17197,121141
;;;;
run;

data ORION.EMPLOYEE_ORGANIZATION;
   attrib Employee_ID length=8;
   attrib Job_Title length=$25;
   attrib Department length=$40;
   attrib Manager_ID length=8;

   infile datalines dsd;
   input
      Employee_ID
      Job_Title
      Department
      Manager_ID
   ;
datalines4;
120101,Director,Sales Management,120261
120102,Sales Manager,Sales Management,120101
120103,Sales Manager,Sales Management,120101
120104,Administration Manager,Administration,120101
120105,Secretary I,Administration,120101
120106,Office Assistant II,Administration,120104
120107,Office Assistant III,Administration,120104
120108,Warehouse Assistant II,Administration,120104
120109,Warehouse Assistant I,Administration,120104
120110,Warehouse Assistant III,Administration,120104
120111,Security Guard II,Administration,120104
120112,Security Guard I,Administration,120104
120113,Security Guard II,Administration,120104
120114,Security Manager,Administration,120104
120115,Service Assistant I,Administration,120104
120116,Service Assistant II,Administration,120104
120117,Cabinet Maker III,Engineering,120104
120118,Cabinet Maker II,Engineering,120104
120119,Electrician IV,Engineering,120104
120120,Electrician II,Engineering,120104
120121,Sales Rep. II,Sales,120102
120122,Sales Rep. II,Sales,120102
120123,Sales Rep. I,Sales,120102
120124,Sales Rep. I,Sales,120102
120125,Sales Rep. IV,Sales,120102
120126,Sales Rep. II,Sales,120102
120127,Sales Rep. II,Sales,120102
120128,Sales Rep. IV,Sales,120102
120129,Sales Rep. III,Sales,120102
120130,Sales Rep. I,Sales,120102
120131,Sales Rep. I,Sales,120102
120132,Sales Rep. III,Sales,120102
120133,Sales Rep. II,Sales,120102
120134,Sales Rep. II,Sales,120102
120135,Sales Rep. IV,Sales,120102
120136,Sales Rep. I,Sales,120102
120137,Sales Rep. III,Sales,120102
120138,Sales Rep. I,Sales,120102
120139,Sales Rep. II,Sales,120102
120140,Sales Rep. I,Sales,120103
120141,Sales Rep. II,Sales,120103
120142,Sales Rep. III,Sales,120103
120143,Sales Rep. II,Sales,120103
120144,Sales Rep. III,Sales,120103
120145,Sales Rep. II,Sales,120103
120146,Sales Rep. I,Sales,120103
120147,Sales Rep. II,Sales,120103
120148,Sales Rep. III,Sales,120103
120149,Sales Rep. I,Sales,120103
120150,Sales Rep. III,Sales,120103
120151,Sales Rep. II,Sales,120103
120152,Sales Rep. I,Sales,120102
120153,Sales Rep. I,Sales,120102
120154,Sales Rep. III,Sales,120102
120155,Sales Rep. III,Sales,120102
120156,Sales Rep. I,Sales,120102
120157,Sales Rep. II,Sales,120102
120158,Sales Rep. III,Sales,120102
120159,Sales Rep. IV,Sales,120102
120160,Sales Rep. I,Sales,120102
120161,Sales Rep. III,Sales,120102
120162,Sales Rep. I,Sales,120102
120163,Sales Rep. II,Sales,120102
120164,Sales Rep. II,Sales,120102
120165,Sales Rep. I,Sales,120102
120166,Sales Rep. IV,Sales,120102
120167,Sales Rep. I,Sales,120102
120168,Sales Rep. I,Sales,120102
120169,Sales Rep. III,Sales,120102
120170,Sales Rep. III,Sales,120102
120171,Sales Rep. II,Sales,120102
120172,Sales Rep. III,Sales,120102
120173,Sales Rep. I,Sales,120102
120174,Sales Rep. I,Sales,120102
120175,Sales Rep. I,Sales,120102
120176,Sales Rep. I,Sales,120102
120177,Sales Rep. III,Sales,120102
120178,Sales Rep. II,Sales,120102
120179,Sales Rep. III,Sales,120102
120180,Sales Rep. II,Sales,120102
120181,Temp. Sales Rep.,Sales,120103
120182,Temp. Sales Rep.,Sales,120103
120183,Temp. Sales Rep.,Sales,120103
120184,Temp. Sales Rep.,Sales,120103
120185,Temp. Sales Rep.,Sales,120103
120186,Temp. Sales Rep.,Sales,120103
120187,Temp. Sales Rep.,Sales,120103
120188,Temp. Sales Rep.,Sales,120103
120189,Temp. Sales Rep.,Sales,120103
120190,Trainee,Sales,120103
120191,Trainee,Sales,120103
120192,Trainee,Sales,120103
120193,Trainee,Sales,120103
120194,Trainee,Sales,120103
120195,Trainee,Sales,120103
120196,Trainee,Sales,120103
120197,Trainee,Sales,120103
120198,Sales Rep. III,Sales,120103
120259,Chief Executive Officer,Executives,
120260,Chief Marketing Officer,Executives,120259
120261,Chief Sales Officer,Executives,120259
120262,Chief Financial Officer,Executives,120259
120263,Financial Analyst III,Group Financials,120262
120264,Financial Analyst II,Group Financials,120262
120265,Auditor III,Group Financials,120262
120266,Secretary IV,Secretary of the Board,120259
120267,Secretary III,Secretary of the Board,120259
120268,Senior Strategist,Strategy,120260
120269,Strategist II,Strategy,120260
120270,Concession Director,Concession Management,120261
120271,Concession Manager,Concession Management,120270
120272,Concession Consultant II,Concession Management,120271
120273,Concession Assistant III,Concession Management,120271
120274,Concession Assistant I,Concession Management,120271
120275,Concession Consultant II,Concession Management,120271
120276,Concession Assistant II,Concession Management,120271
120277,Concession Consultant I,Concession Management,120271
120278,Concession Assistant III,Concession Management,120271
120279,Concession Consultant I,Concession Management,120271
120280,Concession Consultant III,Concession Management,120271
120656,Logistics Coordinator II,Logistics Management,120660
120657,Logistics Coordinator I,Logistics Management,120660
120658,Logistics Coordinator II,Logistics Management,120660
120659,Director,Logistics Management,120259
120660,Logistics Manager,Logistics Management,120659
120661,Senior Logistics Manager,Logistics Management,120659
120662,Secretary II,Logistics Management,120659
120663,Pricing Manager,Logistics Management,120659
120664,Pricing Specialist,Logistics Management,120663
120665,Senior Logistics Manager,Logistics Management,120659
120666,Logistics Manager,Logistics Management,120659
120667,Office Assistant III,Logistics Management,120666
120668,Services Manager,Logistics Management,120659
120669,Services Assistant IV,Logistics Management,120668
120670,Shipping Manager,Stock & Shipping,120659
120671,Shipping Agent III,Stock & Shipping,120670
120672,Shipping Manager,Stock & Shipping,120659
120673,Shipping Agent II,Stock & Shipping,120672
120677,Shipping Manager,Stock & Shipping,120659
120678,Shipping Agent III,Stock & Shipping,120677
120679,Shipping Manager,Stock & Shipping,120659
120680,Shipping Agent I,Stock & Shipping,120679
120681,Shipping Agent II,Stock & Shipping,120679
120682,Shipping Agent I,Stock & Shipping,120679
120683,Shipping Agent III,Stock & Shipping,120679
120684,Warehouse Assistant I,Stock & Shipping,120679
120685,Warehouse Assistant I,Stock & Shipping,120679
120686,Warehouse Assistant II,Stock & Shipping,120679
120687,Warehouse Assistant I,Stock & Shipping,120679
120688,Warehouse Assistant I,Stock & Shipping,120679
120689,Warehouse Assistant III,Stock & Shipping,120679
120690,Warehouse Assistant I,Stock & Shipping,120679
120691,Shipping Manager,Stock & Shipping,120659
120692,Shipping Agent II,Stock & Shipping,120691
120693,Shipping Agent I,Stock & Shipping,120691
120694,Warehouse Assistant I,Stock & Shipping,120691
120695,Warehouse Assistant II,Stock & Shipping,120691
120696,Warehouse Assistant I,Stock & Shipping,120691
120697,Warehouse Assistant IV,Stock & Shipping,120691
120698,Warehouse Assistant I,Stock & Shipping,120691
120710,Business Analyst II,Marketing,120719
120711,Business Analyst III,Marketing,120719
120712,Marketing Manager,Marketing,120719
120713,Marketing Assistant III,Marketing,120712
120714,Marketing Manager,Marketing,120719
120715,Marketing Assistant II,Marketing,120714
120716,Events Manager,Marketing,120719
120717,Marketing Assistant II,Marketing,120716
120718,Marketing Assistant II,Marketing,120716
120719,Senior Marketing Manager,Marketing,120260
120720,Corp. Comm. Manager,Marketing,120719
120721,Marketing Assistant II,Marketing,120720
120722,Corp. Comm. Specialist I,Marketing,120720
120723,Corp. Comm. Specialist II,Marketing,120720
120724,Marketing Manager,Marketing,120719
120725,Marketing Assistant II,Marketing,120724
120726,Marketing Assistant I,Marketing,120724
120727,Marketing Assistant IV,Marketing,120724
120728,Purchasing Agent II,Purchasing,120735
120729,Purchasing Agent I,Purchasing,120735
120730,Purchasing Agent I,Purchasing,120735
120731,Purchasing Agent II,Purchasing,120735
120732,Purchasing Agent III,Purchasing,120736
120733,Purchasing Agent I,Purchasing,120736
120734,Purchasing Agent III,Purchasing,120736
120735,Purchasing Manager,Purchasing,120261
120736,Purchasing Manager,Purchasing,120261
120737,Purchasing Manager,Purchasing,120261
120738,Purchasing Agent I,Purchasing,120737
120739,Purchasing Agent III,Purchasing,120737
120740,Purchasing Agent II,Purchasing,120737
120741,Purchasing Agent III,Purchasing,120737
120742,Purchasing Agent I,Purchasing,120737
120743,Purchasing Agent II,Purchasing,120737
120744,Purchasing Agent II,Purchasing,120737
120745,Purchasing Agent I,Purchasing,120737
120746,Account Manager,Accounts,120262
120747,Financial Controller I,Accounts,120746
120748,Building Admin. Manager,Accounts,120262
120749,Office Assistant II,Accounts,120748
120750,Accountant I,Accounts,120751
120751,Finance Manager,Accounts,120262
120752,Accountant I,Accounts,120751
120753,Financial Controller II,Accounts,120751
120754,Accountant II,Accounts,120751
120755,Accountant III,Accounts,120751
120756,Financial Controller III,Accounts,120751
120757,Accountant III,Accounts,120751
120758,Accountant II,Accounts,120751
120759,Accountant II,Accounts,120746
120760,Financial Controller III,Accounts,120746
120761,Accountant I,Accounts,120746
120762,Accountant I,Accounts,120746
120763,Auditor II,Accounts Management,120766
120764,Auditor I,Accounts Management,120766
120765,Financial Controller III,Accounts Management,120766
120766,Auditing Manager,Accounts Management,120262
120767,Accountant I,Accounts Management,120766
120768,Accountant II,Accounts Management,120766
120769,Auditor II,Accounts Management,120766
120770,Auditor I,Accounts Management,120766
120771,Accountant II,Accounts Management,120766
120772,HR Generalist I,Group HR Management,120780
120773,HR Generalist II,Group HR Management,120780
120774,HR Specialist II,Group HR Management,120780
120775,HR Analyst II,Group HR Management,120780
120776,HR Generalist III,Group HR Management,120780
120777,HR Specialist I,Group HR Management,120780
120778,HR Specialist I,Group HR Management,120780
120779,HR Analyst II,Group HR Management,120780
120780,HR Manager,Group HR Management,120262
120781,Recruiter I,Group HR Management,120782
120782,Recruitment Manager,Group HR Management,120262
120783,Recruiter III,Group HR Management,120782
120784,Recruiter II,Group HR Management,120782
120785,Training Manager,Group HR Management,120780
120786,Trainer I,Group HR Management,120785
120787,Trainer II,Group HR Management,120785
120788,Trainer I,Group HR Management,120785
120789,Trainer III,Group HR Management,120785
120790,ETL Specialist II,IS,120791
120791,Systems Architect IV,IS,120798
120792,Systems Architect II,IS,120791
120793,ETL Specialist I,IS,120791
120794,Applications Developer IV,IS,120800
120795,Applications Developer II,IS,120794
120796,Applications Developer II,IS,120794
120797,Applications Developer I,IS,120794
120798,Senior Project Manager,IS,120800
120799,Office Assistant III,IS,120800
120800,IS Director,IS,120262
120801,Applications Developer I,IS,120798
120802,Applications Developer IV,IS,120798
120803,Applications Developer I,IS,120798
120804,IS Administrator III,IS,120798
120805,BI Administrator IV,IS,120798
120806,IS Administrator II,IS,120798
120807,IS Administrator I,IS,120798
120808,BI Specialist II,IS,120798
120809,BI Architect II,IS,120798
120810,IS Architect III,IS,120798
120811,Applications Developer I,IS,120814
120812,Applications Developer II,IS,120814
120813,Applications Developer IV,IS,120814
120814,Project Manager,IS,120800
120815,Service Administrator III,Marketing,120719
120816,Service Administrator I,Marketing,120719
120992,Office Assistant I,Administration,120996
120993,Office Assistant I,Administration,120996
120994,Office Administrator I,Administration,120996
120995,Office Administrator II,Administration,120996
120996,Office Assistant IV,Administration,121000
120997,Shipping Administrator I,Administration,121000
120998,Clerk I,Administration,120997
120999,Clerk I,Administration,120997
121000,Administration Manager,Administration,121141
121001,Warehouse Manager,Administration,121000
121002,Warehouse Assistant II,Administration,121001
121003,Warehouse Assistant I,Administration,121001
121004,Security Manager,Administration,121000
121005,Security Guard I,Administration,121004
121006,Security Guard I,Administration,121004
121007,Security Guard II,Administration,121004
121008,Security Guard II,Administration,121004
121009,Service Administrator I,Administration,121000
121010,Service Assistant I,Administration,121009
121011,Service Assistant I,Administration,121009
121012,Service Assistant II,Administration,121009
121013,Electrician II,Engineering,121016
121014,Electrician III,Engineering,121016
121015,Technician I,Engineering,121016
121016,Technical Manager,Engineering,121000
121017,Technician II,Engineering,121016
121018,Sales Rep. II,Sales,121144
121019,Sales Rep. IV,Sales,121144
121020,Sales Rep. IV,Sales,121144
121021,Sales Rep. IV,Sales,121144
121022,Sales Rep. IV,Sales,121144
121023,Sales Rep. I,Sales,121144
121024,Sales Rep. II,Sales,121144
121025,Sales Rep. II,Sales,121144
121026,Sales Rep. IV,Sales,121144
121027,Sales Rep. II,Sales,121144
121028,Sales Rep. I,Sales,121144
121029,Sales Rep. I,Sales,121144
121030,Sales Rep. I,Sales,121144
121031,Sales Rep. III,Sales,121144
121032,Sales Rep. IV,Sales,121144
121033,Sales Rep. III,Sales,121144
121034,Sales Rep. II,Sales,121144
121035,Sales Rep. II,Sales,121144
121036,Sales Rep. I,Sales,121144
121037,Sales Rep. III,Sales,121144
121038,Sales Rep. I,Sales,121144
121039,Sales Rep. II,Sales,121144
121040,Sales Rep. III,Sales,121144
121041,Sales Rep. II,Sales,121144
121042,Sales Rep. III,Sales,121144
121043,Sales Rep. II,Sales,121144
121044,Sales Rep. I,Sales,121144
121045,Sales Rep. II,Sales,121143
121046,Sales Rep. I,Sales,121143
121047,Sales Rep. I,Sales,121143
121048,Sales Rep. I,Sales,121143
121049,Sales Rep. I,Sales,121143
121050,Sales Rep. II,Sales,121143
121051,Sales Rep. I,Sales,121143
121052,Sales Rep. II,Sales,121143
121053,Sales Rep. III,Sales,121143
121054,Sales Rep. III,Sales,121143
121055,Sales Rep. III,Sales,121143
121056,Sales Rep. II,Sales,121143
121057,Sales Rep. I,Sales,121143
121058,Sales Rep. I,Sales,121143
121059,Sales Rep. II,Sales,121143
121060,Sales Rep. III,Sales,121143
121061,Sales Rep. III,Sales,121143
121062,Sales Rep. IV,Sales,121145
121063,Sales Rep. II,Sales,121145
121064,Sales Rep. I,Sales,121145
121065,Sales Rep. III,Sales,121145
121066,Sales Rep. II,Sales,121145
121067,Sales Rep. IV,Sales,121145
121068,Sales Rep. II,Sales,121145
121069,Sales Rep. II,Sales,121145
121070,Sales Rep. III,Sales,121145
121071,Sales Rep. III,Sales,121145
121072,Sales Rep. I,Sales,121145
121073,Sales Rep. I,Sales,121145
121074,Sales Rep. I,Sales,121145
121075,Sales Rep. II,Sales,121145
121076,Sales Rep. II,Sales,121143
121077,Sales Rep. III,Sales,121143
121078,Sales Rep. I,Sales,121143
121079,Sales Rep. I,Sales,121143
121080,Sales Rep. I,Sales,121143
121081,Sales Rep. III,Sales,121143
121082,Sales Rep. III,Sales,121143
121083,Sales Rep. I,Sales,121143
121084,Sales Rep. I,Sales,121143
121085,Sales Rep. IV,Sales,121143
121086,Sales Rep. I,Sales,121143
121087,Sales Rep. II,Sales,121143
121088,Sales Rep. I,Sales,121143
121089,Sales Rep. II,Sales,121143
121090,Sales Rep. I,Sales,121143
121091,Sales Rep. II,Sales,121143
121092,Sales Rep. I,Sales,121143
121093,Sales Rep. I,Sales,121143
121094,Sales Rep. I,Sales,121143
121095,Sales Rep. II,Sales,121143
121096,Sales Rep. I,Sales,121143
121097,Sales Rep. II,Sales,121143
121098,Sales Rep. I,Sales,121143
121099,Sales Rep. IV,Sales,121143
121100,Sales Rep. II,Sales,121143
121101,Sales Rep. I,Sales,121143
121102,Sales Rep. I,Sales,121143
121103,Sales Rep. I,Sales,121143
121104,Sales Rep. II,Sales,121143
121105,Sales Rep. III,Sales,121143
121106,Sales Rep. I,Sales,121143
121107,Sales Rep. IV,Sales,121143
121108,Sales Rep. I,Sales,121143
121109,Sales Rep. I,Sales,121143
121110,Temp. Sales Rep.,Sales,121145
121111,Temp. Sales Rep.,Sales,121145
121112,Temp. Sales Rep.,Sales,121145
121113,Temp. Sales Rep.,Sales,121145
121114,Temp. Sales Rep.,Sales,121145
121115,Temp. Sales Rep.,Sales,121145
121116,Temp. Sales Rep.,Sales,121145
121117,Temp. Sales Rep.,Sales,121145
121118,Temp. Sales Rep.,Sales,121145
121119,Temp. Sales Rep.,Sales,121145
121120,Temp. Sales Rep.,Sales,121145
121121,Temp. Sales Rep.,Sales,121145
121122,Temp. Sales Rep.,Sales,121145
121123,Temp. Sales Rep.,Sales,121145
121124,Temp. Sales Rep.,Sales,121145
121125,Trainee,Sales,121145
121126,Trainee,Sales,121145
121127,Trainee,Sales,121145
121128,Trainee,Sales,121145
121129,Trainee,Sales,121145
121130,Trainee,Sales,121145
121131,Trainee,Sales,121145
121132,Trainee,Sales,121145
121133,Trainee,Sales,121145
121134,Trainee,Sales,121145
121135,Sales Rep. I,Sales,121145
121136,Sales Rep. I,Sales,121145
121137,Sales Rep. I,Sales,121145
121138,Sales Rep. I,Sales,121145
121139,Sales Rep. II,Sales,121145
121140,Sales Rep. I,Sales,121145
121141,Vice President,Sales Management,120261
121142,Director,Sales Management,121141
121143,Senior Sales Manager,Sales Management,121142
121144,Sales Manager,Sales Management,121142
121145,Sales Manager,Sales Management,121142
121146,Secretary III,Sales Management,121141
121147,Secretary II,Sales Management,121142
121148,Business Analyst II,Sales Management,121141
;;;;
run;

data ORION.EMPLOYEE_PAYROLL;
   attrib Employee_ID length=8 format=12.;
   attrib Employee_Gender length=$1;
   attrib Salary length=8;
   attrib Birth_Date length=8;
   attrib Employee_Hire_Date length=8;
   attrib Employee_Term_Date length=8;
   attrib Marital_Status length=$1;
   attrib Dependents length=8;

   infile datalines dsd;
   input
      Employee_ID
      Employee_Gender
      Salary
      Birth_Date
      Employee_Hire_Date
      Employee_Term_Date
      Marital_Status
      Dependents
   ;
datalines4;
120101,M,163040,7535,17348,,S,0
120102,M,108255,4971,12205,,O,2
120103,M,87975,-2535,6575,,M,1
120104,F,46230,-600,9132,,M,1
120105,F,27110,6929,15826,,S,0
120106,M,26960,-4026,6575,,M,2
120107,F,30475,-2536,6606,,M,2
120108,F,27660,10280,18475,,S,0
120109,F,26495,11306,18536,,M,3
120110,M,28615,-2233,8705,,M,1
120111,M,26895,-2353,6879,,M,3
120112,F,26550,4796,12600,,M,3
120113,F,26870,-4253,6575,,S,0
120114,F,31285,-4345,6575,,M,3
120115,M,26500,10355,18110,,M,2
120116,M,29250,1259,8797,,S,0
120117,M,31670,3176,11048,,O,1
120118,M,28090,1249,10409,,M,3
120119,M,30255,5103,15341,,M,1
120120,F,27645,-4258,6575,,M,3
120121,F,26600,-4169,6575,,M,1
120122,F,27475,-523,8217,,S,0
120123,F,26190,3193,10866,17928,M,3
120124,M,26480,1228,8460,,M,1
120125,M,32040,-391,8460,17744,M,2
120126,M,26780,11951,18475,,O,2
120127,F,28100,8404,15645,,M,2
120128,F,30890,11152,18567,,S,0
120129,M,30070,3248,10866,17256,S,0
120130,M,26955,10575,18383,,M,2
120131,M,26910,8668,17167,,S,0
120132,F,28525,-2462,8309,,S,0
120133,F,27440,11069,18536,,S,0
120134,M,28015,-2400,6575,18443,M,2
120135,M,32490,4774,15249,17652,M,3
120136,M,26605,8659,17198,,M,1
120137,F,29715,8471,18322,,S,0
120138,F,25795,8592,18444,,S,0
120139,F,26810,11187,18506,,S,0
120140,M,26970,11903,18536,,M,2
120141,F,27465,11759,18383,,M,1
120142,M,29695,11122,18444,,S,0
120143,M,26790,1232,9770,,S,1
120144,M,30265,11023,18536,,S,0
120145,M,26060,2943,10744,,O,0
120146,M,25985,1370,8979,18170,M,1
120147,F,26580,11706,18536,,M,3
120148,M,28480,-2301,8187,,S,0
120149,F,26390,6899,13515,,O,1
120150,M,29965,-541,9709,17652,M,1
120151,F,26520,-4058,6575,,M,3
120152,M,26515,8521,17988,,M,1
120153,F,27260,8527,15341,18293,M,2
120154,F,30490,-4182,6575,,M,1
120155,F,29990,10339,18353,,M,1
120156,F,26445,11932,18322,,O,0
120157,M,27860,11009,18597,,S,0
120158,M,36605,3117,11504,18140,S,0
120159,F,30765,2976,11139,,M,1
120160,M,27115,-479,6848,,M,1
120161,F,30785,11754,18536,,S,0
120162,M,27215,11936,18294,,M,3
120163,M,26735,3064,12784,,M,3
120164,F,27450,1425,9528,,M,2
120165,M,27050,10305,18322,,S,0
120166,M,30660,-4218,6575,18505,S,0
120167,F,25185,-607,6606,18352,S,0
120168,F,25275,10310,18567,,M,1
120169,M,28135,10228,18383,,M,3
120170,M,28830,6630,13423,18566,S,0
120171,F,26205,10427,18506,,M,3
120172,M,28345,-4292,6575,,M,3
120173,M,26715,-677,7822,17744,M,3
120174,F,26850,-4374,6575,18200,S,0
120175,M,25745,11918,18536,,S,0
120176,M,26095,11270,18567,,M,1
120177,F,28745,8495,15372,,S,0
120178,M,26165,-404,6665,,M,3
120179,M,28510,6648,17532,17775,M,1
120180,M,26970,-553,8370,,S,0
120181,F,27065,12020,18597,18717,S,0
120182,M,25020,10505,18597,18627,M,2
120183,M,26910,5001,18597,18627,M,1
120184,M,25820,-2222,18597,18747,O,2
120185,F,25080,6671,18597,18658,M,2
120186,F,26795,8509,18597,18808,O,1
120187,F,26665,10571,18597,18778,M,1
120188,F,26715,-671,18597,18627,M,2
120189,M,25180,10411,18597,18717,S,0
120190,M,24100,10566,17837,18017,M,2
120191,F,24015,1112,17167,17347,S,0
120192,M,26185,10355,18049,18231,M,2
120193,M,24515,10567,18141,18321,S,0
120194,M,25985,10493,17929,18109,M,1
120195,F,24990,10586,18444,18627,S,0
120196,F,24025,10257,17167,17347,S,0
120197,F,25580,-511,17167,17347,M,2
120198,F,28025,11708,18597,,M,1
120259,M,433800,2946,12297,,M,1
120260,F,207885,3258,10532,,M,2
120261,M,243190,4800,11535,,O,1
120262,M,268455,5042,11932,,M,2
120263,M,42605,2962,10135,17531,S,0
120264,F,37510,10249,18597,,S,0
120265,F,51950,-4106,6575,17166,M,3
120266,F,31750,4930,12144,,M,2
120267,F,28585,11110,17198,,M,1
120268,M,76105,6818,15096,,S,0
120269,F,52540,-4113,6575,17652,M,2
120270,M,48435,-647,6575,,O,0
120271,F,43635,3140,11201,,M,1
120272,M,34390,-4309,6575,,S,0
120273,F,28455,11115,18322,,M,2
120274,F,26840,2930,13849,,O,0
120275,F,32195,1456,10501,,M,2
120276,M,28090,-4033,6575,17317,M,3
120277,F,32645,11916,17653,18048,S,0
120278,M,27685,11308,18475,,M,3
120279,F,32925,5041,14731,,S,0
120280,F,36930,3237,11809,16982,M,1
120656,F,42570,6602,15765,,O,0
120657,F,36110,2928,12723,,S,0
120658,M,42485,-377,9163,,O,2
120659,M,161290,-2360,6575,,M,3
120660,M,61125,8192,17957,,S,0
120661,F,85495,-400,10227,17347,M,3
120662,M,27045,11864,18567,,S,0
120663,F,56385,4833,15035,,S,0
120664,M,47605,-682,7060,,M,3
120665,F,80070,6871,16861,,M,1
120666,M,64555,4921,13118,17652,S,0
120667,M,29980,8572,18294,,S,0
120668,M,47785,-2261,8370,,O,0
120669,M,36370,-4179,6575,,S,0
120670,M,65420,-4298,6575,17166,S,0
120671,M,40080,-584,9893,,S,0
120672,M,60980,3159,13209,,M,1
120673,F,35935,-4205,6575,,S,0
120677,F,65555,4993,13546,,M,2
120678,F,40035,-2545,8156,17409,S,0
120679,F,46190,7616,16983,,M,3
120680,F,27295,4985,12904,,S,0
120681,M,30950,8624,17623,,M,2
120682,F,26760,5102,14701,,M,1
120683,F,36315,-415,6575,17225,M,2
120684,F,26960,11287,18567,,S,0
120685,F,25130,10287,18567,,M,3
120686,F,26690,-4256,6575,,M,1
120687,F,26800,8545,17745,17928,O,0
120688,F,25905,-2198,6575,17044,S,0
120689,F,27780,8601,18444,,S,0
120690,F,25185,10243,17867,,S,0
120691,M,49240,-4125,6575,,S,0
120692,M,32485,-405,9587,,M,2
120693,M,26625,1217,8552,,M,3
120694,F,27365,11916,18353,,O,1
120695,M,28180,3116,12235,18474,S,0
120696,M,26615,-505,6634,18352,M,2
120697,F,29625,11866,18414,,O,0
120698,M,26160,-594,7518,17956,O,0
120710,M,54840,6902,15341,,O,1
120711,F,59130,4896,13939,,O,0
120712,F,63640,-2394,6575,,S,0
120713,M,31630,-4330,6575,,M,3
120714,M,62625,7399,15584,,M,3
120715,F,28535,8563,17929,,M,3
120716,M,53015,6779,13727,,M,1
120717,M,30155,-722,9344,,O,2
120718,M,29190,3111,12539,,S,0
120719,F,87420,4770,14641,,M,1
120720,M,46580,3049,13240,,M,2
120721,F,29870,-4089,6575,,M,3
120722,M,32460,1360,10866,,S,0
120723,F,33950,-2335,6575,,O,0
120724,M,63705,2948,13240,,S,0
120725,M,29970,8697,17684,17897,S,0
120726,F,27380,11870,18506,,M,1
120727,M,34925,3098,11109,,M,1
120728,F,35070,-393,9497,,M,1
120729,F,31495,11781,17281,18163,M,3
120730,M,30195,3272,11962,,M,3
120731,M,34150,1169,10105,,O,1
120732,M,35870,-2331,6575,,M,1
120733,M,31760,3015,12723,,M,1
120734,M,34270,8516,18322,,S,1
120735,F,61985,-567,8156,,S,0
120736,F,63985,3253,13057,,S,0
120737,F,63605,1182,11993,,M,2
120738,F,30025,-2370,6575,,S,0
120739,M,36970,11176,18383,,S,0
120740,F,35110,-2265,6575,17409,O,1
120741,F,36365,-4051,6575,,M,2
120742,M,31020,-4349,6575,,S,0
120743,F,34620,4780,15127,,S,0
120744,F,33490,11858,17714,18200,M,2
120745,F,31365,11143,18414,,M,1
120746,M,46090,6857,16892,,M,3
120747,F,43590,6745,14457,,M,2
120748,F,48380,7491,17226,,M,3
120749,M,26545,6837,14884,,S,0
120750,F,32675,-573,8432,16832,M,2
120751,M,58200,3017,11901,,M,3
120752,M,30590,-683,7152,17286,S,0
120753,M,47000,7471,14092,,S,0
120754,M,34760,11841,18383,,M,1
120755,F,36440,3158,10074,,M,3
120756,F,52295,6625,14792,,M,3
120757,M,38545,-4306,6575,17713,M,3
120758,M,34040,3217,13423,,S,0
120759,M,36230,3230,9862,,S,0
120760,F,53475,4754,13635,,S,0
120761,F,30960,11319,18444,,O,2
120762,M,30625,8706,18322,,M,2
120763,M,45100,-4084,6575,,O,1
120764,M,40450,6930,17136,,S,0
120765,F,51950,-380,6575,,S,0
120766,F,53400,6883,16496,,M,1
120767,M,32965,3051,11413,,S,0
120768,M,44955,-528,9405,17500,M,3
120769,M,47990,6718,14701,,S,0
120770,F,43930,3036,11413,17286,S,0
120771,F,36435,-515,7640,,S,0
120772,M,27365,11786,18475,,S,0
120773,F,27370,1148,9222,,M,2
120774,F,45155,8295,16861,18201,M,3
120775,F,41580,4790,14915,,M,3
120776,M,32580,8664,16527,,S,0
120777,M,40955,4833,14000,,S,0
120778,F,43650,-389,10258,,S,0
120779,F,43690,7582,15035,,S,0
120780,F,62995,4992,13057,,M,3
120781,F,32620,11710,17867,18262,M,3
120782,F,63915,6907,15857,,S,0
120783,M,42975,6928,14610,,S,0
120784,F,35715,8514,17776,,O,1
120785,F,48335,4769,13666,,O,2
120786,F,32650,-4306,6575,,S,0
120787,M,34000,4982,14610,,M,1
120788,M,33530,4912,14214,,O,1
120789,M,39330,3117,9831,17317,M,2
120790,F,53740,6915,14365,,S,0
120791,M,61115,3129,11231,,M,2
120792,F,54760,7383,15188,,M,2
120793,M,47155,4968,14762,,S,0
120794,F,51265,8400,17348,,S,0
120795,M,49105,4764,11901,17197,S,0
120796,M,47030,-599,9921,,M,2
120797,F,43385,-410,8005,,M,3
120798,F,80755,1269,11323,,O,1
120799,M,29070,8482,15645,,M,3
120800,M,80210,6928,15127,17197,S,0
120801,F,40040,6639,15887,,M,2
120802,F,65125,-2426,8036,17713,S,0
120803,M,43630,-574,8036,,S,0
120804,M,55400,-4342,6575,,S,0
120805,M,58530,8213,16162,,M,3
120806,F,47285,6630,13180,,M,2
120807,F,43325,1443,9497,17775,S,0
120808,M,44425,3074,10379,,S,0
120809,F,47155,-4370,6575,,S,0
120810,M,58375,-454,8826,,S,0
120811,M,43985,5017,13696,,S,0
120812,M,45810,6624,16649,,O,1
120813,M,50865,5005,13515,17531,S,0
120814,M,59140,1249,8644,,M,1
120815,M,31590,12049,18353,,M,2
120816,F,30485,4871,13727,,S,0
120992,F,26940,8448,16284,,S,0
120993,F,26260,5100,15035,,M,2
120994,F,31645,6741,14184,,S,0
120995,F,34850,10391,18475,,M,1
120996,M,32745,6776,17045,,M,3
120997,F,27420,6899,14854,,S,0
120998,F,26330,8740,17988,,M,1
120999,F,27215,1457,10318,,S,0
121000,M,48600,2946,13849,,M,2
121001,M,43615,1116,7914,,S,0
121002,F,26650,-470,8735,17775,M,3
121003,M,26000,11813,18444,,S,0
121004,M,30895,-4168,6575,,S,0
121005,M,25020,10423,17563,,O,2
121006,M,26145,11242,17837,18201,M,2
121007,M,27290,3207,11354,,M,3
121008,M,27875,4932,13727,,M,1
121009,M,32955,8738,15918,,S,0
121010,M,25195,10453,18322,,S,0
121011,M,25735,-4313,6575,,S,0
121012,M,29575,10983,17410,17866,S,0
121013,M,26675,8518,16162,,S,0
121014,F,28510,6695,15918,,M,3
121015,M,26140,8747,16315,,S,0
121016,F,48075,7323,17776,,S,0
121017,M,29225,10232,17957,,S,0
121018,F,27560,-4381,6575,17286,M,2
121019,M,31320,11133,17684,18109,M,3
121020,F,31750,10280,16922,,M,1
121021,F,32985,6918,13939,,S,0
121022,M,32210,8701,16833,17775,S,0
121023,M,26010,2994,12174,18140,M,3
121024,M,26600,10491,17653,,M,2
121025,M,28295,-2274,7183,,S,0
121026,M,31515,11269,18353,,M,1
121027,M,26165,3047,12388,,M,3
121028,M,26585,11805,18567,,S,0
121029,M,27225,3278,12388,,M,2
121030,M,26745,8716,16468,,S,0
121031,M,28060,3112,10805,,M,3
121032,M,31335,11742,18322,,M,1
121033,F,29775,11267,17684,,M,3
121034,M,27110,11923,18628,,S,0
121035,M,26460,-4299,6575,,M,3
121036,F,25965,11887,17440,18201,O,1
121037,M,28310,6737,16861,,M,2
121038,M,25285,11731,18475,18659,S,0
121039,M,27460,-577,8887,,M,2
121040,F,29525,1282,9801,,M,2
121041,F,26120,-4349,6575,,S,0
121042,M,28845,8494,16010,,M,2
121043,F,28225,5061,13209,,M,2
121044,M,25660,-386,7152,,S,0
121045,F,28560,3086,13880,17591,M,2
121046,M,25845,10477,18444,18628,M,1
121047,F,25820,8730,18506,18687,M,2
121048,F,26560,10402,18506,18687,M,3
121049,F,26930,11002,18597,,M,3
121050,F,26080,10969,18597,,M,3
121051,F,26025,-2435,8340,,M,2
121052,M,26900,10966,18567,,S,0
121053,F,29955,-4117,6606,,M,2
121054,M,29805,-415,7610,,S,0
121055,M,30185,11695,18475,,M,1
121056,F,28325,10413,17287,,O,1
121057,M,25125,1455,9101,,M,1
121058,M,26270,6767,17075,,M,2
121059,F,27425,1393,9222,17531,S,0
121060,F,28800,-4224,6575,,M,2
121061,M,29815,-534,10409,,S,0
121062,F,30305,10528,18475,,M,3
121063,M,35990,8608,18110,,S,0
121064,M,25110,2949,13027,,M,1
121065,F,28040,10475,18353,,M,2
121066,F,27250,-4148,6575,18201,O,1
121067,F,31865,10975,18322,18506,S,0
121068,M,27550,5084,13393,,O,1
121069,M,26195,4826,12692,,M,1
121070,F,29385,10535,18294,,O,1
121071,M,28625,1348,7914,,M,2
121072,M,26105,8410,17776,18201,M,1
121073,M,27100,-2422,6575,,M,1
121074,M,26990,1155,11962,,S,0
121075,F,28395,-4026,6575,,M,3
121076,M,26685,3204,9862,17683,M,2
121077,M,28585,10475,18536,,S,0
121078,M,27485,-2436,8340,,M,1
121079,M,25770,6728,15280,,M,1
121080,M,32235,1119,11566,,S,0
121081,F,30235,-2470,7396,,M,2
121082,M,28510,-2371,7944,,M,3
121083,F,27245,1165,8460,,S,0
121084,M,22710,3150,12784,,M,3
121085,M,32235,11273,18628,,S,0
121086,M,26820,-4033,6575,,M,3
121087,F,28325,6915,15765,18352,M,3
121088,M,27240,11849,18628,,S,0
121089,M,28095,-498,6756,18566,M,1
121090,F,26600,-561,8797,,M,3
121091,M,27325,4798,12054,,M,2
121092,F,25680,6641,17014,,S,0
121093,M,27410,3121,13880,17347,M,2
121094,M,26555,-724,8279,,S,0
121095,F,28010,4852,12965,,S,0
121096,M,26335,4886,14365,,S,0
121097,F,26830,6870,14518,,M,3
121098,M,27475,11769,18383,,S,0
121099,M,32725,8478,16192,,M,3
121100,M,28135,-2440,7396,,S,0
121101,F,25390,11197,18567,,O,1
121102,F,27115,8577,18414,,M,2
121103,M,27260,11806,18506,,S,0
121104,F,28315,3238,11048,16832,S,0
121105,F,29545,8529,17167,,S,0
121106,M,25880,4781,14641,,M,3
121107,F,31380,11071,18444,,M,1
121108,F,25930,11873,18567,18748,S,0
121109,M,26035,5057,12539,,M,1
121110,M,26370,-4279,18597,18627,M,1
121111,M,26885,-4185,18597,18747,S,0
121112,M,26855,11304,18597,18627,S,0
121113,F,27480,-679,18597,18658,O,1
121114,F,26515,-4075,18597,18808,M,3
121115,M,26430,1139,18597,18747,S,0
121116,F,26670,3188,18597,18717,M,3
121117,F,26640,6651,18597,18627,S,0
121118,M,25725,8460,18597,18778,S,0
121119,M,25205,3229,18597,18686,M,3
121120,F,25020,6872,18597,18686,S,0
121121,F,25735,11021,18597,18778,S,0
121122,M,26265,11017,18597,18717,S,0
121123,M,26410,-4266,18597,18717,M,3
121124,M,26925,4794,18597,18627,S,0
121125,M,25315,6681,17167,17347,S,0
121126,M,26015,-432,17167,17347,M,1
121127,F,25435,11203,18049,18231,M,2
121128,F,25405,6751,17167,17347,M,3
121129,M,30945,3043,17167,17347,S,0
121130,M,25255,10247,17563,17744,S,0
121131,M,25445,4929,17167,17347,M,2
121132,M,24390,-692,17167,17347,M,1
121133,M,25405,8714,17167,17347,M,1
121134,M,25585,3105,17167,17347,S,0
121135,F,27010,-573,6787,,S,0
121136,F,27460,6770,17136,17805,S,0
121137,M,27055,11705,18353,,O,0
121138,M,27265,-2498,6575,,M,1
121139,F,27700,1326,11504,,M,2
121140,M,26335,8423,16527,18293,S,0
121141,M,194885,-4213,6575,,S,0
121142,M,156065,4793,13635,,M,2
121143,M,95090,5078,15157,,M,3
121144,F,83505,3101,13088,,M,3
121145,M,84260,-2231,7396,,M,2
121146,F,29320,11300,18353,,M,1
121147,F,29145,4896,11566,,M,2
121148,M,52930,4749,15341,17197,M,1
;;;;
run;

data ORION.EMPLOYEE_PHONES;
   attrib Employee_ID length=8;
   attrib Phone_Type length=$4;
   attrib Phone_Number length=$200;

   infile datalines dsd;
   input
      Employee_ID
      Phone_Type
      Phone_Number
   ;
datalines4;
120101,Home,+61(2)5555-1849
120101,Work,+61(2)5551-0001
120102,Home,+61(3)5555-9700
120102,Work,+61(3)5551-0002
120103,Home,+61(2)5555-3998
120103,Work,+61(2)5551-0003
120104,Home,+61(2)5555-2594
120104,Work,+61(2)5551-0004
120105,Home,+61(3)5555-9215
120105,Work,+61(3)5551-0005
120106,Home,+61(2)5555-9692
120106,Work,+61(2)5551-0006
120106,Cell,+61(5)5555-5435
120107,Home,+61(3)5555-5316
120107,Work,+61(3)5551-0007
120108,Home,+61(3)5555-0498
120108,Work,+61(3)5551-0008
120109,Home,+61(2)5555-0666
120109,Work,+61(2)5551-0009
120110,Home,+61(2)5555-8192
120110,Work,+61(2)5551-0010
120111,Home,+61(2)5555-5238
120111,Work,+61(2)5551-0011
120112,Home,+61(3)5555-8533
120112,Work,+61(3)5551-0012
120112,Cell,+61(5)5555-0684
120113,Home,+61(3)5555-9569
120113,Work,+61(3)5551-0013
120114,Home,+61(2)5555-2972
120114,Work,+61(2)5551-0014
120115,Home,+61(2)5555-2726
120115,Work,+61(2)5551-0015
120116,Home,+61(2)5555-6899
120116,Work,+61(2)5551-0016
120117,Home,+61(3)5555-9767
120117,Work,+61(3)5551-0017
120118,Home,+61(2)5555-2265
120118,Work,+61(2)5551-0018
120118,Cell,+61(5)5555-6900
120119,Home,+61(2)5555-4127
120119,Work,+61(2)5551-0019
120120,Home,+61(2)5555-5585
120120,Work,+61(2)5551-0020
120121,Home,+61(2)5555-2872
120121,Work,+61(2)5551-0021
120122,Home,+61(3)5555-4757
120122,Work,+61(3)5551-0022
120123,Home,+61(2)5555-8449
120123,Work,+61(2)5551-0023
120124,Home,+61(2)5555-6345
120124,Work,+61(2)5551-0024
120124,Cell,+61(5)5555-5927
120125,Home,+61(2)5555-5825
120125,Work,+61(2)5551-0025
120126,Home,+61(2)5555-3770
120126,Work,+61(2)5551-0026
120127,Home,+61(2)5555-7283
120127,Work,+61(2)5551-0027
120128,Home,+61(3)5555-5066
120128,Work,+61(3)5551-0028
120129,Home,+61(3)5555-9311
120129,Work,+61(3)5551-0029
120130,Home,+61(2)5555-9290
120130,Work,+61(2)5551-0030
120130,Cell,+61(5)5555-5926
120131,Home,+61(2)5555-2972
120131,Work,+61(2)5551-0031
120132,Home,+61(2)5555-3910
120132,Work,+61(2)5551-0032
120133,Home,+61(3)5555-4724
120133,Work,+61(3)5551-0033
120134,Home,+61(2)5555-6795
120134,Work,+61(2)5551-0034
120135,Home,+61(2)5555-1681
120135,Work,+61(2)5551-0035
120136,Home,+61(2)5555-1665
120136,Work,+61(2)5551-0036
120136,Cell,+61(5)5555-8746
120137,Home,+61(3)5555-2988
120137,Work,+61(3)5551-0037
120138,Home,+61(3)5555-9345
120138,Work,+61(3)5551-0038
120139,Home,+61(2)5555-9004
120139,Work,+61(2)5551-0039
120140,Home,+61(2)5555-5687
120140,Work,+61(2)5551-0040
120141,Home,+61(2)5555-0495
120141,Work,+61(2)5551-0041
120142,Home,+61(3)5555-1356
120142,Work,+61(3)5551-0042
120142,Cell,+61(5)5555-5155
120143,Home,+61(2)5555-4332
120143,Work,+61(2)5551-0043
120144,Home,+61(2)5555-1761
120144,Work,+61(2)5551-0044
120145,Home,+61(3)5555-6650
120145,Work,+61(3)5551-0045
120146,Home,+61(2)5555-4048
120146,Work,+61(2)5551-0046
120147,Home,+61(2)5555-1245
120147,Work,+61(2)5551-0047
120148,Home,+61(2)5555-4534
120148,Work,+61(2)5551-0048
120148,Cell,+61(5)5555-2043
120149,Home,+61(3)5555-5748
120149,Work,+61(3)5551-0049
120150,Home,+61(3)5555-7384
120150,Work,+61(3)5551-0050
120151,Home,+61(2)5555-4398
120151,Work,+61(2)5551-0051
120152,Home,+61(2)5555-0494
120152,Work,+61(2)5551-0052
120153,Home,+61(2)5555-5223
120153,Work,+61(2)5551-0053
120154,Home,+61(2)5555-3433
120154,Work,+61(2)5551-0054
120154,Cell,+61(5)5555-0281
120155,Home,+61(3)5555-7128
120155,Work,+61(3)5551-0055
120156,Home,+61(2)5555-9370
120156,Work,+61(2)5551-0056
120157,Home,+61(2)5555-4459
120157,Work,+61(2)5551-0057
120158,Home,+61(2)5555-9468
120158,Work,+61(2)5551-0058
120159,Home,+61(2)5555-7128
120159,Work,+61(2)5551-0059
120160,Home,+61(2)5555-1033
120160,Work,+61(2)5551-0060
120160,Cell,+61(5)5555-1812
120161,Home,+61(3)5555-2689
120161,Work,+61(3)5551-0061
120162,Home,+61(3)5555-6148
120162,Work,+61(3)5551-0062
120163,Home,+61(3)5555-4207
120163,Work,+61(3)5551-0063
120164,Home,+61(3)5555-0717
120164,Work,+61(3)5551-0064
120165,Home,+61(2)5555-3585
120165,Work,+61(2)5551-0065
120166,Home,+61(2)5555-7114
120166,Work,+61(2)5551-0066
120166,Cell,+61(5)5555-1964
120167,Home,+61(2)5555-1480
120167,Work,+61(2)5551-0067
120168,Home,+61(3)5555-5618
120168,Work,+61(3)5551-0068
120169,Home,+61(3)5555-2701
120169,Work,+61(3)5551-0069
120170,Home,+61(2)5555-3252
120170,Work,+61(2)5551-0070
120171,Home,+61(2)5555-5691
120171,Work,+61(2)5551-0071
120172,Home,+61(2)5555-0426
120172,Work,+61(2)5551-0072
120172,Cell,+61(5)5555-4464
120173,Home,+61(3)5555-9173
120173,Work,+61(3)5551-0073
120174,Home,+61(3)5555-5258
120174,Work,+61(3)5551-0074
120175,Home,+61(2)5555-7317
120175,Work,+61(2)5551-0075
120176,Home,+61(3)5555-9051
120176,Work,+61(3)5551-0076
120177,Home,+61(2)5555-5759
120177,Work,+61(2)5551-0077
120178,Home,+61(2)5555-1879
120178,Work,+61(2)5551-0078
120178,Cell,+61(5)5555-3391
120179,Home,+61(3)5555-6988
120179,Work,+61(3)5551-0079
120180,Home,+61(3)5555-1216
120180,Work,+61(3)5551-0080
120181,Home,+61(2)5555-1806
120181,Work,+61(2)5551-0081
120182,Home,+61(2)5555-2706
120182,Work,+61(2)5551-0082
120183,Home,+61(3)5555-6531
120183,Work,+61(3)5551-0083
120184,Home,+61(2)5555-4213
120184,Work,+61(2)5551-0084
120184,Cell,+61(5)5555-0464
120185,Home,+61(2)5555-2708
120185,Work,+61(2)5551-0085
120186,Home,+61(2)5555-4277
120186,Work,+61(2)5551-0086
120187,Home,+61(3)5555-8200
120187,Work,+61(3)5551-0087
120188,Home,+61(2)5555-8434
120188,Work,+61(2)5551-0088
120189,Home,+61(2)5555-8768
120189,Work,+61(2)5551-0089
120190,Home,+61(2)5555-2672
120190,Work,+61(2)5551-0090
120190,Cell,+61(5)5555-3150
120191,Home,+61(3)5555-3970
120191,Work,+61(3)5551-0091
120192,Home,+61(2)5555-3490
120192,Work,+61(2)5551-0092
120193,Home,+61(3)5555-7659
120193,Work,+61(3)5551-0093
120194,Home,+61(3)5555-5433
120194,Work,+61(3)5551-0094
120195,Home,+61(3)5555-6125
120195,Work,+61(3)5551-0095
120196,Home,+61(3)5555-5529
120196,Work,+61(3)5551-0096
120196,Cell,+61(5)5555-7454
120197,Home,+61(3)5555-3718
120197,Work,+61(3)5551-0097
120198,Home,+61(2)5555-6456
120198,Work,+61(2)5551-0098
120259,Work,+1(305)555-5571
120259,Home,+1(305)551-0099
120260,Work,+1(619)555-8750
120260,Home,+1(619)551-0100
120261,Work,+1(305)555-5712
120261,Home,+1(305)551-0101
120262,Work,+1(215)555-7567
120262,Home,+1(215)551-0102
120262,Cell,+1(215)444-0102
120263,Work,+1(619)555-1484
120263,Home,+1(619)551-0103
120264,Work,+1(619)555-0254
120264,Home,+1(619)551-0104
120265,Work,+1(215)555-8171
120265,Home,+1(215)551-0105
120266,Work,+1(619)555-6582
120266,Home,+1(619)551-0106
120267,Work,+1(619)555-0295
120267,Home,+1(619)551-0107
120268,Work,+1(215)555-8533
120268,Home,+1(215)551-0108
120268,Cell,+1(215)444-0108
120269,Work,+1(215)555-3628
120269,Home,+1(215)551-0109
120270,Work,+1(305)555-3773
120270,Home,+1(305)551-0110
120271,Work,+1(305)555-5105
120271,Home,+1(305)551-0111
120272,Work,+1(215)555-7119
120272,Home,+1(215)551-0112
120273,Work,+1(305)555-3753
120273,Home,+1(305)551-0113
120274,Work,+1(215)555-2295
120274,Home,+1(215)551-0114
120274,Cell,+1(215)444-0114
120275,Work,+1(619)555-6861
120275,Home,+1(619)551-0115
120276,Work,+1(215)555-5524
120276,Home,+1(215)551-0116
120277,Work,+1(305)555-5818
120277,Home,+1(305)551-0117
120278,Work,+1(619)555-1747
120278,Home,+1(619)551-0118
120279,Work,+1(619)555-0461
120279,Home,+1(619)551-0119
120280,Work,+1(215)555-6437
120280,Home,+1(215)551-0120
120280,Cell,+1(215)444-0120
120656,Work,+1(619)555-6454
120656,Home,+1(619)551-0121
120657,Work,+1(619)555-0932
120657,Home,+1(619)551-0122
120658,Work,+1(619)555-6200
120658,Home,+1(619)551-0123
120659,Work,+1(215)555-0784
120659,Home,+1(215)551-0124
120660,Work,+1(305)555-6892
120660,Home,+1(305)551-0125
120661,Work,+1(619)555-1840
120661,Home,+1(619)551-0126
120661,Cell,+1(619)444-0126
120662,Work,+1(305)555-6204
120662,Home,+1(305)551-0127
120663,Work,+1(305)555-1934
120663,Home,+1(305)551-0128
120664,Work,+1(215)555-2953
120664,Home,+1(215)551-0129
120665,Work,+1(619)555-6309
120665,Home,+1(619)551-0130
120666,Work,+1(619)555-3848
120666,Home,+1(619)551-0131
120667,Work,+1(305)555-6864
120667,Home,+1(305)551-0132
120667,Cell,+1(305)444-0132
120668,Work,+1(305)555-4919
120668,Home,+1(305)551-0133
120669,Work,+1(215)555-8299
120669,Home,+1(215)551-0134
120670,Work,+1(215)555-0444
120670,Home,+1(215)551-0135
120671,Work,+1(215)555-2034
120671,Home,+1(215)551-0136
120672,Home,+61(2)5555-0790
120672,Work,+61(2)5551-0137
120673,Home,+61(3)5555-1451
120673,Work,+61(3)5551-0138
120673,Cell,+61(5)5555-2382
120677,Work,+1(305)555-3475
120677,Home,+1(305)551-0139
120678,Work,+1(619)555-7021
120678,Home,+1(619)551-0140
120679,Work,+1(619)555-4914
120679,Home,+1(619)551-0141
120680,Work,+1(215)555-6313
120680,Home,+1(215)551-0142
120681,Work,+1(305)555-9063
120681,Home,+1(305)551-0143
120682,Work,+1(215)555-3040
120682,Home,+1(215)551-0144
120682,Cell,+1(215)444-0144
120683,Work,+1(215)555-9258
120683,Home,+1(215)551-0145
120684,Work,+1(305)555-4406
120684,Home,+1(305)551-0146
120685,Work,+1(215)555-6083
120685,Home,+1(215)551-0147
120686,Work,+1(619)555-7818
120686,Home,+1(619)551-0148
120687,Work,+1(305)555-4263
120687,Home,+1(305)551-0149
120688,Work,+1(619)555-1253
120688,Home,+1(619)551-0150
120688,Cell,+1(619)444-0150
120689,Work,+1(215)555-7404
120689,Home,+1(215)551-0151
120690,Work,+1(215)555-1948
120690,Home,+1(215)551-0152
120691,Home,+61(2)5555-8166
120691,Work,+61(2)5551-0153
120692,Home,+61(2)5555-0855
120692,Work,+61(2)5551-0154
120693,Home,+61(2)5555-1837
120693,Work,+61(2)5551-0155
120694,Home,+61(2)5555-3326
120694,Work,+61(2)5551-0156
120694,Cell,+61(5)5555-7211
120695,Home,+61(3)5555-9275
120695,Work,+61(3)5551-0157
120696,Home,+61(3)5555-2964
120696,Work,+61(3)5551-0158
120697,Home,+61(3)5555-2240
120697,Work,+61(3)5551-0159
120698,Home,+61(2)5555-1472
120698,Work,+61(2)5551-0160
120710,Work,+1(215)555-5906
120710,Home,+1(215)551-0161
120711,Work,+1(215)555-4632
120711,Home,+1(215)551-0162
120711,Cell,+1(215)444-0162
120712,Work,+1(305)555-4186
120712,Home,+1(305)551-0163
120713,Work,+1(619)555-2563
120713,Home,+1(619)551-0164
120714,Work,+1(305)555-2304
120714,Home,+1(305)551-0165
120715,Work,+1(619)555-0803
120715,Home,+1(619)551-0166
120716,Work,+1(215)555-4355
120716,Home,+1(215)551-0167
120717,Work,+1(305)555-6701
120717,Home,+1(305)551-0168
120717,Cell,+1(305)444-0168
120718,Work,+1(215)555-4227
120718,Home,+1(215)551-0169
120719,Work,+1(619)555-4982
120719,Home,+1(619)551-0170
120720,Work,+1(215)555-8554
120720,Home,+1(215)551-0171
120721,Work,+1(215)555-6000
120721,Home,+1(215)551-0172
120722,Work,+1(305)555-5122
120722,Home,+1(305)551-0173
120723,Work,+1(215)555-5958
120723,Home,+1(215)551-0174
120723,Cell,+1(215)444-0174
120724,Work,+1(619)555-0440
120724,Home,+1(619)551-0175
120725,Work,+1(619)555-5169
120725,Home,+1(619)551-0176
120726,Work,+1(215)555-6888
120726,Home,+1(215)551-0177
120727,Work,+1(619)555-4533
120727,Home,+1(619)551-0178
120728,Work,+1(305)555-8356
120728,Home,+1(305)551-0179
120729,Work,+1(305)555-2974
120729,Home,+1(305)551-0180
120729,Cell,+1(305)444-0180
120730,Work,+1(619)555-4032
120730,Home,+1(619)551-0181
120731,Work,+1(619)555-9567
120731,Home,+1(619)551-0182
120732,Work,+1(305)555-4219
120732,Home,+1(305)551-0183
120733,Work,+1(305)555-7807
120733,Home,+1(305)551-0184
120734,Work,+1(215)555-3310
120734,Home,+1(215)551-0185
120735,Work,+1(305)555-1721
120735,Home,+1(305)551-0186
120735,Cell,+1(305)444-0186
120736,Work,+1(305)555-9105
120736,Home,+1(305)551-0187
120737,Work,+1(619)555-2689
120737,Home,+1(619)551-0188
120738,Work,+1(215)555-9559
120738,Home,+1(215)551-0189
120739,Work,+1(305)555-1372
120739,Home,+1(305)551-0190
120740,Work,+1(305)555-2719
120740,Home,+1(305)551-0191
120741,Work,+1(215)555-5569
120741,Home,+1(215)551-0192
120741,Cell,+1(215)444-0192
120742,Work,+1(215)555-6582
120742,Home,+1(215)551-0193
120743,Work,+1(619)555-6846
120743,Home,+1(619)551-0194
120744,Work,+1(619)555-0143
120744,Home,+1(619)551-0195
120745,Work,+1(215)555-7676
120745,Home,+1(215)551-0196
120746,Work,+1(215)555-6082
120746,Home,+1(215)551-0197
120747,Work,+1(619)555-5377
120747,Home,+1(619)551-0198
120747,Cell,+1(619)444-0198
120748,Work,+1(305)555-0201
120748,Home,+1(305)551-0199
120749,Work,+1(619)555-6446
120749,Home,+1(619)551-0200
120750,Work,+1(305)555-9640
120750,Home,+1(305)551-0201
120751,Work,+1(305)555-1805
120751,Home,+1(305)551-0202
120752,Work,+1(305)555-6010
120752,Home,+1(305)551-0203
120753,Work,+1(305)555-9727
120753,Home,+1(305)551-0204
120753,Cell,+1(305)444-0204
120754,Work,+1(305)555-3511
120754,Home,+1(305)551-0205
120755,Work,+1(619)555-1527
120755,Home,+1(619)551-0206
120756,Work,+1(215)555-6657
120756,Home,+1(215)551-0207
120757,Work,+1(619)555-0623
120757,Home,+1(619)551-0208
120758,Work,+1(305)555-5818
120758,Home,+1(305)551-0209
120759,Work,+1(619)555-7062
120759,Home,+1(619)551-0210
120759,Cell,+1(619)444-0210
120760,Work,+1(619)555-4247
120760,Home,+1(619)551-0211
120761,Work,+1(215)555-0527
120761,Home,+1(215)551-0212
120762,Work,+1(215)555-4854
120762,Home,+1(215)551-0213
120763,Work,+1(619)555-9387
120763,Home,+1(619)551-0214
120764,Work,+1(619)555-6436
120764,Home,+1(619)551-0215
120765,Work,+1(619)555-5356
120765,Home,+1(619)551-0216
120765,Cell,+1(619)444-0216
120766,Work,+1(305)555-6341
120766,Home,+1(305)551-0217
120767,Work,+1(215)555-3071
120767,Home,+1(215)551-0218
120768,Work,+1(215)555-2212
120768,Home,+1(215)551-0219
120769,Work,+1(305)555-5573
120769,Home,+1(305)551-0220
120770,Work,+1(305)555-6063
120770,Home,+1(305)551-0221
120771,Work,+1(305)555-6011
120771,Home,+1(305)551-0222
120771,Cell,+1(305)444-0222
120772,Work,+1(305)555-0359
120772,Home,+1(305)551-0223
120773,Work,+1(305)555-7982
120773,Home,+1(305)551-0224
120774,Work,+1(215)555-3857
120774,Home,+1(215)551-0225
120775,Work,+1(305)555-7812
120775,Home,+1(305)551-0226
120776,Work,+1(305)555-2707
120776,Home,+1(305)551-0227
120777,Work,+1(619)555-2023
120777,Home,+1(619)551-0228
120777,Cell,+1(619)444-0228
120778,Work,+1(215)555-7547
120778,Home,+1(215)551-0229
120779,Work,+1(305)555-4515
120779,Home,+1(305)551-0230
120780,Work,+1(215)555-3722
120780,Home,+1(215)551-0231
120781,Work,+1(619)555-4046
120781,Home,+1(619)551-0232
120782,Work,+1(215)555-7783
120782,Home,+1(215)551-0233
120783,Work,+1(215)555-3040
120783,Home,+1(215)551-0234
120783,Cell,+1(215)444-0234
120784,Work,+1(215)555-9058
120784,Home,+1(215)551-0235
120785,Work,+1(619)555-3072
120785,Home,+1(619)551-0236
120786,Work,+1(305)555-6201
120786,Home,+1(305)551-0237
120787,Work,+1(619)555-7545
120787,Home,+1(619)551-0238
120788,Work,+1(619)555-5030
120788,Home,+1(619)551-0239
120789,Work,+1(305)555-4286
120789,Home,+1(305)551-0240
120789,Cell,+1(305)444-0240
120790,Work,+1(215)555-7662
120790,Home,+1(215)551-0241
120791,Work,+1(619)555-9901
120791,Home,+1(619)551-0242
120792,Work,+1(215)555-5717
120792,Home,+1(215)551-0243
120793,Work,+1(305)555-8000
120793,Home,+1(305)551-0244
120794,Work,+1(305)555-5119
120794,Home,+1(305)551-0245
120795,Work,+1(305)555-2007
120795,Home,+1(305)551-0246
120795,Cell,+1(305)444-0246
120796,Work,+1(215)555-9463
120796,Home,+1(215)551-0247
120797,Work,+1(305)555-8106
120797,Home,+1(305)551-0248
120798,Work,+1(305)555-2908
120798,Home,+1(305)551-0249
120799,Work,+1(215)555-3111
120799,Home,+1(215)551-0250
120800,Work,+1(619)555-5188
120800,Home,+1(619)551-0251
120801,Work,+1(215)555-7998
120801,Home,+1(215)551-0252
120801,Cell,+1(215)444-0252
120802,Work,+1(215)555-5158
120802,Home,+1(215)551-0253
120803,Work,+1(619)555-9578
120803,Home,+1(619)551-0254
120804,Work,+1(305)555-4751
120804,Home,+1(305)551-0255
120805,Work,+1(215)555-9486
120805,Home,+1(215)551-0256
120806,Work,+1(305)555-6399
120806,Home,+1(305)551-0257
120807,Work,+1(619)555-4830
120807,Home,+1(619)551-0258
120807,Cell,+1(619)444-0258
120808,Work,+1(619)555-6505
120808,Home,+1(619)551-0259
120809,Work,+1(305)555-5192
120809,Home,+1(305)551-0260
120810,Work,+1(305)555-2339
120810,Home,+1(305)551-0261
120811,Work,+1(305)555-8993
120811,Home,+1(305)551-0262
120812,Work,+1(305)555-6921
120812,Home,+1(305)551-0263
120813,Work,+1(305)555-4269
120813,Home,+1(305)551-0264
120813,Cell,+1(305)444-0264
120814,Work,+1(619)555-1460
120814,Home,+1(619)551-0265
120815,Work,+1(305)555-2251
120815,Home,+1(305)551-0266
120816,Work,+1(305)555-1987
120816,Home,+1(305)551-0267
120992,Work,+1(305)555-7722
120992,Home,+1(305)551-0268
120993,Work,+1(619)555-9907
120993,Home,+1(619)551-0269
120994,Work,+1(619)555-3507
120994,Home,+1(619)551-0270
120994,Cell,+1(619)444-0270
120995,Work,+1(215)555-4533
120995,Home,+1(215)551-0271
120996,Work,+1(619)555-2820
120996,Home,+1(619)551-0272
120997,Work,+1(215)555-0695
120997,Home,+1(215)551-0273
120998,Work,+1(619)555-5402
120998,Home,+1(619)551-0274
120999,Work,+1(619)555-1982
120999,Home,+1(619)551-0275
121000,Work,+1(305)555-0408
121000,Home,+1(305)551-0276
121000,Cell,+1(305)444-0276
121001,Work,+1(305)555-6853
121001,Home,+1(305)551-0277
121002,Work,+1(619)555-9232
121002,Home,+1(619)551-0278
121003,Work,+1(215)555-4378
121003,Home,+1(215)551-0279
121004,Work,+1(619)555-2394
121004,Home,+1(619)551-0280
121005,Work,+1(305)555-2082
121005,Home,+1(305)551-0281
121006,Work,+1(619)555-0569
121006,Home,+1(619)551-0282
121006,Cell,+1(619)444-0282
121007,Work,+1(215)555-4700
121007,Home,+1(215)551-0283
121008,Work,+1(215)555-6754
121008,Home,+1(215)551-0284
121009,Work,+1(619)555-6680
121009,Home,+1(619)551-0285
121010,Work,+1(305)555-8120
121010,Home,+1(305)551-0286
121011,Work,+1(305)555-1878
121011,Home,+1(305)551-0287
121012,Work,+1(305)555-9119
121012,Home,+1(305)551-0288
121012,Cell,+1(305)444-0288
121013,Work,+1(215)555-9450
121013,Home,+1(215)551-0289
121014,Work,+1(305)555-3565
121014,Home,+1(305)551-0290
121015,Work,+1(619)555-6445
121015,Home,+1(619)551-0291
121016,Work,+1(305)555-7515
121016,Home,+1(305)551-0292
121017,Work,+1(619)555-2281
121017,Home,+1(619)551-0293
121018,Work,+1(305)555-9454
121018,Home,+1(305)551-0294
121018,Cell,+1(305)444-0294
121019,Work,+1(215)555-4428
121019,Home,+1(215)551-0295
121020,Work,+1(215)555-6526
121020,Home,+1(215)551-0296
121021,Work,+1(619)555-8604
121021,Home,+1(619)551-0297
121022,Work,+1(619)555-6536
121022,Home,+1(619)551-0298
121023,Work,+1(619)555-5469
121023,Home,+1(619)551-0299
121024,Work,+1(619)555-2166
121024,Home,+1(619)551-0300
121024,Cell,+1(619)444-0300
121025,Work,+1(305)555-3846
121025,Home,+1(305)551-0301
121026,Work,+1(215)555-7016
121026,Home,+1(215)551-0302
121027,Work,+1(619)555-2873
121027,Home,+1(619)551-0303
121028,Work,+1(305)555-2755
121028,Home,+1(305)551-0304
121029,Work,+1(619)555-9474
121029,Home,+1(619)551-0305
121030,Work,+1(305)555-7013
121030,Home,+1(305)551-0306
121030,Cell,+1(305)444-0306
121031,Work,+1(215)555-7866
121031,Home,+1(215)551-0307
121032,Work,+1(619)555-8594
121032,Home,+1(619)551-0308
121033,Work,+1(215)555-8085
121033,Home,+1(215)551-0309
121034,Work,+1(305)555-2139
121034,Home,+1(305)551-0310
121035,Work,+1(619)555-8874
121035,Home,+1(619)551-0311
121036,Work,+1(215)555-9767
121036,Home,+1(215)551-0312
121036,Cell,+1(215)444-0312
121037,Work,+1(305)555-7231
121037,Home,+1(305)551-0313
121038,Work,+1(305)555-6394
121038,Home,+1(305)551-0314
121039,Work,+1(305)555-7540
121039,Home,+1(305)551-0315
121040,Work,+1(215)555-1584
121040,Home,+1(215)551-0316
121041,Work,+1(619)555-2090
121041,Home,+1(619)551-0317
121042,Work,+1(619)555-5518
121042,Home,+1(619)551-0318
121042,Cell,+1(619)444-0318
121043,Work,+1(215)555-9718
121043,Home,+1(215)551-0319
121044,Work,+1(305)555-5678
121044,Home,+1(305)551-0320
121045,Work,+1(619)555-1819
121045,Home,+1(619)551-0321
121046,Work,+1(215)555-1981
121046,Home,+1(215)551-0322
121047,Work,+1(619)555-7383
121047,Home,+1(619)551-0323
121048,Work,+1(305)555-9560
121048,Home,+1(305)551-0324
121048,Cell,+1(305)444-0324
121049,Work,+1(619)555-3981
121049,Home,+1(619)551-0325
121050,Work,+1(619)555-2865
121050,Home,+1(619)551-0326
121051,Work,+1(619)555-2275
121051,Home,+1(619)551-0327
121052,Work,+1(215)555-7625
121052,Home,+1(215)551-0328
121053,Work,+1(619)555-3618
121053,Home,+1(619)551-0329
121054,Work,+1(619)555-0147
121054,Home,+1(619)551-0330
121054,Cell,+1(619)444-0330
121055,Work,+1(305)555-4208
121055,Home,+1(305)551-0331
121056,Work,+1(619)555-0098
121056,Home,+1(619)551-0332
121057,Work,+1(215)555-1679
121057,Home,+1(215)551-0333
121058,Work,+1(619)555-5751
121058,Home,+1(619)551-0334
121059,Work,+1(619)555-9407
121059,Home,+1(619)551-0335
121060,Work,+1(305)555-4132
121060,Home,+1(305)551-0336
121060,Cell,+1(305)444-0336
121061,Work,+1(305)555-9635
121061,Home,+1(305)551-0337
121062,Work,+1(619)555-8226
121062,Home,+1(619)551-0338
121063,Work,+1(305)555-0288
121063,Home,+1(305)551-0339
121064,Work,+1(619)555-7308
121064,Home,+1(619)551-0340
121065,Work,+1(619)555-4528
121065,Home,+1(619)551-0341
121066,Work,+1(215)555-3376
121066,Home,+1(215)551-0342
121066,Cell,+1(215)444-0342
121067,Work,+1(619)555-9780
121067,Home,+1(619)551-0343
121068,Work,+1(619)555-9814
121068,Home,+1(619)551-0344
121069,Work,+1(619)555-4929
121069,Home,+1(619)551-0345
121070,Work,+1(305)555-4038
121070,Home,+1(305)551-0346
121071,Work,+1(305)555-9529
121071,Home,+1(305)551-0347
121072,Work,+1(215)555-6799
121072,Home,+1(215)551-0348
121072,Cell,+1(215)444-0348
121073,Work,+1(305)555-0051
121073,Home,+1(305)551-0349
121074,Work,+1(619)555-0096
121074,Home,+1(619)551-0350
121075,Work,+1(619)555-1772
121075,Home,+1(619)551-0351
121076,Work,+1(215)555-6398
121076,Home,+1(215)551-0352
121077,Work,+1(305)555-9878
121077,Home,+1(305)551-0353
121078,Work,+1(305)555-0932
121078,Home,+1(305)551-0354
121078,Cell,+1(305)444-0354
121079,Work,+1(215)555-4543
121079,Home,+1(215)551-0355
121080,Work,+1(305)555-9941
121080,Home,+1(305)551-0356
121081,Work,+1(619)555-7939
121081,Home,+1(619)551-0357
121082,Work,+1(305)555-6967
121082,Home,+1(305)551-0358
121083,Work,+1(305)555-1791
121083,Home,+1(305)551-0359
121084,Work,+1(619)555-7593
121084,Home,+1(619)551-0360
121084,Cell,+1(619)444-0360
121085,Work,+1(619)555-1777
121085,Home,+1(619)551-0361
121086,Work,+1(305)555-3637
121086,Home,+1(305)551-0362
121087,Work,+1(305)555-6213
121087,Home,+1(305)551-0363
121088,Work,+1(215)555-0703
121088,Home,+1(215)551-0364
121089,Work,+1(305)555-9141
121089,Home,+1(305)551-0365
121090,Work,+1(619)555-8402
121090,Home,+1(619)551-0366
121090,Cell,+1(619)444-0366
121091,Work,+1(215)555-9375
121091,Home,+1(215)551-0367
121092,Work,+1(619)555-6418
121092,Home,+1(619)551-0368
121093,Work,+1(619)555-1087
121093,Home,+1(619)551-0369
121094,Work,+1(619)555-0102
121094,Home,+1(619)551-0370
121095,Work,+1(619)555-7907
121095,Home,+1(619)551-0371
121096,Work,+1(305)555-2270
121096,Home,+1(305)551-0372
121096,Cell,+1(305)444-0372
121097,Work,+1(215)555-6072
121097,Home,+1(215)551-0373
121098,Work,+1(215)555-6464
121098,Home,+1(215)551-0374
121099,Work,+1(215)555-2433
121099,Home,+1(215)551-0375
121100,Work,+1(619)555-8559
121100,Home,+1(619)551-0376
121101,Work,+1(619)555-4561
121101,Home,+1(619)551-0377
121102,Work,+1(619)555-0450
121102,Home,+1(619)551-0378
121102,Cell,+1(619)444-0378
121103,Work,+1(619)555-1651
121103,Home,+1(619)551-0379
121104,Work,+1(215)555-0622
121104,Home,+1(215)551-0380
121105,Work,+1(305)555-2346
121105,Home,+1(305)551-0381
121106,Work,+1(305)555-9731
121106,Home,+1(305)551-0382
121107,Work,+1(215)555-1258
121107,Home,+1(215)551-0383
121108,Work,+1(305)555-4437
121108,Home,+1(305)551-0384
121108,Cell,+1(305)444-0384
121109,Work,+1(619)555-0088
121109,Home,+1(619)551-0385
121110,Work,+1(305)555-4297
121110,Home,+1(305)551-0386
121111,Work,+1(619)555-7902
121111,Home,+1(619)551-0387
121112,Work,+1(305)555-1561
121112,Home,+1(305)551-0388
121113,Work,+1(305)555-0869
121113,Home,+1(305)551-0389
121114,Work,+1(619)555-4987
121114,Home,+1(619)551-0390
121114,Cell,+1(619)444-0390
121115,Work,+1(619)555-6537
121115,Home,+1(619)551-0391
121116,Work,+1(619)555-0264
121116,Home,+1(619)551-0392
121117,Work,+1(215)555-1234
121117,Home,+1(215)551-0393
121118,Work,+1(215)555-0034
121118,Home,+1(215)551-0394
121119,Work,+1(215)555-9732
121119,Home,+1(215)551-0395
121120,Work,+1(215)555-0834
121120,Home,+1(215)551-0396
121120,Cell,+1(215)444-0396
121121,Work,+1(215)555-2891
121121,Home,+1(215)551-0397
121122,Work,+1(305)555-2093
121122,Home,+1(305)551-0398
121123,Work,+1(215)555-7657
121123,Home,+1(215)551-0399
121124,Work,+1(305)555-4758
121124,Home,+1(305)551-0400
121125,Work,+1(215)555-8927
121125,Home,+1(215)551-0401
121126,Work,+1(215)555-3516
121126,Home,+1(215)551-0402
121126,Cell,+1(215)444-0402
121127,Work,+1(619)555-2114
121127,Home,+1(619)551-0403
121128,Work,+1(619)555-4849
121128,Home,+1(619)551-0404
121129,Work,+1(305)555-1220
121129,Home,+1(305)551-0405
121130,Work,+1(215)555-8199
121130,Home,+1(215)551-0406
121131,Work,+1(619)555-8744
121131,Home,+1(619)551-0407
121132,Work,+1(619)555-8510
121132,Home,+1(619)551-0408
121132,Cell,+1(619)444-0408
121133,Work,+1(215)555-5099
121133,Home,+1(215)551-0409
121134,Work,+1(619)555-7418
121134,Home,+1(619)551-0410
121135,Work,+1(215)555-4186
121135,Home,+1(215)551-0411
121136,Work,+1(215)555-6043
121136,Home,+1(215)551-0412
121137,Work,+1(305)555-4944
121137,Home,+1(305)551-0413
121138,Work,+1(215)555-4627
121138,Home,+1(215)551-0414
121138,Cell,+1(215)444-0414
121139,Work,+1(619)555-9898
121139,Home,+1(619)551-0415
121140,Work,+1(619)555-3558
121140,Home,+1(619)551-0416
121141,Work,+1(215)555-4111
121141,Home,+1(215)551-0417
121142,Work,+1(215)555-0964
121142,Home,+1(215)551-0418
121143,Work,+1(305)555-8022
121143,Home,+1(305)551-0419
121144,Work,+1(305)555-4598
121144,Home,+1(305)551-0420
121144,Cell,+1(305)444-0420
121145,Work,+1(305)555-1076
121145,Home,+1(305)551-0421
121146,Work,+1(215)555-0546
121146,Home,+1(215)551-0422
121147,Work,+1(305)555-5653
121147,Home,+1(305)551-0423
121148,Work,+1(305)555-4118
121148,Home,+1(305)551-0424
20683,Cell,+1(215)555-2000
21149,Work,+1(305)551-3232
21149,Home,+1(305)555-8659
21149,Cell,+1(305)555-8660
12099,Cell,+1(619)555-2022
;;;;
run;

data ORION.FOUR;
   attrib X length=8 format=1.;
   attrib B length=$2;

   infile datalines dsd;
   input
      X
      B
   ;
datalines4;
2,x1
2,x2
3,y
5,v
;;;;
run;

data ORION.ONE;
   attrib X length=8 format=1.;
   attrib A length=$1;

   infile datalines dsd;
   input
      X
      A
   ;
datalines4;
1,a
4,d
2,b
;;;;
run;

data ORION.ORDER_FACT;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Street_ID length=8 label='Street ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Quantity length=8 label='Quantity Ordered';
   attrib Total_Retail_Price length=8 label='Total Retail Price for This Product' format=DOLLAR13.2;
   attrib CostPrice_Per_Unit length=8 label='Cost Price Per Unit' format=DOLLAR13.2;
   attrib Discount length=8 label='Discount in percent of Normal Total Retail Price' format=
PERCENT.;

   infile datalines dsd;
   input
      Customer_ID
      Employee_ID
      Street_ID
      Order_Date
      Delivery_Date

      Order_ID
      Order_Type
      Product_ID
      Quantity
      Total_Retail_Price
      CostPrice_Per_Unit
      Discount
   ;
datalines4;
63,121039,9260125492,17177,17177,1230058123,1,220101300017,1,16.5,7.45,
5,99999999,9260114570,17181,17185,1230080101,2,230100500026,1,247.5,109.55,
45,99999999,9260104847,17186,17188,1230106883,2,240600100080,1,28.3,8.55,
41,120174,1600101527,17194,17194,1230147441,1,240600100010,2,32,6.5,
183,120134,1600100760,17224,17224,1230315085,1,240200200039,3,63.6,8.8,
79,99999999,9260101874,17227,17228,1230333319,2,240100400005,1,234.6,115.95,
23,99999999,9260126679,17228,17233,1230338566,2,240800200062,1,35.4,16.15,
23,99999999,9260126679,17228,17233,1230338566,2,240800200063,2,73.8,16.85,
45,99999999,9260104847,17234,17236,1230371142,2,240500100004,2,127,28,
45,99999999,9260104847,17234,17236,1230371142,2,240500200003,1,23.2,11.1,
56,121059,9260111871,17240,17240,1230404278,1,220200300002,2,75,17.05,
183,120149,1600100760,17247,17247,1230440481,1,230100600005,1,129.8,63.2,
16,99999999,3940105865,17249,17251,1230450371,2,230100600018,2,128.4,32.2,
79,99999999,9260101874,17249,17250,1230453723,2,240500200056,1,24.1,11.55,
183,120134,1600100760,17250,17250,1230455630,1,240200100233,2,91.8,22.45,
2788,99999999,9050100001,17253,17255,1230478006,2,230100100025,2,60.6,13.15,
20,121066,9260118934,17257,17257,1230498538,1,230100300006,1,68.5,34.35,
70046,99999999,2600100017,17258,17259,1230500669,3,240200100131,2,148.6,41.35,
12386,99999999,4750100001,17258,17259,1230503155,2,220101400310,1,31.8,14.2,
23,99999999,9260126679,17274,17279,1230591673,2,220200200024,3,178.5,32.25,
36,99999999,9260128237,17274,17276,1230591675,3,240500100039,1,34.5,15.4,
79,121045,9260101874,17274,17274,1230591684,1,240200100076,4,1796,246.55,
61,99999999,3940108887,17280,17285,1230619748,2,220200100092,1,83,41.6,
61,99999999,3940108887,17280,17285,1230619748,2,220200300005,3,345,52.35,
13,99999999,3940105189,17284,17289,1230642273,2,230100500082,1,126.1,58.6,
171,99999999,1600101555,17287,17290,1230657844,3,240100100646,1,109.9,46.8,
11171,99999999,2600100032,17293,17295,1230690733,3,240200100043,2,282.4,69.4,
14703,99999999,4750100002,17294,17297,1230699509,2,220100100044,1,102.1,48.65,
14703,99999999,4750100002,17294,17297,1230699509,2,220100400005,1,81.3,40.75,
79,99999999,9260101874,17294,17295,1230700421,2,230100100006,1,176,74.55,
79,99999999,9260101874,17294,17295,1230700421,2,230100500045,2,2.6,0.6,
79,99999999,9260101874,17294,17295,1230700421,2,230100500068,2,3.4,0.8,
928,99999999,9050100016,17301,17305,1230738723,2,230100600026,2,237.2,59.4,
19444,99999999,4750100001,17302,17307,1230744524,2,220100700024,1,99.7,47.45,
19444,99999999,4750100001,17302,17307,1230744524,2,220101000002,1,17.7,8,
71,121060,9260124130,17302,17302,1230745294,1,220200100179,1,134.5,67.35,
12,121039,9260103713,17304,17304,1230754828,1,220100100272,3,68.4,11.5,
12,121039,9260103713,17304,17304,1230754828,1,220101400269,4,268,29.8,
544,99999999,9050100008,17307,17308,1230771337,2,230100500012,3,221.7,33.25,
111,120148,1600102072,17309,17309,1230778996,1,230100500096,1,35.5,17.25,
88,99999999,9260100179,17311,17314,1230793366,2,240400200097,3,1250.4,124.2,
23,99999999,9260126679,17313,17318,1230804171,2,240500200073,3,148.5,20.65,
71,121064,9260124130,17317,17317,1230825762,1,230100500093,2,265.6,55.85,
23,99999999,9260126679,17320,17325,1230841456,2,240700400024,2,127.2,33.15,
75,121094,9260108068,17320,17320,1230841466,1,240500100062,2,109.2,23.85,
75,121094,9260108068,17320,17320,1230841466,1,240500200130,2,56,11.7,
56,121043,9260111871,17328,17328,1230885738,1,220101300017,2,33,7.45,
56,121043,9260111871,17328,17328,1230885738,1,220101400098,3,97.2,14.85,
18,121086,9260112361,17333,17333,1230912536,1,240500200121,2,50.8,12.1,
17023,99999999,2600100021,17337,17342,1230931366,3,240200200007,2,166.8,8.35,
17023,99999999,2600100021,17337,17342,1230931366,3,240200200061,2,261.8,52.45,
171,99999999,1600101555,17350,17353,1231002241,3,220101200029,1,52.3,22.65,
70108,99999999,2600100046,17351,17352,1231008713,2,240200200039,2,42.4,8.8,
2806,99999999,8010100089,17351,17355,1231014780,2,240100400043,4,1064,131.5,
215,120145,1600102721,17354,17354,1231023774,1,230100500024,1,22.9,10.85,
215,120145,1600102721,17354,17354,1231023774,1,230100600015,1,78.2,39.2,
13,99999999,3940105189,17356,17361,1231035308,2,230100600023,2,146.8,36.8,
36,99999999,9260128237,17362,17364,1231071449,3,240400200057,2,257,58.05,
36,99999999,9260128237,17362,17364,1231071449,3,240400200066,2,27.6,6.3,
12,121064,9260103713,17363,17363,1231077006,1,230100500095,2,193.8,40,
61,99999999,3940108887,17367,17372,1231094514,2,230100500074,4,544,51.3,
61,99999999,3940108887,17367,17372,1231094514,2,230100600005,2,259.6,63.2,
79,121027,9260101874,17374,17374,1231135703,1,210200900004,2,92,16.05,
79,121027,9260101874,17374,17374,1231135703,1,210201000050,2,39,8.95,
31,121059,9260128428,17380,17380,1231169108,1,220200300157,3,220.2,36.65,
215,120164,1600102721,17382,17382,1231176288,1,240500200100,2,45.4,10.85,
111,99999999,1600102072,17384,17386,1231188317,2,220100900029,1,30.8,12.35,
3959,99999999,8010100151,17384,17385,1231194004,3,240100100610,2,122,27.55,
3959,99999999,8010100151,17384,17385,1231194004,3,240100400143,2,330,82.6,
71,120732,9260124130,17386,17386,1231204878,1,230100600017,2,111.4,27.95,
215,120134,1600102721,17387,17387,1231206746,1,240200100232,1,28.2,14.2,
70187,99999999,2600100035,17391,17396,1231227910,2,240200200013,3,1266,42.2,
20,121040,9260118934,17391,17391,1231231220,1,220101400306,2,145.2,33.1,
45,121045,9260104847,17396,17396,1231259703,1,240200100051,3,420.9,72,
52,99999999,9260116235,17398,17404,1231270767,3,230100600022,2,168.2,42.15,
12,121037,9260103713,17402,17402,1231292064,1,220101400060,3,96.3,14.7,
12,121037,9260103713,17402,17402,1231292064,1,220101400117,2,91.2,20.85,
16,99999999,3940105865,17405,17413,1231305521,2,220200100035,2,125.2,31.4,
16,99999999,3940105865,17405,17407,1231305531,2,220200100090,2,177.2,44.4,
20,121109,9260118934,17406,17406,1231314893,1,240700200024,2,32,6.35,
2806,99999999,8010100089,17406,17410,1231316727,2,240100400076,2,224.6,68.6,
2806,99999999,8010100089,17406,17410,1231316727,2,240100400143,2,330,82.6,
61,99999999,3940108887,17407,17412,1231317443,2,230100700002,2,440,135,
71,121057,9260124130,17411,17411,1231341359,1,220200200018,2,132.8,30.25,
36,99999999,9260128237,17420,17422,1231392762,3,230100600023,2,146.8,36.8,
36,99999999,9260128237,17424,17426,1231414059,3,240800200008,1,150.25,60.1,
70046,99999999,2600100017,17432,17433,1231453831,3,240200100052,1,99.7,51.4,
70046,99999999,2600100017,17432,17433,1231453831,3,240200200015,1,24,10.55,
52,121044,9260116235,17434,17439,1231468750,1,220100100153,1,50,25.1,
19444,99999999,4750100001,17440,17445,1231500373,2,220101200006,1,52.2,20.95,
88,121043,9260100179,17440,17440,1231501254,1,220100700052,1,106.1,50.5,
52,99999999,9260116235,17444,17450,1231522431,3,240100100065,1,34.7,13.8,
14703,99999999,4750100002,17448,17451,1231544990,2,220101400385,1,24.8,12.35,
70108,99999999,2600100046,17461,17462,1231614059,2,220101200020,1,55.9,24.2,
61,99999999,3940108887,17462,17467,1231619928,2,230100600036,1,103.2,50.4,
11,99999999,3940108592,17468,17473,1231653765,3,230100200047,1,72.7,35.2,
63,121061,9260125492,17468,17472,1231657078,1,220200300116,1,84.2,38.35,
5,121025,9260114570,17469,17469,1231663230,1,240100100433,1,3,1.15,
544,99999999,9050100008,17482,17483,1231734609,2,230100500091,1,191,80.45,
1033,99999999,9050100001,17482,17486,1231734615,3,230100600005,1,129.8,63.2,
17,121037,9260123306,17486,17486,1231757107,1,220100100568,1,84.1,42.15,
14703,99999999,4750100002,17489,17492,1231773634,2,220101400018,2,45.6,10.45,
71,121025,9260124130,17490,17490,1231780610,1,240100400080,1,219.9,109.9,
5,99999999,9260114570,17501,17503,1231842118,2,240700300002,2,43.98,7.25,
45,121060,9260104847,17504,17504,1231858937,1,220200300079,2,128.6,28.65,
70187,99999999,2600100035,17505,17510,1231861295,2,240200100154,2,53.2,11.95,
71,121043,9260124130,17510,17510,1231891098,1,220101400091,2,65.6,15,
88,120733,9260100179,17511,17511,1231896710,1,230100500087,1,93.8,39.05,
183,120127,1600100760,17512,17512,1231898348,1,220101400289,4,240.8,27.4,
215,120132,1600102721,17514,17514,1231908237,1,240200100180,2,243.2,62.9,
17,121020,9260123306,17517,17517,1231928627,1,240100400070,1,175.9,127.95,
111,120127,1600102072,17518,17518,1231930216,1,220100300008,4,342.8,34.35,
111,120127,1600102072,17519,17519,1231936241,1,220101400017,2,22.2,5,
5,99999999,9260114570,17521,17523,1231950921,2,230100500093,2,265.6,55.85,
5,99999999,9260114570,17521,17523,1231950921,2,230100600030,1,86.3,41.4,
111,99999999,1600102072,17522,17524,1231952752,2,220100100298,2,105.8,26.55,
70210,99999999,2600100015,17522,17523,1231953192,3,240200100052,2,199.4,51.4,
5,121037,9260114570,17522,17522,1231956902,1,220101400276,2,136.8,31.2,
19,99999999,3940106547,17526,17530,1231976710,3,240300100020,4,56.4,6.05,
19,99999999,3940106547,17526,17530,1231976710,3,240300100032,2,1200.2,300,
183,120158,1600100760,17527,17527,1231982684,1,240400300033,3,107.1,14.35,
195,120148,1600101663,17528,17528,1231986335,1,230100500008,1,38,16.8,
70046,99999999,2600100017,17531,17532,1232003930,3,240200100124,2,49,12.35,
5,99999999,9260114570,17531,17535,1232007693,2,240100400044,1,353.6,174.75,
5,99999999,9260114570,17531,17535,1232007693,2,240100400049,1,421.2,212.95,
45,121066,9260104847,17531,17531,1232007700,1,230100100045,2,249.6,53.6,
45,121066,9260104847,17531,17531,1232007700,1,230100200019,2,398.2,95.65,
45,121066,9260104847,17531,17531,1232007700,1,230100500056,1,8,3.5,
53,120143,1600103258,17544,17544,1232087464,1,230100600022,4,336.4,42.15,
49,121039,9260104510,17544,17544,1232092527,1,220100200004,1,6.5,2.6,
49,121039,9260104510,17544,17544,1232092527,1,220100900006,1,88.4,35.45,
49,121039,9260104510,17544,17544,1232092527,1,220101400150,1,28.2,12.9,
34,121040,9260111379,17554,17554,1232161564,1,220100100197,1,101.3,50.75,
2618,99999999,8010100125,17556,17561,1232173841,3,240100100581,1,28,11.55,
2618,99999999,8010100125,17556,17561,1232173841,3,240100400147,1,248.3,122.75,
89,99999999,9260116551,17563,17566,1232217725,2,230100100062,2,283.4,61,
195,120150,1600101663,17567,17567,1232240447,1,230100200059,2,77.6,16.65,
70046,99999999,2600100017,17567,17568,1232241009,3,240200200039,1,22.2,9.2,
171,120148,1600101555,17577,17577,1232307056,1,230100500081,2,146,30.35,
20,121039,9260118934,17577,17577,1232311932,1,220100300025,2,206,42.4,
23,99999999,9260126679,17580,17584,1232331499,2,230100100051,2,369.8,78.15,
13,99999999,3940105189,17587,17590,1232373481,2,220200100229,1,165.5,82.85,
4,99999999,9260106519,17593,17594,1232410925,3,240800200030,1,47.7,18.8,
4,121100,9260106519,17600,17600,1232455720,1,240600100017,1,53,23.25,
70201,99999999,2600100012,17610,17615,1232517885,3,240200100226,1,183.9,86.65,
4,99999999,9260106519,17611,17612,1232530384,3,240700200019,1,16.9,8.6,
49,121037,9260104510,17611,17611,1232530393,1,220100100125,1,33.4,16.8,
49,121037,9260104510,17611,17611,1232530393,1,220100100513,1,63.9,32.05,
49,121037,9260104510,17611,17611,1232530393,1,220100300019,1,35.6,16.7,
92,121068,9260117676,17615,17615,1232554759,1,230100600022,1,84.1,42.15,
195,120160,1600101663,17621,17621,1232590052,1,240400300013,1,51.8,21.6,
195,120160,1600101663,17621,17621,1232590052,1,240400300035,1,19.1,7.7,
89,99999999,9260116551,17622,17625,1232601472,2,230100500094,2,173.2,34.1,
54655,99999999,2600100013,17625,17628,1232618023,2,240200100183,1,95.7,47.95,
49,121031,9260104510,17629,17637,1232648239,1,210201000126,1,6.5,2.3,
4,99999999,9260106519,17630,17631,1232654929,3,240500100017,4,214,23.75,
4,99999999,9260106519,17630,17631,1232654929,3,240500100029,1,58.9,26.1,
11171,99999999,2600100032,17633,17635,1232672914,3,240200100101,2,38.8,10.2,
11171,99999999,2600100032,17633,17635,1232672914,3,240200200011,2,271.4,13,
9,99999999,3940106659,17637,17642,1232698281,3,230100600035,1,29.4,14.15,
4,121041,9260106519,17638,17638,1232709099,1,220101400145,1,16.7,7.75,
34,121105,9260111379,17638,17638,1232709115,1,240700100001,3,70.8,12.3,
41,99999999,1600101527,17641,17645,1232723799,3,210200600112,1,21.8,9.25,
5,99999999,9260114570,17641,17645,1232728634,2,240100100403,1,168.7,76.55,
215,120151,1600102721,17649,17649,1232777080,1,230100500012,1,73.9,33.25,
215,120151,1600102721,17649,17649,1232777080,1,230100600023,1,73.4,36.8,
195,120143,1600101663,17651,17651,1232790793,1,230100200074,1,50.1,24.5,
45,99999999,9260104847,17660,17664,1232857157,2,230100600030,2,172.6,41.4,
908,99999999,9050100023,17665,17669,1232889267,2,230100200054,3,407.4,61.8,
34,121021,9260111379,17666,17666,1232897220,1,240100400129,3,712.2,111,
544,99999999,9050100008,17672,17673,1232936635,2,230100600030,2,172.6,41.4,
111,99999999,1600102072,17674,17676,1232946301,2,220101400061,2,102,23.3,
52,99999999,9260116235,17675,17676,1232956741,3,230100500008,2,76,16.8,
171,120145,1600101555,17678,17678,1232972274,1,230100200054,1,135.8,61.8,
171,120145,1600101555,17678,17678,1232972274,1,230100500056,1,8,3.5,
183,120122,1600100760,17680,17680,1232985693,1,240100100186,1,273,122.8,
4,121109,9260106519,17681,17681,1232998740,1,240700100011,3,80.97,10.23,
34,121025,9260111379,17682,17682,1233003688,1,240100100535,1,28.6,12.95,
14104,99999999,4750100001,17689,17692,1233049735,3,220101400216,2,48.8,11.2,
215,120148,1600102721,17692,17692,1233066745,1,230100600022,1,84.1,42.15,
49,121060,9260104510,17693,17693,1233078086,1,220200200071,2,200.2,43.5,
12,121054,9260103713,17695,17695,1233092596,1,240300100048,1,15.5,6.7,
45,121084,9260104847,17701,17701,1233131266,1,240400300039,2,39.2,7.9,
171,120121,1600101555,17707,17707,1233166411,1,240100100734,1,10.1,4.15,
70187,99999999,2600100035,17707,17712,1233167161,2,240200100095,2,237,52.55,
49,121109,9260104510,17718,17718,1233243603,1,240700200004,2,8.4,2.2,
19444,99999999,4750100001,17719,17724,1233248920,2,220100700042,2,171.2,36.35,
19444,99999999,4750100001,17719,17724,1233248920,2,220101400387,3,37.8,5.85,
75,121029,9260108068,17722,17722,1233270605,1,210200600085,2,75.2,17,
70059,99999999,2600100047,17724,17728,1233280857,3,220100100609,3,173.7,29.05,
5,121053,9260114570,17729,17729,1233315988,1,240300200018,1,87.2,39.7,
5,121053,9260114570,17729,17729,1233315988,1,240300300071,1,138,60.1,
13,99999999,3940105189,17739,17742,1233378724,2,240300100046,1,14.1,6.9,
34,121105,9260111379,17754,17754,1233482761,1,240700200021,2,38.8,10.35,
2550,99999999,8010100009,17754,17759,1233484749,3,240100400098,2,503.6,125.85,
2550,99999999,8010100009,17754,17759,1233484749,3,240100400136,3,272.7,45.4,
70201,99999999,2600100012,17759,17764,1233514453,3,240200200060,3,553.5,73.85,
215,120123,1600102721,17762,17762,1233531965,1,240100400112,1,114,54.8,
4,99999999,9260106519,17763,17764,1233543560,3,240500200083,3,201.9,28,
41,120134,1600101527,17764,17764,1233545775,1,240200100007,2,49.4,11.8,
41,120134,1600101527,17764,17764,1233545775,1,240200100020,1,189.6,100.6,
215,120150,1600102721,17764,17764,1233545781,1,230100500020,1,6.2,2.85,
89,99999999,9260116551,17771,17774,1233597637,2,240700400002,2,67.2,14.65,
215,120177,1600102721,17775,17775,1233618453,1,240700400020,1,73.4,38.25,
5,99999999,9260114570,17784,17788,1233682051,2,240100100676,1,43.4,18.65,
49,121053,9260104510,17785,17785,1233689304,1,240300300070,3,1514.4,229.65,
195,120148,1600101663,17808,17808,1233837302,1,230100500026,4,990,109.55,
195,120148,1600101663,17808,17808,1233837302,1,230100600036,3,309.6,50.4,
111,99999999,1600102072,17817,17819,1233895201,2,220100100371,1,25.6,12.9,
111,99999999,1600102072,17817,17819,1233895201,2,220101400238,2,113.8,25.95,
544,99999999,9050100008,17819,17820,1233913196,2,230100400012,1,29.3,11.75,
34,121030,9260111379,17820,17820,1233920786,1,210200400020,1,38,19.1,
34,121030,9260111379,17820,17820,1233920786,1,210200400070,1,41.6,20.9,
52,121135,9260116235,17820,17820,1233920795,1,240800200010,1,120.4,48.1,
52,121064,9260116235,17820,17820,1233920805,1,230100500056,1,8,3.5,
19873,99999999,4750100001,17832,17839,1233998114,2,220100100101,1,59.7,29.95,
19873,99999999,4750100001,17832,17839,1233998114,2,220100400022,1,98.9,47.7,
92,121039,9260117676,17837,17837,1234033037,1,220100700022,1,53.7,22.75,
75,121069,9260108068,17846,17846,1234092222,1,230100500023,1,7.2,3.1,
195,120123,1600101663,17853,17853,1234133789,1,240100400046,1,328.3,165.95,
53,120121,1600103258,17861,17861,1234186330,1,240100400095,1,200.1,97.75,
49,121035,9260104510,17862,17862,1234198497,1,210200100017,1,39,17.35,
54655,99999999,2600100013,17868,17871,1234235150,2,240200200060,2,369,73.85,
49,121042,9260104510,17869,17869,1234247283,1,220100400023,2,187.2,40.75,
17,121135,9260123306,17870,17870,1234255111,1,240800100039,3,257.4,39.9,
23,99999999,9260126679,17874,17878,1234279341,2,230100500092,1,116.7,48.6,
92,121109,9260117676,17877,17877,1234301319,1,240700200010,4,105.6,10.1,
70210,99999999,2600100015,17881,17882,1234323012,3,240200100098,2,29.2,6.75,
70210,99999999,2600100015,17881,17882,1234323012,3,240200100101,2,39,10.3,
70210,99999999,2600100015,17881,17882,1234323012,3,240200200035,2,196,39.3,
4,121069,9260106519,17884,17884,1234348668,1,230100100053,2,92.6,20.9,
17,121071,9260123306,17886,17886,1234360543,1,230100100033,2,110.2,25.4,
12,121069,9260103713,17888,17888,1234373539,1,230100100013,2,226.2,58.9,
111,120123,1600102072,17895,17895,1234414529,1,240100100654,2,90.4,18.15,
111,120123,1600102072,17895,17895,1234414529,1,240100400136,2,181.8,45.4,
17,121109,9260123306,17895,17895,1234419240,1,240700100013,5,119.95,9.75,
195,120150,1600101663,17899,17899,1234437760,1,230100600028,2,193.4,48.45,
36,99999999,9260128237,17908,17911,1234534069,3,240800100026,4,525.2,58.55,
183,120121,1600100760,17909,17909,1234537441,1,240100200001,1,16,6.35,
16,99999999,3940105865,17909,17911,1234538390,2,220200300015,1,115,52.4,
16,99999999,3940105865,17914,17916,1234588648,2,230100500101,1,138.7,62.5,
16,99999999,3940105865,17914,17916,1234588648,2,230100600024,1,76.1,38.15,
16,99999999,3940105865,17921,17923,1234659163,2,230100700008,1,504.2,245.8,
63,99999999,9260125492,17921,17922,1234665265,2,240100100063,2,48.4,9.75,
171,99999999,1600101555,17926,17930,1234709803,3,220100100304,2,122.6,30.75,
183,120179,1600100760,17928,17928,1234727966,1,240700400004,1,13.2,5.95,
70221,99999999,2600100019,17944,17946,1234891576,3,240200100226,1,183.9,86.65,
18,121021,9260112361,17944,17944,1234897732,1,240100100672,1,197.9,84.9,
24,99999999,9260115784,17950,17955,1234958242,2,230100500016,1,11.9,5.4,
16,99999999,3940105865,17952,17954,1234972570,2,230100200048,1,68.7,34.45,
11171,99999999,2600100032,17971,17973,1235176942,3,240200100021,1,2.7,1.2,
11171,99999999,2600100032,17971,17973,1235176942,3,240200100246,1,16.2,7.9,
215,120160,1600102721,17977,17977,1235236723,1,240400200094,1,254.2,115.6,
89,121043,9260116551,17980,17980,1235275513,1,220100100241,1,29.7,14.95,
111,120122,1600102072,17984,17984,1235306679,1,240100200014,1,55.4,22.8,
63,121109,9260125492,17991,17991,1235384426,1,240700100012,1,21.99,9.1,
16,99999999,3940105865,18012,18014,1235591214,2,240400200022,1,93.4,38.95,
16,99999999,3940105865,18012,18014,1235591214,2,240400200036,1,55.5,25.1,
16,99999999,3940105865,18014,18016,1235611754,2,240400300033,2,71.4,14.35,
16,99999999,3940105865,18014,18016,1235611754,2,240400300035,2,38.2,7.7,
16,99999999,3940105865,18027,18029,1235744141,2,230100500081,2,146,30.35,
16,99999999,3940105865,18027,18029,1235744141,2,230100700009,3,1687.5,287.1,
24,99999999,9260115784,18035,18041,1235830338,2,220200100202,1,92,46.1,
24,99999999,9260115784,18035,18041,1235830338,2,220200200073,1,145.9,66.35,
171,120127,1600101555,18038,18038,1235856852,1,220100100019,1,27.7,13.95,
171,120127,1600101555,18038,18038,1235856852,1,220101400152,1,13.1,5.9,
36,99999999,9260128237,18040,18043,1235881915,3,240700400004,2,26.4,5.95,
49,121040,9260104510,18043,18043,1235913793,1,220101200025,1,26.7,11.6,
79,99999999,9260101874,18044,18051,1235926178,3,210200200022,2,36,7.05,
12386,99999999,4750100001,18048,18049,1235963427,2,220100700024,3,313.8,49.8,
12386,99999999,4750100001,18048,18049,1235963427,2,220100900029,1,31.4,12.55,
183,120127,1600100760,18054,18054,1236017640,1,220101400092,1,57.7,25.7,
9,99999999,3940106659,18055,18060,1236028541,3,230100500056,2,16,3.5,
10,121136,9260129395,18057,18057,1236055696,1,240800100041,1,292.5,121.75,
908,99999999,9050100023,18058,18062,1236066649,2,230100300010,1,46.7,18.75,
36,99999999,9260128237,18063,18066,1236113431,3,230100200066,2,25.8,5.45,
26148,99999999,2600100010,18065,18067,1236128445,2,240200100053,2,174.4,44.95,
16,99999999,3940105865,18065,18067,1236128456,2,230100500006,2,16.8,3.45,
16,99999999,3940105865,18065,18067,1236128456,2,230100600016,2,154,38.6,
23,99999999,9260126679,18070,18075,1236183578,2,240500100026,2,110.4,24.5,
23,99999999,9260126679,18070,18075,1236183578,2,240500200007,3,28.5,4.55,
41,120131,1600101527,18074,18074,1236216065,1,240200100118,1,175.5,89.55,
92,121051,9260117676,18086,18086,1236349115,1,240200100221,4,396,49.6,
92,121051,9260117676,18086,18086,1236349115,1,240200200024,2,250.8,12.5,
111,120123,1600102072,18089,18089,1236369939,1,240100100365,1,191.6,87.4,
111,120123,1600102072,18089,18089,1236369939,1,240100400037,1,231,113.65,
70108,99999999,2600100046,18100,18111,1236483576,2,240200200071,4,74.8,10,
9,99999999,3940106659,18119,18124,1236673732,3,230100700008,3,1542.6,250.7,
9,99999999,3940106659,18119,18124,1236673732,3,230100700011,2,550.2,113.45,
70221,99999999,2600100019,18121,18123,1236694462,3,240200100056,2,82.4,19.9,
34,121027,9260111379,18121,18121,1236701935,1,210200300052,2,43.8,11.05,
183,120136,1600100760,18130,18130,1236783056,1,240300200058,2,183.6,41.7,
183,120136,1600100760,18130,18130,1236783056,1,240300300090,3,1561.8,237.05,
215,120170,1600102721,18137,18137,1236852196,1,240600100016,1,55.3,21.9,
3959,99999999,8010100151,18143,18144,1236923123,3,240100100031,1,3.7,1.3,
70165,99999999,2600100006,18148,18158,1236965430,3,240200100050,2,27,6.65,
79,99999999,9260101874,18167,18178,1237165927,3,240500100057,2,76.8,17.1,
111,120143,1600102072,18173,18173,1237218771,1,230100500072,1,26.1,11.9,
195,120124,1600101663,18178,18178,1237272696,1,240100400069,2,186.6,39.95,
195,120124,1600101663,18178,18178,1237272696,1,240100400142,2,338.8,84.85,
10,121043,9260129395,18183,18183,1237327705,1,220100100298,1,52.9,26.55,
10,121043,9260129395,18183,18183,1237327705,1,220100100617,1,37.3,18.75,
2618,99999999,8010100125,18183,18188,1237331045,3,240100100366,1,16.3,7.8,
41,120145,1600101527,18188,18188,1237370327,1,230100600031,1,88.5,42.45,
171,99999999,1600101555,18196,18200,1237450174,3,220100800001,2,77.2,18.35,
171,99999999,1600101555,18196,18200,1237450174,3,220101400349,1,11.9,4.8,
908,99999999,9050100023,18198,18202,1237478988,2,230100200004,1,99.9,50.05,
1100,99999999,9050100008,18201,18203,1237507462,2,230100400025,3,51,6.6,
1100,99999999,9050100008,18201,18203,1237507462,2,230100700009,1,568.1,289.95,
79,121081,9260101874,18202,18202,1237517484,1,240400300013,1,54.3,22.6,
65,99999999,3940100176,18217,18223,1237664026,3,230100200004,1,99.9,50.05,
10,99999999,9260129395,18217,18222,1237670443,2,240800200034,1,74.8,34,
53,120190,1600103258,18220,18220,1237695520,1,220200100129,3,240,39.45,
10,99999999,9260129395,18225,18230,1237751376,2,240100400043,1,279.3,138.1,
56,121027,9260111871,18229,18229,1237789102,1,210200300007,1,50.4,25.3,
9,99999999,3940106659,18233,18238,1237825036,3,240400300039,2,39.2,7.9,
5,121041,9260114570,18239,18239,1237890730,1,220101400265,2,74.2,16.55,
5,121041,9260114570,18239,18239,1237890730,1,220101400387,4,50.4,5.85,
29,99999999,1600103020,18240,18245,1237894107,2,220100700027,2,119,29.85,
70187,99999999,2600100035,18240,18245,1237894966,2,240200100050,2,19.98,6.65,0.3
23,99999999,9260126679,18243,18248,1237928021,2,240800100074,3,949.8,126.7,
23,99999999,9260126679,18243,18248,1237928021,2,240800200037,3,164.4,23.75,
41,120158,1600101527,18248,18248,1237974997,1,240400300013,3,162.9,22.6,
36,99999999,9260128237,18249,18252,1237989406,3,230100100018,2,318.2,67.4,
46966,99999999,2600100011,18252,18253,1238013821,3,240200200026,3,312,41.65,
9,99999999,3940106659,18256,18261,1238053337,3,230100700008,1,514.2,250.7,
41,99999999,1600101527,18268,18272,1238161695,2,240100100477,2,17,3.3,
63,121064,9260125492,18268,18268,1238168538,1,230100200073,1,46.9,20.2,
10,121106,9260129395,18276,18276,1238231237,1,240700200021,1,19.6,10.55,
88,121039,9260100179,18279,18279,1238255107,1,220100100581,1,38.7,19.45,
215,120127,1600102721,18282,18282,1238273927,1,220100700022,3,170.7,24.1,
70210,99999999,2600100015,18286,18287,1238305578,3,240200100246,1,16.2,7.9,
52,121025,9260116235,18287,18287,1238319276,1,240100100305,1,8.9,4.1,
89,121106,9260116551,18287,18287,1238319281,1,240700100007,1,22.85,9.3,
111,120127,1600102072,18292,18292,1238353296,1,220101300001,2,67.2,14.95,
111,120127,1600102072,18292,18292,1238353296,1,220101400138,3,140.1,23.45,
31,121044,9260128428,18293,18293,1238367238,1,220100800001,1,38.6,18.35,
19,99999999,3940106547,18294,18299,1238370259,3,230100600028,1,96.7,48.45,
41,120151,1600101527,18295,18295,1238377562,1,230100600016,2,154,38.6,
10,121073,9260129395,18296,18296,1238393448,1,230100500094,1,86.6,34.1,
19,99999999,3940106547,18301,18306,1238426415,3,230100700011,1,283.3,116.85,
52,121042,9260116235,18302,18302,1238440880,1,220100100530,1,52.2,26.2,
50,99999999,3940105781,18307,18308,1238474357,2,230100700011,2,566.6,116.85,
71,121054,9260124130,18311,18311,1238510159,1,240300200009,1,48.7,18.15,
71,121054,9260124130,18311,18311,1238510159,1,240300300024,1,54.1,23,
19,99999999,3940106547,18317,18322,1238553101,3,240400200091,1,217,90.4,
88,121033,9260100179,18323,18323,1238605995,1,210201100004,1,47.9,20.9,
88,121023,9260100179,18327,18327,1238637449,1,240100400151,1,419,209.45,
12,121069,9260103713,18328,18328,1238646479,1,230100200043,1,56.7,27.25,
90,121072,9260111614,18328,18328,1238646484,1,230100300013,1,24.8,5,
53,120121,1600103258,18332,18332,1238674844,1,240100100508,1,48.3,19.25,
12,121051,9260103713,18332,18332,1238678581,1,240200100181,1,109.3,56.6,
12,121051,9260103713,18332,18332,1238678581,1,240200200080,2,187.6,9.4,
10,121044,9260129395,18333,18333,1238686430,1,220101400201,1,40.6,18.05,
2806,99999999,8010100089,18334,18338,1238696385,2,240100100312,2,36.2,7.7,
53,120127,1600103258,18337,18337,1238712056,1,220100100185,1,97.6,48.9,
53,120127,1600103258,18337,18337,1238712056,1,220100700002,1,186.8,89.1,
195,120177,1600101663,18340,18340,1238735750,1,240700400020,2,155.6,40.5,
928,99999999,9050100016,18347,18351,1238797437,2,230100100063,2,767.8,176.05,
52,121024,9260116235,18348,18348,1238805678,1,240100100714,1,92.8,39.85,
52,121024,9260116235,18348,18348,1238805678,1,240100400006,1,229.1,113.25,
89,121039,9260116551,18348,18348,1238805703,1,220101400285,1,59.4,27.05,
14703,99999999,4750100002,18349,18352,1238812262,2,220100100309,1,96.3,48.25,
14703,99999999,4750100002,18349,18352,1238812262,2,220101400373,1,51.8,23.65,
88,121056,9260100179,18353,18353,1238846184,1,220200100035,1,62.6,31.4,
70187,99999999,2600100035,18355,18360,1238856867,2,220101000002,1,17.7,8,
39,121105,9260123099,18356,18356,1238870441,1,240700200007,1,5.1,2.2,
3959,99999999,8010100151,18356,18358,1238872273,3,240100100434,1,16.4,8.05,
89,121042,9260116551,18361,18361,1238910092,1,220100100309,2,192.6,48.25,
89,121042,9260116551,18361,18361,1238910092,1,220101400363,2,78,16.95,
215,120172,1600102721,18364,18364,1238928257,1,240600100181,1,37.4,16.3,
29,99999999,1600103020,18369,18373,1238968334,2,220100100025,1,17.4,8.8,
29,99999999,1600103020,18371,18375,1238985782,2,240100100703,1,79.9,34.3,
19,99999999,3940106547,18373,18378,1239003827,3,230100600016,1,77,38.6,
70221,99999999,2600100019,18375,18377,1239018454,3,240200100073,1,22.3,12.6,
70221,99999999,2600100019,18375,18377,1239018454,3,240200200068,1,313.8,159.15,
12,121030,9260103713,18379,18379,1239057268,1,210200500006,2,48,11.95,
29,99999999,1600103020,18394,18398,1239172417,2,240100100148,2,51.6,10.95,
39,99999999,9260123099,18394,18399,1239179935,2,240700300002,1,21.99,7.25,
52,121040,9260116235,18396,18396,1239194032,1,220100100192,1,27.4,13.8,
90,121020,9260111614,18397,18397,1239201604,1,240100400129,3,712.2,111,
29,99999999,1600103020,18400,18404,1239220388,2,240100100184,1,190.4,88.8,
20,99999999,9260118934,18400,18406,1239226632,3,220200100190,3,190.5,29.95,
63,121087,9260125492,18403,18403,1239248786,1,240500100015,3,174.3,25.8,
63,121087,9260125492,18403,18403,1239248786,1,240500200093,1,41.7,19.75,
41,120152,1600101527,18405,18405,1239258470,1,240400200003,1,6.2,3,
53,120143,1600103258,18406,18406,1239266107,1,230100600038,1,112.5,54.95,
45,121075,9260104847,18411,18411,1239312711,1,230100600016,3,231,38.6,
45,121075,9260104847,18411,18411,1239312711,1,230100700011,3,849.9,116.85,
1100,99999999,9050100008,18412,18414,1239320891,2,230100200006,3,279.3,46.65,
52,121037,9260116235,18415,18415,1239346133,1,220100100273,3,116.4,19.5,
52,121037,9260116235,18415,18415,1239346133,1,220100300042,1,208.6,84.35,
183,120143,1600100760,18417,18417,1239353855,1,230100500066,1,12.7,6.1,
89,121105,9260116551,18418,18418,1239368476,1,240700100012,3,65.97,9.1,
52,121105,9260116235,18423,18423,1239408849,1,240700100017,2,53.2,11.4,
29,99999999,1600103020,18424,18428,1239410348,2,220100800071,1,32.8,15.7,
88,121036,9260100179,18424,18424,1239416627,1,220100800040,2,248.2,59.05,
195,120127,1600101663,18425,18425,1239418524,1,220100100536,2,408.8,102.3,
41,99999999,1600101527,18428,18432,1239442095,2,210201000198,2,120.2,26.8,
17023,99999999,2600100021,18435,18440,1239498112,3,240200200044,2,97.8,19.6,
90,121040,9260111614,18440,18440,1239543223,1,220100100635,2,172.8,43.3,
90,121040,9260111614,18440,18440,1239543223,1,220101300012,2,38.6,8.75,
45,121127,9260104847,18449,18449,1239615368,1,240800200002,1,178.875,71.55,
88,121040,9260100179,18459,18459,1239693951,1,220100900035,2,83.6,19.45,
16,99999999,3940105865,18462,18463,1239713046,2,230100500058,4,66.8,7.25,
16,99999999,3940105865,18462,18463,1239713046,2,230100500082,2,252.2,58.6,
16,99999999,3940105865,18462,18463,1239713046,2,230100600031,2,177,42.45,
71,121073,9260124130,18464,18464,1239735632,1,230100700009,2,1136.2,289.95,
13,99999999,3940105189,18466,18471,1239744161,2,240400200003,1,6.2,3,
13,99999999,3940105189,18466,18471,1239744161,2,240400300035,2,38.2,7.7,
60,121036,9260101262,18468,18468,1239765451,1,220101400004,2,211.4,48.15,
60,121036,9260101262,18468,18468,1239765451,1,220101400148,2,21,4.75,
65,99999999,3940100176,18471,18477,1239785436,3,230100600031,4,354,42.45,
1684,99999999,9050100008,18475,18478,1239821232,2,230100500013,2,18.8,4.75,
54655,99999999,2600100013,18476,18479,1239823829,2,240200200081,2,214.6,10.75,
12,121090,9260103713,18477,18477,1239836937,1,240500100043,2,52.4,8.85,
12,121042,9260103713,18482,18482,1239874523,1,220101400047,2,48.4,11.1,
16,99999999,3940105865,18490,18491,1239932984,2,220200200079,2,285.8,64.85,
16,99999999,3940105865,18490,18491,1239932984,2,220200300129,5,406,37.05,
52,120732,9260116235,18493,18493,1239962634,1,230100500080,2,50,12.2,
53,99999999,1600103258,18495,18497,1239972644,2,220101400237,1,102.9,46.9,
90,121060,9260111614,18497,18497,1239994933,1,220200300082,3,213,32.3,
71,99999999,9260124130,18504,18510,1240051245,3,230100100028,1,250.9,104.2,
71,99999999,9260124130,18504,18510,1240051245,3,230100200022,3,359.1,56.9,
60,121066,9260101262,18505,18505,1240060066,1,230100100062,1,141.7,61,
544,99999999,9050100008,18515,18516,1240137702,2,230100300023,1,36,15,
70165,99999999,2600100006,18520,18521,1240173354,3,240200100225,2,306.2,77.85,
29,99999999,1600103020,18522,18526,1240187143,2,240100400100,1,154.6,116.6,
10,121039,9260129395,18523,18523,1240201886,1,220101400339,1,32.3,14.75,
52,121051,9260116235,18533,18533,1240283215,1,240200100118,1,175.5,89.55,
52,121051,9260116235,18533,18533,1240283215,1,240200100164,2,112.2,28.15,
52,121051,9260116235,18533,18533,1240283215,1,240200100227,2,323.8,75.9,
90,121071,9260111614,18536,18536,1240306942,1,230100500056,1,8,3.5,
90,121071,9260111614,18536,18536,1240306942,1,230100600018,1,64.2,32.2,
908,99999999,9050100023,18537,18541,1240314947,2,230100600028,1,96.7,48.45,
17,121074,9260123306,18537,18537,1240314956,1,230100500094,1,86.6,34.1,
10,121063,9260129395,18542,18542,1240355393,1,230100600022,1,84.1,42.15,
63,120733,9260125492,18545,18545,1240379679,1,230100200004,1,99.9,50.05,
63,120733,9260125492,18545,18545,1240379679,1,230100500077,1,173,72.75,
89,121140,9260116551,18546,18546,1240387741,1,240800200020,1,187.2,85.15,
183,120153,1600100760,18552,18552,1240430921,1,240400200093,1,155.8,64.95,
29,99999999,1600103020,18554,18558,1240446608,2,220100100553,1,35,17.6,
29,99999999,1600103020,18554,18558,1240446608,2,220100700046,2,305.8,72.9,
50,99999999,3940105781,18554,18555,1240447572,2,230100200056,1,270,125.65,
10,121036,9260129395,18555,18555,1240461993,1,220100300020,1,11.3,4.55,
10,121036,9260129395,18555,18555,1240461993,1,220100800009,1,52.5,24.95,
10,121036,9260129395,18555,18555,1240461993,1,220101400276,1,68.4,31.2,
29,99999999,1600103020,18559,18563,1240485814,2,220101400290,1,74.8,34.1,
63,121033,9260125492,18561,18561,1240509842,1,210200500007,1,39.4,17.8,
50,99999999,3940105781,18562,18563,1240512744,2,240300100046,2,28.8,7.05,
89,121061,9260116551,18566,18566,1240549230,1,220200100012,1,58.7,28.25,
19,99999999,3940106547,18569,18574,1240568966,3,220200100226,1,133.2,66.7,
215,120192,1600102721,18571,18571,1240581932,1,210201000199,3,124.2,18.85,
2788,99999999,9050100001,18571,18573,1240588370,2,230100500082,1,126.1,58.6,
16,99999999,3940105865,18573,18574,1240599396,2,230100700002,1,220,135,
16,99999999,3940105865,18573,18574,1240599396,2,230100700004,1,360,199,
63,121071,9260125492,18573,18573,1240604971,1,230100600030,1,86.3,41.4,
20,121069,9260118934,18574,18574,1240613362,1,230100100017,1,175.3,74.95,
88,121086,9260100179,18584,18584,1240692950,1,240500100039,1,34.5,15.4,
544,99999999,9050100008,18595,18596,1240782710,2,230100500066,1,12.7,6.1,
544,99999999,9050100008,18595,18596,1240782710,2,230100600005,1,129.8,63.2,
544,99999999,9050100008,18604,18605,1240856801,2,230100600028,2,193.4,48.45,
544,99999999,9050100008,18604,18605,1240856801,2,230100600039,1,124.7,59.65,
1100,99999999,9050100008,18606,18608,1240870047,2,230100100015,2,213.8,45.5,
52,121030,9260116235,18608,18608,1240886449,1,210200200023,1,19.8,8.25,
52,121044,9260116235,18610,18610,1240903120,1,220100100592,2,62.2,15.65,
52,121044,9260116235,18610,18610,1240903120,1,220100100629,4,213.2,26.75,
16,99999999,3940105865,18618,18619,1240961599,2,230100200025,4,1103.6,125.25,
16,99999999,3940105865,18618,18619,1240961599,2,230100600015,1,78.2,39.2,
24,99999999,9260115784,18629,18632,1241054779,3,240800200021,2,195.6,42.45,
89,121135,9260116551,18630,18631,1241063739,1,240800200035,6,160.8,12.15,
171,120134,1600101555,18631,18631,1241066216,1,240200100225,2,306.2,77.85,
53,99999999,1600103258,18633,18636,1241086052,3,210200500002,3,37.8,5.7,
53,120131,1600103258,18640,18640,1241147641,1,240200200091,2,362.6,72.6,
171,120136,1600101555,18650,18657,1241235281,1,240300100001,1,72.6,36.25,
111,120164,1600102072,18651,18651,1241244297,1,240500100041,2,258.2,51.7,
111,120164,1600102072,18651,18651,1241244297,1,240500200042,2,81.2,19.35,
111,120164,1600102072,18651,18651,1241244297,1,240500200101,3,358.2,49.75,
3959,99999999,8010100151,18652,18653,1241263172,3,240100400004,1,102.4,51.15,
3959,99999999,8010100151,18652,18653,1241263172,3,240100400062,1,113.2,54,
27,99999999,9260105670,18655,18660,1241286432,3,240800200009,2,174.4,34.9,
2806,99999999,8010100089,18656,18666,1241298131,2,240100400058,1,37.4,29.65,
12,121043,9260103713,18663,18663,1241359997,1,220100100105,1,117.6,58.9,
171,120124,1600101555,18665,18665,1241371145,1,240100400046,2,656.6,165.95,
171,120124,1600101555,18665,18665,1241371145,1,240100400085,2,129,30.95,
41,120131,1600101527,18667,18667,1241390440,1,240200100046,2,36.2,9.15,
18,121042,9260112361,18674,18675,1241461856,1,220100100523,1,29.4,14.8,
171,120127,1600101555,18686,18686,1241561055,1,220101400088,5,192,17.5,
24,99999999,9260115784,18692,18695,1241623505,3,240700400017,1,46.9,21.95,
70100,99999999,2600100015,18695,18699,1241645664,2,240200200020,1,150.1,14,
27,99999999,9260105670,18695,18700,1241652707,3,240700400017,3,140.7,21.95,
10,121040,9260129395,18699,18705,1241686210,1,220100100235,1,32.6,16.4,
92,121106,9260117676,18702,18702,1241715610,1,240700200019,1,16.9,8.6,
31,121025,9260128428,18704,18704,1241731828,1,240100100410,1,22.7,10.4,
31,121025,9260128428,18704,18704,1241731828,1,240100100665,1,41.5,17.25,
17023,99999999,2600100021,18711,18716,1241789227,3,240200100211,1,121,60.65,
56,121051,9260111871,18722,18726,1241895594,1,240200100034,2,24.4,4.45,
56,121051,9260111871,18722,18726,1241895594,1,240200100050,1,13.5,6.65,
46966,99999999,2600100011,18724,18725,1241909303,3,240200200081,1,107.3,10.75,
27,99999999,9260105670,18726,18731,1241930625,3,220200100012,1,58.7,28.25,
27,99999999,9260105670,18726,18731,1241930625,3,220200100171,1,56.3,31.05,
27,99999999,9260105670,18726,18731,1241930625,3,220200200014,1,90,40.9,
171,120152,1600101555,18732,18732,1241977403,1,240400300035,1,19.1,7.7,
10,121040,9260129395,18735,18735,1242012259,1,220100300037,2,231.6,48.7,
10,121040,9260129395,18735,18735,1242012259,1,220101400032,2,19.2,4.85,
45,121040,9260104847,18735,18735,1242012269,1,220100300019,4,142.4,16.7,
45,121040,9260104847,18735,18735,1242012269,1,220101400216,3,73.8,11.3,
183,120132,1600100760,18738,18738,1242035131,1,240200200061,1,147.1,58.85,
31,99999999,9260128428,18742,18746,1242076538,3,220200200022,1,57.3,33.9,
92,121086,9260117676,18748,18748,1242130888,1,240500100017,3,160.5,23.75,
5,99999999,9260114570,18749,18754,1242140006,3,240100100159,1,31.4,13.9,
90,99999999,9260111614,18749,18751,1242140009,2,240100100434,1,16.4,8.05,
90,99999999,9260111614,18749,18751,1242140009,2,240100400128,1,192.4,89.9,
90,121032,9260111614,18750,18750,1242149082,1,210200300006,1,14.3,7.7,
90,121032,9260111614,18750,18750,1242149082,1,210200900033,4,56.8,6.45,
5,99999999,9260114570,18751,18756,1242159212,3,230100200029,2,446.6,101.65,
2550,99999999,8010100009,18751,18756,1242161468,3,240100100232,3,9.6,1.3,
2550,99999999,8010100009,18751,18756,1242161468,3,240100400080,1,222,110.95,
46966,99999999,2600100011,18752,18753,1242162201,3,240200100053,2,174.4,44.95,
1033,99999999,9050100001,18753,18757,1242173926,3,230100600026,3,355.8,59.4,
41,120136,1600101527,18755,18755,1242185055,1,240300100049,1,19.9,8.9,
70079,99999999,2600100039,18758,18761,1242214574,3,240200100230,2,29.4,6.65,
171,120127,1600101555,18760,18760,1242229985,1,220100100189,2,189.4,47.45,
70187,99999999,2600100035,18763,18768,1242259863,2,240200100157,2,706.2,196.15,
10,121105,9260129395,18763,18763,1242265757,1,240700100004,3,79.8,13.75,
27,99999999,9260105670,18783,18788,1242449327,3,240100100679,2,91.6,19.5,
10,121071,9260129395,18784,18784,1242458099,1,230100400007,1,12.2,4.9,
34,99999999,9260111379,18785,18791,1242467585,3,240100100690,2,403,86.1,
34,99999999,9260111379,18785,18791,1242467585,3,240100100737,5,239.5,20.65,
31,99999999,9260128428,18786,18790,1242477751,3,220200200036,2,120.4,27.4,
31,99999999,9260128428,18786,18790,1242477751,3,220200200077,2,277.6,63.15,
5,121056,9260114570,18788,18788,1242493791,1,220200100009,2,126.8,30.5,
31,121067,9260128428,18789,18789,1242502670,1,230100500056,2,16,3.5,
31,121067,9260128428,18789,18789,1242502670,1,230100500087,2,195,40.55,
17023,99999999,2600100021,18791,18796,1242515373,3,240200100057,4,168,20.25,
70165,99999999,2600100006,18793,18800,1242534503,3,240200100118,4,702,89.55,
89,99999999,9260116551,18795,18799,1242557584,2,240500200083,2,134.6,28,
171,120130,1600101555,18796,18796,1242559569,1,220100700023,1,73.99,44.25,0.3
2806,99999999,8010100089,18796,18800,1242568696,2,240100100029,2,239,51.7,
2806,99999999,8010100089,18796,18800,1242568696,2,240100400098,3,755.4,125.85,
70100,99999999,2600100015,18798,18802,1242578860,2,240200100173,4,1937.2,247.7,
12,121037,9260103713,18801,18801,1242610991,1,220101400047,2,48.4,11.1,
45,121109,9260104847,18805,18805,1242647539,1,240700200009,2,56,11.35,
90,121037,9260111614,18806,18806,1242657273,1,220100100410,3,33.6,5.7,
90,99999999,9260111614,18810,18812,1242691897,2,240500100062,2,110.2,24.05,
10,121107,9260129395,18815,18815,1242736731,1,240700200010,3,80.7,10.3,
24,99999999,9260115784,18819,18822,1242773202,3,240600100185,2,70.2,15.6,
27,99999999,9260105670,18820,18825,1242782701,3,240500200081,3,403.5,56.05,
10,121105,9260129395,18825,18825,1242827683,1,240700300002,1,21.99,7.25,
10,121027,9260129395,18826,18826,1242836878,1,210201000067,2,60.6,13.5,
41,120195,1600101527,18827,18827,1242838815,1,210200500007,1,39.4,17.8,
41,120195,1600101527,18827,18827,1242838815,1,210200600056,1,50.4,22.75,
2806,99999999,8010100089,18827,18831,1242848557,2,240100100312,3,54.3,7.7,
70165,99999999,2600100006,18836,18837,1242923327,3,240200100081,2,16.6,3.65,
171,120124,1600101555,18838,18838,1242938120,1,240100200004,1,35.2,14.8,
65,99999999,3940100176,18842,18846,1242977743,2,240400200012,2,351.4,75.95,
2806,99999999,8010100089,18845,18849,1243012144,2,240100100615,2,25.8,5.45,
2806,99999999,8010100089,18845,18849,1243012144,2,240100400083,2,219,54.7,
10,120733,9260129395,18847,18847,1243026971,1,230100500082,2,252.2,58.6,
41,120143,1600101527,18849,18849,1243039354,1,230100600003,1,17.6,7.75,
53,99999999,1600103258,18850,18853,1243049938,3,220100300001,2,180.4,38.3,
10,121032,9260129395,18856,18856,1243110343,1,210200600067,2,134,28.9,
10,121032,9260129395,18856,18856,1243110343,1,210200900038,3,60.9,9.3,
171,120159,1600101555,18859,18859,1243127549,1,240400300035,1,19.1,7.7,
45,120734,9260104847,18861,18862,1243152030,1,230100400010,1,40.2,16.85,
90,121089,9260111614,18861,18861,1243152039,1,240500200003,2,47.6,11.4,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100052,2,201.2,51.9,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100116,3,658.5,124.9,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100207,2,215.8,53.35,
10,121061,9260129395,18866,18866,1243198099,1,220200200018,3,199.2,30.25,
10,121061,9260129395,18866,18866,1243198099,1,220200300154,3,256.2,39.8,
171,120141,1600101555,18870,18880,1243227745,1,230100500004,2,6.4,1.35,
928,99999999,9050100016,18874,18878,1243269405,2,230100600030,1,86.3,41.4,
27,99999999,9260105670,18875,18880,1243279343,3,240500200082,2,78.4,16.45,
31,121057,9260128428,18876,18876,1243290080,1,220200100137,1,50.3,25.25,
45,121065,9260104847,18876,18876,1243290089,1,230100600015,1,78.2,39.2,
5,121026,9260114570,18879,18879,1243315613,1,210200500016,1,52.5,22.25,
12,121051,9260103713,18888,18888,1243398628,1,240200100053,1,87.2,44.95,
69,121029,9260116402,18890,18890,1243417726,1,210200700016,1,23.5,9.2,
24,99999999,9260115784,18895,18898,1243462945,3,240600100102,1,46.1,19.7,
41,120195,1600101527,18896,18896,1243465031,1,210200600067,2,134,28.9,
11,99999999,3940108592,18898,18902,1243485097,3,220200100002,2,78.2,19.65,
89,121024,9260116551,18901,18901,1243515588,1,240100400098,1,251.8,125.85,
89,121024,9260116551,18901,18901,1243515588,1,240100400125,1,114.2,44.6,
31,121060,9260128428,18907,18907,1243568955,1,220200300096,1,172.5,78.5,
171,120138,1600101555,18916,18916,1243643970,1,220200200035,1,101.5,46.25,
70079,99999999,2600100039,18916,18919,1243644877,3,240200100098,1,14.6,6.75,
41,120124,1600101527,18918,18918,1243661763,1,240100100463,2,29.4,6.05,
69,121065,9260116402,18918,18918,1243670182,1,230100500004,1,3.2,1.35,
31,121061,9260128428,18919,18919,1243680376,1,220200100190,1,63.5,29.95,
10,121053,9260129395,18932,18932,1243797399,1,240300100028,2,1066.4,251.35,
10,121053,9260129395,18932,18932,1243797399,1,240300300065,1,321.5,146.35,
41,120128,1600101527,18933,18933,1243799681,1,220100100354,1,17,8.45,
41,120128,1600101527,18933,18933,1243799681,1,220100800096,3,222.3,35.3,
10,120732,9260129395,18934,18934,1243815198,1,230100500092,4,471.2,49.05,
10,120732,9260129395,18934,18934,1243815198,1,230100500096,1,35.5,17.25,
171,120127,1600101555,18935,18935,1243817278,1,220101400328,1,19,8.85,
908,99999999,9050100023,18942,18946,1243887390,2,230100700008,1,519.3,253.2,
34,121068,9260111379,18949,18949,1243951648,1,230100600030,1,86.3,41.4,
90,121028,9260111614,18950,18950,1243960910,1,210200100009,2,69.4,15.5,
215,120175,1600102721,18951,18951,1243963366,1,240600100080,2,60.8,9.2,
171,120124,1600101555,18954,18954,1243991721,1,240100100354,1,29.9,14.3,
70187,99999999,2600100035,18954,18959,1243992813,2,220100100421,1,8.2,4.15,
2806,99999999,8010100089,18961,18965,1244066194,2,240100100159,1,31.4,13.9,
2806,99999999,8010100089,18961,18965,1244066194,2,240100100605,3,144.6,20.75,
14104,99999999,4750100001,18964,18967,1244086685,3,220100100516,2,80.4,20.2,
14104,99999999,4750100001,18964,18967,1244086685,3,220100100631,2,114.2,28.65,
45,121107,9260104847,18966,18966,1244107612,1,240700100001,5,118,12.3,
45,121107,9260104847,18966,18966,1244107612,1,240700400031,2,126,31.6,
45,121109,9260104847,18967,18967,1244117101,1,240700100007,2,45.7,9.3,
45,121109,9260104847,18967,18967,1244117101,1,240700100017,2,19.98,11.4,0.4
49,121117,9260104510,18967,18967,1244117109,1,240700400003,2,24.8,5.6,
31,121121,9260128428,18973,18973,1244171290,1,240800100042,3,760.8,105.3,
10,121092,9260129395,18974,18974,1244181114,1,240500200016,3,95.1,14.5,
10,121092,9260129395,18974,18974,1244181114,1,240500200122,2,48.2,11.5,
89,121118,9260116551,18976,18976,1244197366,1,240700200018,4,75.2,10.3,
5,121040,9260114570,18987,18987,1244296274,1,220101400130,2,33.8,5.7,
;;;;
run;

data ORION.PRICE_LIST;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Unit_Cost_Price length=8 label='Unit Cost Price' format=DOLLAR13.2;
   attrib Unit_Sales_Price length=8 label='Unit Sales Price' format=DOLLAR13.2;
   attrib Factor length=8 label='Yearly increase in Price' format=5.2;

   infile datalines dsd;
   input
      Product_ID
      Start_Date
      End_Date
      Unit_Cost_Price
      Unit_Sales_Price
      Factor
   ;
datalines4;
210200100009,18787,2936547,15.5,34.7,1
210200100017,18651,2936547,17.8,40,1
210200200023,18812,2936547,8.25,19.8,1
210200600067,18927,2936547,28.9,67,1
210200600085,18867,2936547,17.85,39.4,1
210200600112,18631,2936547,9.25,21.8,1
210200900033,18887,2936547,6.45,14.2,1
210200900038,18659,2936547,9.3,20.3,1
210201000050,18719,2936547,9,19.6,1
210201000126,18739,2936547,2.3,6.5,1
210201000198,18907,2936547,26.8,60.1,1
210201100004,18735,2936547,21.5,49.2,1.01
220100100189,18837,2936547,47.45,94.7,1
220100100192,18852,2936547,13.8,27.4,1
220100100309,18777,2936547,48.25,96.3,1
220100100354,18755,2936547,8.45,17,1
220100200004,18837,2936547,2.6,6.5,1
220100300008,18731,2936547,34.35,85.7,1
220100300042,18675,2936547,84.35,208.6,1
220100400023,18797,2936547,40.75,93.6,1
220100700002,18917,2936547,89.95,188.6,1
220100700022,18635,2936547,24.1,56.9,1
220100700024,18872,2936547,49.8,104.6,1
220100700027,18751,2936547,29.85,59.5,1
220100700042,18962,2936547,38.45,90.6,1
220100700046,18639,2936547,73.6,154.4,1.01
220100700052,18757,2936547,57.85,121.6,1.01
220100800001,18667,2936547,18.35,38.6,1
220100800009,18962,2936547,24.95,52.5,1
220100800040,18887,2936547,60.2,126.5,1
220100800071,18962,2936547,16.15,33.7,1.01
220100800096,18727,2936547,35.3,74.1,1
220100900006,18755,2936547,35.45,88.4,1
220101200006,18782,2936547,22.15,55.2,1
220101200025,18852,2936547,11.7,26.9,1
220101200029,18635,2936547,23.75,54.8,1
220101300001,18902,2936547,14.95,33.6,1
220101300012,18767,2936547,8.8,19.4,1
220101300017,18802,2936547,7.5,16.6,1
220101400004,18832,2936547,48.15,105.7,1
220101400017,18711,2936547,5,11.1,1
220101400047,18852,2936547,11.1,24.2,1
220101400060,18792,2936547,14.8,32.4,1
220101400061,18757,2936547,23.3,51,1
220101400088,18932,2936547,17.5,38.4,1
220101400091,18927,2936547,15.6,34,1
220101400098,18737,2936547,14.95,32.7,1
220101400117,18667,2936547,21.25,46.4,1
220101400130,18635,2936547,5.7,16.9,1
220101400145,18877,2936547,7.75,16.7,1
220101400148,18707,2936547,4.75,10.5,1
220101400201,18695,2936547,18.05,40.6,1
220101400216,18917,2936547,11.3,24.6,1
220101400237,18751,2936547,46.9,102.9,1
220101400238,18777,2936547,25.95,56.9,1
220101400265,18847,2936547,16.55,37.1,1
220101400269,18723,2936547,29.8,67,1
220101400276,18852,2936547,31.2,68.4,1
220101400285,18751,2936547,27.05,59.4,1
220101400290,18715,2936547,34.1,74.8,1
220101400306,18857,2936547,33.7,74,1
220101400310,18697,2936547,14.3,32.1,1
220101400328,18743,2936547,8.85,19,1
220101400339,18872,2936547,14.75,32.3,1
220101400349,18942,2936547,4.8,11.9,1
220101400363,18897,2936547,16.95,39,1
220101400373,18917,2936547,23.65,51.8,1
220101400385,18782,2936547,13.4,26.9,1
220101400387,18872,2936547,5.85,12.6,1
220200100009,18892,2936547,30.5,63.4,1
220200100129,18755,2936547,39.45,80,1
220200100226,18927,2936547,66.7,133.2,1
220200200022,18711,2936547,33.9,57.3,1
220200200036,18635,2936547,27.4,60.2,1
220200200071,18702,2936547,47,108.2,1
220200200073,18663,2936547,66.35,145.9,1
220200200077,18691,2936547,63.15,138.8,1.01
220200200079,18807,2936547,64.85,142.9,1
220200300002,18663,2936547,17.5,38.5,1
220200300005,18755,2936547,52.35,115,1
220200300015,18742,2936547,52.4,115,1
220200300079,18922,2936547,28.9,64.9,1
220200300116,18697,2936547,38.35,84.2,1
220200300157,18957,2936547,36.65,73.4,1
230100100018,18877,2936547,67.4,159.1,1
230100100033,18667,2936547,26.65,57.8,1
230100100063,18747,2936547,177.8,387.7,1
230100200022,18852,2936547,58,122,1
230100200025,18792,2936547,125.25,275.9,1
230100200059,18907,2936547,16.8,39.1,1
230100200073,18732,2936547,20.2,46.9,1
230100200074,18707,2936547,26.45,54.1,1.01
230100300006,18827,2936547,34.35,68.5,1
230100300010,18862,2936547,19.8,49.4,1.01
230100300013,18703,2936547,5.05,25,1.01
230100300023,18717,2936547,15,36,1
230100400010,18751,2936547,16.85,40.2,1
230100400012,18812,2936547,12.15,30.3,1
230100400025,18742,2936547,6.6,17,1
230100500087,18792,2936547,40.55,97.5,1
230100500092,18743,2936547,49.05,117.8,1
230100500093,18777,2936547,55.85,132.8,1
230100500095,18807,2936547,42,101.7,1
230100600035,18842,2936547,16,33.2,1.02
230100600036,18722,2936547,50.4,103.2,1
230100600039,18767,2936547,60.8,127.1,1.02
230100700002,18742,2936547,135,220,1
230100700008,18747,2936547,253.2,519.3,1
230100700009,18687,2936547,289.95,568.1,1
230100700011,18917,2936547,120.3,291.7,1.01
240100100029,18737,2936547,51.7,119.5,1
240100100031,18867,2936547,1.3,3.7,1
240100100063,18862,2936547,9.9,24.6,1
240100100065,18679,2936547,13.8,34.7,1
240100100159,18703,2936547,13.9,31.4,1
240100100184,18763,2936547,88.8,190.4,1
240100100232,18867,2936547,1.3,3.2,1
240100100305,18692,2936547,4.1,8.9,1
240100100312,18792,2936547,7.7,18.1,1
240100100365,18639,2936547,87.4,191.6,1
240100100410,18897,2936547,10.4,22.7,1
240100100434,18877,2936547,8.05,16.4,1
240100100463,18892,2936547,6.05,14.7,1
240100100477,18655,2936547,3.3,8.5,1
240100100581,18827,2936547,11.95,29,1
240100100605,18683,2936547,20.75,48.2,1
240100100610,18787,2936547,29.45,65.2,1
240100100665,18932,2936547,17.25,41.5,1
240100100672,18747,2936547,84.9,197.9,1
240100100676,18747,2936547,18.65,43.4,1
240100100679,18927,2936547,19.5,45.8,1
240100100690,18707,2936547,86.1,201.5,1
240100100737,18752,2936547,20.65,47.9,1
240100200001,18692,2936547,6.35,16,1
240100200004,18942,2936547,14.8,35.2,1
240100400004,18692,2936547,51.15,102.4,1
240100400005,18777,2936547,131.65,266.4,1
240100400006,18751,2936547,117.75,238.2,1.01
240100400037,18702,2936547,113.65,231,1
240100400043,18703,2936547,139.45,282,1
240100400044,18755,2936547,194.6,393.9,1.01
240100400062,18947,2936547,54,113.2,1
240100400070,18757,2936547,127.95,175.9,1
240100400080,18699,2936547,110.95,222,1
240100400083,18763,2936547,54.7,109.5,1
240100400085,18711,2936547,30.95,64.5,1
240100400129,18697,2936547,111,237.4,1
240100400142,18699,2936547,90.8,181.3,1.03
240100400143,18767,2936547,83.4,166.6,1
240100400147,18655,2936547,131.5,265.9,1.01
240100400151,18727,2936547,209.45,419,1
240200100007,18703,2936547,11.8,24.7,1
240200100020,18711,2936547,104.6,197.1,1
240200100034,18927,2936547,4.45,12.2,1
240200100051,18802,2936547,72,140.3,1
240200100052,18655,2936547,51.9,100.6,1
240200100053,18852,2936547,44.95,87.2,1
240200100056,18647,2936547,19.9,41.2,1
240200100057,18767,2936547,20.25,42,1
240200100073,18667,2936547,12.6,22.3,1
240200100081,18952,2936547,3.65,8.3,1
240200100098,18702,2936547,6.75,14.6,1
240200100101,18792,2936547,10.3,19.5,1
240200100116,18667,2936547,124.9,219.5,1
240200100118,18952,2936547,89.55,175.5,1
240200100124,18832,2936547,12.35,24.5,1
240200100154,18715,2936547,11.95,26.6,1
240200100164,18682,2936547,28.15,56.1,1
240200100173,18687,2936547,247.7,484.3,1
240200100181,18872,2936547,56.6,109.3,1
240200100183,18822,2936547,47.95,95.7,1
240200100207,18897,2936547,53.35,107.9,1
240200100211,18687,2936547,60.65,121,1
240200100225,18751,2936547,77.85,153.1,1
240200100226,18683,2936547,86.65,183.9,1
240200100227,18772,2936547,75.9,161.9,1
240200100230,18735,2936547,6.65,14.7,1
240200100232,18857,2936547,14.4,28.6,1
240200100246,18817,2936547,7.9,16.2,1
240200200007,18651,2936547,8.4,84.2,1
240200200011,18962,2936547,13,135.7,1
240200200013,18717,2936547,42.6,426.2,1
240200200015,18711,2936547,12.25,27.9,1.02
240200200020,18683,2936547,14,150.1,1
240200200024,18727,2936547,12.5,125.4,1
240200200026,18822,2936547,41.65,104,1
240200200035,18867,2936547,39.65,98.9,1
240200200039,18663,2936547,9.95,24.1,1.01
240200200044,18639,2936547,19.6,48.9,1
240200200061,18942,2936547,58.85,147.1,1
240200200068,18927,2936547,159.15,313.8,1
240200200081,18671,2936547,10.75,107.3,1
240200200091,18672,2936547,72.6,181.3,1
240300100028,18757,2936547,251.35,533.2,1
240300100032,18782,2936547,315.15,630.4,1
240300200018,18797,2936547,41.65,91.5,1
240300200058,18667,2936547,41.7,91.8,1
240300300024,18772,2936547,23.2,54.6,1
240300300065,18757,2936547,146.35,321.5,1
240300300070,18937,2936547,231.9,509.8,1
240300300090,18742,2936547,244.15,536.3,1.01
240400200003,18957,2936547,3,6.2,1
240400200012,18695,2936547,75.95,175.7,1
240400200036,18747,2936547,25.85,57.1,1.01
240400200057,18759,2936547,65.85,145.8,1.02
240400200097,18727,2936547,124.2,416.8,1
240400300013,18872,2936547,22.6,54.3,1
240400300039,18727,2936547,7.9,19.6,1
240500100004,18712,2936547,28,63.5,1
240500100015,18772,2936547,25.8,58.1,1
240500100026,18922,2936547,24.5,55.2,1
240500100029,18763,2936547,26.1,58.9,1
240500100039,18737,2936547,15.4,34.5,1
240500100041,18667,2936547,51.7,129.1,1
240500100043,18747,2936547,8.85,26.2,1
240500100057,18917,2936547,17.1,38.4,1
240500100062,18827,2936547,24.05,55.1,1
240500200003,18847,2936547,11.4,23.8,1
240500200016,18847,2936547,14.5,31.7,1
240500200042,18937,2936547,19.35,40.6,1
240500200056,18639,2936547,11.75,24.5,1
240500200081,18635,2936547,56.05,134.5,1
240500200082,18695,2936547,16.45,39.2,1
240500200093,18687,2936547,19.75,41.7,1
240500200121,18727,2936547,13.25,27.8,1
240500200122,18671,2936547,11.5,24.1,1
240500200130,18932,2936547,11.7,28,1
240600100010,18882,2936547,6.75,16.7,1
240600100016,18699,2936547,22.1,55.8,1
240600100080,18763,2936547,9.2,30.4,1
240600100102,18702,2936547,19.7,46.1,1
240600100181,18792,2936547,16.3,37.4,1
240600100185,18707,2936547,15.6,35.1,1
240700100001,18707,2936547,12.3,23.6,1
240700100004,18763,2936547,13.75,26.6,1
240700100017,18962,2936547,11.4,26.6,1
240700200004,18957,2936547,2.2,4.2,1
240700200007,18832,2936547,2.2,5.1,1
240700200009,18739,2936547,11.35,28,1
240700200010,18707,2936547,10.3,26.9,1
240700200018,18947,2936547,10.3,18.8,1
240700200021,18742,2936547,10.55,19.6,1
240700200024,18643,2936547,6.6,16.7,1
240700400003,18957,2936547,5.6,12.4,1
240700400017,18842,2936547,22.15,47.3,1.01
240700400020,18717,2936547,41.3,79.3,1
240700400031,18687,2936547,31.6,63,1
240800100074,18957,2936547,126.7,316.6,1
240800200002,18743,2936547,71.55,178.875,1
240800200008,18717,2936547,68.2,170.5,1
240800200009,18782,2936547,34.9,87.2,1
240800200010,18679,2936547,49.95,125.2,1
240800200020,18792,2936547,85.15,187.2,1
240800200021,18687,2936547,42.45,97.8,1
240800200030,18867,2936547,19.5,49.5,1
240800200034,18777,2936547,35.7,78.5,1.02
240800200037,18711,2936547,24.9,57.5,1.02
240800200062,18922,2936547,16.75,36.8,1
240800200063,18682,2936547,19.7,43.4,1.01
;;;;
run;
data ORION.PRODUCT_DIM;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Product_Line length=$20 label='Product Line';
   attrib Product_Category length=$25 label='Product Category';
   attrib Product_Group length=$25 label='Product Group';
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_Country length=$2 label='Supplier Country';
   attrib Supplier_Name length=$30 label='Supplier Name';
   attrib Supplier_ID length=8 label='Supplier ID' format=12.;

   infile datalines dsd;
   input
      Product_ID
      Product_Line
      Product_Category
      Product_Group
      Product_Name
      Supplier_Country
      Supplier_Name
      Supplier_ID
   ;
datalines4;
210200100009,Children,Children Sports,"A-Team, Kids","Kids Sweat Round Neck,Large Logo",US,A Team Sports,3298
210200100017,Children,Children Sports,"A-Team, Kids",Sweatshirt Children's O-Neck,US,A Team Sports,3298
210200200022,Children,Children Sports,"Bathing Suits, Kids",Sunfit Slow Swimming Trunks,US,Nautlius SportsWear Inc,6153
210200200023,Children,Children Sports,"Bathing Suits, Kids",Sunfit Stockton Swimming Trunks Jr.,US,Nautlius SportsWear Inc,6153
210200300006,Children,Children Sports,"Eclipse, Kid's Clothes",Fleece Cuff Pant Kid'S,US,Eclipse Inc,1303
210200300007,Children,Children Sports,"Eclipse, Kid's Clothes",Hsc Dutch Player Shirt Junior,US,Eclipse Inc,1303
210200300052,Children,Children Sports,"Eclipse, Kid's Clothes",Tony's Cut & Sew T-Shirt,US,Eclipse Inc,1303
210200400020,Children,Children Sports,"Eclipse, Kid's Shoes",Kids Baby Edge Max Shoes,US,Eclipse Inc,1303
210200400070,Children,Children Sports,"Eclipse, Kid's Shoes",Tony's Children's Deschutz (Bg) Shoes,US,Eclipse Inc,1303
210200500002,Children,Children Sports,"Lucky Guy, Kids",Children's Mitten,US,AllSeasons Outdoor Clothing,772
210200500006,Children,Children Sports,"Lucky Guy, Kids","Rain Suit, Plain w/backpack Jacket",US,AllSeasons Outdoor Clothing,772
210200500007,Children,Children Sports,"Lucky Guy, Kids",Bozeman Rain & Storm Set,US,AllSeasons Outdoor Clothing,772
210200500016,Children,Children Sports,"Lucky Guy, Kids",Teen Profleece w/Zipper,US,AllSeasons Outdoor Clothing,772
210200600056,Children,Children Sports,"N.D. Gear, Kids",Butch T-Shirt with V-Neck,ES,Luna sastreria S.A.,4742
210200600067,Children,Children Sports,"N.D. Gear, Kids",Children's Knit Sweater,ES,Luna sastreria S.A.,4742
210200600085,Children,Children Sports,"N.D. Gear, Kids",Gordon Children's Tracking Pants,ES,Luna sastreria S.A.,4742
210200600112,Children,Children Sports,"N.D. Gear, Kids",O'my Children's T-Shirt with Logo,ES,Luna sastreria S.A.,4742
210200700016,Children,Children Sports,"Olssons, Kids",Strap Pants BBO,ES,Sportico,798
210200900004,Children,Children Sports,"Osprey, Kids",Kid Basic Tracking Suit,US,Triple Sportswear Inc,3664
210200900033,Children,Children Sports,"Osprey, Kids",Osprey France Nylon Shorts,US,Triple Sportswear Inc,3664
210200900038,Children,Children Sports,"Osprey, Kids",Osprey Girl's Tights,US,Triple Sportswear Inc,3664
210201000050,Children,Children Sports,Tracker Kid's Clothes,Kid Children's T-Shirt,US,3Top Sports,2963
210201000067,Children,Children Sports,Tracker Kid's Clothes,Logo Coord.Children's Sweatshirt,US,3Top Sports,2963
210201000126,Children,Children Sports,Tracker Kid's Clothes,Toddler Footwear Socks with Knobs,US,3Top Sports,2963
210201000198,Children,Children Sports,Tracker Kid's Clothes,South Peak Junior Training Shoes,US,3Top Sports,2963
210201000199,Children,Children Sports,Tracker Kid's Clothes,Starlite Baby Shoes,US,3Top Sports,2963
210201100004,Children,Children Sports,"Ypsilon, Kids",Ypsilon Children's Sweat w/Big Logo,FR,Ypsilon S.A.,14624
220100100019,Clothes & Shoes,Clothes,Eclipse Clothing,Fit Racing Cap,US,Eclipse Inc,1303
220100100025,Clothes & Shoes,Clothes,Eclipse Clothing,Knit Hat,US,Eclipse Inc,1303
220100100044,Clothes & Shoes,Clothes,Eclipse Clothing,Sports glasses Satin Alumin.,US,Eclipse Inc,1303
220100100101,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Chaser Poplin Pants,US,Eclipse Inc,1303
220100100105,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Clima Fit Jacket,US,Eclipse Inc,1303
220100100125,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Dri Fit Singlet,US,Eclipse Inc,1303
220100100153,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Fresh Soft Nylon Pants,US,Eclipse Inc,1303
220100100185,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fiber Full Zip Jacket,US,Eclipse Inc,1303
220100100189,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fibre Jacket,US,Eclipse Inc,1303
220100100192,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fibre Shorts XXL,US,Eclipse Inc,1303
220100100197,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Mid Layer Jacket,US,Eclipse Inc,1303
220100100235,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Running Shorts Dri.Fit,US,Eclipse Inc,1303
220100100241,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Santos Shorts Dri Fit,US,Eclipse Inc,1303
220100100272,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's T-Shirt,US,Eclipse Inc,1303
220100100273,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's T-Shirt Dri Fit,US,Eclipse Inc,1303
220100100298,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Twill Pants Golf,US,Eclipse Inc,1303
220100100304,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Victory Peach Poplin Pants,US,Eclipse Inc,1303
220100100309,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Woven Warm Up,US,Eclipse Inc,1303
220100100354,Clothes & Shoes,Clothes,Eclipse Clothing,Insu F.I.T Basic,US,Eclipse Inc,1303
220100100371,Clothes & Shoes,Clothes,Eclipse Clothing,Northern Fleece Scarf,US,Eclipse Inc,1303
220100100410,Clothes & Shoes,Clothes,Eclipse Clothing,Toto Tube Socks,US,Eclipse Inc,1303
220100100421,Clothes & Shoes,Clothes,Eclipse Clothing,Trois-fit Running Qtr Socks (Non-Cush),US,Eclipse Inc,1303
220100100513,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Deception Dress,US,Eclipse Inc,1303
220100100516,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Dri Fit Airborne Top,US,Eclipse Inc,1303
220100100523,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Dri-Fit Scoop Neck Bra,US,Eclipse Inc,1303
220100100530,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Emblished Work-Out Pants,US,Eclipse Inc,1303
220100100536,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Foxhole Jacket,US,Eclipse Inc,1303
220100100553,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Short Top Dri Fit,US,Eclipse Inc,1303
220100100568,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Micro Fibre Anorak,US,Eclipse Inc,1303
220100100581,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Out & Sew Airborn Top,US,Eclipse Inc,1303
220100100592,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Short Tights,US,Eclipse Inc,1303
220100100609,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Sweatshirt w/Hood,US,Eclipse Inc,1303
220100100617,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's T-Shirt w/Hood,US,Eclipse Inc,1303
220100100629,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Winter Tights,US,Eclipse Inc,1303
220100100631,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Work Out Pants Dri Fit,US,Eclipse Inc,1303
220100100635,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Woven Warm Up,US,Eclipse Inc,1303
220100200004,Clothes & Shoes,Clothes,Green Tomato,Green Lime Atletic Socks,US,Green Lime Sports Inc,18139
220100300001,Clothes & Shoes,Clothes,Knitwear,Fleece Jacket Compass,US,AllSeasons Outdoor Clothing,772
220100300008,Clothes & Shoes,Clothes,Knitwear,Dp Roller High-necked Knit,US,Mayday Inc,4646
220100300019,Clothes & Shoes,Clothes,Knitwear,Instyle Pullover Mid w/Small Zipper,US,AllSeasons Outdoor Clothing,772
220100300020,Clothes & Shoes,Clothes,Knitwear,Instyle T-Shirt,US,AllSeasons Outdoor Clothing,772
220100300025,Clothes & Shoes,Clothes,Knitwear,Lucky Knitwear Wool Sweater,US,AllSeasons Outdoor Clothing,772
220100300037,Clothes & Shoes,Clothes,Knitwear,Mayday Resque Fleece Pullover,US,Mayday Inc,4646
220100300042,Clothes & Shoes,Clothes,Knitwear,Truls Polar Fleece Cardigan,NO,Truls Sporting Goods,12869
220100400005,Clothes & Shoes,Clothes,LSF,Big Guy Men's Air Force 1 Sc,US,Eclipse Inc,1303
220100400022,Clothes & Shoes,Clothes,LSF,Ultra M803 Ng Men's Street Shoes,US,Ultra Sporting Goods Inc,5503
220100400023,Clothes & Shoes,Clothes,LSF,Ultra W802 All Terrain Women's Shoes,US,Ultra Sporting Goods Inc,5503
220100700002,Clothes & Shoes,Clothes,Orion,Dmx 10 Women's Aerobic Shoes,CA,Fuller Trading Co.,16733
220100700022,Clothes & Shoes,Clothes,Orion,Alexis Women's Classic Shoes,CA,Fuller Trading Co.,16733
220100700023,Clothes & Shoes,Clothes,Orion,Armadillo Road Dmx Men's Running Shoes,CA,Fuller Trading Co.,16733
220100700024,Clothes & Shoes,Clothes,Orion,Armadillo Road Dmx Women's Running Shoes,CA,Fuller Trading Co.,16733
220100700027,Clothes & Shoes,Clothes,Orion,Duration Women's Trainer Aerobic Shoes,CA,Fuller Trading Co.,16733
220100700042,Clothes & Shoes,Clothes,Orion,"Power Women's Dmx Wide, Walking Shoes",CA,Fuller Trading Co.,16733
220100700046,Clothes & Shoes,Clothes,Orion,Tcp 6 Men's Running Shoes,CA,Fuller Trading Co.,16733
220100700052,Clothes & Shoes,Clothes,Orion,Trooper Ii Dmx-2x Men's Walking Shoes,CA,Fuller Trading Co.,16733
220100800001,Clothes & Shoes,Clothes,Orion Clothing,Bra Top Wom.Fitn.Cl,CA,Fuller Trading Co.,16733
220100800009,Clothes & Shoes,Clothes,Orion Clothing,Peacock Pants,CA,Fuller Trading Co.,16733
220100800040,Clothes & Shoes,Clothes,Orion Clothing,Mick's Men's Cl.Tracksuit,CA,Fuller Trading Co.,16733
220100800071,Clothes & Shoes,Clothes,Orion Clothing,Tx Tribe Tank Top,CA,Fuller Trading Co.,16733
220100800096,Clothes & Shoes,Clothes,Orion Clothing,Zx Women's Dance Pants,CA,Fuller Trading Co.,16733
220100900006,Clothes & Shoes,Clothes,Osprey,Osprey Cabri Micro Suit,US,Triple Sportswear Inc,3664
220100900029,Clothes & Shoes,Clothes,Osprey,Osprey Men's King T-Shirt w/Small Logo,US,Triple Sportswear Inc,3664
220100900035,Clothes & Shoes,Clothes,Osprey,Osprey Shadow Indoor,US,Triple Sportswear Inc,3664
220101000002,Clothes & Shoes,Clothes,Shorts,Carribian Women's Jersey Shorts,US,A Team Sports,3298
220101200006,Clothes & Shoes,Clothes,Street Wear,Anthony Bork Maggan 3/4 Long Pique,US,Mayday Inc,4646
220101200020,Clothes & Shoes,Clothes,Street Wear,Tyfoon Flex Shorts,AU,Typhoon Clothing,11427
220101200025,Clothes & Shoes,Clothes,Street Wear,Tyfoon Ketch T-Shirt,AU,Typhoon Clothing,11427
220101200029,Clothes & Shoes,Clothes,Street Wear,Tyfoon Oliver Sweatshirt,AU,Typhoon Clothing,11427
220101300001,Clothes & Shoes,Clothes,T-Shirts,"T-Shirt, Short-sleeved, Big Logo",US,A Team Sports,3298
220101300012,Clothes & Shoes,Clothes,T-Shirts,Men's T-Shirt Small Logo,US,A Team Sports,3298
220101300017,Clothes & Shoes,Clothes,T-Shirts,Toncot Beefy-T Emb T-Shirt,US,A Team Sports,3298
220101400004,Clothes & Shoes,Clothes,Tracker Clothes,Badminton Cotton,US,3Top Sports,2963
220101400017,Clothes & Shoes,Clothes,Tracker Clothes,Men's Cap,US,3Top Sports,2963
220101400018,Clothes & Shoes,Clothes,Tracker Clothes,Men's Running Tee Short Sleeves,US,3Top Sports,2963
220101400032,Clothes & Shoes,Clothes,Tracker Clothes,Socks Wmns'Fitness,US,Eclipse Inc,1303
220101400047,Clothes & Shoes,Clothes,Tracker Clothes,Swimming Trunks Struc,US,3Top Sports,2963
220101400060,Clothes & Shoes,Clothes,Tracker Clothes,2bwet 3 Cb Swimming Trunks,US,3Top Sports,2963
220101400061,Clothes & Shoes,Clothes,Tracker Clothes,2bwet 3 Solid Bikini,US,3Top Sports,2963
220101400088,Clothes & Shoes,Clothes,Tracker Clothes,Casual Genuine Polo-Shirt,US,3Top Sports,2963
220101400091,Clothes & Shoes,Clothes,Tracker Clothes,Casual Genuine Tee,US,3Top Sports,2963
220101400092,Clothes & Shoes,Clothes,Tracker Clothes,Casual Logo Men's Sweatshirt,US,3Top Sports,2963
220101400098,Clothes & Shoes,Clothes,Tracker Clothes,Casual Sport Shorts,US,3Top Sports,2963
220101400117,Clothes & Shoes,Clothes,Tracker Clothes,Casual.st.polo Long-sleeved Polo-shirt,US,3Top Sports,2963
220101400130,Clothes & Shoes,Clothes,Tracker Clothes,Comp. Women's Sleeveless Polo,US,3Top Sports,2963
220101400138,Clothes & Shoes,Clothes,Tracker Clothes,Dima 2-Layer Men's Suit,US,3Top Sports,2963
220101400145,Clothes & Shoes,Clothes,Tracker Clothes,Essence.baseball Cap,US,3Top Sports,2963
220101400148,Clothes & Shoes,Clothes,Tracker Clothes,Essence.cap Men's Bag,US,3Top Sports,2963
220101400150,Clothes & Shoes,Clothes,Tracker Clothes,Essential Suit 2 Swim Suit,US,3Top Sports,2963
220101400152,Clothes & Shoes,Clothes,Tracker Clothes,Essential Trunk 2 Swimming Trunks,US,3Top Sports,2963
220101400201,Clothes & Shoes,Clothes,Tracker Clothes,Kaitum Women's Swim Suit,US,3Top Sports,2963
220101400216,Clothes & Shoes,Clothes,Tracker Clothes,Mm Daypouch Shoulder Bag,US,3Top Sports,2963
220101400237,Clothes & Shoes,Clothes,Tracker Clothes,Mns.jacket Jacket,US,3Top Sports,2963
220101400238,Clothes & Shoes,Clothes,Tracker Clothes,Mns.long Tights,US,3Top Sports,2963
220101400265,Clothes & Shoes,Clothes,Tracker Clothes,Ottis Pes Men's Pants,US,3Top Sports,2963
220101400269,Clothes & Shoes,Clothes,Tracker Clothes,Outfit Women's Shirt,US,3Top Sports,2963
220101400276,Clothes & Shoes,Clothes,Tracker Clothes,Pine Sweat with Hood,US,3Top Sports,2963
220101400285,Clothes & Shoes,Clothes,Tracker Clothes,Quali Jacket with Hood,US,3Top Sports,2963
220101400289,Clothes & Shoes,Clothes,Tracker Clothes,Quali Sweatpant,US,3Top Sports,2963
220101400290,Clothes & Shoes,Clothes,Tracker Clothes,Quali Sweatshirt,US,3Top Sports,2963
220101400306,Clothes & Shoes,Clothes,Tracker Clothes,Sherpa Pes Shiny Cotton,US,3Top Sports,2963
220101400310,Clothes & Shoes,Clothes,Tracker Clothes,Short Women's Tights,US,3Top Sports,2963
220101400328,Clothes & Shoes,Clothes,Tracker Clothes,Stars Swim Suit,US,3Top Sports,2963
220101400339,Clothes & Shoes,Clothes,Tracker Clothes,Tims Shorts,US,3Top Sports,2963
220101400349,Clothes & Shoes,Clothes,Tracker Clothes,Tracker Fitness Stockings,US,3Top Sports,2963
220101400363,Clothes & Shoes,Clothes,Tracker Clothes,Brafit Swim Tights,ES,Luna sastreria S.A.,4742
220101400373,Clothes & Shoes,Clothes,Tracker Clothes,Jogging Pants  Men's Tracking Pants w/Small L,GB,Greenline Sports Ltd,14682
220101400385,Clothes & Shoes,Clothes,Tracker Clothes,N.d.gear Basic T-Shirt,GB,Greenline Sports Ltd,14682
220101400387,Clothes & Shoes,Clothes,Tracker Clothes,N.d.gear Cap,GB,Greenline Sports Ltd,14682
220200100002,Clothes & Shoes,Shoes,Eclipse Shoes,Cnv Plus Men's Off Court Tennis,US,Eclipse Inc,1303
220200100009,Clothes & Shoes,Shoes,Eclipse Shoes,Atmosphere Imara Women's Running Shoes,US,Eclipse Inc,1303
220200100012,Clothes & Shoes,Shoes,Eclipse Shoes,Atmosphere Shatter Mid Shoes,US,Eclipse Inc,1303
220200100035,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Deschutz Viii Shoes,US,Eclipse Inc,1303
220200100090,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Terra Reach Shoes,US,Eclipse Inc,1303
220200100092,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Terra Sebec Shoes,US,Eclipse Inc,1303
220200100129,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's International Triax Shoes,US,Eclipse Inc,1303
220200100137,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Multicourt Ii Shoes,US,Eclipse Inc,1303
220200100171,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Amend Mid,US,Eclipse Inc,1303
220200100179,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Converge Triax X,US,Eclipse Inc,1303
220200100190,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Imara,US,Eclipse Inc,1303
220200100202,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Rasp Suede,US,Eclipse Inc,1303
220200100226,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Zoom Drive,US,Eclipse Inc,1303
220200100229,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Zoom Sterling,US,Eclipse Inc,1303
220200200014,Clothes & Shoes,Shoes,Shoes,Dubby Low Men's Street Shoes,SE,Petterson AB,109
220200200018,Clothes & Shoes,Shoes,Shoes,Lulu Men's Street Shoes,SE,Petterson AB,109
220200200022,Clothes & Shoes,Shoes,Shoes,Pro Fit Gel Ds Trainer Women's Running Shoes,US,Pro Sportswear Inc,1747
220200200024,Clothes & Shoes,Shoes,Shoes,Pro Fit Gel Gt 2030 Women's Running Shoes,US,Pro Sportswear Inc,1747
220200200035,Clothes & Shoes,Shoes,Shoes,Soft Alta Plus Women's Indoor Shoes,US,Pro Sportswear Inc,1747
220200200036,Clothes & Shoes,Shoes,Shoes,Soft Astro Men's Running Shoes,US,Pro Sportswear Inc,1747
220200200071,Clothes & Shoes,Shoes,Shoes,Twain Men's Exit Low 2000 Street Shoes,US,Twain Inc,13198
220200200073,Clothes & Shoes,Shoes,Shoes,Twain Stf6 Gtx M Men's Trekking Boot,US,Twain Inc,13198
220200200077,Clothes & Shoes,Shoes,Shoes,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,US,Twain Inc,13198
220200200079,Clothes & Shoes,Shoes,Shoes,Twain Women's Expresso X-Hiking Shoes,US,Twain Inc,13198
220200300002,Clothes & Shoes,Shoes,Tracker Shoes,Pytossage Bathing Sandal,US,3Top Sports,2963
220200300005,Clothes & Shoes,Shoes,Tracker Shoes,Liga Football Boot,US,3Top Sports,2963
220200300015,Clothes & Shoes,Shoes,Tracker Shoes,Men's Running Shoes Piedmmont,US,3Top Sports,2963
220200300079,Clothes & Shoes,Shoes,Tracker Shoes,Hilly Women's Crosstrainer Shoes,US,3Top Sports,2963
220200300082,Clothes & Shoes,Shoes,Tracker Shoes,Indoor Handbold Special Shoes,US,3Top Sports,2963
220200300096,Clothes & Shoes,Shoes,Tracker Shoes,Mns.raptor Precision Sg Football,US,3Top Sports,2963
220200300116,Clothes & Shoes,Shoes,Tracker Shoes,South Peak Men's Running Shoes,US,3Top Sports,2963
220200300129,Clothes & Shoes,Shoes,Tracker Shoes,Torino Men's Leather Adventure Shoes,US,3Top Sports,2963
220200300154,Clothes & Shoes,Shoes,Tracker Shoes,Hardcore Junior/Women's Street Shoes Large,GB,Greenline Sports Ltd,14682
220200300157,Clothes & Shoes,Shoes,Tracker Shoes,Hardcore Men's Street Shoes Large,GB,Greenline Sports Ltd,14682
230100100006,Outdoors,Outdoors,Anoraks & Parkas,Jacket Nome,ES,Luna sastreria S.A.,4742
230100100013,Outdoors,Outdoors,Anoraks & Parkas,Jacket with Removable Fleece,US,AllSeasons Outdoor Clothing,772
230100100015,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Caians,NO,Scandinavian Clothing A/S,50
230100100017,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Rem,NO,Scandinavian Clothing A/S,50
230100100018,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Sandy,ES,Luna sastreria S.A.,4742
230100100025,Outdoors,Outdoors,Anoraks & Parkas,Women's Shorts,NO,Scandinavian Clothing A/S,50
230100100028,Outdoors,Outdoors,Anoraks & Parkas,4men Men's Polar Down Jacket,US,AllSeasons Outdoor Clothing,772
230100100033,Outdoors,Outdoors,Anoraks & Parkas,Big Guy Men's Packable Hiking Shorts,US,Miller Trading Inc,15218
230100100045,Outdoors,Outdoors,Anoraks & Parkas,Duwall Pants,US,AllSeasons Outdoor Clothing,772
230100100051,Outdoors,Outdoors,Anoraks & Parkas,Lucky Voss Jacket,US,AllSeasons Outdoor Clothing,772
230100100053,Outdoors,Outdoors,Anoraks & Parkas,Monster Men's Pants with Zipper,NO,Scandinavian Clothing A/S,50
230100100062,Outdoors,Outdoors,Anoraks & Parkas,Topper Pants,US,AllSeasons Outdoor Clothing,772
230100100063,Outdoors,Outdoors,Anoraks & Parkas,Tx Peak Parka,US,Miller Trading Inc,15218
230100200004,Outdoors,Outdoors,Backpacks,Black/Black,DK,Top Sports,755
230100200006,Outdoors,Outdoors,Backpacks,X-Large Bottlegreen/Black,DK,Top Sports,755
230100200019,Outdoors,Outdoors,Backpacks,Commanche Women's 6000 Q Backpack. Bark,DK,Top Sports,755
230100200022,Outdoors,Outdoors,Backpacks,Expedition Camp Duffle Medium Backpack,US,Miller Trading Inc,15218
230100200025,Outdoors,Outdoors,Backpacks,Feelgood 55-75 Litre Black Women's Backpack,AU,Toto Outdoor Gear,10692
230100200029,Outdoors,Outdoors,Backpacks,Jaguar 50-75 Liter Blue Women's Backpack,AU,Toto Outdoor Gear,10692
230100200043,Outdoors,Outdoors,Backpacks,Medium Black/Bark Backpack,DK,Top Sports,755
230100200047,Outdoors,Outdoors,Backpacks,Medium Gold Black/Gold Backpack,DK,Top Sports,755
230100200048,Outdoors,Outdoors,Backpacks,Medium Olive Olive/Black Backpack,DK,Top Sports,755
230100200054,Outdoors,Outdoors,Backpacks,Trekker 65 Royal Men's Backpack,AU,Toto Outdoor Gear,10692
230100200056,Outdoors,Outdoors,Backpacks,Victor Grey/Olive Women's Backpack,DK,Top Sports,755
230100200059,Outdoors,Outdoors,Backpacks,Deer Backpack,ES,Luna sastreria S.A.,4742
230100200066,Outdoors,Outdoors,Backpacks,Deer Waist Bag,ES,Luna sastreria S.A.,4742
230100200073,Outdoors,Outdoors,Backpacks,Hammock Sports Bag,ES,Luna sastreria S.A.,4742
230100200074,Outdoors,Outdoors,Backpacks,Sioux Men's Backpack 26 Litre.,US,Miller Trading Inc,15218
230100300006,Outdoors,Outdoors,Gloves & Mittens,Gloves Le Fly Mitten,PT,Magnifico Sports,1684
230100300010,Outdoors,Outdoors,Gloves & Mittens,Massif Dual Gloves,FR,Massif S.A.,13199
230100300013,Outdoors,Outdoors,Gloves & Mittens,Montana Adult Gloves,SE,Svensson Trading AB,6355
230100300023,Outdoors,Outdoors,Gloves & Mittens,Scania Unisex Gloves,SE,Svensson Trading AB,6355
230100400007,Outdoors,Outdoors,Knitted Accessories,Breaker Commandos Cap,DK,Norsok A/S,4793
230100400010,Outdoors,Outdoors,Knitted Accessories,Breaker Frozen Husky Hat,DK,Norsok A/S,4793
230100400012,Outdoors,Outdoors,Knitted Accessories,Breaker Russia Cap,DK,Norsok A/S,4793
230100400025,Outdoors,Outdoors,Knitted Accessories,Mayday Serious Headband,US,Mayday Inc,4646
230100500004,Outdoors,Outdoors,Outdoor Gear,"Backpack Flag, 6,5x9 Cm.",GB,Prime Sports Ltd,316
230100500006,Outdoors,Outdoors,Outdoor Gear,Collapsible Water Can,GB,Prime Sports Ltd,316
230100500008,Outdoors,Outdoors,Outdoor Gear,Dome Tent Monodome Alu,GB,Prime Sports Ltd,316
230100500012,Outdoors,Outdoors,Outdoor Gear,Inflatable 3.5,GB,Prime Sports Ltd,316
230100500013,Outdoors,Outdoors,Outdoor Gear,Lamp with Battery Box,GB,Prime Sports Ltd,316
230100500016,Outdoors,Outdoors,Outdoor Gear,"Money Purse, Black",DK,Top Sports,755
230100500020,Outdoors,Outdoors,Outdoor Gear,Pocket Light with Crypton Bulb,GB,Prime Sports Ltd,316
230100500023,Outdoors,Outdoors,Outdoor Gear,Proofing Spray,GB,Prime Sports Ltd,316
230100500024,Outdoors,Outdoors,Outdoor Gear,"Small Belt Bag, Black",DK,Top Sports,755
230100500026,Outdoors,Outdoors,Outdoor Gear,Trekking Tent,GB,Prime Sports Ltd,316
230100500045,Outdoors,Outdoors,Outdoor Gear,Cup Picnic Mug 25 Cl.,GB,Prime Sports Ltd,316
230100500056,Outdoors,Outdoors,Outdoor Gear,Knife,US,KN Outdoor Trading Inc,4718
230100500058,Outdoors,Outdoors,Outdoor Gear,Mattress with 5 channels 196x72,GB,Prime Sports Ltd,316
230100500066,Outdoors,Outdoors,Outdoor Gear,Outback Spirits Kitchen,GB,Prime Sports Ltd,316
230100500068,Outdoors,Outdoors,Outdoor Gear,Plate Picnic Deep,GB,Prime Sports Ltd,316
230100500072,Outdoors,Outdoors,Outdoor Gear,Single Full Box Madras honeycomb-weave,GB,Prime Sports Ltd,316
230100500074,Outdoors,Outdoors,Outdoor Gear,"Tent Milano Tent,4 Persons, about 4.8",GB,Prime Sports Ltd,316
230100500077,Outdoors,Outdoors,Outdoor Gear,Jl Legacy Curig I.A.Jacket,US,AllSeasons Outdoor Clothing,772
230100500080,Outdoors,Outdoors,Outdoor Gear,Jl Rainlight Essential Pants,US,AllSeasons Outdoor Clothing,772
230100500081,Outdoors,Outdoors,Outdoor Gear,Lucky Tech Classic Rain Pants,US,AllSeasons Outdoor Clothing,772
230100500082,Outdoors,Outdoors,Outdoor Gear,Lucky Tech Intergal Wp/B Rain Pants,US,AllSeasons Outdoor Clothing,772
230100500087,Outdoors,Outdoors,Outdoor Gear,Mayday Qd Zip Pants,US,Mayday Inc,4646
230100500091,Outdoors,Outdoors,Outdoor Gear,Mayday Soul Ht Jacket,US,Mayday Inc,4646
230100500092,Outdoors,Outdoors,Outdoor Gear,Mayday Sports Pullover,US,Mayday Inc,4646
230100500093,Outdoors,Outdoors,Outdoor Gear,Mayday W'S Sports Pullover,US,Mayday Inc,4646
230100500094,Outdoors,Outdoors,Outdoor Gear,"Men's Pants, Basic",US,Mayday Inc,4646
230100500095,Outdoors,Outdoors,Outdoor Gear,Men's Sports Pullover,US,Mayday Inc,4646
230100500096,Outdoors,Outdoors,Outdoor Gear,Rain Jacket,US,AllSeasons Outdoor Clothing,772
230100500101,Outdoors,Outdoors,Outdoor Gear,Ultra Ht Lightning Set,US,AllSeasons Outdoor Clothing,772
230100600003,Outdoors,Outdoors,Sleepingbags,"Sheet Sleeping Bag, Red",GB,Outback Outfitters Ltd,16422
230100600005,Outdoors,Outdoors,Sleepingbags,"Basic 10, Left , Yellow/Black",DK,Top Sports,755
230100600015,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Medium,Left,Charcoal",DK,Top Sports,755
230100600016,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Medium,Right,Charcoal",DK,Top Sports,755
230100600017,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Small,Left,Charcoal",DK,Top Sports,755
230100600018,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Small,Right,Charcoal",DK,Top Sports,755
230100600022,Outdoors,Outdoors,Sleepingbags,"Expedition10,Medium,Right,Blue Ribbon",DK,Top Sports,755
230100600023,Outdoors,Outdoors,Sleepingbags,"Expedition 10,Small,Left,Blue Ribbon",DK,Top Sports,755
230100600024,Outdoors,Outdoors,Sleepingbags,"Expedition 10,Small,Right,Blue Ribbon",DK,Top Sports,755
230100600026,Outdoors,Outdoors,Sleepingbags,"Expedition 20,Large,Right,Forestgreen",DK,Top Sports,755
230100600028,Outdoors,Outdoors,Sleepingbags,"Expedition 20,Medium,Right,Forestgreen",DK,Top Sports,755
230100600030,Outdoors,Outdoors,Sleepingbags,"Outback Sleeping Bag, Large,Left,Blue/Black",DK,Top Sports,755
230100600031,Outdoors,Outdoors,Sleepingbags,"Outback Sleeping Bag, Large,Right, Blue/Black",DK,Top Sports,755
230100600035,Outdoors,Outdoors,Sleepingbags,"Polar Bear Sleeping mat, Olive Green",GB,Outback Outfitters Ltd,16422
230100600036,Outdoors,Outdoors,Sleepingbags,Tent Summer 195 Twin Sleeping Bag,GB,Outback Outfitters Ltd,16422
230100600038,Outdoors,Outdoors,Sleepingbags,Tipee Summer Sleeping Bag,GB,Outback Outfitters Ltd,16422
230100600039,Outdoors,Outdoors,Sleepingbags,Tipee Twin Blue/Orange,GB,Outback Outfitters Ltd,16422
230100700002,Outdoors,Outdoors,Tents,Comfort Shelter,GB,Outback Outfitters Ltd,16422
230100700004,Outdoors,Outdoors,Tents,Expedition Dome 3,GB,Outback Outfitters Ltd,16422
230100700008,Outdoors,Outdoors,Tents,Family Holiday 4,SE,Petterson AB,109
230100700009,Outdoors,Outdoors,Tents,Family Holiday 6,SE,Petterson AB,109
230100700011,Outdoors,Outdoors,Tents,Hurricane 4,SE,Petterson AB,109
240100100029,Sports,Assorted Sports Articles,Assorted Sports articles,Buzz Saw,CA,CrystalClear Optics Inc,16814
240100100031,Sports,Assorted Sports Articles,Assorted Sports articles,Capsy Hood,US,Nautlius SportsWear Inc,6153
240100100063,Sports,Assorted Sports Articles,Assorted Sports articles,Grey Met.,CA,CrystalClear Optics Inc,16814
240100100065,Sports,Assorted Sports Articles,Assorted Sports articles,Grey,CA,CrystalClear Optics Inc,16814
240100100148,Sports,Assorted Sports Articles,Assorted Sports articles,Wood Box for 6 Balls,GB,Royal Darts Ltd,4514
240100100159,Sports,Assorted Sports Articles,Assorted Sports articles,A-team Smoothsport Bra,US,A Team Sports,3298
240100100184,Sports,Assorted Sports Articles,Assorted Sports articles,Barret 2.12 Men's Softboot,US,Roll-Over Inc,3815
240100100186,Sports,Assorted Sports Articles,Assorted Sports articles,Barret 3.1 Women's Softboot,US,Roll-Over Inc,3815
240100100232,Sports,Assorted Sports Articles,Assorted Sports articles,Dartsharpener Key ring,GB,Royal Darts Ltd,4514
240100100305,Sports,Assorted Sports Articles,Assorted Sports articles,Hiclass Mundo 78a 36x72mm Pink-Swirl,US,Roll-Over Inc,3815
240100100312,Sports,Assorted Sports Articles,Assorted Sports articles,Hot Mini Backboard Bulls,NL,Van Dammeren International,2995
240100100354,Sports,Assorted Sports Articles,Assorted Sports articles,Mk Splinter 66 5m 88a Pea.,PT,Magnifico Sports,1684
240100100365,Sports,Assorted Sports Articles,Assorted Sports articles,Northern Coach,GB,EA Sports Limited,12283
240100100366,Sports,Assorted Sports Articles,Assorted Sports articles,Northern Liquid Belt with Bottle,GB,EA Sports Limited,12283
240100100403,Sports,Assorted Sports Articles,Assorted Sports articles,Proskater Viablade Tx Women's Fitness,US,Roll-Over Inc,3815
240100100410,Sports,Assorted Sports Articles,Assorted Sports articles,Prosoccer  Club Football 4/32 (Replica) Synth,US,Teamsports Inc,5810
240100100433,Sports,Assorted Sports Articles,Assorted Sports articles,Shoelace White 150 Cm,US,Teamsports Inc,5810
240100100434,Sports,Assorted Sports Articles,Assorted Sports articles,Shoeshine Black,CA,CrystalClear Optics Inc,16814
240100100463,Sports,Assorted Sports Articles,Assorted Sports articles,Sparkle Spray Orange,CA,CrystalClear Optics Inc,16814
240100100477,Sports,Assorted Sports Articles,Assorted Sports articles,Stout Brass 18 Gram,GB,Royal Darts Ltd,4514
240100100508,Sports,Assorted Sports Articles,Assorted Sports articles,Top Elite Kit Small,US,Roll-Over Inc,3815
240100100535,Sports,Assorted Sports Articles,Assorted Sports articles,Victor 76 76mm Optics Blue,PT,Magnifico Sports,1684
240100100581,Sports,Assorted Sports Articles,Assorted Sports articles,Eliza T-Shirt,ES,Luna sastreria S.A.,4742
240100100605,Sports,Assorted Sports Articles,Assorted Sports articles,Fred T-Shirt,ES,Luna sastreria S.A.,4742
240100100610,Sports,Assorted Sports Articles,Assorted Sports articles,Goodtime Bag,ES,Luna sastreria S.A.,4742
240100100615,Sports,Assorted Sports Articles,Assorted Sports articles,Goodtime Toilet Bag,ES,Luna sastreria S.A.,4742
240100100646,Sports,Assorted Sports Articles,Assorted Sports articles,Lyon Men's Jacket,ES,Luna sastreria S.A.,4742
240100100654,Sports,Assorted Sports Articles,Assorted Sports articles,Montevideo Men's Shorts,ES,Luna sastreria S.A.,4742
240100100665,Sports,Assorted Sports Articles,Assorted Sports articles,Pool Shorts,ES,Luna sastreria S.A.,4742
240100100672,Sports,Assorted Sports Articles,Assorted Sports articles,Ribstop Jacket,ES,Luna sastreria S.A.,4742
240100100676,Sports,Assorted Sports Articles,Assorted Sports articles,Roth T-Shirt,ES,Luna sastreria S.A.,4742
240100100679,Sports,Assorted Sports Articles,Assorted Sports articles,Saturn Big Bag,ES,Luna sastreria S.A.,4742
240100100690,Sports,Assorted Sports Articles,Assorted Sports articles,Shirt Termir,ES,Luna sastreria S.A.,4742
240100100703,Sports,Assorted Sports Articles,Assorted Sports articles,Stream Sweatshirt with Tube,ES,Luna sastreria S.A.,4742
240100100714,Sports,Assorted Sports Articles,Assorted Sports articles,Tybor Sweatshirt with Hood,ES,Luna sastreria S.A.,4742
240100100734,Sports,Assorted Sports Articles,Assorted Sports articles,Wyoming Men's Socks,ES,Luna sastreria S.A.,4742
240100100737,Sports,Assorted Sports Articles,Assorted Sports articles,Wyoming Men's T-Shirt with V-Neck,ES,Luna sastreria S.A.,4742
240100200001,Sports,Assorted Sports Articles,Darts,Aim4it 16 Gram Softtip Pil,GB,Royal Darts Ltd,4514
240100200004,Sports,Assorted Sports Articles,Darts,Aim4it 80% Tungsten 22 Gram,GB,Royal Darts Ltd,4514
240100200014,Sports,Assorted Sports Articles,Darts,Pacific 95% 23 Gram,GB,Royal Darts Ltd,4514
240100400004,Sports,Assorted Sports Articles,Skates,Children's Roller Skates,PT,Magnifico Sports,1684
240100400005,Sports,Assorted Sports Articles,Skates,Cool Fit Men's Roller Skates,US,Twain Inc,13198
240100400006,Sports,Assorted Sports Articles,Skates,Cool Fit Women's Roller Skates,US,Twain Inc,13198
240100400037,Sports,Assorted Sports Articles,Skates,N.d.gear Roller Skates Ff80 80 millimetre78a,PT,Magnifico Sports,1684
240100400043,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's  Roller Skates,US,Twain Inc,13198
240100400044,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's Roller Skates,US,Twain Inc,13198
240100400046,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's Stunt Skates,US,Twain Inc,13198
240100400049,Sports,Assorted Sports Articles,Skates,Perfect Fit Women's Roller Skates Custom,US,Twain Inc,13198
240100400058,Sports,Assorted Sports Articles,Skates,Pro-roll Hot Rod Roller Skates,PT,Magnifico Sports,1684
240100400062,Sports,Assorted Sports Articles,Skates,Pro-roll Lazer Roller Skates,PT,Magnifico Sports,1684
240100400069,Sports,Assorted Sports Articles,Skates,Pro-roll Panga Roller Skates,PT,Magnifico Sports,1684
240100400070,Sports,Assorted Sports Articles,Skates,Pro-roll Sabotage-Rp  Roller Skates,PT,Magnifico Sports,1684
240100400076,Sports,Assorted Sports Articles,Skates,Pro-roll Sq9 80-76mm/78a Roller Skates,PT,Magnifico Sports,1684
240100400080,Sports,Assorted Sports Articles,Skates,Proskater Kitalpha Gamma Roller Skates,US,Roll-Over Inc,3815
240100400083,Sports,Assorted Sports Articles,Skates,Proskater Viablade S Roller Skates,US,Roll-Over Inc,3815
240100400085,Sports,Assorted Sports Articles,Skates,Proskater W-500 Jr.Roller Skates,US,Roll-Over Inc,3815
240100400095,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Control Xi Adult,PT,Magnifico Sports,1684
240100400098,Sports,Assorted Sports Articles,Skates,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,PT,Magnifico Sports,1684
240100400100,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Gretzky Mvp S.B.S,PT,Magnifico Sports,1684
240100400112,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Panga 72mm/78a,PT,Magnifico Sports,1684
240100400125,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq5 76mm/78a,PT,Magnifico Sports,1684
240100400128,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq7-Ls 76mm/78a,PT,Magnifico Sports,1684
240100400129,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq9 80-76mm/78a,PT,Magnifico Sports,1684
240100400136,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Xpander,PT,Magnifico Sports,1684
240100400142,Sports,Assorted Sports Articles,Skates,Twain Ac7/Ft7 Men's Roller Skates,US,Twain Inc,13198
240100400143,Sports,Assorted Sports Articles,Skates,Twain Ac7/Ft7 Women's Roller Skates,US,Twain Inc,13198
240100400147,Sports,Assorted Sports Articles,Skates,Twain Tr7 Men's Roller Skates,US,Twain Inc,13198
240100400151,Sports,Assorted Sports Articles,Skates,Weston F4 Men's Hockey Skates,US,Roll-Over Inc,3815
240200100007,Sports,Golf,Golf,Ball Bag,NL,Van Dammeren International,2995
240200100020,Sports,Golf,Golf,Red/White/Black Staff 9 Bag,GB,GrandSlam Sporting Goods Ltd,17832
240200100021,Sports,Golf,Golf,Tee Holder,NL,Van Dammeren International,2995
240200100034,Sports,Golf,Golf,Bb Softspikes - Xp 22-pack,GB,TeeTime Ltd,15938
240200100043,Sports,Golf,Golf,Bretagne Performance Tg Men's Golf Shoes L.,NL,Van Dammeren International,2995
240200100046,Sports,Golf,Golf,"Bretagne Soft-Tech Men's Glove, left",NL,Van Dammeren International,2995
240200100050,Sports,Golf,Golf,"Bretagne St2 Men's Golf Glove, left",NL,Van Dammeren International,2995
240200100051,Sports,Golf,Golf,Bretagne Stabilites 2000 Goretex Shoes,NL,Van Dammeren International,2995
240200100052,Sports,Golf,Golf,Bretagne Stabilities Tg Men's Golf Shoes,NL,Van Dammeren International,2995
240200100053,Sports,Golf,Golf,Bretagne Stabilities Women's Golf Shoes,NL,Van Dammeren International,2995
240200100056,Sports,Golf,Golf,Carolina,US,Carolina Sports,3808
240200100057,Sports,Golf,Golf,Carolina II,US,Carolina Sports,3808
240200100073,Sports,Golf,Golf,Donald Plush Headcover,GB,TeeTime Ltd,15938
240200100076,Sports,Golf,Golf,Expert Men's Firesole Driver,US,Twain Inc,13198
240200100081,Sports,Golf,Golf,Extreme Distance 90 3-pack,US,Carolina Sports,3808
240200100095,Sports,Golf,Golf,Grandslam Staff Fs Copper Insert Putter,GB,GrandSlam Sporting Goods Ltd,17832
240200100098,Sports,Golf,Golf,Grandslam Staff Grip Llh Golf Gloves,US,Carolina Sports,3808
240200100101,Sports,Golf,Golf,Grandslam Staff Tour Mhl Golf Gloves,US,Carolina Sports,3808
240200100116,Sports,Golf,Golf,Hi-fly Intimidator Ti R80/10,NL,Van Dammeren International,2995
240200100118,Sports,Golf,Golf,Hi-fly Intrepid Stand 8  Black,NL,Van Dammeren International,2995
240200100124,Sports,Golf,Golf,Hi-fly Staff Towel Blue/Black,NL,Van Dammeren International,2995
240200100131,Sports,Golf,Golf,Hi-fly Tour Advance Flex Steel,NL,Van Dammeren International,2995
240200100154,Sports,Golf,Golf,"Men's.m Men's Winter Gloves, Medium",NL,Van Dammeren International,2995
240200100157,Sports,Golf,Golf,Normal Standard,GB,TeeTime Ltd,15938
240200100164,Sports,Golf,Golf,Precision Jack 309 Lh Balata,GB,GrandSlam Sporting Goods Ltd,17832
240200100173,Sports,Golf,Golf,Proplay Executive Bi-Metal Graphite,NL,Van Dammeren International,2995
240200100180,Sports,Golf,Golf,Proplay Men's Tour Force Lp 7-Wood,NL,Van Dammeren International,2995
240200100181,Sports,Golf,Golf,Proplay Men's Tour Force Lp Driver,NL,Van Dammeren International,2995
240200100183,Sports,Golf,Golf,Proplay Men's Tour Force Ti 5w,NL,Van Dammeren International,2995
240200100207,Sports,Golf,Golf,Proplay Stand Black,NL,Van Dammeren International,2995
240200100211,Sports,Golf,Golf,Proplay Women's Tour Force 7w,NL,Van Dammeren International,2995
240200100221,Sports,Golf,Golf,Rosefinch Cart 8 1/2  Black,NL,Van Dammeren International,2995
240200100225,Sports,Golf,Golf,Rubby Men's Golf Shoes w/Goretex,ES,Rubby Zapatos S.A.,4168
240200100226,Sports,Golf,Golf,Rubby Men's Golf Shoes w/Goretex Plain Toe,ES,Rubby Zapatos S.A.,4168
240200100227,Sports,Golf,Golf,Rubby Women's Golf Shoes w/Gore-Tex,ES,Rubby Zapatos S.A.,4168
240200100230,Sports,Golf,Golf,Score Counter Scoreboard De Luxe,NL,Van Dammeren International,2995
240200100232,Sports,Golf,Golf,Tee18 Ascot Chipper,NL,Van Dammeren International,2995
240200100233,Sports,Golf,Golf,Tee18 Troon 7  Black,NL,Van Dammeren International,2995
240200100246,Sports,Golf,Golf,"White 90,Top.Flite Strata Tour 3-pack",NL,Van Dammeren International,2995
240200200007,Sports,Golf,Golf Clothes,Golf Polo(1/400),US,Mike Schaeffer Inc,7511
240200200011,Sports,Golf,Golf Clothes,Golf Windstopper,US,Mike Schaeffer Inc,7511
240200200013,Sports,Golf,Golf Clothes,Master Golf Rain Suit,US,Mike Schaeffer Inc,7511
240200200015,Sports,Golf,Golf Clothes,Tek Cap,US,Twain Inc,13198
240200200020,Sports,Golf,Golf Clothes,Big Boss Houston Pants,US,Mike Schaeffer Inc,7511
240200200024,Sports,Golf,Golf Clothes,Bogie Golf Fleece with small Zipper,US,Mike Schaeffer Inc,7511
240200200026,Sports,Golf,Golf Clothes,Eagle 5 Pocket Pants with Stretch,US,HighPoint Trading,10225
240200200035,Sports,Golf,Golf Clothes,Eagle Pants with Cross Pocket,US,HighPoint Trading,10225
240200200039,Sports,Golf,Golf Clothes,Eagle Plain Cap,US,HighPoint Trading,10225
240200200044,Sports,Golf,Golf Clothes,Eagle Polo-Shirt Interlock,US,HighPoint Trading,10225
240200200060,Sports,Golf,Golf Clothes,Eagle Windstopper Knit Neck,US,HighPoint Trading,10225
240200200061,Sports,Golf,Golf Clothes,Eagle Windstopper Sweat Neck,US,HighPoint Trading,10225
240200200068,Sports,Golf,Golf Clothes,Hi-fly Staff Rain Suit,NL,Van Dammeren International,2995
240200200071,Sports,Golf,Golf Clothes,Hi-fly Strata Cap Offwhite/Green,NL,Van Dammeren International,2995
240200200080,Sports,Golf,Golf Clothes,Release Golf Sweatshirt w/Logo(1/100),US,Mike Schaeffer Inc,7511
240200200081,Sports,Golf,Golf Clothes,Top (1/100),US,Mike Schaeffer Inc,7511
240200200091,Sports,Golf,Golf Clothes,Wind Proof Windstopper Merino/Acryl,US,HighPoint Trading,10225
240300100001,Sports,Indoor Sports,Fitness,Abdomen Shaper,NL,TrimSport B.V.,16542
240300100020,Sports,Indoor Sports,Fitness,Fitness Dumbbell Foam 0.90,NL,TrimSport B.V.,16542
240300100028,Sports,Indoor Sports,Fitness,Letour Heart Bike,NL,TrimSport B.V.,16542
240300100032,Sports,Indoor Sports,Fitness,Letour Trimag Bike,NL,TrimSport B.V.,16542
240300100046,Sports,Indoor Sports,Fitness,Weight  5.0 Kg,NL,TrimSport B.V.,16542
240300100048,Sports,Indoor Sports,Fitness,Wrist Weight 1.10 Kg,NL,TrimSport B.V.,16542
240300100049,Sports,Indoor Sports,Fitness,Wrist Weight  2.25 Kg,NL,TrimSport B.V.,16542
240300200009,Sports,Indoor Sports,Gymnastic Clothing,Blues Jazz Pants Suplex,ES,Sportico,798
240300200018,Sports,Indoor Sports,Gymnastic Clothing,Cougar Fleece Jacket with Zipper,US,SD Sporting Goods Inc,13710
240300200058,Sports,Indoor Sports,Gymnastic Clothing,Cougar Windbreaker Vest,US,SD Sporting Goods Inc,13710
240300300024,Sports,Indoor Sports,Top Trim,Men's Summer Shorts,US,Top Sports Inc,14648
240300300065,Sports,Indoor Sports,Top Trim,Top Men's Goretex Ski Pants,US,Top Sports Inc,14648
240300300070,Sports,Indoor Sports,Top Trim,Top Men's R&D Ultimate Jacket,US,Top Sports Inc,14648
240300300071,Sports,Indoor Sports,Top Trim,Top Men's Retro T-Neck,US,Top Sports Inc,14648
240300300090,Sports,Indoor Sports,Top Trim,Top R&D Long Jacket,US,Top Sports Inc,14648
240400200003,Sports,Racket Sports,Racket Sports,Bat 5-Ply,US,Carolina Sports,3808
240400200012,Sports,Racket Sports,Racket Sports,Sledgehammer 120 Ph Black,GB,GrandSlam Sporting Goods Ltd,17832
240400200022,Sports,Racket Sports,Racket Sports,Aftm 95 Vf Long Bg-65 White,GB,British Sports Ltd,1280
240400200036,Sports,Racket Sports,Racket Sports,Bag  Tit.Weekend,FR,Le Blanc S.A.,13079
240400200057,Sports,Racket Sports,Racket Sports,Grandslam Ultra Power Tennisketcher,GB,GrandSlam Sporting Goods Ltd,17832
240400200066,Sports,Racket Sports,Racket Sports,"Memhis 350,Yellow Medium, 6-pack tube",GB,British Sports Ltd,1280
240400200091,Sports,Racket Sports,Racket Sports,Smasher Rd Ti 70 Tennis Racket,GB,British Sports Ltd,1280
240400200093,Sports,Racket Sports,Racket Sports,Smasher Super Rq Ti 350 Tennis Racket,GB,British Sports Ltd,1280
240400200094,Sports,Racket Sports,Racket Sports,Smasher Super Rq Ti 700 Long Tennis,GB,British Sports Ltd,1280
240400200097,Sports,Racket Sports,Racket Sports,Smasher Tg 70 Tennis String Roll,GB,British Sports Ltd,1280
240400300013,Sports,Racket Sports,Tennis,Anthony Women's Tennis Cable Vest,US,Mayday Inc,4646
240400300033,Sports,Racket Sports,Tennis,Smasher Polo-Shirt w/V-Neck,GB,British Sports Ltd,1280
240400300035,Sports,Racket Sports,Tennis,Smasher Shorts,GB,British Sports Ltd,1280
240400300039,Sports,Racket Sports,Tennis,Smasher Tights,GB,British Sports Ltd,1280
240500100004,Sports,Running - Jogging,Jogging,Pants N,ES,Luna sastreria S.A.,4742
240500100015,Sports,Running - Jogging,Jogging,A-team Pants Taffeta,US,A Team Sports,3298
240500100017,Sports,Running - Jogging,Jogging,"A-team Sweat Round Neck, Small Logo",US,A Team Sports,3298
240500100026,Sports,Running - Jogging,Jogging,"Men's Sweat Pants without Rib, Small Logo",US,A Team Sports,3298
240500100029,Sports,Running - Jogging,Jogging,Men's Sweatshirt w/Hood Big Logo,US,A Team Sports,3298
240500100039,Sports,Running - Jogging,Jogging,Sweatshirt Women's Sweatshirt with O-Neck,US,A Team Sports,3298
240500100041,Sports,Running - Jogging,Jogging,Triffy Jacket,NL,Triffy B.V.,13314
240500100043,Sports,Running - Jogging,Jogging,Triffy Logo T-Shirt with V-Neck,NL,Triffy B.V.,13314
240500100057,Sports,Running - Jogging,Jogging,"Woman Sweat with Round Neck, Big Logo",US,A Team Sports,3298
240500100062,Sports,Running - Jogging,Jogging,Ypsilon Men's Sweatshirt w/Piping,FR,Ypsilon S.A.,14624
240500200003,Sports,Running - Jogging,Running Clothes,Men's Singlet,BE,Force Sports,5922
240500200007,Sports,Running - Jogging,Running Clothes,Running Gloves,BE,Force Sports,5922
240500200016,Sports,Running - Jogging,Running Clothes,T-Shirt,US,3Top Sports,2963
240500200042,Sports,Running - Jogging,Running Clothes,Bike.Pants Short Biking Pants,BE,Force Sports,5922
240500200056,Sports,Running - Jogging,Running Clothes,Breath-brief Long Underpants XXL,BE,Force Sports,5922
240500200073,Sports,Running - Jogging,Running Clothes,Force Classic Men's Jacket,BE,Force Sports,5922
240500200081,Sports,Running - Jogging,Running Clothes,Force Micro Men's Suit,BE,Force Sports,5922
240500200082,Sports,Running - Jogging,Running Clothes,Force Short Sprinter Men's Tights,BE,Force Sports,5922
240500200083,Sports,Running - Jogging,Running Clothes,Force Technical Jacket w/Coolmax,BE,Force Sports,5922
240500200093,Sports,Running - Jogging,Running Clothes,Maxrun Running Tights,BE,Force Sports,5922
240500200100,Sports,Running - Jogging,Running Clothes,Original Running Pants,BE,Force Sports,5922
240500200101,Sports,Running - Jogging,Running Clothes,Polar Jacket,BE,Force Sports,5922
240500200121,Sports,Running - Jogging,Running Clothes,Stout Running Shorts,BE,Force Sports,5922
240500200122,Sports,Running - Jogging,Running Clothes,Stout Running Shorts Micro,BE,Force Sports,5922
240500200130,Sports,Running - Jogging,Running Clothes,Topline Delphi Race Shorts,BE,Force Sports,5922
240600100010,Sports,Swim Sports,Bathing Suits,"Goggles, Assorted Colours",US,Nautlius SportsWear Inc,6153
240600100016,Sports,Swim Sports,Bathing Suits,Swim Suit Fabulo,US,Nautlius SportsWear Inc,6153
240600100017,Sports,Swim Sports,Bathing Suits,Swim Suit Laurel,ES,Luna sastreria S.A.,4742
240600100080,Sports,Swim Sports,Bathing Suits,Sharky Swimming Trunks,US,Dolphin Sportswear Inc,16292
240600100102,Sports,Swim Sports,Bathing Suits,Sunfit Luffa Bikini,US,Nautlius SportsWear Inc,6153
240600100181,Sports,Swim Sports,Bathing Suits,Milan Swimming Trunks,ES,Luna sastreria S.A.,4742
240600100185,Sports,Swim Sports,Bathing Suits,Pew Swimming Trunks,ES,Luna sastreria S.A.,4742
240700100001,Sports,Team Sports,American Football,Armour L,US,A Team Sports,3298
240700100004,Sports,Team Sports,American Football,Armour XL,US,A Team Sports,3298
240700100007,Sports,Team Sports,American Football,Football - Helmet M,US,A Team Sports,3298
240700100011,Sports,Team Sports,American Football,Football - Helmet Pro XL,US,A Team Sports,3298
240700100012,Sports,Team Sports,American Football,Football - Helmet S,US,A Team Sports,3298
240700100013,Sports,Team Sports,American Football,Football - Helmet XL,US,A Team Sports,3298
240700100017,Sports,Team Sports,American Football,Football Super Bowl,US,Carolina Sports,3808
240700200004,Sports,Team Sports,Baseball,Baseball Orange Small,US,Top Sports Inc,14648
240700200007,Sports,Team Sports,Baseball,Baseball White Small,US,Top Sports Inc,14648
240700200009,Sports,Team Sports,Baseball,Bat - Home Run M,US,Miller Trading Inc,15218
240700200010,Sports,Team Sports,Baseball,Bat - Home Run S,US,Miller Trading Inc,15218
240700200018,Sports,Team Sports,Baseball,Helmet L,US,Miller Trading Inc,15218
240700200019,Sports,Team Sports,Baseball,Helmet M,US,Miller Trading Inc,15218
240700200021,Sports,Team Sports,Baseball,Helmet XL,US,Miller Trading Inc,15218
240700200024,Sports,Team Sports,Baseball,Bat - Large,US,Miller Trading Inc,15218
240700300002,Sports,Team Sports,Basket Ball,Basket Ball Pro,US,HighPoint Trading,10225
240700400002,Sports,Team Sports,Soccer,Stephens Shirt,US,Teamsports Inc,5810
240700400003,Sports,Team Sports,Soccer,Red Cap,GB,SportsFan Products Ltd,6071
240700400004,Sports,Team Sports,Soccer,Red Scarf,GB,SportsFan Products Ltd,6071
240700400017,Sports,Team Sports,Soccer,Fga Home Shorts,US,Fga Sports Inc,14593
240700400020,Sports,Team Sports,Soccer,Norwood Player Shirt,US,Fga Sports Inc,14593
240700400024,Sports,Team Sports,Soccer,Prosoccer Away Shirt,US,Fga Sports Inc,14593
240700400031,Sports,Team Sports,Soccer,Soccer Fan Football Player Shirt,GB,SportsFan Products Ltd,6071
240800100026,Sports,Winter Sports,Ski Dress,Additive Women's Ski Pants Vent Air,NO,Scandinavian Clothing A/S,50
240800100039,Sports,Winter Sports,Ski Dress,Garbo Fleece Jacket,US,Miller Trading Inc,15218
240800100041,Sports,Winter Sports,Ski Dress,Helmsdale Ski Jacket,US,AllSeasons Outdoor Clothing,772
240800100042,Sports,Winter Sports,Ski Dress,Helmsdale Ski Pants,US,AllSeasons Outdoor Clothing,772
240800100074,Sports,Winter Sports,Ski Dress,Mayday Soul Pro New Tech Ski Jacket,US,Mayday Inc,4646
240800200002,Sports,Winter Sports,Winter Sports,Massif Bandit Ski Parcel Axial,FR,Massif S.A.,13199
240800200008,Sports,Winter Sports,Winter Sports,"Twain X-Scream 7.9 Ski,Sq 750 Dri",US,Twain Inc,13198
240800200009,Sports,Winter Sports,Winter Sports,Amber Cc,CA,CrystalClear Optics Inc,16814
240800200010,Sports,Winter Sports,Winter Sports,Black Morphe,CA,CrystalClear Optics Inc,16814
240800200020,Sports,Winter Sports,Winter Sports,"C.A.M.,Bone",CA,CrystalClear Optics Inc,16814
240800200021,Sports,Winter Sports,Winter Sports,Cayenne Red,CA,CrystalClear Optics Inc,16814
240800200030,Sports,Winter Sports,Winter Sports,"Ii Pmt,Bone",CA,CrystalClear Optics Inc,16814
240800200034,Sports,Winter Sports,Winter Sports,"Regulator,Stopsign",CA,CrystalClear Optics Inc,16814
240800200035,Sports,Winter Sports,Winter Sports,Shine Black PRO,CA,CrystalClear Optics Inc,16814
240800200037,Sports,Winter Sports,Winter Sports,Coolman Pro 01 Neon Yellow,US,Twain Inc,13198
240800200062,Sports,Winter Sports,Winter Sports,Top Equipe 07 Green,US,Twain Inc,13198
240800200063,Sports,Winter Sports,Winter Sports,Top Equipe 99 Black,US,Twain Inc,13198
;;;;
run;


data ORION.QTR1;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241054779,3,24,18629,18632
1241063739,1,89,18630,18631
1241066216,1,171,18631,18631
1241086052,3,53,18633,18636
1241147641,1,53,18640,18640
1241235281,1,171,18650,18657
1241244297,1,111,18651,18651
1241263172,3,3959,18652,18653
1241286432,3,27,18655,18660
1241298131,2,2806,18656,18666
1241359997,1,12,18663,18663
1241371145,1,171,18665,18665
1241390440,1,41,18667,18667
1241461856,1,18,18674,18675
1241561055,1,171,18686,18686
1241623505,3,24,18692,18695
1241645664,2,70100,18695,18699
1241652707,3,27,18695,18700
1241686210,1,10,18699,18705
1241715610,1,92,18702,18702
1241731828,1,31,18704,18704
1241789227,3,17023,18711,18716
;;;;
run;

data ORION.QTR2;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241895594,1,121051,56,18722,18726
1241909303,0,99999999,46966,18724,18725
1241930625,3,99999999,27,18726,18731
1241977403,1,120152,171,18732,18732
1242012259,1,121040,10,18735,18729
1242012269,1,121040,45,18735,18735
1242035131,1,120132,183,18738,18738
1242076538,3,99999999,31,18742,18746
1242130888,1,121086,92,18748,18748
1242140006,4,99999999,5,18749,18754
1242140009,2,99999999,90,18749,18751
1242149082,1,121032,90,18750,18750
1242159212,3,99999999,5,18751,18756
1242161468,3,99999999,2550,18751,18756
1242162201,3,99999999,46966,18752,18753
1242173926,3,99999999,1033,18753,18757
1242185055,1,120136,41,18755,18755
,3,99999999,70079,18758,18761
,1,120127,171,18760,18760
1242259863,2,99999999,70187,18763,18768
1242265757,1,121105,10,18763,18763
1242449327,3,99999999,27,18834,18834
1242458099,1,121071,10,18784,18784
1242467585,3,99999999,34,18785,18791
1242477751,3,99999999,31,18786,18790
1242493791,1,121056,5,18788,18788
1242502670,1,121067,31,18789,18789
1242515373,3,99999999,17023,18791,18796
1242534503,3,99999999,70165,18793,18800
1242557584,2,99999999,89,18795,18799
1242559569,1,120130,171,18796,18796
1242568696,2,99999999,2806,18796,18800
1242578860,2,99999999,70100,18798,18802
1242610991,1,121037,12,18801,18801
1242647539,1,121109,45,18805,18805
1242657273,1,121037,90,18806,18806
;;;;
run;

data ORION.REWARDS;
   attrib Purchased length=8 format=COMMA9.2;
   attrib Year length=8 format=4.;
   attrib Level length=$9;
   attrib Award length=$50;

   infile datalines dsd;
   input
      Purchased
      Year
      Level
      Award
   ;
datalines4;
200,2006,Silver,25% Discount on one item over $25
300,2006,Gold,15% Discount on one order over $50
500,2006,Platinum,10% Discount on all 2007 purchases
225,2007,Silver,25% Discount on one item over $50
350,2007,Gold,15% Discount on one order over $100
600,2007,Platinum,10% Discount on all 2008 purchases
;;;;
run;

data ORION.SALES;
   attrib Employee_ID length=8 format=12.;
   attrib First_Name length=$12;
   attrib Last_Name length=$18;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Job_Title length=$25;
   attrib Country length=$2;
   attrib Birth_Date length=8;
   attrib Hire_Date length=8;

   infile datalines dsd;
   input
      Employee_ID
      First_Name
      Last_Name
      Gender
      Salary
      Job_Title
      Country
      Birth_Date
      Hire_Date
   ;
datalines4;
120102,Tom,Zhou,M,108255,Sales Manager,AU,4971,12205
120103,Wilson,Dawes,M,87975,Sales Manager,AU,-2535,6575
120121,Irenie,Elvish,F,26600,Sales Rep. II,AU,-4169,6575
120122,Christina,Ngan,F,27475,Sales Rep. II,AU,-523,8217
120123,Kimiko,Hotstone,F,26190,Sales Rep. I,AU,3193,10866
120124,Lucian,Daymond,M,26480,Sales Rep. I,AU,1228,8460
120125,Fong,Hofmeister,M,32040,Sales Rep. IV,AU,-391,8460
120126,Satyakam,Denny,M,26780,Sales Rep. II,AU,11951,18475
120127,Sharryn,Clarkson,F,28100,Sales Rep. II,AU,8404,15645
120128,Monica,Kletschkus,F,30890,Sales Rep. IV,AU,11152,18567
120129,Alvin,Roebuck,M,30070,Sales Rep. III,AU,3248,10866
120130,Kevin,Lyon,M,26955,Sales Rep. I,AU,10575,18383
120131,Marinus,Surawski,M,26910,Sales Rep. I,AU,8668,17167
120132,Fancine,Kaiser,F,28525,Sales Rep. III,AU,-2462,8309
120133,Petrea,Soltau,F,27440,Sales Rep. II,AU,11069,18536
120134,Sian,Shannan,M,28015,Sales Rep. II,AU,-2400,6575
120135,Alexei,Platts,M,32490,Sales Rep. IV,AU,4774,15249
120136,Atul,Leyden,M,26605,Sales Rep. I,AU,8659,17198
120137,Marina,Iyengar,F,29715,Sales Rep. III,AU,8471,18322
120138,Shani,Duckett,F,25795,Sales Rep. I,AU,8592,18444
120139,Fang,Wilson,F,26810,Sales Rep. II,AU,11187,18506
120140,Michael,Minas,M,26970,Sales Rep. I,AU,11903,18536
120141,Amanda,Liebman,F,27465,Sales Rep. II,AU,11759,18383
120142,Vincent,Eastley,M,29695,Sales Rep. III,AU,11122,18444
120143,Phu,Sloey,M,26790,Sales Rep. II,AU,1232,9770
120144,Viney,Barbis,M,30265,Sales Rep. III,AU,11023,18536
120145,Sandy,Aisbitt,M,26060,Sales Rep. II,AU,2943,10744
120146,Wendall,Cederlund,M,25985,Sales Rep. I,AU,1370,8979
120147,Skev,Rusli,F,26580,Sales Rep. II,AU,11706,18536
120148,Michael,Zubak,M,28480,Sales Rep. III,AU,-2301,8187
120149,Judy,Chantharasy,F,26390,Sales Rep. I,AU,6899,13515
120150,John,Filo,M,29965,Sales Rep. III,AU,-541,9709
120151,Julianna,Phaiyakounh,F,26520,Sales Rep. II,AU,-4058,6575
120152,Sean,Dives,M,26515,Sales Rep. I,AU,8521,17988
120153,Samantha,Waal,F,27260,Sales Rep. I,AU,8527,15341
120154,Caterina,Hayawardhana,F,30490,Sales Rep. III,AU,-4182,6575
120155,Narelle,James,F,29990,Sales Rep. III,AU,10339,18353
120156,Gerry,Snellings,F,26445,Sales Rep. I,AU,11932,18322
120157,Leonid,Karavdic,M,27860,Sales Rep. II,AU,11009,18597
120158,Daniel,Pilgrim,M,36605,Sales Rep. III,AU,3117,11504
120159,Lynelle,Phoumirath,F,30765,Sales Rep. IV,AU,2976,11139
120160,Chuck,Segrave,M,27115,Sales Rep. I,AU,-479,6848
120161,Rosette,Martines,F,30785,Sales Rep. III,AU,11754,18536
120162,Randal,Scordia,M,27215,Sales Rep. I,AU,11936,18294
120163,Brett,Magrath,M,26735,Sales Rep. II,AU,3064,12784
120164,Ranj,Stamalis,F,27450,Sales Rep. II,AU,1425,9528
120165,Tadashi,Pretorius,M,27050,Sales Rep. I,AU,10305,18322
120166,Fadi,Nowd,M,30660,Sales Rep. IV,AU,-4218,6575
120167,Kimiko,Tilley,F,25185,Sales Rep. I,AU,-607,6606
120168,Selina,Barcoe,F,25275,Sales Rep. I,AU,10310,18567
120169,Cos,Tannous,M,28135,Sales Rep. III,AU,10228,18383
120170,Alban,Kingston,M,28830,Sales Rep. III,AU,6630,13423
120171,Alena,Moody,F,26205,Sales Rep. II,AU,10427,18506
120172,Edwin,Comber,M,28345,Sales Rep. III,AU,-4292,6575
120173,Hernani,Osborn,M,26715,Sales Rep. I,AU,-677,7822
120174,Doungkamol,Simms,F,26850,Sales Rep. I,AU,-4374,6575
120175,Andrew,Conolly,M,25745,Sales Rep. I,AU,11918,18536
120176,Koavea,Pa,M,26095,Sales Rep. I,AU,11270,18567
120177,Franca,Kierce,F,28745,Sales Rep. III,AU,8495,15372
120178,Billy,Plested,M,26165,Sales Rep. II,AU,-404,6665
120179,Matsuoka,Wills,M,28510,Sales Rep. III,AU,6648,17532
120180,Vino,George,M,26970,Sales Rep. II,AU,-553,8370
120198,Meera,Body,F,28025,Sales Rep. III,AU,11708,18597
120261,Harry,Highpoint,M,243190,Chief Sales Officer,US,4800,11535
121018,Julienne,Magolan,F,27560,Sales Rep. II,US,-4381,6575
121019,Scott,Desanctis,M,31320,Sales Rep. IV,US,11133,17684
121020,Cherda,Ridley,F,31750,Sales Rep. IV,US,10280,16922
121021,Priscilla,Farren,F,32985,Sales Rep. IV,US,6918,13939
121022,Robert,Stevens,M,32210,Sales Rep. IV,US,8701,16833
121023,Shawn,Fuller,M,26010,Sales Rep. I,US,2994,12174
121024,Michael,Westlund,M,26600,Sales Rep. II,US,10491,17653
121025,Barnaby,Cassey,M,28295,Sales Rep. II,US,-2274,7183
121026,Terrill,Jaime,M,31515,Sales Rep. IV,US,11269,18353
121027,Allan,Rudder,M,26165,Sales Rep. II,US,3047,12388
121028,William,Smades,M,26585,Sales Rep. I,US,11805,18567
121029,Kuo-Chung,Mcelwee,M,27225,Sales Rep. I,US,3278,12388
121030,Jeryl,Areu,M,26745,Sales Rep. I,US,8716,16468
121031,Scott,Filan,M,28060,Sales Rep. III,US,3112,10805
121032,Nasim,Smith,M,31335,Sales Rep. IV,US,11742,18322
121033,Kristie,Snitzer,F,29775,Sales Rep. III,US,11267,17684
121034,John,Kirkman,M,27110,Sales Rep. II,US,11923,18628
121035,James,Blackley,M,26460,Sales Rep. II,US,-4299,6575
121036,Teresa,Mesley,F,25965,Sales Rep. I,US,11887,17440
121037,Muthukumar,Miketa,M,28310,Sales Rep. III,US,6737,16861
121038,David,Anstey,M,25285,Sales Rep. I,US,11731,18475
121039,Donald,Washington,M,27460,Sales Rep. II,US,-577,8887
121040,Brienne,Darrohn,F,29525,Sales Rep. III,US,1282,9801
121041,Jaime,Wetherington,F,26120,Sales Rep. II,US,-4349,6575
121042,Joseph,Robbin-Coker,M,28845,Sales Rep. III,US,8494,16010
121043,Sigrid,Kagarise,F,28225,Sales Rep. II,US,5061,13209
121044,Ray,Abbott,M,25660,Sales Rep. I,US,-386,7152
121045,Cascile,Hampton,F,28560,Sales Rep. II,US,3086,13880
121046,Roger,Mandzak,M,25845,Sales Rep. I,US,10477,18444
121047,Karen,Grzebien,F,25820,Sales Rep. I,US,8730,18506
121048,Lawrie,Clark,F,26560,Sales Rep. I,US,10402,18506
121049,Perrior,Bataineh,F,26930,Sales Rep. I,US,11002,18597
121050,Patricia,Capristo-Abramczyk,F,26080,Sales Rep. II,US,10969,18597
121051,Glorina,Myers,F,26025,Sales Rep. I,US,-2435,8340
121052,Richard,Fay,M,26900,Sales Rep. II,US,10966,18567
121053,Tywanna,Mcdade,F,29955,Sales Rep. III,US,-4117,6606
121054,Daniel,Pulliam,M,29805,Sales Rep. III,US,-415,7610
121055,Clement,Davis,M,30185,Sales Rep. III,US,11695,18475
121056,Stacey,Lyszyk,F,28325,Sales Rep. II,US,10413,17287
121057,Tachaun,Voron,M,25125,Sales Rep. I,US,1455,9101
121058,Del,Kohake,M,26270,Sales Rep. I,US,6767,17075
121059,Jacqulin,Carhide,F,27425,Sales Rep. II,US,1393,9222
121060,Elizabeth,Spofford,F,28800,Sales Rep. III,US,-4224,6575
121061,Lauris,Hassam,M,29815,Sales Rep. III,US,-534,10409
121062,Debra,Armant,F,30305,Sales Rep. IV,US,10528,18475
121063,Regi,Kinol,M,35990,Sales Rep. II,US,8608,18110
121064,Asishana,Polky,M,25110,Sales Rep. I,US,2949,13027
121065,Corneille,Malta,F,28040,Sales Rep. III,US,10475,18353
121066,Ceresh,Norman,F,27250,Sales Rep. II,US,-4148,6575
121067,Jeanilla,Macnair,F,31865,Sales Rep. IV,US,10975,18322
121068,Salaheloin,Osuba,M,27550,Sales Rep. II,US,5084,13393
121069,Jason,Lapsley,M,26195,Sales Rep. II,US,4826,12692
121070,Agnieszka,Holthouse,F,29385,Sales Rep. III,US,10535,18294
121071,John,Hoppmann,M,28625,Sales Rep. III,US,1348,7914
121072,Christer,North,M,26105,Sales Rep. I,US,8410,17776
121073,Donald,Court,M,27100,Sales Rep. I,US,-2422,6575
121074,Eric,Michonski,M,26990,Sales Rep. I,US,1155,11962
121075,Kasha,Sugg,F,28395,Sales Rep. II,US,-4026,6575
121076,Micah,Cobb,M,26685,Sales Rep. II,US,3204,9862
121077,Bryce,Smotherly,M,28585,Sales Rep. III,US,10475,18536
121078,Lionel,Wende,M,27485,Sales Rep. I,US,-2436,8340
121079,Azmi,Mees,M,25770,Sales Rep. I,US,6728,15280
121080,Kumar,Chinnis,M,32235,Sales Rep. I,US,1119,11566
121081,Susie,Knudson,F,30235,Sales Rep. III,US,-2470,7396
121082,Richard,Debank,M,28510,Sales Rep. III,US,-2371,7944
121083,Tingmei,Sutton,F,27245,Sales Rep. I,US,1165,8460
121084,Tulsidas,Ould,M,22710,Sales Rep. I,US,3150,12784
121085,Rebecca,Huslage,M,32235,Sales Rep. IV,US,11273,18628
121086,John-Michael,Plybon,M,26820,Sales Rep. I,US,-4033,6575
121087,Virtina,O'Suilleabhain,F,28325,Sales Rep. II,US,6915,15765
121088,Momolu,Kernitzki,M,27240,Sales Rep. I,US,11849,18628
121089,Gregory,Sauder,M,28095,Sales Rep. II,US,-498,6756
121090,Betty,Klibbe,F,26600,Sales Rep. I,US,-561,8797
121091,Ernest,Kadiri,M,27325,Sales Rep. II,US,4798,12054
121092,Gynell,Pritt,F,25680,Sales Rep. I,US,6641,17014
121093,Carl,Vasconcellos,M,27410,Sales Rep. I,US,3121,13880
121094,Larry,Tate,M,26555,Sales Rep. I,US,-724,8279
121095,Sara,Kratzke,F,28010,Sales Rep. II,US,4852,12965
121096,Robert,Newstead,M,26335,Sales Rep. I,US,4886,14365
121097,Willeta,Chernega,F,26830,Sales Rep. II,US,6870,14518
121098,Hal,Heatwole,M,27475,Sales Rep. I,US,11769,18383
121099,Royall,Mrvichin,M,32725,Sales Rep. IV,US,8478,16192
121100,Tzue-Ing,Cormell,M,28135,Sales Rep. II,US,-2440,7396
121101,Burnetta,Buckner,F,25390,Sales Rep. I,US,11197,18567
121102,Rocheal,Flammia,F,27115,Sales Rep. I,US,8577,18414
121103,Brian,Farnsworth,M,27260,Sales Rep. I,US,11806,18506
121104,Leoma,Johnson,F,28315,Sales Rep. II,US,3238,11048
121105,Jessica,Savacool,F,29545,Sales Rep. III,US,8529,17167
121106,James,Hilburger,M,25880,Sales Rep. I,US,4781,14641
121107,Rose,Anger,F,31380,Sales Rep. IV,US,11071,18444
121108,Libby,Levi,F,25930,Sales Rep. I,US,11873,18567
121109,Harold,Boulus,M,26035,Sales Rep. I,US,5057,12539
121135,Tammy,Ruta,F,27010,Sales Rep. I,US,-573,6787
121136,Lesia,Galarneau,F,27460,Sales Rep. I,US,6770,17136
121137,Michael. R.,Boocks,M,27055,Sales Rep. I,US,11705,18353
121138,Hershell,Tolley,M,27265,Sales Rep. I,US,-2498,6575
121139,Diosdado,Mckee,F,27700,Sales Rep. II,US,1326,11504
121140,Saunders,Briggi,M,26335,Sales Rep. I,US,8423,16527
121143,Louis,Favaron,M,95090,Senior Sales Manager,US,5078,15157
121144,Renee,Capachietti,F,83505,Sales Manager,US,3101,13088
121145,Dennis,Lansberry,M,84260,Sales Manager,US,-2231,7396
;;;;
run;

data ORION.SALESSTAFF;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Job_Title length=$25 label='Employee Job Title';
   attrib Salary length=8 label='Employee Annual Salary' format=DOLLAR12.;
   attrib Gender length=$1 label='Employee Gender';
   attrib Birth_Date length=8 label='Employee Birth Date' format=DATE9.;
   attrib Emp_Hire_Date length=8 label='Employee Hire Date' format=DATE9. informat=DATE9.;
   attrib Emp_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=DATE9.
;
   attrib Manager_ID length=8 label='Manager for Employee' format=12.;
   attrib SSN length=$16;
   attrib Employee_Name length=$40;

   infile datalines dsd;
   input
      Employee_ID
      Job_Title
      Salary
      Gender
      Birth_Date
      Emp_Hire_Date:BEST32.
      Emp_Term_Date:BEST32.
      Manager_ID
      SSN
      Employee_Name
   ;
datalines4;
120121,Sales Rep. II,26600,F,-4169,6575,,120102,42-8321-982,"Elvish, Irenie"
120134,Sales Rep. II,28015,M,-2400,6575,18443,120102,905-76-7767,"Shannan, Sian"
120151,Sales Rep. II,26520,F,-4058,6575,,120103,798-16-4924,"Phaiyakounh, Julianna"
120154,Sales Rep. III,30490,F,-4182,6575,,120102,534-14-1428,"Hayawardhana, Caterina"
120166,Sales Rep. IV,30660,M,-4218,6575,18505,120102,878-79-9390,"Nowd, Fadi"
120172,Sales Rep. III,28345,M,-4292,6575,,120102,801-5A-3640,"Comber, Edwin"
120174,Sales Rep. I,26850,F,-4374,6575,18200,120102,693-17-9406,"Simms, Doungkamol"
121018,Sales Rep. II,27560,F,-4381,6575,17286,121144,712-79-3016,"Magolan, Julienne"
121035,Sales Rep. II,26460,M,-4299,6575,,121144,305-03-6563,"Blackley, James"
121041,Sales Rep. II,26120,F,-4349,6575,,121144,114-96-2569,"Wetherington, Jaime"
121060,Sales Rep. III,28800,F,-4224,6575,,121143,749-47-4742,"Spofford, Elizabeth"
121066,Sales Rep. II,27250,F,-4148,6575,18201,121145,915-59-7961,"Norman, Ceresh"
121073,Sales Rep. I,27100,M,-2422,6575,,121145,219-68-2436abc,"Court, Donald"
121075,Sales Rep. II,28395,F,-4026,6575,,121145,161-74-5004,"Sugg, Kasha"
121086,Sales Rep. I,26820,M,-4033,6575,,121143,248-50-7517,"Plybon, John-Michael"
121138,Sales Rep. I,27265,M,-2498,6575,,121145,424-44-6422,"Tolley, Hershell"
120167,Sales Rep. I,25185,F,-607,6606,18352,120102,139-34-1780,"Tilley, Kimiko"
121053,Sales Rep. III,29955,F,-4117,6606,,121143,973-70-5198,"Mcdade, Tywanna"
120178,Sales Rep. II,26165,M,-404,6665,,120102,276-86-7310,"Plested, Billy"
121089,Sales Rep. II,28095,M,-498,6756,18566,121143,963-87-3695,"Sauder, Gregory"
121135,Sales Rep. I,27010,F,-573,6787,,121145,075-30-2918,"Ruta, Tammy"
120160,Sales Rep. I,27115,M,-479,6848,,120102,421-02-5121,"Segrave, Chuck"
121044,Sales Rep. I,25660,M,-386,7152,,121144,045-87-4776,"Abbott, Ray"
121025,Sales Rep. II,28295,M,-2274,7183,,121144,438-56-4418,"Cassey, Barnaby"
121081,Sales Rep. III,30235,F,-2470,7396,,121143,,"Knudson, Susie"
121100,Sales Rep. II,28135,M,-2440,7396,,121143,737-47-5975,"Cormell, Tzue-Ing"
121054,Sales Rep. III,29805,M,-415,7610,,121143,864-48-5995,"Pulliam, Daniel"
120173,Sales Rep. I,26715,M,-677,7822,17744,120102,546-22-9687,"Osborn, Hernani"
121071,Sales Rep. III,28625,M,1348,7914,,121145,556-65-5330,"Hoppmann, John"
121082,Sales Rep. III,28510,M,-2371,7944,,121143,609-81-9148,"Debank, Richard"
120148,Sales Rep. III,28480,M,-2301,8187,,120103,510-00-1866,"Zubak, Michael"
120122,Sales Rep. II,27475,F,-523,8217,,120102,089-47-5114,"Ngan, Christina"
121094,Sales Rep. I,26555,M,-724,8279,,121143,967-49-0193,"Tate, Larry"
120132,Sales Rep. III,28525,F,-2462,8309,,120102,456-22-3493,"Kaiser, Fancine"
121051,Sales Rep. I,26025,F,-2435,8340,,121143,968-92-3216,"Myers, Glorina"
121078,Sales Rep. I,27485,M,-2436,8340,,121143,242-70-4182,"Wende, Lionel"
120180,Sales Rep. II,26970,M,-553,8370,,120102,918-93-7071,"George, Vino"
120124,Sales Rep. I,26480,M,1228,8460,,120102,097-92-8395,"Daymond, Lucian"
120125,Sales Rep. IV,32040,M,-391,8460,17744,120102,257-58-1087,"Hofmeister, Fong"
121083,Sales Rep. I,27245,F,1165,8460,,121143,008-09-5291,"Sutton, Tingmei"
121090,Sales Rep. I,26600,F,-561,8797,,121143,607-53-3101,"Klibbe, Betty"
121039,Sales Rep. II,27460,M,-577,8887,,121144,561-54-0481,"Washington, Donald"
120146,Sales Rep. I,25985,M,1370,8979,18170,120103,713-92-9598,"Cederlund, Wendall"
121057,Sales Rep. I,25125,M,1455,9101,,121143,007-21-6147,"Voron, Tachaun"
121059,Sales Rep. II,27425,F,1393,9222,17531,121143,107-05-5563,"Carhide, Jacqulin"
120164,Sales Rep. II,27450,F,1425,9528,,120102,347-93-6206,"Stamalis, Ranj"
120150,Sales Rep. III,29965,M,-541,9709,17652,120103,234-49-7560,"Filo, John"
120143,Sales Rep. II,26790,M,1232,9770,,120103,255-77-5079,"Sloey, Phu"
121040,Sales Rep. III,29525,F,1282,9801,,121144,985-86-9431,"Darrohn, Brienne"
121076,Sales Rep. II,26685,M,3204,9862,17683,121143,389-24-3331,"Cobb, Micah"
121061,Sales Rep. III,29815,M,-534,10409,,121143,634-40-1176,"Hassam, Lauris"
120145,Sales Rep. II,26060,M,2943,10744,,120103,124-00-2425,"Aisbitt, Sandy"
121031,Sales Rep. III,28060,M,3112,10805,,121144,381-39-1694,"Filan, Scott"
120123,Sales Rep. I,26190,F,3193,10866,17928,120102,383-19-3715,"Hotstone, Kimiko"
120129,Sales Rep. III,30070,M,3248,10866,17256,120102,445-82-8341,"Roebuck, Alvin"
121104,Sales Rep. II,28315,F,3238,11048,16832,121143,061-33-7488,"Johnson, Leoma"
120159,Sales Rep. IV,30765,F,2976,11139,,120102,534-77-3294,"Phoumirath, Lynelle"
120158,Sales Rep. III,36605,M,3117,11504,18140,120102,977-60-2710,"Pilgrim, Daniel"
121139,Sales Rep. II,27700,F,1326,11504,,121145,451-61-9583,"Mckee, Diosdado"
121080,Sales Rep. I,32235,M,1119,11566,,121143,086-57-3574,"Chinnis, Kumar"
121074,Sales Rep. I,26990,M,1155,11962,,121145,855-53-1211,"Michonski, Eric"
121091,Sales Rep. II,27325,M,4798,12054,,121143,882-12-1413,"Kadiri, Ernest"
121023,Sales Rep. I,26010,M,2994,12174,18140,121144,520-53-3109,"Fuller, Shawn"
121027,Sales Rep. II,26165,M,3047,12388,,121144,829-83-4727,"Rudder, Allan"
121029,Sales Rep. I,27225,M,3278,12388,,121144,153-16-2789,"Mcelwee, Kuo-Chung"
121109,Sales Rep. I,26035,M,5057,12539,,121143,481-31-7308,"Boulus, Harold"
121069,Sales Rep. II,26195,M,4826,12692,,121145,872-69-3273,"Lapsley, Jason"
120163,Sales Rep. II,26735,M,3064,12784,,120102,706-28-4290,"Magrath, Brett"
121084,Sales Rep. I,22710,M,3150,12784,,121143,534-92-2128,"Ould, Tulsidas"
121095,Sales Rep. II,28010,F,4852,12965,,121143,175-95-9594,"Kratzke, Sara"
121064,Sales Rep. I,25110,M,2949,13027,,121145,163-54-3966,"Polky, Asishana"
121043,Sales Rep. II,28225,F,5061,13209,,121144,060-88-3887,"Kagarise, Sigrid"
121068,Sales Rep. II,27550,M,5084,13393,,121145,110-80-4309,"Osuba, Salaheloin"
120170,Sales Rep. III,28830,M,6630,13423,18566,120102,574-43-1404,"Kingston, Alban"
120149,Sales Rep. I,26390,F,6899,13515,,120103,905-60-3585,"Chantharasy, Judy"
121045,Sales Rep. II,28560,F,3086,13880,17591,121143,788-63-2249,"Hampton, Cascile"
121093,Sales Rep. I,27410,M,3121,13880,17347,121143,482-57-1127,"Vasconcellos, Carl"
121021,Sales Rep. IV,32985,F,6918,13939,,121144,337-71-9456,"Farren, Priscilla"
121096,Sales Rep. I,26335,M,4886,14365,,121143,810-60-4039,"Newstead, Robert"
121097,Sales Rep. II,26830,F,6870,14518,,121143,hello219-68-1098,"Chernega, Willeta"
121106,Sales Rep. I,25880,M,4781,14641,,121143,206-54-7999,"Hilburger, James"
120135,Sales Rep. IV,32490,M,4774,15249,17652,120102,967-44-0288,"Platts, Alexei"
121079,Sales Rep. I,25770,M,6728,15280,,121143,369-24-2683,"Mees, Azmi"
120153,Sales Rep. I,27260,F,8527,15341,18293,120102,117-57-5009,"Waal, Samantha"
120177,Sales Rep. III,28745,F,8495,15372,,120102,349-07-2227,"Kierce, Franca"
120127,Sales Rep. II,28100,F,8404,15645,,120102,036-29-9667,"Clarkson, Sharryn"
121087,Sales Rep. II,28325,F,6915,15765,18352,121143,788-14-2460,"O'Suilleabhain, Virtina"
121042,Sales Rep. III,28845,M,8494,16010,,121144,888-84-0152,"Robbin-Coker, Joseph"
121099,Sales Rep. IV,32725,M,8478,16192,,121143,658-54-7772,"Mrvichin, Royall"
121030,Sales Rep. I,26745,M,8716,16468,,121144,523-63-5913,"Areu, Jeryl"
121140,Sales Rep. I,26335,M,8423,16527,18293,121145,084-08-6174,"Briggi, Saunders"
121022,Sales Rep. IV,32210,M,8701,16833,17775,121144,355-45-0392,"Stevens, Robert"
121037,Sales Rep. III,28310,M,6737,16861,,121144,295-70-7059,"Miketa, Muthukumar"
121020,Sales Rep. IV,31750,F,10280,16922,,121144,703-63-9068,"Ridley, Cherda"
121092,Sales Rep. I,25680,F,6641,17014,,121143,447-78-9329,"Pritt, Gynell"
121058,Sales Rep. I,26270,M,6767,17075,,121143,821-15-1683,"Kohake, Del"
121136,Sales Rep. I,27460,F,6770,17136,17805,121145,954-18-9609,"Galarneau, Lesia"
120131,Sales Rep. I,26910,M,8668,17167,,120102,039-11-6094,"Surawski, Marinus"
121105,Sales Rep. III,29545,F,8529,17167,,121143,085-13-8459,"Savacool, Jessica"
120136,Sales Rep. I,26605,M,8659,17198,,120102,737-35-1762,"Leyden, Atul"
121056,Sales Rep. II,28325,F,10413,17287,,121143,823-65-9311,"Lyszyk, Stacey"
121036,Sales Rep. I,25965,F,11887,17440,18201,121144,314-13-2259,"Mesley, Teresa"
120179,Sales Rep. III,28510,M,6648,17532,17775,120102,728-25-9828,"Wills, Matsuoka"
121024,Sales Rep. II,26600,M,10491,17653,,121144,716-97-6713,"Westlund, Michael"
121019,Sales Rep. IV,31320,M,11133,17684,18109,121144,027-00-3578,"Desanctis, Scott"
121033,Sales Rep. III,29775,F,11267,17684,,121144,274-77-8534,"Snitzer, Kristie"
121072,Sales Rep. I,26105,M,8410,17776,18201,121145,802-74-3703,"North, Christer"
120152,Sales Rep. I,26515,M,8521,17988,,120102,148-75-5338,"Dives, Sean"
121063,Sales Rep. II,35990,M,8608,18110,,121145,729-96-4035,"Kinol, Regi"
120162,Sales Rep. I,27215,M,11936,18294,,120102,943-43-0183,"Scordia, Randal"
121070,Sales Rep. III,29385,F,10535,18294,,121145,728-21-7433,"Holthouse, Agnieszka"
120137,Sales Rep. III,29715,F,8471,18322,,120102,402-94-7709,"Iyengar, Marina"
120156,Sales Rep. I,26445,F,11932,18322,,120102,772-99-2367,"Snellings, Gerry"
120165,Sales Rep. I,27050,M,10305,18322,,120102,181-00-5355,"Pretorius, Tadashi"
121032,Sales Rep. IV,31335,M,11742,18322,,121144,910-64-2664,"Smith, Nasim"
121067,Sales Rep. IV,31865,F,10975,18322,18506,121145,294-60-9411,"Macnair, Jeanilla"
120155,Sales Rep. III,29990,F,10339,18353,,120102,640-85-7012,"James, Narelle"
121026,Sales Rep. IV,31515,M,11269,18353,,121144,162-30-9249,"Jaime, Terrill"
121065,Sales Rep. III,28040,F,10475,18353,,121145,557-40-7901,"Malta, Corneille"
121137,Sales Rep. I,27055,M,11705,18353,,121145,876-12-1631,"Boocks, Michael. R."
120130,Sales Rep. I,26955,M,10575,18383,,120102,143-12-4676,"Lyon, Kevin"
120141,Sales Rep. II,27465,F,11759,18383,,120103,283-90-3049,"Liebman, Amanda"
120169,Sales Rep. III,28135,M,10228,18383,,120102,966-26-7530,"Tannous, Cos"
121098,Sales Rep. I,27475,M,11769,18383,,121143,080-66-5221,"Heatwole, Hal"
121102,Sales Rep. I,27115,F,8577,18414,,121143,657-70-9638,"Flammia, Rocheal"
120138,Sales Rep. I,25795,F,8592,18444,,120102,373-16-4566,"Duckett, Shani"
120142,Sales Rep. III,29695,M,11122,18444,,120103,350-61-1042,"Eastley, Vincent"
121046,Sales Rep. I,25845,M,10477,18444,18628,121143,921-73-4364,"Mandzak, Roger"
121107,Sales Rep. IV,31380,F,11071,18444,,121143,778-29-5999,"Anger, Rose"
120126,Sales Rep. II,26780,M,11951,18475,,120102,088-24-9595,"Denny, Satyakam"
121038,Sales Rep. I,25285,M,11731,18475,18659,121144,366-10-0075,"Anstey, David"
121055,Sales Rep. III,30185,M,11695,18475,,121143,174-95-3655,"Davis, Clement"
121062,Sales Rep. IV,30305,F,10528,18475,,121145,957-64-2816,"Armant, Debra"
120139,Sales Rep. II,26810,F,11187,18506,,120102,327-84-0220,"Wilson, Fang"
120171,Sales Rep. II,26205,F,10427,18506,,120102,314-53-2123,"Moody, Alena"
121047,Sales Rep. I,25820,F,8730,18506,18687,121143,856-23-7556,"Grzebien, Karen"
121048,Sales Rep. I,26560,F,10402,18506,18687,121143,410-21-8164,"Clark, Lawrie"
121103,Sales Rep. I,27260,M,11806,18506,,121143,862-19-2330,"Farnsworth, Brian"
120133,Sales Rep. II,27440,F,11069,18536,,120102,088-57-9593,"Soltau, Petrea"
120140,Sales Rep. I,26970,M,11903,18536,,120103,510-27-7886,"Minas, Michael"
120144,Sales Rep. III,30265,M,11023,18536,,120103,436-40-3617,"Barbis, Viney"
120147,Sales Rep. II,26580,F,11706,18536,,120103,002-76-2169,"Rusli, Skev"
120161,Sales Rep. III,30785,F,11754,18536,,120102,493-21-1108,"Martines, Rosette"
120175,Sales Rep. I,25745,M,11918,18536,,120102,602-65-4238,"Conolly, Andrew"
121077,Sales Rep. III,28585,M,10475,18536,,121143,445-56-8520,"Smotherly, Bryce"
120128,Sales Rep. IV,30890,F,11152,18567,,120102,107-58-5960,"Kletschkus, Monica"
120168,Sales Rep. I,25275,F,10310,18567,,120102,315-91-4521,"Barcoe, Selina"
120176,Sales Rep. I,26095,M,11270,18567,,120102,248-57-5992,"Pa, Koavea"
121028,Sales Rep. I,26585,M,11805,18567,,121144,732-94-3985,"Smades, William"
121052,Sales Rep. II,26900,M,10966,18567,,121143,063-51-7196,"Fay, Richard"
121101,Sales Rep. I,25390,F,11197,18567,,121143,428-59-7468,"Buckner, Burnetta"
121108,Sales Rep. I,25930,F,11873,18567,18748,121143,076-69-8811,"Levi, Libby"
120157,Sales Rep. II,27860,M,11009,18597,,120102,546-36-2811,"Karavdic, Leonid"
120198,Sales Rep. III,28025,F,11708,18597,,120103,619-59-4011,"Body, Meera"
121049,Sales Rep. I,26930,F,11002,18597,,121143,008-90-9458,"Bataineh, Perrior"
121050,Sales Rep. II,26080,F,10969,18597,,121143,941-62-4741,"Capristo-Abramczyk, Patricia"
120146,Sales Rep. II,27284.25,M,1370,18628,,120103,713-92-9598,"Cederlund, Wendall"
121034,Sales Rep. II,27110,M,11923,18628,,121144,590-47-7664,"Kirkman, John"
121085,Sales Rep. IV,32235,M,11273,18628,,121143,157-59-1652,"Huslage, Rebecca"
121088,Sales Rep. I,27240,M,11849,18628,,121143,701-31-9529,"Kernitzki, Momolu"
120134,Sales Rep. II,29415.75,M,-2400,18962,,120102,905-76-7767,"Shannan, Sian"
120166,Sales Rep. II,32193,M,-4218,18962,,120102,878-79-9390,"Nowd, Fadi"
120167,Sales Rep. II,26444.25,F,-607,18962,,120102,139-34-1780,"Tilley, Kimiko"
;;;;
run;

data ORION.STAFF;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Job_Title length=$25 label='Employee Job Title';
   attrib Salary length=8 label='Employee Annual Salary' format=DOLLAR12.;
   attrib Gender length=$1 label='Employee Gender';
   attrib Birth_Date length=8 label='Employee Birth Date' format=DATE9.;
   attrib Emp_Hire_Date length=8 label='Employee Hire Date' format=DATE9. informat=DATE9.;
   attrib Emp_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=DATE9.
;
   attrib Manager_ID length=8 label='Manager for Employee' format=12.;

   infile datalines dsd;
   input
      Employee_ID
      Start_Date
      End_Date
      Job_Title
      Salary
      Gender
      Birth_Date
      Emp_Hire_Date:BEST32.
      Emp_Term_Date:BEST32.
      Manager_ID
   ;
datalines4;
120101,17348,2936547,Director,163040,M,7535,17348,,120261
120102,12205,2936547,Sales Manager,108255,M,4971,12205,,120101
120103,6575,2936547,Sales Manager,87975,M,-2535,6575,,120101
120104,9132,2936547,Administration Manager,46230,F,-600,9132,,120101
120105,15826,2936547,Secretary I,27110,F,6929,15826,,120101
120106,6575,2936547,Office Assistant II,26960,M,-4026,6575,,120104
120107,6606,2936547,Office Assistant III,30475,F,-2536,6606,,120104
120108,18475,2936547,Warehouse Assistant II,27660,F,10280,18475,,120104
120109,18536,2936547,Warehouse Assistant I,26495,F,11306,18536,,120104
120110,8705,2936547,Warehouse Assistant III,28615,M,-2233,8705,,120104
120111,6879,2936547,Security Guard II,26895,M,-2353,6879,,120104
120112,12600,2936547,Security Guard I,26550,F,4796,12600,,120104
120113,6575,2936547,Security Guard II,26870,F,-4253,6575,,120104
120114,6575,2936547,Security Manager,31285,F,-4345,6575,,120104
120115,18110,2936547,Service Assistant I,26500,M,10355,18110,,120104
120116,8797,2936547,Service Assistant II,29250,M,1259,8797,,120104
120117,11048,2936547,Cabinet Maker III,31670,M,3176,11048,,120104
120118,10409,2936547,Cabinet Maker II,28090,M,1249,10409,,120104
120119,15341,2936547,Electrician IV,30255,M,5103,15341,,120104
120120,6575,2936547,Electrician II,27645,F,-4258,6575,,120104
120121,6575,2936547,Sales Rep. II,26600,F,-4169,6575,,120102
120122,8217,2936547,Sales Rep. II,27475,F,-523,8217,,120102
120123,10866,17928,Sales Rep. I,26190,F,3193,10866,17928,120102
120124,8460,2936547,Sales Rep. I,26480,M,1228,8460,,120102
120125,8460,17744,Sales Rep. IV,32040,M,-391,8460,17744,120102
120126,18475,2936547,Sales Rep. II,26780,M,11951,18475,,120102
120127,15645,2936547,Sales Rep. II,28100,F,8404,15645,,120102
120128,18567,2936547,Sales Rep. IV,30890,F,11152,18567,,120102
120129,10866,17256,Sales Rep. III,30070,M,3248,10866,17256,120102
120130,18383,2936547,Sales Rep. I,26955,M,10575,18383,,120102
120131,17167,2936547,Sales Rep. I,26910,M,8668,17167,,120102
120132,8309,2936547,Sales Rep. III,28525,F,-2462,8309,,120102
120133,18536,2936547,Sales Rep. II,27440,F,11069,18536,,120102
120134,6575,18443,Sales Rep. II,28015,M,-2400,6575,18443,120102
120135,15249,17652,Sales Rep. IV,32490,M,4774,15249,17652,120102
120136,17198,2936547,Sales Rep. I,26605,M,8659,17198,,120102
120137,18322,2936547,Sales Rep. III,29715,F,8471,18322,,120102
120138,18444,2936547,Sales Rep. I,25795,F,8592,18444,,120102
120139,18506,2936547,Sales Rep. II,26810,F,11187,18506,,120102
120140,18536,2936547,Sales Rep. I,26970,M,11903,18536,,120103
120141,18383,2936547,Sales Rep. II,27465,F,11759,18383,,120103
120142,18444,2936547,Sales Rep. III,29695,M,11122,18444,,120103
120143,9770,2936547,Sales Rep. II,26790,M,1232,9770,,120103
120144,18536,2936547,Sales Rep. III,30265,M,11023,18536,,120103
120145,10744,2936547,Sales Rep. II,26060,M,2943,10744,,120103
120146,8979,18170,Sales Rep. I,25985,M,1370,8979,18170,120103
120147,18536,2936547,Sales Rep. II,26580,F,11706,18536,,120103
120148,8187,2936547,Sales Rep. III,28480,M,-2301,8187,,120103
120149,13515,2936547,Sales Rep. I,26390,F,6899,13515,,120103
120150,9709,17652,Sales Rep. III,29965,M,-541,9709,17652,120103
120151,6575,2936547,Sales Rep. II,26520,F,-4058,6575,,120103
120152,17988,2936547,Sales Rep. I,26515,M,8521,17988,,120102
120153,15341,18293,Sales Rep. I,27260,F,8527,15341,18293,120102
120154,6575,2936547,Sales Rep. III,30490,F,-4182,6575,,120102
120155,18353,2936547,Sales Rep. III,29990,F,10339,18353,,120102
120156,18322,2936547,Sales Rep. I,26445,F,11932,18322,,120102
120157,18597,2936547,Sales Rep. II,27860,M,11009,18597,,120102
120158,11504,18140,Sales Rep. III,36605,M,3117,11504,18140,120102
120159,11139,2936547,Sales Rep. IV,30765,F,2976,11139,,120102
120160,6848,2936547,Sales Rep. I,27115,M,-479,6848,,120102
120161,18536,2936547,Sales Rep. III,30785,F,11754,18536,,120102
120162,18294,2936547,Sales Rep. I,27215,M,11936,18294,,120102
120163,12784,2936547,Sales Rep. II,26735,M,3064,12784,,120102
120164,9528,2936547,Sales Rep. II,27450,F,1425,9528,,120102
120165,18322,2936547,Sales Rep. I,27050,M,10305,18322,,120102
120166,6575,18505,Sales Rep. IV,30660,M,-4218,6575,18505,120102
120167,6606,18352,Sales Rep. I,25185,F,-607,6606,18352,120102
120168,18567,2936547,Sales Rep. I,25275,F,10310,18567,,120102
120169,18383,2936547,Sales Rep. III,28135,M,10228,18383,,120102
120170,13423,18566,Sales Rep. III,28830,M,6630,13423,18566,120102
120171,18506,2936547,Sales Rep. II,26205,F,10427,18506,,120102
120172,6575,2936547,Sales Rep. III,28345,M,-4292,6575,,120102
120173,7822,17744,Sales Rep. I,26715,M,-677,7822,17744,120102
120174,6575,18200,Sales Rep. I,26850,F,-4374,6575,18200,120102
120175,18536,2936547,Sales Rep. I,25745,M,11918,18536,,120102
120176,18567,2936547,Sales Rep. I,26095,M,11270,18567,,120102
120177,15372,2936547,Sales Rep. III,28745,F,8495,15372,,120102
120178,6665,2936547,Sales Rep. II,26165,M,-404,6665,,120102
120179,17532,17775,Sales Rep. III,28510,M,6648,17532,17775,120102
120180,8370,2936547,Sales Rep. II,26970,M,-553,8370,,120102
120181,18597,18717,Temp. Sales Rep.,27065,F,12020,18597,18717,120103
120182,18597,18627,Temp. Sales Rep.,25020,M,10505,18597,18627,120103
120183,18597,18627,Temp. Sales Rep.,26910,M,5001,18597,18627,120103
120184,18597,18747,Temp. Sales Rep.,25820,M,-2222,18597,18747,120103
120185,18597,18658,Temp. Sales Rep.,25080,F,6671,18597,18658,120103
120186,18597,18808,Temp. Sales Rep.,26795,F,8509,18597,18808,120103
120187,18597,18778,Temp. Sales Rep.,26665,F,10571,18597,18778,120103
120188,18597,18627,Temp. Sales Rep.,26715,F,-671,18597,18627,120103
120189,18597,18717,Temp. Sales Rep.,25180,M,10411,18597,18717,120103
120190,17837,18017,Trainee,24100,M,10566,17837,18017,120103
120191,17167,17347,Trainee,24015,F,1112,17167,17347,120103
120192,18049,18231,Trainee,26185,M,10355,18049,18231,120103
120193,18141,18321,Trainee,24515,M,10567,18141,18321,120103
120194,17929,18109,Trainee,25985,M,10493,17929,18109,120103
120195,18444,18627,Trainee,24990,F,10586,18444,18627,120103
120196,17167,17347,Trainee,24025,F,10257,17167,17347,120103
120197,17167,17347,Trainee,25580,F,-511,17167,17347,120103
120198,18597,2936547,Sales Rep. III,28025,F,11708,18597,,120103
120259,12297,2936547,Chief Executive Officer,433800,M,2946,12297,,
120260,10532,2936547,Chief Marketing Officer,207885,F,3258,10532,,120259
120261,11535,2936547,Chief Sales Officer,243190,M,4800,11535,,120259
120262,11932,2936547,Chief Financial Officer,268455,M,5042,11932,,120259
120263,10135,17531,Financial Analyst III,42605,M,2962,10135,17531,120262
120264,18597,2936547,Financial Analyst II,37510,F,10249,18597,,120262
120265,6575,17166,Auditor III,51950,F,-4106,6575,17166,120262
120266,12144,2936547,Secretary IV,31750,F,4930,12144,,120259
120267,17198,2936547,Secretary III,28585,F,11110,17198,,120259
120268,15096,2936547,Senior Strategist,76105,M,6818,15096,,120260
120269,6575,17652,Strategist II,52540,F,-4113,6575,17652,120260
120270,6575,2936547,Concession Director,48435,M,-647,6575,,120261
120271,11201,2936547,Concession Manager,43635,F,3140,11201,,120270
120272,6575,2936547,Concession Consultant II,34390,M,-4309,6575,,120271
120273,18322,2936547,Concession Assistant III,28455,F,11115,18322,,120271
120274,13849,2936547,Concession Assistant I,26840,F,2930,13849,,120271
120275,10501,2936547,Concession Consultant II,32195,F,1456,10501,,120271
120276,6575,17317,Concession Assistant II,28090,M,-4033,6575,17317,120271
120277,17653,18048,Concession Consultant I,32645,F,11916,17653,18048,120271
120278,18475,2936547,Concession Assistant III,27685,M,11308,18475,,120271
120279,14731,2936547,Concession Consultant I,32925,F,5041,14731,,120271
120280,11809,16982,Concession Consultant III,36930,F,3237,11809,16982,120271
120656,15765,2936547,Logistics Coordinator II,42570,F,6602,15765,,120660
120657,12723,2936547,Logistics Coordinator I,36110,F,2928,12723,,120660
120658,9163,2936547,Logistics Coordinator II,42485,M,-377,9163,,120660
120659,6575,2936547,Director,161290,M,-2360,6575,,120259
120660,17957,2936547,Logistics Manager,61125,M,8192,17957,,120659
120661,10227,17347,Senior Logistics Manager,85495,F,-400,10227,17347,120659
120662,18567,2936547,Secretary II,27045,M,11864,18567,,120659
120663,15035,2936547,Pricing Manager,56385,F,4833,15035,,120659
120664,7060,2936547,Pricing Specialist,47605,M,-682,7060,,120663
120665,16861,2936547,Senior Logistics Manager,80070,F,6871,16861,,120659
120666,13118,17652,Logistics Manager,64555,M,4921,13118,17652,120659
120667,18294,2936547,Office Assistant III,29980,M,8572,18294,,120666
120668,8370,2936547,Services Manager,47785,M,-2261,8370,,120659
120669,6575,2936547,Services Assistant IV,36370,M,-4179,6575,,120668
120670,6575,17166,Shipping Manager,65420,M,-4298,6575,17166,120659
120671,9893,2936547,Shipping Agent III,40080,M,-584,9893,,120670
120672,13209,2936547,Shipping Manager,60980,M,3159,13209,,120659
120673,6575,2936547,Shipping Agent II,35935,F,-4205,6575,,120672
120677,13546,2936547,Shipping Manager,65555,F,4993,13546,,120659
120678,8156,17409,Shipping Agent III,40035,F,-2545,8156,17409,120677
120679,16983,2936547,Shipping Manager,46190,F,7616,16983,,120659
120680,12904,2936547,Shipping Agent I,27295,F,4985,12904,,120679
120681,17623,2936547,Shipping Agent II,30950,M,8624,17623,,120679
120682,14701,2936547,Shipping Agent I,26760,F,5102,14701,,120679
120683,6575,17225,Shipping Agent III,36315,F,-415,6575,17225,120679
120684,18567,2936547,Warehouse Assistant I,26960,F,11287,18567,,120679
120685,18567,2936547,Warehouse Assistant I,25130,F,10287,18567,,120679
120686,6575,2936547,Warehouse Assistant II,26690,F,-4256,6575,,120679
120687,17745,17928,Warehouse Assistant I,26800,F,8545,17745,17928,120679
120688,6575,17044,Warehouse Assistant I,25905,F,-2198,6575,17044,120679
120689,18444,2936547,Warehouse Assistant III,27780,F,8601,18444,,120679
120690,17867,2936547,Warehouse Assistant I,25185,F,10243,17867,,120679
120691,6575,2936547,Shipping Manager,49240,M,-4125,6575,,120659
120692,9587,2936547,Shipping Agent II,32485,M,-405,9587,,120691
120693,8552,2936547,Shipping Agent I,26625,M,1217,8552,,120691
120694,18353,2936547,Warehouse Assistant I,27365,F,11916,18353,,120691
120695,12235,18474,Warehouse Assistant II,28180,M,3116,12235,18474,120691
120696,6634,18352,Warehouse Assistant I,26615,M,-505,6634,18352,120691
120697,18414,2936547,Warehouse Assistant IV,29625,F,11866,18414,,120691
120698,7518,17956,Warehouse Assistant I,26160,M,-594,7518,17956,120691
120710,15341,2936547,Business Analyst II,54840,M,6902,15341,,120719
120711,13939,2936547,Business Analyst III,59130,F,4896,13939,,120719
120712,6575,2936547,Marketing Manager,63640,F,-2394,6575,,120719
120713,6575,2936547,Marketing Assistant III,31630,M,-4330,6575,,120712
120714,15584,2936547,Marketing Manager,62625,M,7399,15584,,120719
120715,17929,2936547,Marketing Assistant II,28535,F,8563,17929,,120714
120716,13727,2936547,Events Manager,53015,M,6779,13727,,120719
120717,9344,2936547,Marketing Assistant II,30155,M,-722,9344,,120716
120718,12539,2936547,Marketing Assistant II,29190,M,3111,12539,,120716
120719,14641,2936547,Senior Marketing Manager,87420,F,4770,14641,,120260
120720,13240,2936547,Corp. Comm. Manager,46580,M,3049,13240,,120719
120721,6575,2936547,Marketing Assistant II,29870,F,-4089,6575,,120720
120722,10866,2936547,Corp. Comm. Specialist I,32460,M,1360,10866,,120720
120723,6575,2936547,Corp. Comm. Specialist II,33950,F,-2335,6575,,120720
120724,13240,2936547,Marketing Manager,63705,M,2948,13240,,120719
120725,17684,17897,Marketing Assistant II,29970,M,8697,17684,17897,120724
120726,18506,2936547,Marketing Assistant I,27380,F,11870,18506,,120724
120727,11109,2936547,Marketing Assistant IV,34925,M,3098,11109,,120724
120728,9497,2936547,Purchasing Agent II,35070,F,-393,9497,,120735
120729,17281,18163,Purchasing Agent I,31495,F,11781,17281,18163,120735
120730,11962,2936547,Purchasing Agent I,30195,M,3272,11962,,120735
120731,10105,2936547,Purchasing Agent II,34150,M,1169,10105,,120735
120732,6575,2936547,Purchasing Agent III,35870,M,-2331,6575,,120736
120733,12723,2936547,Purchasing Agent I,31760,M,3015,12723,,120736
120734,18322,2936547,Purchasing Agent III,34270,M,8516,18322,,120736
120735,8156,2936547,Purchasing Manager,61985,F,-567,8156,,120261
120736,13057,2936547,Purchasing Manager,63985,F,3253,13057,,120261
120737,11993,2936547,Purchasing Manager,63605,F,1182,11993,,120261
120738,6575,2936547,Purchasing Agent I,30025,F,-2370,6575,,120737
120739,18383,2936547,Purchasing Agent III,36970,M,11176,18383,,120737
120740,6575,17409,Purchasing Agent II,35110,F,-2265,6575,17409,120737
120741,6575,2936547,Purchasing Agent III,36365,F,-4051,6575,,120737
120742,6575,2936547,Purchasing Agent I,31020,M,-4349,6575,,120737
120743,15127,2936547,Purchasing Agent II,34620,F,4780,15127,,120737
120744,17714,18200,Purchasing Agent II,33490,F,11858,17714,18200,120737
120745,18414,2936547,Purchasing Agent I,31365,F,11143,18414,,120737
120746,16892,2936547,Account Manager,46090,M,6857,16892,,120262
120747,14457,2936547,Financial Controller I,43590,F,6745,14457,,120746
120748,17226,2936547,Building Admin. Manager,48380,F,7491,17226,,120262
120749,14884,2936547,Office Assistant II,26545,M,6837,14884,,120748
120750,8432,16832,Accountant I,32675,F,-573,8432,16832,120751
120751,11901,2936547,Finance Manager,58200,M,3017,11901,,120262
120752,7152,17286,Accountant I,30590,M,-683,7152,17286,120751
120753,14092,2936547,Financial Controller II,47000,M,7471,14092,,120751
120754,18383,2936547,Accountant II,34760,M,11841,18383,,120751
120755,10074,2936547,Accountant III,36440,F,3158,10074,,120751
120756,14792,2936547,Financial Controller III,52295,F,6625,14792,,120751
120757,6575,17713,Accountant III,38545,M,-4306,6575,17713,120751
120758,13423,2936547,Accountant II,34040,M,3217,13423,,120751
120759,9862,2936547,Accountant II,36230,M,3230,9862,,120746
120760,13635,2936547,Financial Controller III,53475,F,4754,13635,,120746
120761,18444,2936547,Accountant I,30960,F,11319,18444,,120746
120762,18322,2936547,Accountant I,30625,M,8706,18322,,120746
120763,6575,2936547,Auditor II,45100,M,-4084,6575,,120766
120764,17136,2936547,Auditor I,40450,M,6930,17136,,120766
120765,6575,2936547,Financial Controller III,51950,F,-380,6575,,120766
120766,16496,2936547,Auditing Manager,53400,F,6883,16496,,120262
120767,11413,2936547,Accountant I,32965,M,3051,11413,,120766
120768,9405,17500,Accountant II,44955,M,-528,9405,17500,120766
120769,14701,2936547,Auditor II,47990,M,6718,14701,,120766
120770,11413,17286,Auditor I,43930,F,3036,11413,17286,120766
120771,7640,2936547,Accountant II,36435,F,-515,7640,,120766
120772,18475,2936547,HR Generalist I,27365,M,11786,18475,,120780
120773,9222,2936547,HR Generalist II,27370,F,1148,9222,,120780
120774,16861,18201,HR Specialist II,45155,F,8295,16861,18201,120780
120775,14915,2936547,HR Analyst II,41580,F,4790,14915,,120780
120776,16527,2936547,HR Generalist III,32580,M,8664,16527,,120780
120777,14000,2936547,HR Specialist I,40955,M,4833,14000,,120780
120778,10258,2936547,HR Specialist I,43650,F,-389,10258,,120780
120779,15035,2936547,HR Analyst II,43690,F,7582,15035,,120780
120780,13057,2936547,HR Manager,62995,F,4992,13057,,120262
120781,17867,18262,Recruiter I,32620,F,11710,17867,18262,120782
120782,15857,2936547,Recruitment Manager,63915,F,6907,15857,,120262
120783,14610,2936547,Recruiter III,42975,M,6928,14610,,120782
120784,17776,2936547,Recruiter II,35715,F,8514,17776,,120782
120785,13666,2936547,Training Manager,48335,F,4769,13666,,120780
120786,6575,2936547,Trainer I,32650,F,-4306,6575,,120785
120787,14610,2936547,Trainer II,34000,M,4982,14610,,120785
120788,14214,2936547,Trainer I,33530,M,4912,14214,,120785
120789,9831,17317,Trainer III,39330,M,3117,9831,17317,120785
120790,14365,2936547,ETL Specialist II,53740,F,6915,14365,,120791
120791,11231,2936547,Systems Architect IV,61115,M,3129,11231,,120798
120792,15188,2936547,Systems Architect II,54760,F,7383,15188,,120791
120793,14762,2936547,ETL Specialist I,47155,M,4968,14762,,120791
120794,17348,2936547,Applications Developer IV,51265,F,8400,17348,,120800
120795,11901,17197,Applications Developer II,49105,M,4764,11901,17197,120794
120796,9921,2936547,Applications Developer II,47030,M,-599,9921,,120794
120797,8005,2936547,Applications Developer I,43385,F,-410,8005,,120794
120798,11323,2936547,Senior Project Manager,80755,F,1269,11323,,120800
120799,15645,2936547,Office Assistant III,29070,M,8482,15645,,120800
120800,15127,17197,IS Director,80210,M,6928,15127,17197,120262
120801,15887,2936547,Applications Developer I,40040,F,6639,15887,,120798
120802,8036,17713,Applications Developer IV,65125,F,-2426,8036,17713,120798
120803,8036,2936547,Applications Developer I,43630,M,-574,8036,,120798
120804,6575,2936547,IS Administrator III,55400,M,-4342,6575,,120798
120805,16162,2936547,BI Administrator IV,58530,M,8213,16162,,120798
120806,13180,2936547,IS Administrator II,47285,F,6630,13180,,120798
120807,9497,17775,IS Administrator I,43325,F,1443,9497,17775,120798
120808,10379,2936547,BI Specialist II,44425,M,3074,10379,,120798
120809,6575,2936547,BI Architect II,47155,F,-4370,6575,,120798
120810,8826,2936547,IS Architect III,58375,M,-454,8826,,120798
120811,13696,2936547,Applications Developer I,43985,M,5017,13696,,120814
120812,16649,2936547,Applications Developer II,45810,M,6624,16649,,120814
120813,13515,17531,Applications Developer IV,50865,M,5005,13515,17531,120814
120814,8644,2936547,Project Manager,59140,M,1249,8644,,120800
120815,18353,2936547,Service Administrator III,31590,M,12049,18353,,120719
120816,13727,2936547,Service Administrator I,30485,F,4871,13727,,120719
120992,16284,2936547,Office Assistant I,26940,F,8448,16284,,120996
120993,15035,2936547,Office Assistant I,26260,F,5100,15035,,120996
120994,14184,2936547,Office Administrator I,31645,F,6741,14184,,120996
120995,18475,2936547,Office Administrator II,34850,F,10391,18475,,120996
120996,17045,2936547,Office Assistant IV,32745,M,6776,17045,,121000
120997,14854,2936547,Shipping Administrator I,27420,F,6899,14854,,121000
120998,17988,2936547,Clerk I,26330,F,8740,17988,,120997
120999,10318,2936547,Clerk I,27215,F,1457,10318,,120997
121000,13849,2936547,Administration Manager,48600,M,2946,13849,,121141
121001,7914,2936547,Warehouse Manager,43615,M,1116,7914,,121000
121002,8735,17775,Warehouse Assistant II,26650,F,-470,8735,17775,121001
121003,18444,2936547,Warehouse Assistant I,26000,M,11813,18444,,121001
121004,6575,2936547,Security Manager,30895,M,-4168,6575,,121000
121005,17563,2936547,Security Guard I,25020,M,10423,17563,,121004
121006,17837,18201,Security Guard I,26145,M,11242,17837,18201,121004
121007,11354,2936547,Security Guard II,27290,M,3207,11354,,121004
121008,13727,2936547,Security Guard II,27875,M,4932,13727,,121004
121009,15918,2936547,Service Administrator I,32955,M,8738,15918,,121000
121010,18322,2936547,Service Assistant I,25195,M,10453,18322,,121009
121011,6575,2936547,Service Assistant I,25735,M,-4313,6575,,121009
121012,17410,17866,Service Assistant II,29575,M,10983,17410,17866,121009
121013,16162,2936547,Electrician II,26675,M,8518,16162,,121016
121014,15918,2936547,Electrician III,28510,F,6695,15918,,121016
121015,16315,2936547,Technician I,26140,M,8747,16315,,121016
121016,17776,2936547,Technical Manager,48075,F,7323,17776,,121000
121017,17957,2936547,Technician II,29225,M,10232,17957,,121016
121018,6575,17286,Sales Rep. II,27560,F,-4381,6575,17286,121144
121019,17684,18109,Sales Rep. IV,31320,M,11133,17684,18109,121144
121020,16922,2936547,Sales Rep. IV,31750,F,10280,16922,,121144
121021,13939,2936547,Sales Rep. IV,32985,F,6918,13939,,121144
121022,16833,17775,Sales Rep. IV,32210,M,8701,16833,17775,121144
121023,12174,18140,Sales Rep. I,26010,M,2994,12174,18140,121144
121024,17653,2936547,Sales Rep. II,26600,M,10491,17653,,121144
121025,7183,2936547,Sales Rep. II,28295,M,-2274,7183,,121144
121026,18353,2936547,Sales Rep. IV,31515,M,11269,18353,,121144
121027,12388,2936547,Sales Rep. II,26165,M,3047,12388,,121144
121028,18567,2936547,Sales Rep. I,26585,M,11805,18567,,121144
121029,12388,2936547,Sales Rep. I,27225,M,3278,12388,,121144
121030,16468,2936547,Sales Rep. I,26745,M,8716,16468,,121144
121031,10805,2936547,Sales Rep. III,28060,M,3112,10805,,121144
121032,18322,2936547,Sales Rep. IV,31335,M,11742,18322,,121144
121033,17684,2936547,Sales Rep. III,29775,F,11267,17684,,121144
121034,18628,2936547,Sales Rep. II,27110,M,11923,18628,,121144
121035,6575,2936547,Sales Rep. II,26460,M,-4299,6575,,121144
121036,17440,18201,Sales Rep. I,25965,F,11887,17440,18201,121144
121037,16861,2936547,Sales Rep. III,28310,M,6737,16861,,121144
121038,18475,18659,Sales Rep. I,25285,M,11731,18475,18659,121144
121039,8887,2936547,Sales Rep. II,27460,M,-577,8887,,121144
121040,9801,2936547,Sales Rep. III,29525,F,1282,9801,,121144
121041,6575,2936547,Sales Rep. II,26120,F,-4349,6575,,121144
121042,16010,2936547,Sales Rep. III,28845,M,8494,16010,,121144
121043,13209,2936547,Sales Rep. II,28225,F,5061,13209,,121144
121044,7152,2936547,Sales Rep. I,25660,M,-386,7152,,121144
121045,13880,17591,Sales Rep. II,28560,F,3086,13880,17591,121143
121046,18444,18628,Sales Rep. I,25845,M,10477,18444,18628,121143
121047,18506,18687,Sales Rep. I,25820,F,8730,18506,18687,121143
121048,18506,18687,Sales Rep. I,26560,F,10402,18506,18687,121143
121049,18597,2936547,Sales Rep. I,26930,F,11002,18597,,121143
121050,18597,2936547,Sales Rep. II,26080,F,10969,18597,,121143
121051,8340,2936547,Sales Rep. I,26025,F,-2435,8340,,121143
121052,18567,2936547,Sales Rep. II,26900,M,10966,18567,,121143
121053,6606,2936547,Sales Rep. III,29955,F,-4117,6606,,121143
121054,7610,2936547,Sales Rep. III,29805,M,-415,7610,,121143
121055,18475,2936547,Sales Rep. III,30185,M,11695,18475,,121143
121056,17287,2936547,Sales Rep. II,28325,F,10413,17287,,121143
121057,9101,2936547,Sales Rep. I,25125,M,1455,9101,,121143
121058,17075,2936547,Sales Rep. I,26270,M,6767,17075,,121143
121059,9222,17531,Sales Rep. II,27425,F,1393,9222,17531,121143
121060,6575,2936547,Sales Rep. III,28800,F,-4224,6575,,121143
121061,10409,2936547,Sales Rep. III,29815,M,-534,10409,,121143
121062,18475,2936547,Sales Rep. IV,30305,F,10528,18475,,121145
121063,18110,2936547,Sales Rep. II,35990,M,8608,18110,,121145
121064,13027,2936547,Sales Rep. I,25110,M,2949,13027,,121145
121065,18353,2936547,Sales Rep. III,28040,F,10475,18353,,121145
121066,6575,18201,Sales Rep. II,27250,F,-4148,6575,18201,121145
121067,18322,18506,Sales Rep. IV,31865,F,10975,18322,18506,121145
121068,13393,2936547,Sales Rep. II,27550,M,5084,13393,,121145
121069,12692,2936547,Sales Rep. II,26195,M,4826,12692,,121145
121070,18294,2936547,Sales Rep. III,29385,F,10535,18294,,121145
121071,7914,2936547,Sales Rep. III,28625,M,1348,7914,,121145
121072,17776,18201,Sales Rep. I,26105,M,8410,17776,18201,121145
121073,6575,2936547,Sales Rep. I,27100,M,-2422,6575,,121145
121074,11962,2936547,Sales Rep. I,26990,M,1155,11962,,121145
121075,6575,2936547,Sales Rep. II,28395,F,-4026,6575,,121145
121076,9862,17683,Sales Rep. II,26685,M,3204,9862,17683,121143
121077,18536,2936547,Sales Rep. III,28585,M,10475,18536,,121143
121078,8340,2936547,Sales Rep. I,27485,M,-2436,8340,,121143
121079,15280,2936547,Sales Rep. I,25770,M,6728,15280,,121143
121080,11566,2936547,Sales Rep. I,32235,M,1119,11566,,121143
121081,7396,2936547,Sales Rep. III,30235,F,-2470,7396,,121143
121082,7944,2936547,Sales Rep. III,28510,M,-2371,7944,,121143
121083,8460,2936547,Sales Rep. I,27245,F,1165,8460,,121143
121084,12784,2936547,Sales Rep. I,22710,M,3150,12784,,121143
121085,18628,2936547,Sales Rep. IV,32235,M,11273,18628,,121143
121086,6575,2936547,Sales Rep. I,26820,M,-4033,6575,,121143
121087,15765,18352,Sales Rep. II,28325,F,6915,15765,18352,121143
121088,18628,2936547,Sales Rep. I,27240,M,11849,18628,,121143
121089,6756,18566,Sales Rep. II,28095,M,-498,6756,18566,121143
121090,8797,2936547,Sales Rep. I,26600,F,-561,8797,,121143
121091,12054,2936547,Sales Rep. II,27325,M,4798,12054,,121143
121092,17014,2936547,Sales Rep. I,25680,F,6641,17014,,121143
121093,13880,17347,Sales Rep. I,27410,M,3121,13880,17347,121143
121094,8279,2936547,Sales Rep. I,26555,M,-724,8279,,121143
121095,12965,2936547,Sales Rep. II,28010,F,4852,12965,,121143
121096,14365,2936547,Sales Rep. I,26335,M,4886,14365,,121143
121097,14518,2936547,Sales Rep. II,26830,F,6870,14518,,121143
121098,18383,2936547,Sales Rep. I,27475,M,11769,18383,,121143
121099,16192,2936547,Sales Rep. IV,32725,M,8478,16192,,121143
121100,7396,2936547,Sales Rep. II,28135,M,-2440,7396,,121143
121101,18567,2936547,Sales Rep. I,25390,F,11197,18567,,121143
121102,18414,2936547,Sales Rep. I,27115,F,8577,18414,,121143
121103,18506,2936547,Sales Rep. I,27260,M,11806,18506,,121143
121104,11048,16832,Sales Rep. II,28315,F,3238,11048,16832,121143
121105,17167,2936547,Sales Rep. III,29545,F,8529,17167,,121143
121106,14641,2936547,Sales Rep. I,25880,M,4781,14641,,121143
121107,18444,2936547,Sales Rep. IV,31380,F,11071,18444,,121143
121108,18567,18748,Sales Rep. I,25930,F,11873,18567,18748,121143
121109,12539,2936547,Sales Rep. I,26035,M,5057,12539,,121143
121110,18597,18627,Temp. Sales Rep.,26370,M,-4279,18597,18627,121145
121111,18597,18747,Temp. Sales Rep.,26885,M,-4185,18597,18747,121145
121112,18597,18627,Temp. Sales Rep.,26855,M,11304,18597,18627,121145
121113,18597,18658,Temp. Sales Rep.,27480,F,-679,18597,18658,121145
121114,18597,18808,Temp. Sales Rep.,26515,F,-4075,18597,18808,121145
121115,18597,18747,Temp. Sales Rep.,26430,M,1139,18597,18747,121145
121116,18597,18717,Temp. Sales Rep.,26670,F,3188,18597,18717,121145
121117,18597,18627,Temp. Sales Rep.,26640,F,6651,18597,18627,121145
121118,18597,18778,Temp. Sales Rep.,25725,M,8460,18597,18778,121145
121119,18597,18686,Temp. Sales Rep.,25205,M,3229,18597,18686,121145
121120,18597,18686,Temp. Sales Rep.,25020,F,6872,18597,18686,121145
121121,18597,18778,Temp. Sales Rep.,25735,F,11021,18597,18778,121145
121122,18597,18717,Temp. Sales Rep.,26265,M,11017,18597,18717,121145
121123,18597,18717,Temp. Sales Rep.,26410,M,-4266,18597,18717,121145
121124,18597,18627,Temp. Sales Rep.,26925,M,4794,18597,18627,121145
121125,17167,17347,Trainee,25315,M,6681,17167,17347,121145
121126,17167,17347,Trainee,26015,M,-432,17167,17347,121145
121127,18049,18231,Trainee,25435,F,11203,18049,18231,121145
121128,17167,17347,Trainee,25405,F,6751,17167,17347,121145
121129,17167,17347,Trainee,30945,M,3043,17167,17347,121145
121130,17563,17744,Trainee,25255,M,10247,17563,17744,121145
121131,17167,17347,Trainee,25445,M,4929,17167,17347,121145
121132,17167,17347,Trainee,24390,M,-692,17167,17347,121145
121133,17167,17347,Trainee,25405,M,8714,17167,17347,121145
121134,17167,17347,Trainee,25585,M,3105,17167,17347,121145
121135,6787,2936547,Sales Rep. I,27010,F,-573,6787,,121145
121136,17136,17805,Sales Rep. I,27460,F,6770,17136,17805,121145
121137,18353,2936547,Sales Rep. I,27055,M,11705,18353,,121145
121138,6575,2936547,Sales Rep. I,27265,M,-2498,6575,,121145
121139,11504,2936547,Sales Rep. II,27700,F,1326,11504,,121145
121140,16527,18293,Sales Rep. I,26335,M,8423,16527,18293,121145
121141,6575,2936547,Vice President,194885,M,-4213,6575,,120261
121142,13635,2936547,Director,156065,M,4793,13635,,121141
121143,15157,2936547,Senior Sales Manager,95090,M,5078,15157,,121142
121144,13088,2936547,Sales Manager,83505,F,3101,13088,,121142
121145,7396,2936547,Sales Manager,84260,M,-2231,7396,,121142
121146,18353,2936547,Secretary III,29320,F,11300,18353,,121141
121147,11566,2936547,Secretary II,29145,F,4896,11566,,121142
121148,15341,17197,Business Analyst II,52930,M,4749,15341,17197,121141
;;;;
run;

data ORION.TEAM;
   attrib ID length=8;
   attrib Name length=$5;

   infile datalines dsd;
   input
      ID
      Name
   ;
datalines4;
13,Anne
11,Bob
21,Chris
18,Kim
19,Kyle
20,Mary
15,Pam
17,Pat
14,Pete
16,Sam
12,Sue
11,Bob
;;;;
run;

data ORION.THREE;
   attrib X length=8 format=1.;
   attrib B length=$2;

   infile datalines dsd;
   input
      X
      B
   ;
datalines4;
1,a1
1,a2
2,b1
2,b2
4,d
;;;;
run;

data ORION.TRAIN_A;
   attrib ID length=8;
   attrib Name length=$5;
   attrib Date length=8 label='Completion Date' format=DATE9. informat=DATE.;

   infile datalines dsd;
   input
      ID
      Name
      Date:BEST32.
   ;
datalines4;
11,Bob,19159
16,Sam,19149
14,Pete,19165
21,Chris,19151
18,Kim,19148
17,Pat,19166
20,Mary,19155
12,Sue,19150
87,Ted,19149
91,Rand,19151
;;;;
run;

data ORION.TRAIN_B;
   attrib Name length=$5;
   attrib ID length=8;
   attrib SDate length=8 label='Start Date' format=DATE9. informat=DATE.;
   attrib EDate length=8 label='End Date' format=DATE9. informat=DATE.;

   infile datalines dsd;
   input
      Name
      ID
      SDate:BEST32.
      EDate:BEST32.
   ;
datalines4;
Bob,11,19183,19187
Pam,15,19199,19201
Kyle,19,19186,19194
Chris,21,19203,
Kim,18,19186,
Ted,87,19183,19187
Rand,91,19183,
;;;;
run;

data ORION.TRANSACTION2;
   attrib ID length=8;
   attrib Action length=$10;
   attrib Amount length=8 format=DOLLAR5.;

   infile datalines dsd;
   input
      ID
      Action
      Amount
   ;
datalines4;
102,Purchase,376
102,Return,119
103,Purchase,57
105,Purchase,98
;;;;
run;

data ORION.TRANSACTIONS;
   attrib ID length=8;
   attrib Action length=$10;
   attrib Amount length=8 format=DOLLAR5.;

   infile datalines dsd;
   input
      ID
      Action
      Amount
   ;
datalines4;
102,Purchase,100
103,Return,52
105,Return,212
;;;;
run;

data ORION.TWO;
   attrib X length=8 format=1.;
   attrib B length=$1;

   infile datalines dsd;
   input
      X
      B
   ;
datalines4;
2,x
3,y
5,v
;;;;
run;

proc contents data=ORION._all_ nods;
run;



 