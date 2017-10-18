
/*++++++++++++++++++++++++++++++++++++++++++++++*/
/* THIS CODE CREATES PRACTICE DATA FOR ECPRG293 */
/* orion.employee_addresses2 added for ecourse  */
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


data ORION.ACRE8FORMAT;
   attrib FMTNAME length=$32 label='Format name';
   attrib START length=$9 label='Starting value for format';
   attrib END length=$9 label='Ending value for format';
   attrib LABEL length=$30 label='Format value label';
   attrib MIN length=3 label='Minimum length';
   attrib MAX length=3 label='Maximum length';
   attrib DEFAULT length=3 label='Default length';
   attrib LENGTH length=3 label='Format length';
   attrib FUZZ length=8 label='Fuzz value';
   attrib PREFIX length=$2 label='Prefix characters';
   attrib MULT length=8 label='Multiplier';
   attrib FILL length=$1 label='Fill character';
   attrib NOEDIT length=3 label='Is picture string noedit?';
   attrib TYPE length=$1 label='Type of format';
   attrib SEXCL length=$1 label='Start exclusion';
   attrib EEXCL length=$1 label='End exclusion';
   attrib HLO length=$13 label='Additional information';
   attrib DECSEP length=$1 label='Decimal separator';
   attrib DIG3SEP length=$1 label='Three-digit separator';
   attrib DATATYPE length=$8 label='Date/time/datetime?';
   attrib LANGUAGE length=$8 label='Language for date strings';

   infile datalines dsd;
   input
      FMTNAME
      START
      END
      LABEL
      MIN
      MAX
      DEFAULT
      LENGTH
      FUZZ
      PREFIX
      MULT
      FILL
      NOEDIT
      TYPE
      SEXCL
      EEXCL
      HLO
      DECSEP
      DIG3SEP
      DATATYPE
      LANGUAGE
   ;
datalines4;
COUNTRY,AU,AU,Australia,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,CA,CA,Canada,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,DE,DE,Germany,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,IL,IL,Israel,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,TR,TR,Turkey,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,US,US,United States,1,40,13,13,0,,0,,0,C,N,N,,,,,
COUNTRY,ZA,ZA,South Africa,1,40,13,13,0,,0,,0,C,N,N,,,,,
EXTRA,,,Unknown,1,40,30,30,0,,0,,0,C,N,N,,,,,
EXTRA,**OTHER**,**OTHER**,$COUNTRY30.,1,40,30,30,0,,0,,0,C,N,N,OF,,,,
;;;;
run;

libname myfmts "&path";
options fmtsearch=(myfmts);

proc format library=myfmts cntlin=ORION.ACRE8FORMAT;
run;
data ORION.AGES;
   attrib Description length=$48;
   attrib First_Age length=8;
   attrib Last_Age length=8;

   infile datalines dsd;
   input
      Description
      First_Age
      Last_Age
   ;
datalines4;
15-30 years,15,30
31-45 years,30,45
46-60 years,45,60
61-75 years,60,75
;;;;
run;

data ORION.AGES_MOD;
   attrib Description length=$48;
   attrib First_Age length=8;
   attrib Last_Age length=8;

   infile datalines dsd;
   input
      Description
      First_Age
      Last_Age
   ;
datalines4;
15-29 years,15,30
30-44 years,30,45
45-59 years,45,60
60-75 years,60,75
;;;;
run;

data ORION.APRSALES;
   attrib SaleDate length=8;
   attrib SaleAmt length=8;

   infile datalines dsd;
   input
      SaleDate
      SaleAmt
   ;
datalines4;
18718,498.49
18719,946.5
18720,994.97
18721,564.59
18722,783.01
18723,228.82
18724,930.57
18725,211.47
18726,156.23
18727,117.69
18728,374.73
18729,252.73
18730,839.73
18731,742.74
18732,107.22
18733,257.57
18734,536.6
18735,857.45
18736,499.87
18737,284.04
18738,294.94
18739,730.33
18740,389.51
18741,388.55
18742,475.26
18743,352.67
18744,257.37
18745,820.69
18746,228.07
18747,823.67
;;;;
run;

data ORION.APRSALES2;
   attrib SaleDate length=8;
   attrib SaleAmt length=8;

   infile datalines dsd;
   input
      SaleDate
      SaleAmt
   ;
datalines4;
18718,498.49
18719,
18720,994.97
18721,564.59
18722,783.01
18723,228.82
18724,930.57
18725,211.47
18726,156.23
18727,117.69
18728,374.73
18729,252.73
18730,839.73
18731,742.74
18732,107.22
18733,257.57
18734,536.6
18735,857.45
18736,499.87
18737,284.04
18738,294.94
18739,730.33
18740,389.51
18741,388.55
18742,475.26
18743,352.67
18744,257.37
18745,820.69
18746,228.07
18747,823.67
;;;;
run;

data ORION.AU_SALESFORCE;
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
;;;;
run;

data ORION.BANKS;
   attrib Name length=$29;
   attrib Rate length=8;

   infile datalines dsd;
   input
      Name
      Rate
   ;
datalines4;
Carolina Bank and Trust,0.0318
State Savings Bank,0.0321
National Savings and Trust,0.0328
;;;;
run;

data ORION.BIZ_LIST;
   attrib Acct_Code length=$6;
   attrib Name length=$30;

   infile datalines dsd;
   input
      Acct_Code
      Name
   ;
datalines4;
AEK3,ANGELA E. KEARNEY
AQI2,AQUAMISSIONS INTERNATIONAL
ATS1,A TEAM SPORTS
CBO3,CLAIRE B. OWENS
CCI2,"CANCER CURES, INC."
CNI2,"CONSERVE NATURE, INC."
CS1,CAROLINA SPORTS
CS2,CHILD SURVIVORS
CU2,CUIDADORES LTD.
DAI2,"DISASTER ASSIST, INC."
DSI1,DOLPHIN SPORTSWEAR INC
ES2,EARTHSALVORS
ESL1,EA SPORTS LIMITED
FFC2,FARMING FOR COMMUNITIES
HT1,HIGHPOINT TRADING
JB3,JUDITH BRUMFIELD
LAF3,LAUREN A. FREEMAN
LBSA1,LE BLANC S.A.
MI2,MITLEID INTERNATIONAL
MK3,MARTINA KOITZSCH
MSI1,MIKE SCHAEFFER INC
NSI1,NAUTLIUS SPORTSWEAR INC
NY3,NORIKI YOSHIKAWA
OOL1,OUTBACK OUTFITTERS LTD
PJR3,PATRICIA J. ROHLOFF
RBW3,ROBERT B. WANG
ROI1,ROLL-OVER INC
SBA2,SAVE THE BABY ANIMALS
SS3,STEPHANIE SAWYER
STA1,SVENSSON TRADING AB
TSG1,TRULS SPORTING GOODS
TSI1,TRIPLE SPORTSWEAR INC
V22,VOX VICTIMAS
VB3,VICKIE BALLARD
WB3,WAY BALDRIDGE
WO3,WOUTER OVERBY
YYCR2,"YES, YOU CAN RECYCLE"
;;;;
run;

data ORION.CLEAN_UP;
   attrib Product_ID length=$15 label='Product_ID' format=$15. informat=$15.;
   attrib Product length=$25 label='Product' format=$25. informat=$25.;
   attrib Order_ID length=8 label='Order_ID';

   infile datalines dsd;
   input
      Product_ID:$15.
      Product:$25.
      Order_ID
   ;
datalines4;
21 02 002 00003,"Sunfit Trunks, Blue",1231986335
21 02 002 00003,"Luci Knit Mittens, Red",1232003930
21 02 002 00004,"Luci Knit mittens, blue",1232007693
21 02 002 00004,"Sunfit Trunks, aqua",1232007700
21 02 002 00005,"Sunfit Trunks, Yellow",1232087464
21 02 002 00005,"Lucky Knit Mittens, Black",1232092527
;;;;
run;

data ORION.CONTACTS;
   attrib ID length=$5;
   attrib Title length=$5;
   attrib Name length=$25;
   attrib Address1 length=$21;
   attrib Address2 length=$24;

   infile datalines dsd;
   input
      ID
      Title
      Name
      Address1
      Address2
   ;
datalines4;
AQI,Ms.,"Farr,Sue",15 Harvey Rd.,"Macon, GA  31298"
CCI,Dr.,"Cox,Kay B.",163 McNeil Pl.,"Kern, CA  93280"
CNI,Mr.,"Mason,Ron",442 Glen Ave.,"Miami, FL  33054"
CS,Ms.,"Ruth,G. H.",2491 Brady St.,"Munger, MI  48747"
CU,Prof.,"Florentino,Helen-Ashe H.",PO Box 2253,"Washington, DC 20018"
DAI,Ms.,"Van Allsburg,Jan F.",25 Chesire Pl.,"Short Hills, NJ  07078"
ES,Mr.,"Laff,Stanley X.",1725 Airport Rd.,"Springfield, IL  62707"
FFC,Mr.,"Rizen,George Q.",11234 W Hoyt St.,"Chicago, IL  60612"
MI,Dr.,"Mitchell,Marc J.",922 Mitchell Circle,"Chicago, IL  60603"
SBA,Ms.,"Mills,Dorothy E.",34 Clear Sky Rd.,"Butte, MT  59750"
V2,Dr.,"Webb,Jonathan W.",1012 Hwy 54,"Morrisville, NC  27560"
YYCR,Mr.,"Keenan,Maynard J.",1315 Green Valley Ln.,"Sedona, AZ  86351"
;;;;
run;

data ORION.CONTINENT;
   attrib Continent_ID length=8 label='Continent ID';
   attrib Continent_Name length=$30 label='Continent Name';

   infile datalines dsd;
   input
      Continent_ID
      Continent_Name
   ;
datalines4;
91,North America
93,Europe
94,Africa
95,Asia
96,Australia/Pacific
;;;;
run;

data ORION.CONVERT;
   attrib ID length=$5;
   attrib GrossPay length=$6;
   attrib Code length=8;
   attrib Mobile length=$8;
   attrib hired length=$10;

   infile datalines dsd;
   input
      ID
      GrossPay
      Code
      Mobile
      hired
   ;
datalines4;
36,"52,000",303,393-0956,04/13/2008
48,"32,000",919,770-8292,08/25/2010
52,"49,000",301,449-5239,06/08/2009
;;;;
run;

data ORION.COUNTRY;
   attrib Country length=$2 label='Country Abbreviation';
   attrib Country_Name length=$30 label='Current Name of Country';
   attrib Population length=8 label='Population (approx.)' format=COMMA12.;
   attrib Country_ID length=8 label='Country ID';
   attrib Continent_ID length=8 label='Numeric Rep. for Continent';
   attrib Country_FormerName length=$30 label='Former Name of Country';

   infile datalines dsd;
   input
      Country
      Country_Name
      Population
      Country_ID
      Continent_ID
      Country_FormerName
   ;
datalines4;
AU,Australia,20000000,160,96,
CA,Canada,,260,91,
DE,Germany,80000000,394,93,East/West Germany
IL,Israel,5000000,475,95,
TR,Turkey,70000000,905,95,
US,United States,280000000,926,91,
ZA,South Africa,43000000,801,94,
;;;;
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

data ORION.CUSTOMERS_EX5;
   attrib Customer_ID length=$25;
   attrib Name length=$40;
   attrib Country length=$2 label='Customer Country';
   attrib Gender length=$1 label='Customer Gender';
   attrib Birth_Date length=8 label='Customer Birth Date' format=DATE9.;

   infile datalines dsd;
   input
      Customer_ID
      Name
      Country
      Gender
      Birth_Date
   ;
datalines4;
000-000-00-0004,"KVARNIQ, James",US,M,6752
Silver000-000-00-0005,"STEPHANO, Sandrina",US,F,8590
000-000-00-0009,"KRAHL, Cornelia",DE,F,6632
platinum000-000-00-0010,"BALLINGER, Karen",US,F,10518
000-000-00-0011,"WALLSTAB, Elke",DE,F,6802
Silver000-000-00-0012,"BLACK, David",US,M,4850
000-000-00-0013,"SEPKE, Markus",DE,M,11890
000-000-00-0016,"HEYDE, Ulrich",DE,M,-6194
000-000-00-0017,"EVANS, Jimmie",US,M,-502
000-000-00-0018,"ASMUSSEN, Tonie",US,M,-698
000-000-00-0019,"FÜßLING, Oliver S.",DE,M,2975
000-000-00-0020,"DINELEY, Michael",US,M,1202
000-000-00-0023,"DEVEREAUX, Tulio",US,M,-2221
Silver000-000-00-0024,"KLEM, Robyn",US,F,1248
Gold000-000-00-0027,"MCCLUNEY, Cynthia",US,F,4853
000-000-00-0029,"KINSEY, Candy",AU,F,-7847
platinum000-000-00-0031,"MARTINEZ, Cynthia",US,F,1314
000-000-00-0033,"ROBAK, Rolf",DE,M,-6155
Silver000-000-00-0034,"GOHEEN, Alvan",US,M,10244
000-000-00-0036,"HILL, Phenix",US,M,3014
000-000-00-0039,"GREENWALD, Alphone",US,M,10433
Silver000-000-00-0041,"SUMMERSBY, Wendell",AU,M,3258
000-000-00-0042,"LEITMANN, Thomas",DE,M,8440
Silver000-000-00-0045,"PATCHIN, Dianne",US,F,8526
000-000-00-0049,"LEVEILLE, Annmarie",US,F,10424
000-000-00-0050,"MENDLER, Gert-Gunter",DE,M,-8020
000-000-00-0052,"KOZLOWSKI, Yan",US,M,4844
Silver000-000-00-0053,"POCKRAN, Dericka",AU,F,-560
000-000-00-0056,"SIFERD, Roy",US,M,-8004
000-000-00-0060,"LANZARONE, Tedi",US,F,4891
000-000-00-0061,"MAESTRINI, Carsten",DE,M,-4194
000-000-00-0063,"KLISURICH, James",US,M,5107
Silver000-000-00-0065,"DEISSER, Ines",DE,F,4949
000-000-00-0069,"BERTOLOZZI, Patricia",US,F,8533
000-000-00-0071,"FOLSOM, Viola",US,F,5014
000-000-00-0075,"SPETZ, Mikel",US,M,10396
000-000-00-0079,"HICKS, Najma",US,F,10979
000-000-00-0088,"GIBBS, Attila",US,M,1145
Silver000-000-00-0089,"LEWIS, Wynella",US,F,-7765
Silver000-000-00-0090,"HOOKS, Kyndal",US,F,3135
000-000-00-0092,"CELII, Lendon",US,M,-4126
Silver000-000-00-0111,"DOKTER, Karolina",AU,F,6936
platinum000-000-00-0171,"BOWERMAN, Robert",AU,M,6627
000-000-00-0183,"ROBERTSHAWE, Duncan",AU,M,-4299
000-000-00-0195,"RIMMINGTON, Cosi",AU,M,-4068
000-000-00-0215,"TRENTHOLME, Ramesh",AU,M,-2421
000-000-00-0544,"ARGAC, Avni",TR,M,3062
Silver000-000-00-0908,"UMRAN, Avni",TR,M,8740
000-000-00-0928,"URFALIOGLU, Bulent",TR,M,4971
Silver000-000-00-1033,"OKAY, Selim",TR,M,8687
000-000-00-1100,"CANKO, Ahmet",TR,M,2940
000-000-00-1684,"AYDEMIR, Carglar",TR,M,6864
000-000-00-2550,"COLLIER, Sanelisiwe",ZA,F,11876
000-000-00-2618,"BRAZIER, Theunis",ZA,M,-2477
000-000-00-2788,"YUCEL, Serdar",TR,M,-4382
platinum000-000-00-2806,"VAN DEN BERG, Raedene",ZA,F,11947
000-000-00-3959,"LOTZ, Rita",ZA,F,2976
000-000-01-1171,"CUDDY, Bill",CA,M,11246
000-000-01-2386,"ZWEIG, Avinoam",IL,M,1227
000-000-01-4104,"ZWEIG, Avinoam",IL,M,3205
000-000-01-4703,"BLOCH, Eyal",IL,M,5015
Silver000-000-01-7023,"KRASOWSKI, Susan",CA,F,1285
000-000-01-9444,"ZWEIG, Avinoam",IL,M,1366
000-000-01-9873,"TUVIA, Avinoam",IL,M,10392
000-000-02-6148,"RENNIE, Andreas",CA,M,-7837
Silver000-000-04-6966,"KRASOWSKI, Lauren",CA,F,11254
000-000-05-4655,"MARX, Lauren",CA,F,4978
000-000-07-0046,"MCDONALD, Tommy",CA,M,1115
000-000-07-0059,"BYARLEY, Colin",CA,M,-8016
000-000-07-0079,"KNOTT, Lera",CA,F,11149
platinum000-000-07-0100,"YEARGAN, Wilma",CA,F,10401
000-000-07-0108,"LEACH, Patrick",CA,M,-6106
Silver000-000-07-0165,"REYNOSO, Portia",CA,F,2963
Silver000-000-07-0187,"BERENT, Soberina",CA,F,11227
Gold000-000-07-0201,"BORWICK, Angel",CA,F,5101
000-000-07-0210,"SANTINELLO, Alex",CA,M,11069
000-000-07-0221,"TALARR, Kenan",CA,M,2962
;;;;
run;

data ORION.CUSTOMER_DIM;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Customer_Country length=$2 label='Customer Country';
   attrib Customer_Gender length=$1 label='Customer Gender';
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Customer_FirstName length=$20 label='Customer First Name';
   attrib Customer_LastName length=$30 label='Customer Last Name';
   attrib Customer_BirthDate length=8 label='Customer Birth Date' format=DATE9.;
   attrib Customer_Age_Group length=$12 label='Customer Age Group';
   attrib Customer_Type length=$40 label='Customer Type Name';
   attrib Customer_Group length=$40 label='Customer Group Name';
   attrib Customer_Age length=8 label='Customer Age';

   infile datalines dsd;
   input
      Customer_ID
      Customer_Country
      Customer_Gender
      Customer_Name
      Customer_FirstName
      Customer_LastName
      Customer_BirthDate
      Customer_Age_Group
      Customer_Type
      Customer_Group
      Customer_Age
   ;
datalines4;
4,US,M,James Kvarniq,James,Kvarniq,6752,31-45 years,Orion Club members low activity,Orion Club members,33
5,US,F,Sandrina Stephano,Sandrina,Stephano,8590,15-30 years,Orion Club Gold members medium activity,Orion Club Gold members,28
9,DE,F,Cornelia Krahl,Cornelia,Krahl,6632,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,33
10,US,F,Karen Ballinger,Karen,Ballinger,10518,15-30 years,Orion  Club members high activity,Orion Club members,23
11,DE,F,Elke Wallstab,Elke,Wallstab,6802,31-45 years,Orion  Club members high activity,Orion Club members,33
12,US,M,David Black,David,Black,4850,31-45 years,Orion  Club members medium activity,Orion Club members,38
13,DE,M,Markus Sepke,Markus,Sepke,11890,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,19
16,DE,M,Ulrich Heyde,Ulrich,Heyde,-6194,61-75 years,Internet/Catalog Customers,Internet/Catalog Customers,68
17,US,M,Jimmie Evans,Jimmie,Evans,-502,46-60 years,Orion  Club members medium activity,Orion Club members,53
18,US,M,Tonie Asmussen,Tonie,Asmussen,-698,46-60 years,Orion Club members low activity,Orion Club members,53
19,DE,M,Oliver S. Füßling,Oliver S.,Füßling,2975,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
20,US,M,Michael Dineley,Michael,Dineley,1202,46-60 years,Orion  Club members medium activity,Orion Club members,48
23,US,M,Tulio Devereaux,Tulio,Devereaux,-2221,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,58
24,US,F,Robyn Klem,Robyn,Klem,1248,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,48
27,US,F,Cynthia Mccluney,Cynthia,Mccluney,4853,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,38
29,AU,F,Candy Kinsey,Candy,Kinsey,-7847,61-75 years,Internet/Catalog Customers,Internet/Catalog Customers,73
31,US,F,Cynthia Martinez,Cynthia,Martinez,1314,46-60 years,Orion Club Gold members medium activity,Orion Club Gold members,48
33,DE,M,Rolf Robak,Rolf,Robak,-6155,61-75 years,Orion  Club members medium activity,Orion Club members,68
34,US,M,Alvan Goheen,Alvan,Goheen,10244,15-30 years,Orion Club members low activity,Orion Club members,23
36,US,M,Phenix Hill,Phenix,Hill,3014,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,43
39,US,M,Alphone Greenwald,Alphone,Greenwald,10433,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
41,AU,M,Wendell Summersby,Wendell,Summersby,3258,31-45 years,Orion  Club members medium activity,Orion Club members,43
42,DE,M,Thomas Leitmann,Thomas,Leitmann,8440,15-30 years,Orion Club members low activity,Orion Club members,28
45,US,F,Dianne Patchin,Dianne,Patchin,8526,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,28
49,US,F,Annmarie Leveille,Annmarie,Leveille,10424,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
50,DE,M,Gert-Gunter Mendler,Gert-Gunter,Mendler,-8020,61-75 years,Orion Club Gold members high activity,Orion Club Gold members,73
52,US,M,Yan Kozlowski,Yan,Kozlowski,4844,31-45 years,Orion  Club members medium activity,Orion Club members,38
53,AU,F,Dericka Pockran,Dericka,Pockran,-560,46-60 years,Orion  Club members high activity,Orion Club members,53
56,US,M,Roy Siferd,Roy,Siferd,-8004,61-75 years,Orion  Club members medium activity,Orion Club members,73
60,US,F,Tedi Lanzarone,Tedi,Lanzarone,4891,31-45 years,Orion  Club members medium activity,Orion Club members,38
61,DE,M,Carsten Maestrini,Carsten,Maestrini,-4194,61-75 years,Orion Club Gold members high activity,Orion Club Gold members,63
63,US,M,James Klisurich,James,Klisurich,5107,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,38
65,DE,F,Ines Deisser,Ines,Deisser,4949,31-45 years,Orion Club members low activity,Orion Club members,38
69,US,F,Patricia Bertolozzi,Patricia,Bertolozzi,8533,15-30 years,Orion Club members low activity,Orion Club members,28
71,US,F,Viola Folsom,Viola,Folsom,5014,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,38
75,US,M,Mikel Spetz,Mikel,Spetz,10396,15-30 years,Orion Club members low activity,Orion Club members,23
79,US,F,Najma Hicks,Najma,Hicks,10979,15-30 years,Orion  Club members medium activity,Orion Club members,21
88,US,M,Attila Gibbs,Attila,Gibbs,1145,46-60 years,Orion  Club members medium activity,Orion Club members,48
89,US,F,Wynella Lewis,Wynella,Lewis,-7765,61-75 years,Orion  Club members high activity,Orion Club members,73
90,US,F,Kyndal Hooks,Kyndal,Hooks,3135,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
92,US,M,Lendon Celii,Lendon,Celii,-4126,61-75 years,Orion Club members low activity,Orion Club members,63
111,AU,F,Karolina Dokter,Karolina,Dokter,6936,31-45 years,Orion  Club members medium activity,Orion Club members,33
171,AU,M,Robert Bowerman,Robert,Bowerman,6627,31-45 years,Orion  Club members high activity,Orion Club members,33
183,AU,M,Duncan Robertshawe,Duncan,Robertshawe,-4299,61-75 years,Orion Club members low activity,Orion Club members,63
195,AU,M,Cosi Rimmington,Cosi,Rimmington,-4068,61-75 years,Orion Club members low activity,Orion Club members,63
215,AU,M,Ramesh Trentholme,Ramesh,Trentholme,-2421,46-60 years,Orion Club Gold members medium activity,Orion Club Gold members,58
544,TR,M,Avni Argac,Avni,Argac,3062,31-45 years,Orion  Club members high activity,Orion Club members,43
908,TR,M,Avni Umran,Avni,Umran,8740,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,28
928,TR,M,Bulent Urfalioglu,Bulent,Urfalioglu,4971,31-45 years,Orion Club members low activity,Orion Club members,38
1033,TR,M,Selim Okay,Selim,Okay,8687,15-30 years,Orion Club members low activity,Orion Club members,28
1100,TR,M,Ahmet Canko,Ahmet,Canko,2940,31-45 years,Orion Club members low activity,Orion Club members,43
1684,TR,M,Carglar Aydemir,Carglar,Aydemir,6864,31-45 years,Orion Club members low activity,Orion Club members,33
2550,ZA,F,Sanelisiwe Collier,Sanelisiwe,Collier,11876,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,19
2618,ZA,M,Theunis Brazier,Theunis,Brazier,-2477,46-60 years,Orion  Club members medium activity,Orion Club members,58
2788,TR,M,Serdar Yucel,Serdar,Yucel,-4382,61-75 years,Orion  Club members high activity,Orion Club members,63
2806,ZA,F,Raedene Van Den Berg,Raedene,Van Den Berg,11947,15-30 years,Orion  Club members medium activity,Orion Club members,19
3959,ZA,F,Rita Lotz,Rita,Lotz,2976,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
11171,CA,M,Bill Cuddy,Bill,Cuddy,11246,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,21
12386,IL,M,Avinoam Zweig,Avinoam,Zweig,1227,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,48
14104,IL,M,Avinoam Zweig,Avinoam,Zweig,3205,31-45 years,Orion  Club members medium activity,Orion Club members,43
14703,IL,M,Eyal Bloch,Eyal,Bloch,5015,31-45 years,Orion  Club members high activity,Orion Club members,38
17023,CA,F,Susan Krasowski,Susan,Krasowski,1285,46-60 years,Orion Club Gold members high activity,Orion Club Gold members,48
19444,IL,M,Avinoam Zweig,Avinoam,Zweig,1366,46-60 years,Orion  Club members high activity,Orion Club members,48
19873,IL,M,Avinoam Tuvia,Avinoam,Tuvia,10392,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
26148,CA,M,Andreas Rennie,Andreas,Rennie,-7837,61-75 years,Orion  Club members medium activity,Orion Club members,73
46966,CA,F,Lauren Krasowski,Lauren,Krasowski,11254,15-30 years,Orion  Club members high activity,Orion Club members,21
54655,CA,F,Lauren Marx,Lauren,Marx,4978,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,38
70046,CA,M,Tommy Mcdonald,Tommy,Mcdonald,1115,46-60 years,Orion Club members low activity,Orion Club members,48
70059,CA,M,Colin Byarley,Colin,Byarley,-8016,61-75 years,Orion  Club members medium activity,Orion Club members,73
70079,CA,F,Lera Knott,Lera,Knott,11149,15-30 years,Orion  Club members medium activity,Orion Club members,21
70100,CA,F,Wilma Yeargan,Wilma,Yeargan,10401,15-30 years,Orion  Club members medium activity,Orion Club members,23
70108,CA,M,Patrick Leach,Patrick,Leach,-6106,61-75 years,Orion Club members low activity,Orion Club members,68
70165,CA,F,Portia Reynoso,Portia,Reynoso,2963,31-45 years,Orion Club members low activity,Orion Club members,43
70187,CA,F,Soberina Berent,Soberina,Berent,11227,15-30 years,Orion  Club members medium activity,Orion Club members,21
70201,CA,F,Angel Borwick,Angel,Borwick,5101,31-45 years,Orion Club Gold members low activity,Orion Club Gold members,38
70210,CA,M,Alex Santinello,Alex,Santinello,11069,15-30 years,Orion  Club members medium activity,Orion Club members,21
70221,CA,M,Kenan Talarr,Kenan,Talarr,2962,31-45 years,Orion  Club members high activity,Orion Club members,43
;;;;
run;

data ORION.CUSTOMER_ORDERS;
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Quantity length=8 label='Quantity Ordered';
   attrib Total_Retail_Price length=8 label='Total Retail Price for This Product' format=DOLLAR13.2;
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier length=$200;

   infile datalines dsd;
   input
      Customer_Name
      Quantity
      Total_Retail_Price
      Product_Name
      Supplier
   ;
datalines4;
Kyndal Hooks,2,69.4,"Kids Sweat Round Neck,Large Logo",US 3298
Kyndal Hooks,1,14.3,Fleece Cuff Pant Kid'S,US 1303
Dericka Pockran,3,37.8,Children's Mitten,US 772
Wendell Summersby,1,39.4,Bozeman Rain & Storm Set,US 772
Sandrina Stephano,1,52.5,Teen Profleece w/Zipper,US 772
Wendell Summersby,1,50.4,Butch T-Shirt with V-Neck,ES 4742
Karen Ballinger,2,134,Children's Knit Sweater,ES 4742
Wendell Summersby,2,134,Children's Knit Sweater,ES 4742
Patricia Bertolozzi,1,23.5,Strap Pants BBO,ES 798
Kyndal Hooks,4,56.8,Osprey France Nylon Shorts,US 3664
Karen Ballinger,3,60.9,Osprey Girl's Tights,US 3664
Karen Ballinger,2,60.6,Logo Coord.Children's Sweatshirt,US 2963
David Black,1,117.6,Big Guy Men's Clima Fit Jacket,US 1303
Robert Bowerman,2,189.4,Big Guy Men's Micro Fibre Jacket,US 1303
Karen Ballinger,1,32.6,Big Guy Men's Running Shorts Dri.Fit,US 1303
Wendell Summersby,1,17,Insu F.I.T Basic,US 1303
Kyndal Hooks,3,33.6,Toto Tube Socks,US 1303
Soberina Berent,1,8.2,Trois-fit Running Qtr Socks (Non-Cush),US 1303
Avinoam Zweig,2,80.4,Woman's Dri Fit Airborne Top,US 1303
Tonie Asmussen,1,29.4,Woman's Dri-Fit Scoop Neck Bra,US 1303
Avinoam Zweig,2,114.2,Woman's Work Out Pants Dri Fit,US 1303
Dericka Pockran,2,180.4,Fleece Jacket Compass,US 772
Dianne Patchin,4,142.4,Instyle Pullover Mid w/Small Zipper,US 772
Karen Ballinger,2,231.6,Mayday Resque Fleece Pullover,US 4646
Robert Bowerman,1,73.99,Armadillo Road Dmx Men's Running Shoes,CA 16733
Wendell Summersby,3,222.3,Zx Women's Dance Pants,CA 16733
Karen Ballinger,2,19.2,Socks Wmns'Fitness,US 1303
David Black,2,48.4,Swimming Trunks Struc,US 2963
Robert Bowerman,5,192,Casual Genuine Polo-Shirt,US 2963
Sandrina Stephano,2,33.8,Comp. Women's Sleeveless Polo,US 2963
Dianne Patchin,3,73.8,Mm Daypouch Shoulder Bag,US 2963
Robert Bowerman,1,19,Stars Swim Suit,US 2963
Elke Wallstab,2,78.2,Cnv Plus Men's Off Court Tennis,US 1303
Sandrina Stephano,2,126.8,Atmosphere Imara Women's Running Shoes,US 1303
Cynthia Mccluney,1,58.7,Atmosphere Shatter Mid Shoes,US 1303
Cynthia Martinez,1,50.3,Big Guy Men's Multicourt Ii Shoes,US 1303
Cynthia Mccluney,1,56.3,Woman's Air Amend Mid,US 1303
Cynthia Martinez,1,63.5,Woman's Air Imara,US 1303
Cynthia Mccluney,1,90,Dubby Low Men's Street Shoes,SE 109
Karen Ballinger,3,199.2,Lulu Men's Street Shoes,SE 109
Cynthia Martinez,1,57.3,Pro Fit Gel Ds Trainer Women's Running Shoes,US 1747
Robert Bowerman,1,101.5,Soft Alta Plus Women's Indoor Shoes,US 1747
Cynthia Martinez,2,120.4,Soft Astro Men's Running Shoes,US 1747
Cynthia Martinez,2,277.6,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,US 13198
Cynthia Martinez,1,172.5,Mns.raptor Precision Sg Football,US 2963
Karen Ballinger,3,256.2,Hardcore Junior/Women's Street Shoes Large,GB 14682
Sandrina Stephano,2,446.6,Jaguar 50-75 Liter Blue Women's Backpack,AU 10692
Karen Ballinger,1,12.2,Breaker Commandos Cap,DK 4793
Dianne Patchin,1,40.2,Breaker Frozen Husky Hat,DK 4793
Patricia Bertolozzi,1,3.2,"Backpack Flag, 6,5x9 Cm.",GB 316
Robert Bowerman,2,6.4,"Backpack Flag, 6,5x9 Cm.",GB 316
Cynthia Martinez,2,16,Knife,US 4718
Karen Ballinger,2,252.2,Lucky Tech Intergal Wp/B Rain Pants,US 772
Cynthia Martinez,2,195,Mayday Qd Zip Pants,US 4646
Karen Ballinger,4,471.2,Mayday Sports Pullover,US 4646
Karen Ballinger,1,35.5,Rain Jacket,US 772
Wendell Summersby,1,17.6,"Sheet Sleeping Bag, Red",GB 16422
Dianne Patchin,1,78.2,"Expedition Zero,Medium,Left,Charcoal",DK 755
Selim Okay,3,355.8,"Expedition 20,Large,Right,Forestgreen",DK 755
Alvan Goheen,1,86.3,"Outback Sleeping Bag, Large,Left,Blue/Black",DK 755
Bulent Urfalioglu,1,86.3,"Outback Sleeping Bag, Large,Left,Blue/Black",DK 755
Avni Umran,1,519.3,Family Holiday 4,SE 109
Raedene Van Den Berg,2,239,Buzz Saw,CA 16814
Sandrina Stephano,1,31.4,A-team Smoothsport Bra,US 3298
Raedene Van Den Berg,1,31.4,A-team Smoothsport Bra,US 3298
Sanelisiwe Collier,3,9.6,Dartsharpener Key ring,GB 4514
Raedene Van Den Berg,3,54.3,Hot Mini Backboard Bulls,NL 2995
Robert Bowerman,1,29.9,Mk Splinter 66 5m 88a Pea.,PT 1684
Cynthia Martinez,1,22.7,Prosoccer  Club Football 4/32 (Replica) Synth,US 5810
Kyndal Hooks,1,16.4,Shoeshine Black,CA 16814
Wendell Summersby,2,29.4,Sparkle Spray Orange,CA 16814
Raedene Van Den Berg,3,144.6,Fred T-Shirt,ES 4742
Raedene Van Den Berg,2,25.8,Goodtime Toilet Bag,ES 4742
Cynthia Martinez,1,41.5,Pool Shorts,ES 4742
Cynthia Mccluney,2,91.6,Saturn Big Bag,ES 4742
Alvan Goheen,2,403,Shirt Termir,ES 4742
Alvan Goheen,5,239.5,Wyoming Men's T-Shirt with V-Neck,ES 4742
Robert Bowerman,1,35.2,Aim4it 80% Tungsten 22 Gram,GB 4514
Rita Lotz,1,102.4,Children's Roller Skates,PT 1684
Robert Bowerman,2,656.6,Perfect Fit Men's Stunt Skates,US 13198
Raedene Van Den Berg,1,37.4,Pro-roll Hot Rod Roller Skates,PT 1684
Rita Lotz,1,113.2,Pro-roll Lazer Roller Skates,PT 1684
Sanelisiwe Collier,1,222,Proskater Kitalpha Gamma Roller Skates,US 3815
Raedene Van Den Berg,2,219,Proskater Viablade S Roller Skates,US 3815
Robert Bowerman,2,129,Proskater W-500 Jr.Roller Skates,US 3815
Wynella Lewis,1,251.8,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,PT 1684
Raedene Van Den Berg,3,755.4,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,PT 1684
Wynella Lewis,1,114.2,Rollerskate Roller Skates Sq5 76mm/78a,PT 1684
Kyndal Hooks,1,192.4,Rollerskate Roller Skates Sq7-Ls 76mm/78a,PT 1684
Roy Siferd,2,24.4,Bb Softspikes - Xp 22-pack,GB 15938
Wendell Summersby,2,36.2,"Bretagne Soft-Tech Men's Glove, left",NL 2995
Roy Siferd,1,13.5,"Bretagne St2 Men's Golf Glove, left",NL 2995
Angel Borwick,2,201.2,Bretagne Stabilities Tg Men's Golf Shoes,NL 2995
David Black,1,87.2,Bretagne Stabilities Women's Golf Shoes,NL 2995
Lauren Krasowski,2,174.4,Bretagne Stabilities Women's Golf Shoes,NL 2995
Susan Krasowski,4,168,Carolina II,US 3808
Portia Reynoso,2,16.6,Extreme Distance 90 3-pack,US 3808
Lera Knott,1,14.6,Grandslam Staff Grip Llh Golf Gloves,US 3808
Angel Borwick,3,658.5,Hi-fly Intimidator Ti R80/10,NL 2995
Portia Reynoso,4,702,Hi-fly Intrepid Stand 8  Black,NL 2995
Soberina Berent,2,706.2,Normal Standard,GB 15938
Wilma Yeargan,4,1937.2,Proplay Executive Bi-Metal Graphite,NL 2995
Angel Borwick,2,215.8,Proplay Stand Black,NL 2995
Susan Krasowski,1,121,Proplay Women's Tour Force 7w,NL 2995
Robert Bowerman,2,306.2,Rubby Men's Golf Shoes w/Goretex,ES 4168
Lera Knott,2,29.4,Score Counter Scoreboard De Luxe,NL 2995
Wilma Yeargan,1,150.1,Big Boss Houston Pants,US 7511
Duncan Robertshawe,1,147.1,Eagle Windstopper Sweat Neck,US 10225
Lauren Krasowski,1,107.3,Top (1/100),US 7511
Dericka Pockran,2,362.6,Wind Proof Windstopper Merino/Acryl,US 10225
Robert Bowerman,1,72.6,Abdomen Shaper,NL 16542
Karen Ballinger,2,1066.4,Letour Heart Bike,NL 16542
Wendell Summersby,1,19.9,Wrist Weight  2.25 Kg,NL 16542
Karen Ballinger,1,321.5,Top Men's Goretex Ski Pants,US 14648
Ines Deisser,2,351.4,Sledgehammer 120 Ph Black,GB 17832
Robert Bowerman,1,19.1,Smasher Shorts,GB 1280
Robert Bowerman,1,19.1,Smasher Shorts,GB 1280
Lendon Celii,3,160.5,"A-team Sweat Round Neck, Small Logo",US 3298
Karolina Dokter,2,258.2,Triffy Jacket,NL 13314
Kyndal Hooks,2,110.2,Ypsilon Men's Sweatshirt w/Piping,FR 14624
Kyndal Hooks,2,47.6,Men's Singlet,BE 5922
Karen Ballinger,3,95.1,T-Shirt,US 2963
Karolina Dokter,2,81.2,Bike.Pants Short Biking Pants,BE 5922
Cynthia Mccluney,3,403.5,Force Micro Men's Suit,BE 5922
Cynthia Mccluney,2,78.4,Force Short Sprinter Men's Tights,BE 5922
Wynella Lewis,2,134.6,Force Technical Jacket w/Coolmax,BE 5922
Karolina Dokter,3,358.2,Polar Jacket,BE 5922
Karen Ballinger,2,48.2,Stout Running Shorts Micro,BE 5922
Ramesh Trentholme,2,60.8,Sharky Swimming Trunks,US 16292
Robyn Klem,1,46.1,Sunfit Luffa Bikini,US 6153
Robyn Klem,2,70.2,Pew Swimming Trunks,ES 4742
Dianne Patchin,5,118,Armour L,US 3298
Karen Ballinger,3,79.8,Armour XL,US 3298
Dianne Patchin,2,45.7,Football - Helmet M,US 3298
Dianne Patchin,2,19.98,Football Super Bowl,US 3808
Dianne Patchin,2,56,Bat - Home Run M,US 15218
Karen Ballinger,3,80.7,Bat - Home Run S,US 15218
Wynella Lewis,4,75.2,Helmet L,US 15218
Lendon Celii,1,16.9,Helmet M,US 15218
Karen Ballinger,1,21.99,Basket Ball Pro,US 10225
Annmarie Leveille,2,24.8,Red Cap,GB 6071
Robyn Klem,1,46.9,Fga Home Shorts,US 14593
Cynthia Mccluney,3,140.7,Fga Home Shorts,US 14593
Dianne Patchin,2,126,Soccer Fan Football Player Shirt,GB 6071
Cynthia Martinez,3,760.8,Helmsdale Ski Pants,US 772
Cynthia Mccluney,2,174.4,Amber Cc,CA 16814
Robyn Klem,2,195.6,Cayenne Red,CA 16814
Wynella Lewis,6,160.8,Shine Black PRO,CA 16814
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

data ORION.DISCOUNT;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Unit_Sales_Price length=8 label='Discount Retail Sales Price per Unit' format=DOLLAR13.2;
   attrib Discount length=8 label='Discount as Percent of Normal Retail Sales Price' format=PERCENT.;

   infile datalines dsd;
   input
      Product_ID
      Start_Date
      End_Date
      Unit_Sales_Price
      Discount
   ;
datalines4;
210100100027,18748,18778,17.99,0.7
210100100030,18840,18870,32.99,0.7
210100100033,18840,18870,161.99,0.7
210100100034,18840,18870,187.99,0.7
210100100035,18748,18778,172.99,0.7
210100100038,18809,18839,59.99,0.6
210100100039,18779,18870,21.99,0.7
210100100048,18840,18870,13.99,0.7
210100100049,18840,18870,10.99,0.7
210200100007,18962,18992,12.99,0.5
210200100010,18809,18839,26.99,0.6
210200100012,18840,18870,13.99,0.7
210200100014,18809,18839,21.99,0.6
210200100015,18840,18870,26.99,0.7
210200100016,18840,18870,22.99,0.7
210200200001,18809,18839,10.99,0.6
210200200020,18809,18839,10.99,0.6
210200200026,18809,18839,12.99,0.6
210200200028,18779,18808,17.99,0.6
210200200030,18840,18870,34.99,0.7
210200300012,18809,18839,11.99,0.6
210200300013,18962,18992,7.99,0.5
210200300025,18962,18992,22.99,0.5
210200300032,18962,18992,23.99,0.5
210200300046,18809,18839,36.99,0.6
210200300050,18779,18808,15.99,0.7
210200300057,18840,18870,23.99,0.7
210200300061,18962,18992,14.99,0.5
210200300094,18840,18870,13.99,0.7
210200400002,18962,18992,25.99,0.5
210200400007,18779,18808,26.99,0.7
210200400039,18962,18992,22.99,0.5
210200400051,18840,18870,29.99,0.7
210200400052,18809,18839,25.99,0.6
210200400092,18962,18992,31.99,0.5
210200400096,18779,18808,34.99,0.7
210200600006,18962,18992,10.99,0.5
210200600013,18809,18839,58.99,0.6
210200600017,18779,18808,25.99,0.7
210200600019,18779,18808,9.99,0.7
210200600024,18962,18992,26.99,0.5
210200600025,18840,18870,26.99,0.7
210200600026,18962,18992,18.99,0.5
210200600037,18779,18808,16.99,0.7
210200600060,18840,18870,36.99,0.7
210200600080,18840,18870,14.99,0.7
210200600086,18962,18992,19.99,0.5
210200600089,18779,18808,11.99,0.7
210200600095,18840,18870,25.99,0.7
210200600097,18809,18839,42.99,0.6
210200600098,18809,18839,17.99,0.6
210200600101,18962,18992,11.99,0.5
210200600103,18809,18839,16.99,0.6
210200600104,18809,18839,8.99,0.6
210200600123,18840,18870,5.99,0.7
210200600125,18840,18870,32.99,0.7
210200900008,18840,18870,23.99,0.7
210200900009,18962,18992,17.99,0.5
210200900024,18779,18870,13.99,0.7
210200900031,18779,18808,34.99,0.7
210200900038,18962,18992,10.99,0.5
210200900041,18840,18870,27.99,0.7
210200900051,18779,18808,31.99,0.7
210201000013,18840,18870,38.99,0.7
210201000016,18779,18808,32.99,0.7
210201000018,18962,18992,8.99,0.5
210201000020,18840,18870,24.99,0.7
210201000035,18809,18839,39.99,0.6
210201000053,18809,18839,28.99,0.6
210201000056,18779,18808,27.99,0.7
210201000078,18840,18870,36.99,0.7
210201000079,18809,18839,34.99,0.6
210201000080,18779,18808,78.99,0.7
210201000082,18962,18992,18.99,0.5
210201000095,18779,18870,47.99,0.7
210201000107,18779,18839,3.99,0.6
210201000115,18962,18992,5.99,0.5
210201000117,18840,18870,34.99,0.7
210201000120,18809,18839,13.99,0.6
210201000123,18809,18870,8.99,0.7
210201000123,18962,18992,6.99,0.5
210201000125,18840,18870,38.99,0.7
210201000125,18962,18992,27.99,0.5
210201000128,18779,18808,25.99,0.7
210201000132,18840,18870,16.99,0.7
210201000134,18779,18808,30.99,0.7
210201000138,18779,18808,48.99,0.7
210201000139,18809,18839,22.99,0.6
210201000139,18962,18992,19.99,0.5
210201000149,18779,18808,45.99,0.7
210201000156,18779,18808,24.99,0.7
210201000161,18779,18808,3.99,0.7
210201000169,18962,18992,14.99,0.5
210201000171,18809,18839,25.99,0.6
210201000184,18809,18839,28.99,0.6
210201000185,18840,18870,17.99,0.7
210201000188,18962,18992,18.99,0.5
210201000191,18809,18839,21.99,0.6
210201000204,18840,18870,27.99,0.7
210201000208,18962,18992,28.99,0.5
210201100006,18809,18839,46.99,0.6
220100100004,18779,18839,19.99,0.6
220100100018,18779,18808,10.99,0.7
220100100046,18809,18839,10.99,0.6
220100100052,18809,18839,16.99,0.6
220100100052,18962,18992,16.99,0.5
220100100076,18840,18870,25.99,0.7
220100100087,18809,18839,141.99,0.6
220100100106,18779,18808,67.99,0.7
220100100121,18840,18870,59.99,0.7
220100100141,18779,18808,57.99,0.7
220100100165,18962,18992,37.99,0.5
220100100167,18962,18992,10.99,0.5
220100100173,18809,18839,31.99,0.6
220100100179,18779,18808,42.99,0.7
220100100196,18962,18992,43.99,0.5
220100100210,18840,18870,28.99,0.7
220100100212,18779,18808,47.99,0.7
220100100218,18962,18992,22.99,0.5
220100100226,18779,18808,18.99,0.7
220100100245,18779,18808,21.99,0.7
220100100278,18779,18808,16.99,0.7
220100100284,18809,18839,51.99,0.6
220100100309,18809,18839,59.99,0.6
220100100326,18809,18839,104.99,0.6
220100100336,18840,18870,26.99,0.7
220100100340,18809,18839,25.99,0.6
220100100344,18779,18808,56.99,0.7
220100100349,18840,18870,52.99,0.7
220100100351,18809,18839,39.99,0.6
220100100351,18962,18992,37.99,0.5
220100100406,18779,18808,15.99,0.7
220100100411,18962,18992,36.99,0.5
220100100423,18809,18839,10.99,0.6
220100100431,18962,18992,34.99,0.5
220100100462,18840,18870,66.99,0.7
220100100470,18962,18992,64.99,0.5
220100100536,18809,18839,127.99,0.6
220100100555,18840,18870,34.99,0.7
220100100588,18809,18839,20.99,0.6
220100100593,18840,18870,103.99,0.7
220100100619,18962,18992,21.99,0.5
220100100626,18779,18808,25.99,0.7
220100100638,18840,18870,44.99,0.7
220100200006,18809,18839,27.99,0.6
220100200008,18962,18992,25.99,0.5
220100200011,18962,18992,33.99,0.5
220100200020,18809,18839,32.99,0.6
220100200020,18962,18992,27.99,0.5
220100200021,18840,18870,26.99,0.7
220100300041,18628,18658,123.99,0.6
220100400014,18840,18870,52.99,0.7
220100400015,18779,18808,51.99,0.7
220100400021,18962,18992,45.99,0.5
220100400027,18962,18992,51.99,0.5
220100500002,18840,18870,62.99,0.7
220100500016,18962,18992,103.99,0.5
220100700005,18809,18839,100.99,0.6
220100700013,18809,18839,47.99,0.6
220100700016,18779,18808,70.99,0.7
220100700023,18779,18808,73.99,0.7
220100700024,18809,18839,69.99,0.6
220100700033,18840,18870,40.99,0.7
220100700039,18962,18992,33.99,0.5
220100700047,18962,18992,69.99,0.5
220100700049,18840,18870,115.99,0.7
220100700049,18962,18992,87.99,0.5
220100800001,18840,18870,31.99,0.7
220100800008,18779,18808,32.99,0.7
220100800012,18779,18808,29.99,0.7
220100800015,18809,18839,36.99,0.6
220100800019,18779,18808,17.99,0.7
220100800035,18809,18839,21.99,0.6
220100800054,18779,18808,41.99,0.7
220100800063,18779,18808,26.99,0.7
220100800067,18809,18839,19.99,0.6
220100800069,18809,18839,22.99,0.6
220100800073,18840,18870,20.99,0.7
220100800075,18809,18839,29.99,0.6
220100800075,18962,18992,24.99,0.5
220100800080,18962,18992,17.99,0.5
220100800086,18840,18870,48.99,0.7
220100800089,18779,18808,36.99,0.7
220100800094,18840,18870,66.99,0.7
220100800098,18962,18992,27.99,0.5
220100900008,18962,18992,11.99,0.5
220100900016,18840,18870,58.99,0.7
220100900028,18809,18839,18.99,0.6
220100900032,18840,18870,97.99,0.7
220101000001,18840,18870,13.99,0.7
220101000004,18840,18870,36.99,0.7
220101100003,18809,18839,9.99,0.6
220101100035,18840,18870,8.99,0.7
220101100039,18840,18870,4.99,0.7
220101200001,18962,18992,29.99,0.5
220101200031,18779,18808,155.99,0.7
220101200035,18779,18808,63.99,0.7
220101200036,18840,18870,29.99,0.7
220101300001,18779,18808,22.99,0.6
220101300019,18779,18808,38.99,0.6
220101400019,18809,18839,61.99,0.6
220101400026,18840,18870,20.99,0.7
220101400029,18962,18992,2.99,0.5
220101400044,18809,18839,26.99,0.6
220101400045,18809,18839,20.99,0.6
220101400052,18809,18839,118.99,0.6
220101400071,18962,18992,12.99,0.5
220101400074,18779,18870,6.99,0.7
220101400082,18962,18992,19.99,0.5
220101400092,18809,18839,35.99,0.6
220101400101,18962,18992,13.99,0.5
220101400111,18840,18870,17.99,0.7
220101400137,18962,18992,32.99,0.5
220101400150,18809,18839,18.99,0.6
220101400173,18779,18808,12.99,0.7
220101400173,18962,18992,8.99,0.5
220101400183,18962,18992,45.99,0.5
220101400184,18962,18992,28.99,0.5
220101400187,18809,18839,33.99,0.6
220101400192,18840,18870,20.99,0.7
220101400200,18840,18870,20.99,0.7
220101400201,18840,18870,30.99,0.7
220101400203,18962,18992,20.99,0.5
220101400212,18840,18870,41.99,0.7
220101400213,18779,18808,50.99,0.7
220101400223,18962,18992,19.99,0.5
220101400232,18809,18839,21.99,0.6
220101400234,18779,18808,40.99,0.7
220101400234,18962,18992,29.99,0.5
220101400235,18962,18992,28.99,0.5
220101400249,18779,18808,60.99,0.7
220101400254,18962,18992,29.99,0.5
220101400262,18840,18870,68.99,0.7
220101400266,18962,18992,20.99,0.5
220101400272,18809,18870,30.99,0.7
220101400282,18809,18839,25.99,0.6
220101400284,18779,18808,36.99,0.7
220101400289,18962,18992,32.99,0.5
220101400304,18962,18992,9.99,0.5
220101400313,18809,18839,59.99,0.6
220101400316,18779,18808,21.99,0.7
220101400325,18962,18992,6.99,0.5
220101400331,18840,18870,34.99,0.7
220101400332,18779,18808,42.99,0.7
220101400338,18840,18870,26.99,0.7
220101400341,18962,18992,17.99,0.5
220101400366,18962,18992,42.99,0.5
220101400367,18962,18992,35.99,0.5
220101400373,18779,18808,39.99,0.7
220101400375,18809,18839,57.99,0.6
220101400379,18809,18839,25.99,0.6
220101400390,18809,18839,26.99,0.6
220101400399,18840,18870,47.99,0.7
220101400411,18840,18870,32.99,0.7
220101400426,18962,18992,67.99,0.5
220101400432,18962,18992,21.99,0.5
220101400434,18779,18808,34.99,0.7
220101500013,18840,18870,84.99,0.7
220200100003,18809,18839,21.99,0.6
220200100059,18809,18839,91.99,0.6
220200100077,18779,18808,71.99,0.7
220200100085,18840,18870,48.99,0.7
220200100113,18779,18808,100.99,0.7
220200100115,18809,18839,92.99,0.6
220200100151,18840,18870,33.99,0.7
220200100239,18840,18870,40.99,0.7
220200100247,18962,18992,34.99,0.7
220200200017,18809,18839,89.99,0.6
220200200020,18779,18808,134.99,0.7
220200200031,18962,18992,28.99,0.5
220200200055,18809,18839,114.99,0.6
220200200057,18962,18992,34.99,0.5
220200200059,18840,18870,98.99,0.7
220200200067,18962,18992,47.99,0.5
220200200070,18809,18839,80.99,0.6
220200300008,18809,18839,42.99,0.6
220200300012,18840,18870,63.99,0.7
220200300025,18809,18839,51.99,0.6
220200300027,18809,18839,40.99,0.6
220200300053,18779,18808,44.99,0.7
220200300064,18840,18870,106.99,0.7
220200300073,18840,18870,59.99,0.7
220200300073,18962,18992,43.99,0.5
220200300086,18840,18870,102.99,0.7
220200300087,18840,18870,82.99,0.7
220200300110,18809,18839,37.99,0.6
220200300117,18840,18870,72.99,0.7
220200300118,18809,18839,61.99,0.6
220200300137,18809,18839,60.99,0.6
220200300138,18779,18808,56.99,0.7
220200300138,18962,18992,40.99,0.5
220200300139,18809,18839,47.99,0.6
220200300144,18840,18870,60.99,0.7
220200300146,18840,18870,31.99,0.7
220200300146,18962,18992,24.99,0.5
220200300149,18779,18808,18.99,0.7
220200300152,18779,18870,63.99,0.7
220200300161,18840,18870,16.99,0.7
220200300162,18809,18839,28.99,0.6
220200300164,18809,18839,56.99,0.6
230100100004,18779,18808,90.99,0.6
230100100006,18779,18808,109.99,0.6
230100100006,18962,18992,91.99,0.5
230100100019,18659,18686,51.99,0.5
230100100024,18779,18808,29.99,0.6
230100100033,18628,18658,29.99,0.5
230100100039,18962,18992,31.99,0.5
230100100040,18962,18992,95.99,0.5
230100100043,18779,18808,51.99,0.6
230100100047,18962,18992,168.99,0.5
230100200011,18840,18870,124.99,0.7
230100200013,18962,18992,18.99,0.5
230100200023,18962,18992,129.99,0.5
230100200028,18840,18870,57.99,0.7
230100200032,18840,18870,111.99,0.7
230100200034,18779,18808,134.99,0.6
230100200059,18779,18808,26.99,0.6
230100200071,18748,18778,50.99,0.7
230100400001,18659,18686,10.99,0.5
230100400009,18659,18686,7.99,0.5
230100400020,18628,18658,8.99,0.5
230100400022,18659,18686,9.99,0.5
230100400026,18962,18992,11.99,0.5
230100400028,18962,18992,8.99,0.5
230100500019,18840,18870,10.99,0.7
230100500027,18840,18870,44.99,0.7
230100500031,18748,18839,64.99,0.6
230100500033,18748,18778,10.99,0.7
230100500040,18748,18778,8.99,0.7
230100500055,18779,18808,17.99,0.6
230100500061,18809,18839,12.99,0.6
230100500090,18748,18778,62.99,0.7
230100500093,18779,18808,85.99,0.6
230100600009,18809,18839,76.99,0.6
230100700001,18748,18778,23.99,0.7
240100100005,18962,18992,3.99,0.5
240100100015,18809,18839,52.99,0.6
240100100021,18779,18808,48.99,0.7
240100100028,18779,18808,2.99,0.7
240100100028,18962,18992,1.99,0.5
240100100037,18779,18808,62.99,0.7
240100100038,18779,18808,63.99,0.7
240100100042,18779,18808,81.99,0.7
240100100044,18779,18808,57.99,0.7
240100100047,18840,18870,47.99,0.7
240100100057,18840,18870,14.99,0.7
240100100062,18840,18870,14.99,0.7
240100100064,18779,18808,19.99,0.7
240100100065,18809,18839,25.99,0.6
240100100084,18840,18870,11.99,0.7
240100100096,18779,18808,14.99,0.7
240100100097,18779,18808,1.99,0.7
240100100097,18962,18992,0.99,0.5
240100100098,18779,18808,29.99,0.7
240100100104,18779,18808,32.99,0.7
240100100106,18809,18839,151.99,0.6
240100100110,18962,18992,91.99,0.5
240100100116,18962,18992,12.99,0.5
240100100124,18809,18839,21.99,0.6
240100100136,18779,18870,155.99,0.7
240100100156,18840,18870,18.99,0.7
240100100161,18809,18839,69.99,0.6
240100100164,18962,18992,1.99,0.5
240100100169,18962,18992,21.99,0.5
240100100171,18840,18870,5.99,0.7
240100100171,18962,18992,4.99,0.5
240100100177,18840,18870,72.99,0.7
240100100178,18962,18992,13.99,0.5
240100100179,18840,18870,59.99,0.7
240100100183,18962,18992,6.99,0.5
240100100194,18809,18839,25.99,0.6
240100100210,18779,18839,14.99,0.6
240100100211,18962,18992,21.99,0.5
240100100222,18809,18839,56.99,0.6
240100100225,18840,18870,4.99,0.7
240100100235,18809,18839,9.99,0.6
240100100239,18809,18839,8.99,0.6
240100100241,18779,18808,9.99,0.7
240100100243,18840,18870,7.99,0.7
240100100244,18840,18870,13.99,0.7
240100100246,18840,18870,17.99,0.7
240100100247,18809,18839,58.99,0.6
240100100248,18779,18808,10.99,0.7
240100100250,18779,18808,11.99,0.7
240100100254,18840,18870,12.99,0.7
240100100271,18779,18808,11.99,0.7
240100100272,18840,18870,10.99,0.7
240100100290,18809,18839,15.99,0.6
240100100293,18779,18808,14.99,0.7
240100100294,18809,18839,10.99,0.6
240100100299,18779,18808,139.99,0.7
240100100302,18962,18992,4.99,0.5
240100100306,18962,18992,4.99,0.5
240100100307,18840,18870,6.99,0.7
240100100315,18962,18992,6.99,0.5
240100100318,18779,18808,15.99,0.7
240100100319,18962,18992,12.99,0.5
240100100320,18962,18992,10.99,0.5
240100100340,18779,18808,82.99,0.7
240100100352,18840,18870,17.99,0.7
240100100359,18840,18870,9.99,0.7
240100100362,18809,18839,6.99,0.6
240100100366,18962,18992,9.99,0.5
240100100367,18809,18839,40.99,0.6
240100100368,18840,18870,37.99,0.7
240100100369,18840,18870,42.99,0.7
240100100370,18779,18839,5.99,0.6
240100100370,18962,18992,4.99,0.5
240100100371,18779,18808,22.99,0.7
240100100382,18840,18870,7.99,0.7
240100100390,18779,18808,10.99,0.7
240100100391,18840,18870,8.99,0.7
240100100397,18840,18870,16.99,0.7
240100100404,18809,18839,44.99,0.6
240100100409,18962,18992,21.99,0.5
240100100411,18779,18808,4.99,0.7
240100100414,18840,18870,19.99,0.7
240100100419,18840,18870,21.99,0.7
240100100422,18840,18870,16.99,0.7
240100100432,18840,18870,1.99,0.7
240100100445,18809,18839,51.99,0.6
240100100453,18809,18839,17.99,0.6
240100100479,18809,18839,5.99,0.6
240100100485,18962,18992,0.99,0.5
240100100494,18840,18870,8.99,0.7
240100100496,18840,18870,10.99,0.7
240100100507,18840,18870,34.99,0.7
240100100508,18962,18992,24.99,0.5
240100100516,18809,18839,17.99,0.6
240100100519,18809,18839,19.99,0.6
240100100538,18809,18839,6.99,0.6
240100100554,18809,18839,42.99,0.6
240100100557,18809,18839,50.99,0.6
240100100565,18809,18839,65.99,0.6
240100100586,18779,18808,18.99,0.7
240100100588,18962,18992,27.99,0.5
240100100601,18779,18808,46.99,0.7
240100100603,18962,18992,5.99,0.5
240100100617,18840,18870,4.99,0.7
240100100621,18809,18839,38.99,0.6
240100100623,18809,18839,11.99,0.6
240100100629,18809,18839,32.99,0.6
240100100636,18809,18839,16.99,0.6
240100100649,18840,18870,61.99,0.7
240100100653,18962,18992,34.99,0.5
240100100656,18809,18870,88.99,0.7
240100100657,18779,18808,58.99,0.7
240100100662,18962,18992,24.99,0.5
240100100685,18962,18992,14.99,0.5
240100100700,18962,18992,50.99,0.5
240100100709,18809,18839,32.99,0.6
240100100712,18840,18870,48.99,0.7
240100100713,18809,18839,40.99,0.6
240100100718,18809,18839,44.99,0.6
240100100722,18840,18870,34.99,0.7
240100100726,18779,18808,23.99,0.7
240100100728,18840,18870,14.99,0.7
240100100733,18779,18808,32.99,0.7
240100100739,18809,18839,83.99,0.6
240100100739,18962,18992,69.99,0.5
240100400001,18809,18839,108.99,0.5
240100400005,18718,18747,135.99,0.5
240100400015,18840,18870,200.99,0.7
240100400026,18779,18808,68.99,0.7
240100400028,18809,18839,9.99,0.5
240100400032,18779,18808,209.99,0.7
240100400042,18840,18870,47.99,0.7
240100400044,18809,18839,201.99,0.5
240100400046,18718,18747,199.99,0.5
240100400048,18718,18747,165.99,0.5
240100400051,18840,18870,4.99,0.7
240100400056,18840,18870,100.99,0.7
240100400068,18718,18747,101.99,0.5
240100400081,18809,18839,67.99,0.5
240100400085,18718,18747,36.99,0.5
240100400096,18809,18839,100.99,0.5
240100400127,18809,18839,102.99,0.5
240100400148,18779,18808,206.99,0.7
240200100003,18779,18839,118.99,0.6
240200100003,18809,18870,137.99,0.7
240200100008,18779,18808,24.99,0.6
240200100010,18809,18839,7.99,0.6
240200100016,18962,18992,21.99,0.7
240200100025,18748,18778,14.99,0.7
240200100035,18840,18870,9.99,0.7
240200100036,18748,18778,11.99,0.7
240200100040,18962,18992,15.99,0.7
240200100050,18962,18992,9.99,0.7
240200100062,18809,18839,9.99,0.6
240200100072,18779,18808,6.99,0.6
240200100073,18809,18839,14.99,0.6
240200100080,18840,18870,389.99,0.7
240200100090,18748,18778,10.99,0.7
240200100096,18748,18778,692.99,0.7
240200100102,18809,18839,9.99,0.6
240200100103,18748,18778,9.99,0.7
240200100103,18962,18992,9.99,0.7
240200100114,18962,18992,121.99,0.7
240200100121,18962,18992,98.99,0.7
240200100122,18779,18808,76.99,0.6
240200100123,18962,18992,166.99,0.7
240200100131,18779,18839,49.99,0.6
240200100137,18809,18839,5.99,0.6
240200100142,18809,18839,9.99,0.6
240200100143,18962,18992,13.99,0.7
240200100146,18748,18778,294.99,0.7
240200100146,18840,18870,294.99,0.7
240200100151,18748,18778,738.99,0.7
240200100156,18809,18839,15.99,0.6
240200100161,18748,18778,45.99,0.7
240200100166,18779,18870,44.99,0.7
240200100169,18748,18778,11.99,0.7
240200100171,18748,18778,2.99,0.7
240200100173,18748,18778,342.99,0.7
240200100176,18840,18870,460.99,0.7
240200100184,18809,18870,82.99,0.7
240200100188,18779,18808,23.99,0.6
240200100197,18809,18839,38.99,0.6
240200100201,18809,18839,35.99,0.6
240200100206,18779,18808,81.99,0.6
240200100218,18840,18870,39.99,0.7
240200100227,18779,18808,92.99,0.6
240200100230,18840,18870,10.99,0.7
240200100231,18809,18839,5.99,0.6
240200100237,18840,18870,62.99,0.7
240200200005,18809,18839,17.99,0.6
240200200010,18840,18870,104.99,0.7
240200200011,18840,18870,97.99,0.7
240200200013,18779,18808,301.99,0.6
240200200014,18779,18808,79.99,0.6
240200200016,18962,18992,92.99,0.7
240200200017,18840,18870,81.99,0.7
240200200023,18748,18778,45.99,0.7
240200200027,18748,18778,57.99,0.7
240200200033,18840,18870,58.99,0.7
240200200033,18962,18992,58.99,0.7
240200200034,18962,18992,12.99,0.7
240200200041,18809,18839,45.99,0.6
240200200048,18748,18778,32.99,0.7
240200200052,18809,18839,43.99,0.6
240200200067,18840,18870,201.99,0.7
240200200070,18840,18870,17.99,0.7
240200200084,18962,18992,57.99,0.7
240200200091,18748,18778,145.99,0.7
240300100008,18962,18992,3.99,0.5
240300100016,18628,18658,22.99,0.5
240300100019,18628,18658,13.99,0.5
240300100034,18628,18658,28.99,0.5
240300100034,18962,18992,28.99,0.5
240300100049,18962,18992,11.99,0.5
240300100057,18628,18658,20.99,0.5
240300200025,18628,18658,75.99,0.7
240300200025,18962,18992,54.99,0.5
240300200038,18962,18992,37.99,0.5
240300200047,18628,18658,34.99,0.7
240300200054,18628,18658,6.99,0.7
240300200056,18628,18658,87.99,0.7
240300200057,18962,18992,33.99,0.5
240300300012,18628,18658,17.99,0.5
240300300022,18628,18658,157.99,0.5
240300300024,18962,18992,30.99,0.5
240300300047,18962,18992,32.99,0.5
240300300058,18628,18658,242.99,0.5
240300300074,18962,18992,28.99,0.5
240300300083,18628,18658,12.99,0.5
240300300084,18628,18658,17.99,0.5
240300300087,18962,18992,36.99,0.5
240300300090,18962,18992,267.99,0.5
240300300092,18962,18992,128.99,0.5
240300300096,18628,18658,24.99,0.5
240300300111,18962,18992,42.99,0.5
240300300116,18962,18992,24.99,0.5
240400200028,18962,18992,166.99,0.7
240400200070,18840,18870,62.99,0.7
240400200075,18840,18870,44.99,0.7
240400200079,18840,18870,235.99,0.7
240400200081,18962,18992,240.99,0.7
240400300003,18809,18839,42.99,0.6
240400300004,18962,18992,60.99,0.7
240400300005,18718,18747,45.99,0.7
240400300006,18748,18808,23.99,0.6
240400300011,18718,18747,35.99,0.7
240400300012,18962,18992,51.99,0.7
240400300013,18718,18747,36.99,0.7
240400300022,18809,18839,24.99,0.6
240400300028,18962,18992,56.99,0.7
240400300038,18748,18778,23.99,0.6
240500100009,18962,18992,47.99,0.7
240500100011,18779,18808,28.99,0.7
240500100013,18962,18992,42.99,0.7
240500100015,18779,18808,41.99,0.7
240500100024,18840,18870,28.99,0.7
240500100031,18962,18992,41.99,0.7
240500100041,18962,18992,87.99,0.7
240500100043,18962,18992,21.99,0.7
240500100059,18809,18839,42.99,0.6
240500100061,18779,18808,58.99,0.7
240500200003,18779,18808,17.99,0.7
240500200018,18779,18808,31.99,0.7
240500200018,18962,18992,31.99,0.7
240500200022,18779,18808,24.99,0.7
240500200031,18779,18839,24.99,0.6
240500200032,18962,18992,40.99,0.7
240500200038,18779,18808,51.99,0.7
240500200050,18840,18870,40.99,0.7
240500200053,18962,18992,39.99,0.7
240500200058,18809,18839,13.99,0.6
240500200093,18809,18839,25.99,0.6
240500200094,18809,18839,43.99,0.6
240500200094,18962,18992,50.99,0.7
240500200098,18809,18839,27.99,0.6
240500200099,18962,18992,38.99,0.7
240500200113,18840,18870,33.99,0.7
240500200121,18840,18870,17.99,0.7
240500200127,18809,18839,25.99,0.6
240500200137,18779,18808,19.99,0.7
240500200142,18809,18870,5.99,0.7
240500200146,18809,18839,35.99,0.6
240500200147,18809,18839,37.99,0.6
240500200148,18962,18992,109.99,0.7
240500200149,18840,18870,210.99,0.7
240600100003,18809,18839,36.99,0.6
240600100004,18779,18808,31.99,0.5
240600100006,18809,18839,5.99,0.6
240600100011,18748,18778,29.99,0.7
240600100014,18748,18778,7.99,0.7
240600100021,18779,18808,36.99,0.5
240600100038,18779,18808,22.99,0.5
240600100044,18840,18870,6.99,0.7
240600100051,18779,18870,29.99,0.7
240600100052,18779,18808,23.99,0.5
240600100056,18748,18778,26.99,0.7
240600100059,18809,18839,2.99,0.6
240600100067,18779,18870,32.99,0.7
240600100068,18840,18870,42.99,0.7
240600100079,18840,18870,41.99,0.7
240600100087,18809,18839,26.99,0.6
240600100089,18779,18808,11.99,0.5
240600100100,18840,18870,42.99,0.7
240600100101,18748,18839,38.99,0.6
240600100106,18840,18870,39.99,0.7
240600100115,18840,18870,34.99,0.7
240600100123,18779,18808,30.99,0.5
240600100133,18748,18778,29.99,0.7
240600100137,18840,18870,16.99,0.7
240600100142,18748,18808,13.99,0.5
240600100148,18840,18870,16.99,0.7
240600100162,18840,18870,43.99,0.7
240600100172,18809,18839,14.99,0.6
240600100175,18779,18808,12.99,0.5
240600100191,18840,18870,25.99,0.7
240600100194,18779,18808,12.99,0.5
240600100196,18748,18778,43.99,0.7
240600100199,18809,18839,10.99,0.6
240600100204,18779,18808,17.99,0.5
240700100004,18779,18808,14.99,0.7
240700100009,18809,18839,17.99,0.6
240700100011,18809,18839,5.99,0.6
240700100017,18962,18992,9.99,0.6
240700200004,18962,18992,12.99,0.6
240700200005,18779,18808,15.99,0.7
240700200006,18779,18808,31.99,0.7
240700200007,18962,18992,12.99,0.6
240700200016,18840,18870,4.99,0.7
240700200018,18840,18870,6.99,0.7
240700400001,18840,18870,45.99,0.7
240700400002,18779,18808,26.99,0.7
240700400011,18748,18778,12.99,0.6
240700400016,18840,18870,54.99,0.7
240700400022,18779,18808,23.99,0.7
240700400025,18718,18747,28.99,0.7
240700400027,18962,18992,50.99,0.6
240700400028,18748,18778,26.99,0.6
240700400029,18840,18870,10.99,0.7
240700400030,18748,18778,14.99,0.6
240700400032,18779,18808,22.99,0.7
240700400034,18748,18778,9.99,0.6
240700400034,18840,18870,10.99,0.7
240800100014,18628,18658,182.99,0.5
240800100019,18962,18992,21.99,0.4
240800100039,18628,18658,52.99,0.5
240800100050,18628,18658,158.99,0.5
240800100053,18659,18686,128.99,0.4
240800100062,18628,18658,211.99,0.5
240800100081,18962,18992,107.99,0.4
240800100084,18659,18686,26.99,0.4
240800100099,18962,18992,11.99,0.4
240800200007,18659,18686,9.99,0.4
240800200009,18962,18992,41.99,0.4
240800200022,18628,18658,30.99,0.5
240800200032,18628,18658,27.99,0.5
240800200044,18659,18686,26.99,0.4
240800200045,18628,18686,31.99,0.4
240800200054,18628,18658,13.99,0.5
240800200056,18962,18992,28.99,0.4
240800200064,18962,18992,17.99,0.4
240800200065,18962,18992,17.99,0.4
;;;;
run;

data ORION.DONATE;
   attrib Employee_ID length=8 label='Employee_ID';
   attrib Qtr length=8 label='Qtr';
   attrib Amount length=8 label='Amount';

   infile datalines dsd;
   input
      Employee_ID
      Qtr
      Amount
   ;
datalines4;
11036,2,20
11036,3,25
11057,1,10
11057,2,10
11057,3,10
11608,1,50
11608,3,50
11945,1,15
11945,2,20
11945,3,20
12321,1,100
12325,4,125
12447,1,35
12447,2,35
12447,3,35
12447,4,35
;;;;
run;

data ORION.EMPLOYEES;
   attrib Employee_ID length=8 format=12.;
   attrib Name length=$40;
   attrib Street_Number length=8;
   attrib Street_Name length=$40;
   attrib City length=$30;
   attrib State length=$2;
   attrib Postal_Code length=$10;
   attrib Country length=$2;
   attrib Job_Title length=$25;
   attrib Department length=$40;
   attrib Manager_ID length=8;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Birth_Date length=8;
   attrib Hire_date length=8;
   attrib Term_date length=8;
   attrib Marital_Status length=$1;
   attrib Dependents length=8;

   infile datalines dsd;
   input
      Employee_ID
      Name
      Street_Number
      Street_Name
      City
      State
      Postal_Code
      Country
      Job_Title
      Department
      Manager_ID
      Gender
      Salary
      Birth_Date
      Hire_date
      Term_date
      Marital_Status
      Dependents
   ;
datalines4;
120101,"Lu, Patrick",51,Botany Road,Sydney,,1230,AU,Director,Sales Management,120261,M,163040,7535,17348,,S,0
120102,"Zhou, Tom",1,Adelaide Street MIC Court,Melbourne,,3125,AU,Sales Manager,Sales Management,120101,M,108255,4971,12205,,O,2
120103,"Dawes, Wilson",166,Toorak Road,Sydney,,2119,AU,Sales Manager,Sales Management,120101,M,87975,-2535,6575,,M,1
120104,"Billington, Kareen",40,Smith Street,Sydney,,1670,AU,Administration Manager,Administration,120101,F,46230,-600,9132,,M,1
120105,"Povey, Liz",23,Garden Street,Melbourne,,8004,AU,Secretary I,Administration,120101,F,27110,6929,15826,,S,0
120106,"Hornsey, John",325,Sherwood Road,Sydney,,1100,AU,Office Assistant II,Administration,120104,M,26960,-4026,6575,,M,2
120107,"Sheedy, Sherie",12,Sir William Pickering Drive,Melbourne,,3175,AU,Office Assistant III,Administration,120104,F,30475,-2536,6606,,M,2
120108,"Gromek, Gladys",6,George Street,Melbourne,,3000,AU,Warehouse Assistant II,Administration,120104,F,27660,10280,18475,,S,0
120109,"Baker, Gabriele",166,Toorak Road,Sydney,,2119,AU,Warehouse Assistant I,Administration,120104,F,26495,11306,18536,,M,3
120110,"Entwisle, Dennis",9,Grayson Avenue Papatoetoe,Sydney,,1226,AU,Warehouse Assistant III,Administration,120104,M,28615,-2233,8705,,M,1
120111,"Spillane, Ubaldo",325,Sherwood Road,Sydney,,1100,AU,Security Guard II,Administration,120104,M,26895,-2353,6879,,M,3
120112,"Glattback, Ellis",7,Vulture Street,Melbourne,,3174,AU,Security Guard I,Administration,120104,F,26550,4796,12600,,M,3
120113,"Horsey, Riu",45,Talavera Road,Melbourne,,3146,AU,Security Guard II,Administration,120104,F,26870,-4253,6575,,S,0
120114,"Buddery, Jeannette",12,Hunua Road Papakura,Sydney,,1004,AU,Security Manager,Administration,120104,F,31285,-4345,6575,,M,3
120115,"Nichollas, Hugh",30,Hotham Parade,Sydney,,2600,AU,Service Assistant I,Administration,120104,M,26500,10355,18110,,M,2
120116,"Ralston, Austen",12,Hunua Road Papakura,Sydney,,1004,AU,Service Assistant II,Administration,120104,M,29250,1259,8797,,S,0
120117,"Mccleary, Bill",6,Palmiston Cresent,Melbourne,,3150,AU,Cabinet Maker III,Engineering,120104,M,31670,3176,11048,,O,1
120118,"Hartshorn, Darshi",1,Waterloo Street,Sydney,,2065,AU,Cabinet Maker II,Engineering,120104,M,28090,1249,10409,,M,3
120119,"Elleman, Lal",1021,Haupapa Street,Sydney,,1219,AU,Electrician IV,Engineering,120104,M,30255,5103,15341,,M,1
120120,"Peiris, Krishna",46,George Street,Sydney,,2012,AU,Electrician II,Engineering,120104,F,27645,-4258,6575,,M,3
120121,"Elvish, Irenie",3,Mundi Place,Sydney,,1232,AU,Sales Rep. II,Sales,120102,F,26600,-4169,6575,,M,1
120122,"Ngan, Christina",11,Prospect Hill Road,Melbourne,,3001,AU,Sales Rep. II,Sales,120102,F,27475,-523,8217,,S,0
120123,"Hotstone, Kimiko",54,Overseas Drive,Sydney,,2066,AU,Sales Rep. I,Sales,120102,F,26190,3193,10866,17928,M,3
120124,"Daymond, Lucian",1,Julius Avenue,Sydney,,2233,AU,Sales Rep. I,Sales,120102,M,26480,1228,8460,,M,1
120125,"Hofmeister, Fong",17,Druitt Street,Sydney,,2122,AU,Sales Rep. IV,Sales,120102,M,32040,-391,8460,17744,M,2
120126,"Denny, Satyakam",7,Boundary Street,Sydney,,2099,AU,Sales Rep. II,Sales,120102,M,26780,11951,18475,,O,2
120127,"Clarkson, Sharryn",21,Albert St,Sydney,,1170,AU,Sales Rep. II,Sales,120102,F,28100,8404,15645,,M,2
120128,"Kletschkus, Monica",26,Bay Street,Melbourne,,3050,AU,Sales Rep. IV,Sales,120102,F,30890,11152,18567,,S,0
120129,"Roebuck, Alvin",6,Palmiston Cresent,Melbourne,,3150,AU,Sales Rep. III,Sales,120102,M,30070,3248,10866,17256,S,0
120130,"Lyon, Kevin",2,Hill St,Sydney,,1044,AU,Sales Rep. I,Sales,120102,M,26955,10575,18383,,M,2
120131,"Surawski, Marinus",163,Nebo Road,Sydney,,1117,AU,Sales Rep. I,Sales,120102,M,26910,8668,17167,,S,0
120132,"Kaiser, Fancine",33,Great South Road Riccarton,Sydney,,2000,AU,Sales Rep. III,Sales,120102,F,28525,-2462,8309,,S,0
120133,"Soltau, Petrea",105,East St,Melbourne,,8060,AU,Sales Rep. II,Sales,120102,F,27440,11069,18536,,S,0
120134,"Shannan, Sian",5,Rosebery Ave,Sydney,,2010,AU,Sales Rep. II,Sales,120102,M,28015,-2400,6575,18443,M,2
120135,"Platts, Alexei",39,Station Street,Sydney,,2000,au,Sales Rep. IV,Sales,120102,M,32490,4774,15249,17652,M,3
120136,"Leyden, Atul",12,Hunua Road Papakura,Sydney,,1004,AU,Sales Rep. I,Sales,120102,M,26605,8659,17198,,M,1
120137,"Iyengar, Marina",9,Crusin Place,Melbourne,,3086,AU,Sales Rep. III,Sales,120102,F,29715,8471,18322,,S,0
120138,"Duckett, Shani",9,Northgate Drive,Melbourne,,3168,AU,Sales Rep. I,Sales,120102,F,25795,8592,18444,,S,0
120139,"Wilson, Fang",354,St Kilda Rd,Sydney,,2145,AU,Sales Rep. II,Sales,120102,F,26810,11187,18506,,S,0
120140,"Minas, Michael",95,Miller St,Sydney,,2125,AU,Sales Rep. I,Sales,120103,M,26970,11903,18536,,M,2
120141,"Liebman, Amanda",46,George Street,Sydney,,2012,AU,Sales Rep. II,Sales,120103,F,27465,11759,18383,,M,1
120142,"Eastley, Vincent",4,Dalmore Drive,Melbourne,,3095,AU,Sales Rep. III,Sales,120103,M,29695,11122,18444,,S,0
120143,"Sloey, Phu",1,Pacific Rise Mount Wellington,Sydney,,20000,AU,Sales Rep. II,Sales,120103,M,26790,1232,9770,,S,1
120144,"Barbis, Viney",3,Alice Street,Sydney,,2114,AU,Sales Rep. III,Sales,120103,M,30265,11023,18536,,S,0
120145,"Aisbitt, Sandy",30,Bingera Street,Melbourne,,2001,AU,Sales Rep. II,Sales,120103,M,26060,2943,10744,,O,0
120146,"Cederlund, Wendall",1,Pacific Rise Mount Wellington,Sydney,,20000,AU,Sales Rep. I,Sales,120103,M,25985,1370,8979,18170,M,1
120147,"Rusli, Skev",26,St Kilda Road,Sydney,,2022,AU,Sales Rep. II,Sales,120103,F,26580,11706,18536,,M,3
120148,"Zubak, Michael",51,Court Crescent Panmure,Sydney,,2041,AU,Sales Rep. III,Sales,120103,M,28480,-2301,8187,,S,0
120149,"Chantharasy, Judy",1,Embarcadero Center Site 1500,Melbourne,,3000,AU,Sales Rep. I,Sales,120103,F,26390,6899,13515,,O,1
120150,"Filo, John",5,Sun Pl,Melbourne,,3001,AU,Sales Rep. III,Sales,120103,M,29965,-541,9709,17652,M,1
120151,"Phaiyakounh, Julianna",3,Evans St,Sydney,,2011,AU,Sales Rep. II,Sales,120103,F,26520,-4058,6575,,M,3
120152,"Dives, Sean",69,Bourke St,Sydney,,1460,AU,Sales Rep. I,Sales,120102,M,26515,8521,17988,,M,1
120153,"Waal, Samantha",121,Blackburn Road,Sydney,,2580,AU,Sales Rep. I,Sales,120102,F,27260,8527,15341,18293,M,2
120154,"Hayawardhana, Caterina",21,Albert St,Sydney,,1170,AU,Sales Rep. III,Sales,120102,F,30490,-4182,6575,,M,1
120155,"James, Narelle",30,Thorncraft Parade,Melbourne,,2113,AU,Sales Rep. III,Sales,120102,F,29990,10339,18353,,M,1
120156,"Snellings, Gerry",26,St Kilda Road,Sydney,,2022,AU,Sales Rep. I,Sales,120102,F,26445,11932,18322,,O,0
120157,"Karavdic, Leonid",121,Blackburn Road,Sydney,,2580,AU,Sales Rep. II,Sales,120102,M,27860,11009,18597,,S,0
120158,"Pilgrim, Daniel",8,Nicholson Street,Sydney,,4720,AU,Sales Rep. III,Sales,120102,M,36605,3117,11504,18140,S,0
120159,"Phoumirath, Lynelle",166,Toorak Road,Sydney,,2119,AU,Sales Rep. IV,Sales,120102,F,30765,2976,11139,,M,1
120160,"Segrave, Chuck",1,Sleigh Street,Sydney,,1164,AU,Sales Rep. I,Sales,120102,M,27115,-479,6848,,M,1
120161,"Martines, Rosette",147,North Clark Street,Melbourne,,3156,AU,Sales Rep. III,Sales,120102,F,30785,11754,18536,,S,0
120162,"Scordia, Randal",45,Talavera Road,Melbourne,,3146,AU,Sales Rep. I,Sales,120102,M,27215,11936,18294,,M,3
120163,"Magrath, Brett",253,Princess Hwy,Melbourne,,3000,AU,Sales Rep. II,Sales,120102,M,26735,3064,12784,,M,3
120164,"Stamalis, Ranj",435,Sherwood Rd,Melbourne,,8003,AU,Sales Rep. II,Sales,120102,F,27450,1425,9528,,M,2
120165,"Pretorius, Tadashi",30,Hotham Parade,Sydney,,2600,AU,Sales Rep. I,Sales,120102,M,27050,10305,18322,,S,0
120166,"Nowd, Fadi",17,Elsie St,Sydney,,2154,AU,Sales Rep. IV,Sales,120102,M,30660,-4218,6575,18505,S,0
120167,"Tilley, Kimiko",153,High St,Sydney,,2006,AU,Sales Rep. I,Sales,120102,F,25185,-607,6606,18352,S,0
120168,"Barcoe, Selina",435,Sherwood Rd,Melbourne,,8003,AU,Sales Rep. I,Sales,120102,F,25275,10310,18567,,M,1
120169,"Tannous, Cos",13,Symonds Street,Melbourne,,3005,AU,Sales Rep. III,Sales,120102,M,28135,10228,18383,,M,3
120170,"Kingston, Alban",5,Buffalo Road,Sydney,,1042,AU,Sales Rep. III,Sales,120102,M,28830,6630,13423,18566,S,0
120171,"Moody, Alena",248,Port Road,Sydney,,2020,AU,Sales Rep. II,Sales,120102,F,26205,10427,18506,,M,3
120172,"Comber, Edwin",121,Blackburn Road,Sydney,,2580,AU,Sales Rep. III,Sales,120102,M,28345,-4292,6575,,M,3
120173,"Osborn, Hernani",8,Cannon Lane Whitby,Melbourne,,3350,AU,Sales Rep. I,Sales,120102,M,26715,-677,7822,17744,M,3
120174,"Simms, Doungkamol",30,Goodall Ave,Melbourne,,3053,AU,Sales Rep. I,Sales,120102,F,26850,-4374,6575,18200,S,0
120175,"Conolly, Andrew",79,Old Port Road,Sydney,,2144,AU,Sales Rep. I,Sales,120102,M,25745,11918,18536,,S,0
120176,"Pa, Koavea",1,Endeavour Road,Melbourne,,3225,AU,Sales Rep. I,Sales,120102,M,26095,11270,18567,,M,1
120177,"Kierce, Franca",120,Walkers Road,Sydney,,2015,AU,Sales Rep. III,Sales,120102,F,28745,8495,15372,,S,0
120178,"Plested, Billy",51,Martin Place,Sydney,,1131,AU,Sales Rep. II,Sales,120102,M,26165,-404,6665,,M,3
120179,"Wills, Matsuoka",5059,Great Eastern Highway,Melbourne,,8010,AU,Sales Rep. III,Sales,120102,M,28510,6648,17532,17775,M,1
120180,"George, Vino",9,Adelaide Terrace,Melbourne,,3000,AU,Sales Rep. II,Sales,120102,M,26970,-553,8370,,S,0
120181,"Cantatore, Lorian",207,Canterbury Road,Sydney,,1225,AU,Temp. Sales Rep.,Sales,120103,F,27065,12020,18597,18717,S,0
120182,"Barreto, Geok-Seng",241,Royal Perade,Sydney,,1115,AU,Temp. Sales Rep.,Sales,120103,M,25020,10505,18597,18627,M,2
120183,"Blanton, Brig",6,Palmiston Cresent,Melbourne,,3150,AU,Temp. Sales Rep.,Sales,120103,M,26910,5001,18597,18627,M,1
120184,"Moore, Ari",241,Royal Perade,Sydney,,1115,AU,Temp. Sales Rep.,Sales,120103,M,25820,-2222,18597,18747,O,2
120185,"Bahlman, Sharon",24,LaTrobe Street,Sydney,,2165,AU,Temp. Sales Rep.,Sales,120103,F,25080,6671,18597,18658,M,2
120186,"Quinby, Merryn",54,Dunning Street,Sydney,,2120,AU,Temp. Sales Rep.,Sales,120103,F,26795,8509,18597,18808,O,1
120187,"Catenacci, Reyne",44,Gow Street,Melbourne,,2066,AU,Temp. Sales Rep.,Sales,120103,F,26665,10571,18597,18778,M,1
120188,"Baran, Shanmuganathan",207,Canterbury Road,Sydney,,1225,AU,Temp. Sales Rep.,Sales,120103,F,26715,-671,18597,18627,M,2
120189,"Lachlan, Mihailo",17,Elsie St,Sydney,,2154,AU,Temp. Sales Rep.,Sales,120103,M,25180,10411,18597,18717,S,0
120190,"Czernezkyi, Ivor",21,Market Street,Sydney,,2113,AU,Trainee,Sales,120103,M,24100,10566,17837,18017,M,2
120191,"Graham-Rowe, Jannene",1,Embarcadero Center Site 1500,Melbourne,,3000,AU,Trainee,Sales,120103,F,24015,1112,17167,17347,S,0
120192,"Nichollas, Anthony",66,Phillip Street,Sydney,,2124,AU,Trainee,Sales,120103,M,26185,10355,18049,18231,M,2
120193,"Streit, Russell",176,Exhibition Street,Melbourne,,3170,AU,Trainee,Sales,120103,M,24515,10567,18141,18321,S,0
120194,"Harwood, Reece",81,Burwood Road,Melbourne,,3155,AU,Trainee,Sales,120103,M,25985,10493,17929,18109,M,1
120195,"Fiocca, Jina",81,Burwood Road,Melbourne,,3155,AU,Trainee,Sales,120103,F,24990,10586,18444,18627,S,0
120196,"Hieds, Merle",5,Sun Pl,Melbourne,,3001,AU,Trainee,Sales,120103,F,24025,10257,17167,17347,S,0
120197,"Dillin, Kerrin",29,Emily Bullock Cres,Melbourne,,8007,AU,Trainee,Sales,120103,F,25580,-511,17167,17347,M,2
120198,"Body, Meera",51,Martin Place,Sydney,,1131,AU,Sales Rep. III,Sales,120103,F,28025,11708,18597,,M,1
120259,"Miller, Anthony",522,Buncombe St,Miami-Dade,FL,33031,US,Chief Executive Officer,Executives,,M,433800,2946,12297,,M,1
120260,"Fletcher, Christine",2416,Cove Point Dr,San Diego,CA,91910,US,Chief Marketing Officer,Executives,120259,F,207885,3258,10532,,M,2
120261,"Highpoint, Harry",18,Antler Ct,Miami-Dade,FL,33135,US,Chief Sales Officer,Executives,120259,M,243190,4800,11535,,O,1
120262,"Crown, Max",1823,Ashley Rd,Philadelphia,PA,19111,US,Chief Financial Officer,Executives,120259,M,268455,5042,11932,,M,2
120263,"Cleverley, Bobby",622,Boylan Ave,San Diego,CA,92054,US,Financial Analyst III,Group Financials,120262,M,42605,2962,10135,17531,S,0
120264,"Croome, Latonya",1722,Calm Winds Ct,San Diego,CA,91941,US,Financial Analyst II,Group Financials,120262,F,37510,10249,18597,,S,0
120265,"Branly, Wanda",21,Lake Pine Dr,Philadelphia,PA,19135,US,Auditor III,Group Financials,120262,F,51950,-4106,6575,17166,M,3
120266,"Krafve, Bao",12,Brigadoon Dr,San Diego,CA,92040,US,Secretary IV,Secretary of the Board,120259,F,31750,4930,12144,,M,2
120267,"Rink, Belanda",43,Grist Mill Rd,San Diego,CA,92122,US,Secretary III,Secretary of the Board,120259,F,28585,11110,17198,,M,1
120268,"Villeneuve, Jacques",11,Kinderston Dr,Philadelphia,PA,19104,US,Senior Strategist,Strategy,120260,M,76105,6818,15096,,S,0
120269,"Kagolanu, Shrimatee",65,Applecross Cir,Philadelphia,PA,19131,US,Strategist II,Strategy,120260,F,52540,-4113,6575,17652,M,2
120270,"Nuss, Grezegorz",1916,Hebron Church Rd,Miami-Dade,FL,33186,US,Concession Director,Concession Management,120261,M,48435,-647,6575,,O,0
120271,"Winge, Kenisha",94,Irelan Dr,Miami-Dade,FL,33144,US,Concession Manager,Concession Management,120270,F,43635,3140,11201,,M,1
120272,"Flow, Febin",461,Kimberly Dr,Philadelphia,PA,19121,US,Concession Consultant II,Concession Management,120271,M,34390,-4309,6575,,S,0
120273,"Antonini, Doris",681,Ferguson Rd,Miami-Dade,FL,33141,US,Concession Assistant III,Concession Management,120271,F,28455,11115,18322,,M,2
120274,"Landry, Angela",162,Horsetrail Way,Philadelphia,PA,19121,US,Concession Assistant I,Concession Management,120271,F,26840,2930,13849,,O,0
120275,"Lattimer, Brandy",56,Cahill Rd,San Diego,CA,92065,US,Concession Consultant II,Concession Management,120271,F,32195,1456,10501,,M,2
120276,"Plybon, Nicholas",2975,Foxbury Dr,Philadelphia,Pa,19120,US,Concession Assistant II,Concession Management,120271,M,28090,-4033,6575,17317,M,3
120277,"Shirts, Wesley",710,Crawford Rd,Miami-Dade,FL,33015,US,Concession Consultant I,Concession Management,120271,F,32645,11916,17653,18048,S,0
120278,"Jongleux, Binit",3053,Blackpine Ct,San Diego,CA,91910,US,Concession Assistant III,Concession Management,120271,M,27685,11308,18475,,M,3
120279,"Dunlap, Kareema",181,Falls River Ave,San Diego,CA,92021,US,Concession Consultant I,Concession Management,120271,F,32925,5041,14731,,S,0
120280,"Laurer, Jaime",211,Hamstead Crossing Dr,Philadelphia,PA,19124,US,Concession Consultant III,Concession Management,120271,F,36930,3237,11809,16982,M,1
120656,"Amos, Salley",3524,Calico Ct,San Diego,CA,92116,US,Logistics Coordinator II,Logistics Management,120660,F,42570,6602,15765,,O,0
120657,"Weisbarth, Theresa",1571,Edenton St,San Diego,CA,92114,US,Logistics Coordinator I,Logistics Management,120660,F,36110,2928,12723,,S,0
120658,"Kennedy, Kenneth",3118,Iris Dr,San Diego,CA,92105,US,Logistics Coordinator II,Logistics Management,120660,M,42485,-377,9163,,O,2
120659,"Havasy, Jay",1930,Apple Meadow Dr,Philadelphia,PA,19145,US,Director,Logistics Management,120259,M,161290,-2360,6575,,M,3
120660,"Smith, Robert",4156,Hwy 42,Miami-Dade,FL,33180,US,Logistics Manager,Logistics Management,120659,M,61125,8192,17957,,S,0
120661,"Racine, Cynthia",63,Cane Creek Dr,San Diego,CA,92131,US,Senior Logistics Manager,Logistics Management,120659,F,85495,-400,10227,17347,M,3
120662,"Burroughs, Lemonica",2565,Bledsoe Ave,Miami-Dade,FL,33176,US,Secretary II,Logistics Management,120659,M,27045,11864,18567,,S,0
120663,"Kornblith, Anglar",4407,Fountain Dr,Miami-Dade,FL,33178,US,Pricing Manager,Logistics Management,120659,F,56385,4833,15035,,S,0
120664,"Senchak, Brock",1779,Greymist Ln,Philadelphia,PA,19142,US,Pricing Specialist,Logistics Management,120663,M,47605,-682,7060,,M,3
120665,"Leacock, Jill",1288,Joe Leach Rd,San Diego,CA,91945,US,Senior Logistics Manager,Logistics Management,120659,F,80070,6871,16861,,M,1
120666,"Onuscheck, John",215,Alercia Ct,San Diego,CA,92029,US,Logistics Manager,Logistics Management,120659,M,64555,4921,13118,17652,S,0
120667,"Droste, Edwin",1661,Hanna Ln,Miami-Dade,FL,33014,US,Office Assistant III,Logistics Management,120666,M,29980,8572,18294,,S,0
120668,"Dolan, Thyland",744,Farmington Grove Dr,Miami-Dade,FL,33141,US,Services Manager,Logistics Management,120659,M,47785,-2261,8370,,O,0
120669,"Hill, Ronald",2823,Eagles Landing Dr,Philadelphia,PA,19146,US,Services Assistant IV,Logistics Management,120668,M,36370,-4179,6575,,S,0
120670,"Zisek, Odudu",114,Lakerun Ct,Philadelphia,PA,19146,US,Shipping Manager,Stock & Shipping,120659,M,65420,-4298,6575,17166,S,0
120671,"Latty, William",422,Brentwood Rd,Philadelphia,PA,19134,US,Shipping Agent III,Stock & Shipping,120670,M,40080,-584,9893,,S,0
120672,"Guscott, Verne",249,Collins Street,Sydney,,2009,AU,Shipping Manager,Stock & Shipping,120659,M,60980,3159,13209,,M,1
120673,"Santomaggio, Pearl",2,Stephen Road,Melbourne,,3181,AU,Shipping Agent II,Stock & Shipping,120672,F,35935,-4205,6575,,S,0
120677,"Sochacki, Suad",3519,Amersham Ln,Miami-Dade,FL,33160,US,Shipping Manager,Stock & Shipping,120659,F,65555,4993,13546,,M,2
120678,"Octetree, Lucretta",433,Farmington Woods Dr,San Diego,CA,92054,US,Shipping Agent III,Stock & Shipping,120677,F,40035,-2545,8156,17409,S,0
120679,"Cutucache, Chrisy",1541,Highland Trl,San Diego,CA,92103,US,Shipping Manager,Stock & Shipping,120659,F,46190,7616,16983,,M,3
120680,"Desaulniers, Raymondria",2409,Carnegie Ln,Philadelphia,PA,19145,US,Shipping Agent I,Stock & Shipping,120679,F,27295,4985,12904,,S,0
120681,"Tolbet, Elery",63,Bishops Park Dr,Miami-Dade,FL,33016,US,Shipping Agent II,Stock & Shipping,120679,M,30950,8624,17623,,M,2
120682,"Kennedy, Barbara",1635,Auburn Church Rd,Philadelphia,PA,19119,US,Shipping Agent I,Stock & Shipping,120679,F,26760,5102,14701,,M,1
120683,"Kochneff, Deven",765,Greenhaven Ln,Philadelphia,PA,19102,US,Shipping Agent III,Stock & Shipping,120679,F,36315,-415,6575,17225,M,2
120684,"Woyach, Suzon",1107,Caswell Ct,Miami-Dade,FL,33141,US,Warehouse Assistant I,Stock & Shipping,120679,F,26960,11287,18567,,S,0
120685,"Howard, Anita",1455,Emerywood Dr,Philadelphia,PA,19124,US,Warehouse Assistant I,Stock & Shipping,120679,F,25130,10287,18567,,M,3
120686,"Tucker, Berether",1999,Avery St,San Diego,CA,91941,US,Warehouse Assistant II,Stock & Shipping,120679,F,26690,-4256,6575,,M,1
120687,"Dannin, Freda",674,Friar Tuck Rd,Miami-Dade,FL,33193,US,Warehouse Assistant I,Stock & Shipping,120679,F,26800,8545,17745,17928,O,0
120688,"Carcaterra, Lisa",91,Langstonshire Ln,San Diego,Ca,92119,US,Warehouse Assistant I,Stock & Shipping,120679,F,25905,-2198,6575,17044,S,0
120689,"Pongor, Katherine",4750,Cottonwood Ln,Philadelphia,PA,19148,US,Warehouse Assistant III,Stock & Shipping,120679,F,27780,8601,18444,,S,0
120690,"Langston, Taronda",1635,Auburn Church Rd,Philadelphia,PA,19119,US,Warehouse Assistant I,Stock & Shipping,120679,F,25185,10243,17867,,S,0
120691,"Habres, Sek",11,Reid Street,Sydney,,1005,AU,Shipping Manager,Stock & Shipping,120659,M,49240,-4125,6575,,S,0
120692,"Tregonning, Rit",26,Brisbane Avenue,Sydney,,2064,AU,Shipping Agent II,Stock & Shipping,120691,M,32485,-405,9587,,M,2
120693,"Tellam, Diaz",8,Aboukis Street,Sydney,,1223,AU,Shipping Agent I,Stock & Shipping,120691,M,26625,1217,8552,,M,3
120694,"Leazer, Sharon",29,Lawson Ave,Sydney,,1220,AU,Warehouse Assistant I,Stock & Shipping,120691,F,27365,11916,18353,,O,1
120695,"Moffat, Trent",8,Learmonth Road,Melbourne,,3101,au,Warehouse Assistant II,Stock & Shipping,120691,M,28180,3116,12235,18474,S,0
120696,"Pettolino, Peter",1,Endeavour Road,Melbourne,,3225,AU,Warehouse Assistant I,Stock & Shipping,120691,M,26615,-505,6634,18352,M,2
120697,"Fouche, Madelaine",1,Embarcadero Center Site 1500,Melbourne,,3000,AU,Warehouse Assistant IV,Stock & Shipping,120691,F,29625,11866,18414,,O,0
120698,"Kistanna, Geoff",28,Fonceca Street,Sydney,,1171,au,Warehouse Assistant I,Stock & Shipping,120691,M,26160,-594,7518,17956,O,0
120710,"Baltzell, Timothy",31,Castalia Dr,Philadelphia,PA,19140,US,Business Analyst II,Marketing,120719,M,54840,6902,15341,,O,1
120711,"Drew, Gloria",17,Kempwood Dr,Philadelphia,PA,19119,US,Business Analyst III,Marketing,120719,F,59130,4896,13939,,O,0
120712,"Motashaw, Elisabeth",360,Bridgepath Dr,Miami-Dade,FL,33150,US,Marketing Manager,Marketing,120719,F,63640,-2394,6575,,S,0
120713,"Campbell, Carston",19,Fairwinds Dr,San Diego,CA,92069,US,Marketing Assistant III,Marketing,120712,M,31630,-4330,6575,,M,3
120714,"Dinley, Robert",182,Fort Sumter Rd,Miami-Dade,FL,33160,US,Marketing Manager,Marketing,120719,M,62625,7399,15584,,M,3
120715,"Neal, Angelia",6278,Aqua Marine Ln,San Diego,CA,92054,US,Marketing Assistant II,Marketing,120714,F,28535,8563,17929,,M,3
120716,"Juif, Kenneth",881,Green Downs Dr,Philadelphia,PA,19143,US,Events Manager,Marketing,120719,M,53015,6779,13727,,M,1
120717,"Sleva, Jon",472,Big Bend Ct,Miami-Dade,FL,33155,US,Marketing Assistant II,Marketing,120716,M,30155,-722,9344,,O,2
120718,"Hennington, Charles",40,Elsbeth Ct,Philadelphia,PA,19144,US,Marketing Assistant II,Marketing,120716,M,29190,3111,12539,,S,0
120719,"Ridley, Roya",6121,Birklands Dr,San Diego,CA,92025,US,Senior Marketing Manager,Marketing,120260,F,87420,4770,14641,,M,1
120720,"Spingola, John",1219,Hawkshead Rd,Philadelphia,PA,19139,US,Corp. Comm. Manager,Marketing,120719,M,46580,3049,13240,,M,2
120721,"Knust, Dlutomi",744,Brannigan Pl,Philadelphia,PA,19141,US,Marketing Assistant II,Marketing,120720,F,29870,-4089,6575,,M,3
120722,"Sheffield, Ishmar",939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US,Corp. Comm. Specialist I,Marketing,120720,M,32460,1360,10866,,S,0
120723,"Olsen, Deanna",218,Hillsford Ln,Philadelphia,PA,19146,US,Corp. Comm. Specialist II,Marketing,120720,F,33950,-2335,6575,,O,0
120724,"Brown, Hampie",1951,Cobble Creek Ln,San Diego,CA,92054,US,Marketing Manager,Marketing,120719,M,63705,2948,13240,,S,0
120725,"Whitlock, Robert",456,Avent Hill,San Diego,CA,92117,US,Marketing Assistant II,Marketing,120724,M,29970,8697,17684,17897,S,0
120726,"Obermeyer, Lutezenia",3246,Cartier Dr,Philadelphia,PA,19140,US,Marketing Assistant I,Marketing,120724,F,27380,11870,18506,,M,1
120727,"Marples, Donald",2227,Calais Ct,San Diego,CA,92122,US,Marketing Assistant IV,Marketing,120724,M,34925,3098,11109,,M,1
120728,"Borge, Kathryn",360,Bridgepath Dr,Miami-Dade,FL,33150,US,Purchasing Agent II,Purchasing,120735,F,35070,-393,9497,,M,1
120729,"Howell, Kimberly",260,Langstonshire Ln,Miami-Dade,FL,33134,US,Purchasing Agent I,Purchasing,120735,F,31495,11781,17281,18163,M,3
120730,"Burt, Woodson",136,Fox Rd,San Diego,CA,92128,US,Purchasing Agent I,Purchasing,120735,M,30195,3272,11962,,M,3
120731,"Lerew, Robert",2254,Appledown Dr,San Diego,CA,92008,US,Purchasing Agent II,Purchasing,120735,M,34150,1169,10105,,O,1
120732,"Uenking, Kent",2853,Birchford Ct,Miami-Dade,FL,33142,US,Purchasing Agent III,Purchasing,120736,M,35870,-2331,6575,,M,1
120733,"Bezinque, Michael",2732,Bell Dr,Miami-Dade,FL,33033,US,Purchasing Agent I,Purchasing,120736,M,31760,3015,12723,,M,1
120734,"Saylor, Svein",3707,Hillside Dr,Philadelphia,PA,19144,US,Purchasing Agent III,Purchasing,120736,M,34270,8516,18322,,S,1
120735,"Bilobran, Brenda",11217,Avent Ferry Rd,Miami-Dade,FL,33160,US,Purchasing Manager,Purchasing,120261,F,61985,-567,8156,,S,0
120736,"Kiemle, Parie",26,Holly Park Dr,Miami-Dade,FL,33130,US,Purchasing Manager,Purchasing,120261,F,63985,3253,13057,,S,0
120737,"Toner, Brenner",36,Enka Dr,San Diego,CA,92037,US,Purchasing Manager,Purchasing,120261,F,63605,1182,11993,,M,2
120738,"Swaiti, Huilun",211,Hamstead Crossing Dr,Philadelphia,PA,19124,US,Purchasing Agent I,Purchasing,120737,F,30025,-2370,6575,,S,0
120739,"Cooper, Bryon",5857,Academy St,Miami-Dade,FL,33133,US,Purchasing Agent III,Purchasing,120737,M,36970,11176,18383,,S,0
120740,"Koonce, Lisa",1636,Gorman St,Miami-Dade,FL,33012,US,Purchasing Agent II,Purchasing,120737,F,35110,-2265,6575,17409,O,1
120741,"Court, Keisha",88,Kershaw Dr,Philadelphia,PA,19130,US,Purchasing Agent III,Purchasing,120737,F,36365,-4051,6575,,M,2
120742,"Shewitz, Ronald",507,Carriage Pine Dr,Philadelphia,PA,19125,US,Purchasing Agent I,Purchasing,120737,M,31020,-4349,6575,,S,0
120743,"Harrison, Chimena",77,Braswell Ct,San Diego,CA,91950,US,Purchasing Agent II,Purchasing,120737,F,34620,4780,15127,,S,0
120744,"Feigenbaum, Alden",43,Glen Bonnie Ln,San Diego,CA,92122,US,Purchasing Agent II,Purchasing,120737,F,33490,11858,17714,18200,M,2
120745,"Harvill, Barbara",23,Alderman Cir,Philadelphia,PA,19129,US,Purchasing Agent I,Purchasing,120737,F,31365,11143,18414,,M,1
120746,"Kimmerle, Kevie",162,Horsetrail Way,Philadelphia,PA,19121,US,Account Manager,Accounts,120262,M,46090,6857,16892,,M,3
120747,"Farthing, Zashia",763,Chatterson Dr,San Diego,CA,92116,us,Financial Controller I,Accounts,120746,F,43590,6745,14457,,M,2
120748,"Post, Nahliah",52,Landor Rd,Miami-Dade,FL,33169,US,Building Admin. Manager,Accounts,120262,F,48380,7491,17226,,M,3
120749,"Niemann, Kevin",651,Bluebird Ct,San Diego,CA,92027,US,Office Assistant II,Accounts,120748,M,26545,6837,14884,,S,0
120750,"Woods, Connie",4407,Fountain Dr,Miami-Dade,FL,33178,US,Accountant I,Accounts,120751,F,32675,-573,8432,16832,M,2
120751,"Mea, Azavi0us",649,Buckboard Ln,Miami-Dade,FL,33014,US,Finance Manager,Accounts,120262,M,58200,3017,11901,,M,3
120752,"Van Damme, Jean-Claude",973,Chris Dr,Miami-Dade,FL,33183,US,Accountant I,Accounts,120751,M,30590,-683,7152,17286,S,0
120753,"Ferrari, Ralph",309,Gilliam Ln,Miami-Dade,FL,33172,US,Financial Controller II,Accounts,120751,M,47000,7471,14092,,S,0
120754,"Atkins, John",6137,Blue Water Ct,Miami-Dade,FL,33161,US,Accountant II,Accounts,120751,M,34760,11841,18383,,M,1
120755,"Thoits, Elizabeth",5,Green Lantern St,San Diego,CA,92128,US,Accountant III,Accounts,120751,F,36440,3158,10074,,M,3
120756,"Asta, Wendy",3565,Lake Park Dr,Philadelphia,PA,19145,US,Financial Controller III,Accounts,120751,F,52295,6625,14792,,M,3
120757,"Knopfmacher, Paul",804,Calebra Way,San Diego,CA,92104,US,Accountant III,Accounts,120751,M,38545,-4306,6575,17713,M,3
120758,"Voltz, Sal",34,Flicker Ct,Miami-Dade,FL,33168,US,Accountant II,Accounts,120751,M,34040,3217,13423,,S,0
120759,"Apr, Nishan",105,Brack Penny Rd,San Diego,CA,92071,US,Accountant II,Accounts,120746,M,36230,3230,9862,,S,0
120760,"Miller, Pamela",108,Elmview Dr,San Diego,CA,92111,US,Financial Controller III,Accounts,120746,F,53475,4754,13635,,S,0
120761,"Akinfolarin, Tameaka",5,Donnybrook Rd,Philadelphia,PA,19145,US,Accountant I,Accounts,120746,F,30960,11319,18444,,O,2
120762,"Leone, Marvin",2898,Cookshire Dr,Philadelphia,PA,19121,US,Accountant I,Accounts,120746,M,30625,8706,18322,,M,2
120763,"Capps, Ramond",3384,Cotton Mill Dr,San Diego,CA,92113,US,Auditor II,Accounts Management,120766,M,45100,-4084,6575,,O,1
120764,"Worton, Steven",3100,Erinsbrook Dr,San Diego,CA,92026,US,Auditor I,Accounts Management,120766,M,40450,6930,17136,,S,0
120765,"Kokoszka, Nikeisha",2416,Cove Point Dr,San Diego,Ca,91910,US,Financial Controller III,Accounts Management,120766,F,51950,-380,6575,,S,0
120766,"Kempster, Janelle",8,Ashwood Dr,Miami-Dade,FL,33173,US,Auditing Manager,Accounts Management,120262,F,53400,6883,16496,,M,1
120767,"Terricciano, Legette",6348,Draper Rd,Philadelphia,PA,19131,US,Accountant I,Accounts Management,120766,M,32965,3051,11413,,S,0
120768,"Rayburn, Roland",31,Castalia Dr,Philadelphia,PA,19140,US,Accountant II,Accounts Management,120766,M,44955,-528,9405,17500,M,3
120769,"Lightbourne, Abelino",6137,Blue Water Ct,Miami-Dade,FL,33161,US,Auditor II,Accounts Management,120766,M,47990,6718,14701,,S,0
120770,"Pascoe, Julia",973,Chris Dr,Miami-Dade,FL,33183,US,Auditor I,Accounts Management,120766,F,43930,3036,11413,17286,S,0
120771,"Xing Moore, Wei",84,Holt Dr,Miami-Dade,FL,33183,US,Accountant II,Accounts Management,120766,F,36435,-515,7640,,S,0
120772,"Overdorff, Erich",1407,Coorsdale Dr,Miami-Dade,FL,33161,US,HR Generalist I,Group HR Management,120780,M,27365,11786,18475,,S,0
120773,"Horne, Entrisse",7497,Holly Pointe Dr,Miami-Dade,FL,33133,US,HR Generalist II,Group HR Management,120780,F,27370,1148,9222,,M,2
120774,"El-Amin, Sue",1030,Indigo Dr,Philadelphia,PA,19122,US,HR Specialist II,Group HR Management,120780,F,45155,8295,16861,18201,M,3
120775,"Thompson, Tanya",509,Green Level To Durham Rd,Miami-Dade,FL,33142,US,HR Analyst II,Group HR Management,120780,F,41580,4790,14915,,M,3
120776,"Silverthorne, Ratna",284,Forest Dr,Miami-Dade,FL,33142,US,HR Generalist III,Group HR Management,120780,M,32580,8664,16527,,S,0
120777,"Sacher, Kary",2547,Allenby Dr,San Diego,CA,91913,US,HR Specialist I,Group HR Management,120780,M,40955,4833,14000,,S,0
120778,"Gardner, Angela",349,Eason Cir,Philadelphia,PA,19104,US,HR Specialist I,Group HR Management,120780,F,43650,-389,10258,,S,0
120779,"Eggleston, Jennifer",140,Hollow Ct,Miami-Dade,FL,33032,US,HR Analyst II,Group HR Management,120780,F,43690,7582,15035,,S,0
120780,"Walcott, Kimberly",967,Hearthside Ct,Philadelphia,PA,19148,US,HR Manager,Group HR Management,120262,F,62995,4992,13057,,M,3
120781,"Sitnik, Sarah",6846,Glastonbury Rd,San Diego,CA,91941,US,Recruiter I,Group HR Management,120782,F,32620,11710,17867,18262,M,3
120782,"Sines, Rilma",142,Bluffridge Dr,Philadelphia,PA,19141,US,Recruitment Manager,Group HR Management,120262,F,63915,6907,15857,,S,0
120783,"Karp, Davis",458,Huckleberry Dr,Philadelphia,PA,19104,US,Recruiter III,Group HR Management,120782,M,42975,6928,14610,,S,0
120784,"Pinol, Jennifer",9,Chastain Dr,Philadelphia,PA,19132,US,Recruiter II,Group HR Management,120782,F,35715,8514,17776,,O,1
120785,"Donnell, Damesha",1947,Bromley Way,San Diego,CA,92024,US,Training Manager,Group HR Management,120780,F,48335,4769,13666,,O,2
120786,"Delafuente, Chris-Anne",1329,Cross Link Rd,Miami-Dade,FL,33016,US,Trainer I,Group HR Management,120785,F,32650,-4306,6575,,S,0
120787,"Peachey, Carl",175,Carteret Dr,San Diego,CA,92025,US,Trainer II,Group HR Management,120785,M,34000,4982,14610,,M,1
120788,"Lisowe, Smitty",1058,Atchison St,San Diego,CA,92120,US,Trainer I,Group HR Management,120785,M,33530,4912,14214,,O,1
120789,"Denhollem, Julius",147,Clearport Dr,Miami-Dade,FL,33135,US,Trainer III,Group HR Management,120785,M,39330,3117,9831,17317,M,2
120790,"O'Toole, Tara",461,Kimberly Dr,Philadelphia,Pa,19121,US,ETL Specialist II,IS,120791,F,53740,6915,14365,,S,0
120791,"Chiseloff, Richard",1726,Evans Rd,San Diego,CA,92067,US,Systems Architect IV,IS,120798,M,61115,3129,11231,,M,2
120792,"Horne, Omeba",4750,Jet Ln,Philadelphia,PA,19119,US,Systems Architect II,IS,120791,F,54760,7383,15188,,M,2
120793,"Mamo, William",183,Dacus Pl,Miami-Dade,FL,33055,US,ETL Specialist I,IS,120791,M,47155,4968,14762,,S,0
120794,"Cross, Samantha",699,Buck Rowland Rd,Miami-Dade,FL,33169,US,Applications Developer IV,IS,120800,F,51265,8400,17348,,S,0
120795,"Deacon, David",1636,Gorman St,Miami-Dade,FL,33012,US,Applications Developer II,IS,120794,M,49105,4764,11901,17197,S,0
120796,"Kellis, Philip",40,Elsbeth Ct,Philadelphia,PA,19144,US,Applications Developer II,IS,120794,M,47030,-599,9921,,M,2
120797,"Jones, Sherrie",19,Dutch Creek Dr,Miami-Dade,FL,33186,US,Applications Developer I,IS,120794,F,43385,-410,8005,,M,3
120798,"Ardskin, Elizabeth",701,Glenridge Dr,Miami-Dade,FL,33177,US,Senior Project Manager,IS,120800,F,80755,1269,11323,,O,1
120799,"Stefandonovan, Jeffery",47,Dixie Trl,Philadelphia,PA,19136,US,Office Assistant III,IS,120800,M,29070,8482,15645,,M,3
120800,"Benyami, Fred",1498,Falconwood Dr,San Diego,CA,92069,US,IS Director,IS,120262,M,80210,6928,15127,17197,S,0
120801,"Kennedy, Kathryn",353,Cameron Woods Dr,Philadelphia,PA,19148,US,Applications Developer I,IS,120798,F,40040,6639,15887,,M,2
120802,"Parker, U'Vonda",11,Kinderston Dr,Philadelphia,PA,19104,US,Applications Developer IV,IS,120798,F,65125,-2426,8036,17713,S,0
120803,"Droste, Victor",1722,Calm Winds Ct,San Diego,CA,91941,US,Applications Developer I,IS,120798,M,43630,-574,8036,,S,0
120804,"Zied, Ahmed",101,Avent Ferry Rd,Miami-Dade,FL,33178,US,IS Administrator III,IS,120798,M,55400,-4342,6575,,S,0
120805,"Walker, Robert",153,Dawson Mill Run,Philadelphia,PA,19143,US,BI Administrator IV,IS,120798,M,58530,8213,16162,,M,3
120806,"Ousley, Lorna",881,Kettlebridge Dr,Miami-Dade,FL,33183,US,IS Administrator II,IS,120798,F,47285,6630,13180,,M,2
120807,"Peppers, Gerlinde",1209,Fraternity Court Dr,San Diego,CA,92173,US,IS Administrator I,IS,120798,F,43325,1443,9497,17775,S,0
120808,"Dupree, Marcel",3231,Amity Hill Ct,San Diego,CA,92064,US,BI Specialist II,IS,120798,M,44425,3074,10379,,S,0
120809,"Marion, Chiorene",89,Atchison St,Miami-Dade,FL,33129,US,BI Architect II,IS,120798,F,47155,-4370,6575,,S,0
120810,"Esguerra, Loyal",2726,Fairfax Woods Dr,Miami-Dade,FL,33162,US,IS Architect III,IS,120798,M,58375,-454,8826,,S,0
120811,"Bergeron-Jeter, Dale",2356,Aileen Dr,Miami-Dade,FL,33010,US,Applications Developer I,IS,120814,M,43985,5017,13696,,S,0
120812,"Arruza, Fauver",265,Fyfe Ct,Miami-Dade,FL,33133,US,Applications Developer II,IS,120814,M,45810,6624,16649,,O,1
120813,"Heinsler, John",39,Brush Stream Dr,Miami-Dade,FL,33179,US,Applications Developer IV,IS,120814,M,50865,5005,13515,17531,S,0
120814,"Scroggin, Victor",1058,Atchison St,San Diego,CA,92120,US,Project Manager,IS,120800,M,59140,1249,8644,,M,1
120815,"Honore, Craig",7766,Brimfield Ct,Miami-Dade,FL,33141,US,Service Administrator III,Marketing,120719,M,31590,12049,18353,,M,2
120816,"Hart, Tessia",2170,Buttercup Ln,Miami-Dade,FL,33055,US,Service Administrator I,Marketing,120719,F,30485,4871,13727,,S,0
120992,"Kicak, Lisa",1974,Clear Brook Dr,Miami-Dade,FL,33172,US,Office Assistant I,Administration,120996,F,26940,8448,16284,,S,0
120993,"Boatright, Lorraine",110,Glascock St,San Diego,CA,91950,US,Office Assistant I,Administration,120996,F,26260,5100,15035,,M,2
120994,"Sergeant, Danelle",734,Ladys Slipper Ct,San Diego,CA,92105,us,Office Administrator I,Administration,120996,F,31645,6741,14184,,S,0
120995,"Gordo, Lily-Ann",545,Jones Sausage Rd,Philadelphia,PA,19144,US,Office Administrator II,Administration,120996,F,34850,10391,18475,,M,1
120996,"Wade, Johannes",139,Deer Hunter Ct,San Diego,CA,91950,US,Office Assistant IV,Administration,121000,M,32745,6776,17045,,M,3
120997,"Donathan, Mary",4923,Gateridge Dr,Philadelphia,PA,19152,us,Shipping Administrator I,Administration,121000,F,27420,6899,14854,,S,0
120998,"Benedicto, Tondelayo",2902,Gable Ridge Ln,San Diego,CA,92118,US,Clerk I,Administration,120997,F,26330,8740,17988,,M,1
120999,"Heilmann, Sherelyn",3750,Langley Cir,San Diego,CA,92025,US,Clerk I,Administration,120997,F,27215,1457,10318,,S,0
121000,"Supple, Herman",4,Kimbrook Dr,Miami-Dade,Fl,33187,US,Administration Manager,Administration,121141,M,48600,2946,13849,,M,2
121001,"House, Tony",1,Bona Ct,Miami-Dade,FL,33140,US,Warehouse Manager,Administration,121000,M,43615,1116,7914,,S,0
121002,"Clark, Terry-Ann",57,Hickory Dr,San Diego,CA,92104,US,Warehouse Assistant II,Administration,121001,F,26650,-470,8735,17775,M,3
121003,"Der Wiele, Troyce Van",1787,Brushy Meadows Dr,Philadelphia,PA,19148,US,Warehouse Assistant I,Administration,121001,M,26000,11813,18444,,S,0
121004,"Smith, Kellen",1466,Horne St,San Diego,CA,92117,US,Security Manager,Administration,121000,M,30895,-4168,6575,,S,0
121005,"Mclamb, Yuh-Lang",9891,Glendower Rd,Miami-Dade,FL,33154,US,Security Guard I,Administration,121004,M,25020,10423,17563,,O,2
121006,"Bolster, Bernard",77,Braswell Ct,San Diego,CA,91950,US,Security Guard I,Administration,121004,M,26145,11242,17837,18201,M,2
121007,"Banaszak, John",77,Lake Tillery Dr,Philadelphia,PA,19139,US,Security Guard II,Administration,121004,M,27290,3207,11354,,M,3
121008,"Mckenzie, Eron",131,Gem Dr,Philadelphia,PA,19122,US,Security Guard II,Administration,121004,M,27875,4932,13727,,M,1
121009,"Goodwin, Robert",31,Friendly Dr,San Diego,CA,92116,US,Service Administrator I,Administration,121000,M,32955,8738,15918,,S,0
121010,"Lamp, Donald",509,Green Level To Durham Rd,Miami-Dade,FL,33142,US,Service Assistant I,Administration,121009,M,25195,10453,18322,,S,0
121011,"Banchi, Steven",522,Buncombe St,Miami-Dade,FL,33031,US,Service Assistant I,Administration,121009,M,25735,-4313,6575,,S,0
121012,"Broome, Carmelo",368,Buck Jones Rd,Miami-Dade,FL,33144,US,Service Assistant II,Administration,121009,M,29575,10983,17410,17866,S,0
121013,"Hargrave, Seco",3,Altair Cir,Philadelphia,PA,19131,US,Electrician II,Engineering,121016,M,26675,8518,16162,,S,0
121014,"Liguori, Donelle",6,Gamelyn Walk,Miami-Dade,FL,33183,US,Electrician III,Engineering,121016,F,28510,6695,15918,,M,3
121015,"Elmoslamy, Wilson",3118,Iris Dr,San Diego,CA,92105,US,Technician I,Engineering,121016,M,26140,8747,16315,,S,0
121016,"Sullivan, Lutezenia",4758,Barbara Dr,Miami-Dade,FL,33180,US,Technical Manager,Engineering,121000,F,48075,7323,17776,,S,0
121017,"Arizmendi, Gilbert",379,Englehardt Dr,San Diego,CA,91950,US,Technician II,Engineering,121016,M,29225,10232,17957,,S,0
121018,"Magolan, Julienne",522,Buncombe St,Miami-Dade,FL,33031,US,Sales Rep. II,Sales,121144,F,27560,-4381,6575,17286,M,2
121019,"Desanctis, Scott",765,Greenhaven Ln,Philadelphia,PA,19102,us,Sales Rep. IV,Sales,121144,M,31320,11133,17684,18109,M,3
121020,"Ridley, Cherda",30,Aiken Pkwy,Philadelphia,PA,19142,US,Sales Rep. IV,Sales,121144,F,31750,10280,16922,,M,1
121021,"Farren, Priscilla",1538,Dacian Rd,San Diego,CA,92124,US,Sales Rep. IV,Sales,121144,F,32985,6918,13939,,S,0
121022,"Stevens, Robert",224,Horsham Way,San Diego,CA,91950,US,Sales Rep. IV,Sales,121144,M,32210,8701,16833,17775,S,0
121023,"Fuller, Shawn",1195,Echo Glen Ln,San Diego,CA,92028,US,Sales Rep. I,Sales,121144,M,26010,2994,12174,18140,M,3
121024,"Westlund, Michael",198,Botany Bay Dr,San Diego,CA,92021,US,Sales Rep. II,Sales,121144,M,26600,10491,17653,,M,2
121025,"Cassey, Barnaby",1609,Abbey Ln,Miami-Dade,FL,33134,US,Sales Rep. II,Sales,121144,M,28295,-2274,7183,,S,0
121026,"Jaime, Terrill",697,Harcourt Dr,Philadelphia,PA,19136,US,Sales Rep. IV,Sales,121144,M,31515,11269,18353,,M,1
121027,"Rudder, Allan",941,Dixon Dr,San Diego,CA,91911,US,Sales Rep. II,Sales,121144,M,26165,3047,12388,,M,3
121028,"Smades, William",6,Gamelyn Walk,Miami-Dade,FL,33183,US,Sales Rep. I,Sales,121144,M,26585,11805,18567,,S,0
121029,"Mcelwee, Kuo-Chung",1538,Dacian Rd,San Diego,CA,92124,US,Sales Rep. I,Sales,121144,M,27225,3278,12388,,M,2
121030,"Areu, Jeryl",265,Fyfe Ct,Miami-Dade,Fl,33133,US,Sales Rep. I,Sales,121144,M,26745,8716,16468,,S,0
121031,"Filan, Scott",375,Foxmoor Ct,Philadelphia,PA,19142,US,Sales Rep. III,Sales,121144,M,28060,3112,10805,,M,3
121032,"Smith, Nasim",340,Bellevue Rd,San Diego,CA,92027,US,Sales Rep. IV,Sales,121144,M,31335,11742,18322,,M,1
121033,"Snitzer, Kristie",2157,Denberg Ln,Philadelphia,PA,19140,US,Sales Rep. III,Sales,121144,F,29775,11267,17684,,M,3
121034,"Kirkman, John",40,Dry Fork Ln,Miami-Dade,FL,33193,US,Sales Rep. II,Sales,121144,M,27110,11923,18628,,S,0
121035,"Blackley, James",41,Dubose St,San Diego,CA,92110,US,Sales Rep. II,Sales,121144,M,26460,-4299,6575,,M,3
121036,"Mesley, Teresa",967,Hearthside Ct,Philadelphia,PA,19148,US,Sales Rep. I,Sales,121144,F,25965,11887,17440,18201,O,1
121037,"Miketa, Muthukumar",2185,Ileagnes Rd,Miami-Dade,FL,33176,US,Sales Rep. III,Sales,121144,M,28310,6737,16861,,M,2
121038,"Anstey, David",939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US,Sales Rep. I,Sales,121144,M,25285,11731,18475,18659,S,0
121039,"Washington, Donald",1668,Bladen St,Miami-Dade,FL,33055,US,Sales Rep. II,Sales,121144,M,27460,-577,8887,,M,2
121040,"Darrohn, Brienne",3941,Belford Valley Ln,Philadelphia,PA,19103,US,Sales Rep. III,Sales,121144,F,29525,1282,9801,,M,2
121041,"Wetherington, Jaime",1428,Brandywine Dr,San Diego,CA,92071,US,Sales Rep. II,Sales,121144,F,26120,-4349,6575,,S,0
121042,"Robbin-Coker, Joseph",2645,Berkshire Downs Dr,San Diego,CA,92008,US,Sales Rep. III,Sales,121144,M,28845,8494,16010,,M,2
121043,"Kagarise, Sigrid",3313,Dothan Ct,Philadelphia,PA,19107,US,Sales Rep. II,Sales,121144,F,28225,5061,13209,,M,2
121044,"Abbott, Ray",2267,Edwards Mill Rd,Miami-Dade,FL,33135,US,Sales Rep. I,Sales,121144,M,25660,-386,7152,,S,0
121045,"Hampton, Cascile",8560,Carlton Ave,San Diego,CA,92027,US,Sales Rep. II,Sales,121143,F,28560,3086,13880,17591,M,2
121046,"Mandzak, Roger",443,High Country Dr,Philadelphia,PA,19147,US,Sales Rep. I,Sales,121143,M,25845,10477,18444,18628,M,1
121047,"Grzebien, Karen",627,Chenworth Dr,San Diego,CA,92082,US,Sales Rep. I,Sales,121143,F,25820,8730,18506,18687,M,2
121048,"Clark, Lawrie",5716,Deacons Bend Ct,Miami-Dade,FL,33184,US,Sales Rep. I,Sales,121143,F,26560,10402,18506,18687,M,3
121049,"Bataineh, Perrior",892,Birchland Dr,San Diego,CA,92126,US,Sales Rep. I,Sales,121143,F,26930,11002,18597,,M,3
121050,"Capristo-Abramczyk, Patricia",157,Ithaca Ln,San Diego,CA,91950,US,Sales Rep. II,Sales,121143,F,26080,10969,18597,,M,3
121051,"Myers, Glorina",335,Fox Ct,San Diego,CA,92029,US,Sales Rep. I,Sales,121143,F,26025,-2435,8340,,M,2
121052,"Fay, Richard",7660,Calvary Dr,Philadelphia,PA,19107,US,Sales Rep. II,Sales,121143,M,26900,10966,18567,,S,0
121053,"Mcdade, Tywanna",87,Christofle Ln,San Diego,CA,92082,US,Sales Rep. III,Sales,121143,F,29955,-4117,6606,,M,2
121054,"Pulliam, Daniel",651,Bluebird Ct,San Diego,CA,92027,US,Sales Rep. III,Sales,121143,M,29805,-415,7610,,S,0
121055,"Davis, Clement",1305,Kyle Dr,Miami-Dade,FL,33172,US,Sales Rep. III,Sales,121143,M,30185,11695,18475,,M,1
121056,"Lyszyk, Stacey",3118,Iris Dr,San Diego,CA,92105,US,Sales Rep. II,Sales,121143,F,28325,10413,17287,,O,1
121057,"Voron, Tachaun",990,Center Pointe Dr,Philadelphia,PA,19143,US,Sales Rep. I,Sales,121143,M,25125,1455,9101,,M,1
121058,"Kohake, Del",181,Falls River Ave,San Diego,CA,92021,US,Sales Rep. I,Sales,121143,M,26270,6767,17075,,M,2
121059,"Carhide, Jacqulin",5637,Greenfield Dr,San Diego,CA,91911,US,Sales Rep. II,Sales,121143,F,27425,1393,9222,17531,S,0
121060,"Spofford, Elizabeth",4368,Farrington Dr,Miami-Dade,FL,33165,US,Sales Rep. III,Sales,121143,F,28800,-4224,6575,,M,2
121061,"Hassam, Lauris",4407,Fountain Dr,Miami-Dade,FL,33178,US,Sales Rep. III,Sales,121143,M,29815,-534,10409,,S,0
121062,"Armant, Debra",10398,Crown Forest Ct,San Diego,CA,92025,US,Sales Rep. IV,Sales,121145,F,30305,10528,18475,,M,3
121063,"Kinol, Regi",63,Fountainhead Dr,Miami-Dade,FL,33180,US,Sales Rep. II,Sales,121145,M,35990,8608,18110,,S,0
121064,"Polky, Asishana",41,Dubose St,San Diego,CA,92110,US,Sales Rep. I,Sales,121145,M,25110,2949,13027,,M,1
121065,"Malta, Corneille",1793,Falcon Rest Cir,San Diego,CA,92113,US,Sales Rep. III,Sales,121145,F,28040,10475,18353,,M,2
121066,"Norman, Ceresh",251,Lake Tillery Dr,Philadelphia,PA,19148,US,Sales Rep. II,Sales,121145,F,27250,-4148,6575,18201,O,1
121067,"Macnair, Jeanilla",1984,Dunhill Ter,San Diego,CA,92008,US,Sales Rep. IV,Sales,121145,F,31865,10975,18322,18506,S,0
121068,"Osuba, Salaheloin",2546,Belford Valley Ln,San Diego,CA,91932,US,Sales Rep. II,Sales,121145,M,27550,5084,13393,,O,1
121069,"Lapsley, Jason",2148,Circlebank Dr,San Diego,CA,92064,US,Sales Rep. II,Sales,121145,M,26195,4826,12692,,M,1
121070,"Holthouse, Agnieszka",41,Hawthorne Way,Miami-Dade,FL,33018,US,Sales Rep. III,Sales,121145,F,29385,10535,18294,,O,1
121071,"Hoppmann, John",744,Farmington Grove Dr,Miami-Dade,FL,33141,US,Sales Rep. III,Sales,121145,M,28625,1348,7914,,M,2
121072,"North, Christer",2765,Eaglesham Way,Philadelphia,PA,19121,US,Sales Rep. I,Sales,121145,M,26105,8410,17776,18201,M,1
121073,"Court, Donald",4498,Calumet Dr,Miami-Dade,FL,33144,US,Sales Rep. I,Sales,121145,M,27100,-2422,6575,,M,1
121074,"Michonski, Eric",1921,Kingston Ridge Rd,San Diego,CA,92129,US,Sales Rep. I,Sales,121145,M,26990,1155,11962,,S,0
121075,"Sugg, Kasha",4137,Deer Haven Dr,San Diego,CA,92101,US,Sales Rep. II,Sales,121145,F,28395,-4026,6575,,M,3
121076,"Cobb, Micah",37,Glencoe Dr,Philadelphia,Pa,19138,US,Sales Rep. II,Sales,121143,M,26685,3204,9862,17683,M,2
121077,"Smotherly, Bryce",4396,Burntwood Cir,Miami-Dade,FL,33193,US,Sales Rep. III,Sales,121143,M,28585,10475,18536,,S,0
121078,"Wende, Lionel",52,Landor Rd,Miami-Dade,FL,33169,US,Sales Rep. I,Sales,121143,M,27485,-2436,8340,,M,1
121079,"Mees, Azmi",824,Beaufort St,Philadelphia,PA,19128,US,Sales Rep. I,Sales,121143,M,25770,6728,15280,,M,1
121080,"Chinnis, Kumar",60,Hodge Rd,Miami-Dade,FL,33138,US,Sales Rep. I,Sales,121143,M,32235,1119,11566,,S,0
121081,"Knudson, Susie",110,Glascock St,San Diego,CA,91950,US,Sales Rep. III,Sales,121143,F,30235,-2470,7396,,M,2
121082,"Debank, Richard",608,Campbell Rd,Miami-Dade,FL,33129,US,Sales Rep. III,Sales,121143,M,28510,-2371,7944,,M,3
121083,"Sutton, Tingmei",6940,Hunt Farms Ln,Miami-Dade,FL,33147,US,Sales Rep. I,Sales,121143,F,27245,1165,8460,,S,0
121084,"Ould, Tulsidas",1025,Coronado Dr,San Diego,Ca,92028,US,Sales Rep. I,Sales,121143,M,22710,3150,12784,,M,3
121085,"Huslage, Rebecca",1984,Dunhill Ter,San Diego,CA,92008,US,Sales Rep. IV,Sales,121143,M,32235,11273,18628,,S,0
121086,"Plybon, John-Michael",890,Dinwiddie Ct,Miami-Dade,FL,33174,US,Sales Rep. I,Sales,121143,M,26820,-4033,6575,,M,3
121087,"O'Suilleabhain, Virtina",219,Ivydale Dr,Miami-Dade,FL,33178,US,Sales Rep. II,Sales,121143,F,28325,6915,15765,18352,M,3
121088,"Kernitzki, Momolu",422,Brentwood Rd,Philadelphia,PA,19134,US,Sales Rep. I,Sales,121143,M,27240,11849,18628,,S,0
121089,"Sauder, Gregory",974,Joel Ct,Miami-Dade,FL,33030,US,Sales Rep. II,Sales,121143,M,28095,-498,6756,18566,M,1
121090,"Klibbe, Betty",3750,Langley Cir,San Diego,CA,92025,US,Sales Rep. I,Sales,121143,F,26600,-561,8797,,M,3
121091,"Kadiri, Ernest",6,Frissell Ave,Philadelphia,Pa,19142,US,Sales Rep. II,Sales,121143,M,27325,4798,12054,,M,2
121092,"Pritt, Gynell",8112,Kenna Ct,San Diego,CA,92116,US,Sales Rep. I,Sales,121143,F,25680,6641,17014,,S,0
121093,"Vasconcellos, Carl",5194,Calm Winds Ct,San Diego,CA,92071,US,Sales Rep. I,Sales,121143,M,27410,3121,13880,17347,M,2
121094,"Tate, Larry",2704,Lake Wheeler Rd,San Diego,CA,92082,US,Sales Rep. I,Sales,121143,M,26555,-724,8279,,S,0
121095,"Kratzke, Sara",4137,Deer Haven Dr,San Diego,CA,92101,US,Sales Rep. II,Sales,121143,F,28010,4852,12965,,S,0
121096,"Newstead, Robert",683,Lake Hill Dr,Miami-Dade,FL,33176,US,Sales Rep. I,Sales,121143,M,26335,4886,14365,,S,0
121097,"Chernega, Willeta",17,Cottonwood Ln,Philadelphia,PA,19111,US,Sales Rep. II,Sales,121143,F,26830,6870,14518,,M,3
121098,"Heatwole, Hal",1543,Cherrycrest Ct,Philadelphia,PA,19154,US,Sales Rep. I,Sales,121143,M,27475,11769,18383,,S,0
121099,"Mrvichin, Royall",31,Cantwell Ct,Philadelphia,PA,19141,US,Sales Rep. IV,Sales,121143,M,32725,8478,16192,,M,3
121100,"Cormell, Tzue-Ing",4104,Blackwolf Run Ln,San Diego,CA,92114,US,Sales Rep. II,Sales,121143,M,28135,-2440,7396,,S,0
121101,"Buckner, Burnetta",3385,Hampton Ridge Rd,San Diego,CA,92114,US,Sales Rep. I,Sales,121143,F,25390,11197,18567,,O,1
121102,"Flammia, Rocheal",1201,Hoyle Dr,San Diego,CA,91978,us,Sales Rep. I,Sales,121143,F,27115,8577,18414,,M,2
121103,"Farnsworth, Brian",8458,Crispwood Ct,San Diego,Ca,91901,US,Sales Rep. I,Sales,121143,M,27260,11806,18506,,S,0
121104,"Johnson, Leoma",4002,Brassfield Rd,Philadelphia,PA,19134,US,Sales Rep. II,Sales,121143,F,28315,3238,11048,16832,S,0
121105,"Savacool, Jessica",618,Darlington Pl,Miami-Dade,FL,33143,US,Sales Rep. III,Sales,121143,F,29545,8529,17167,,S,0
121106,"Hilburger, James",139,Barton Pines Rd,Miami-Dade,FL,33189,US,Sales Rep. I,Sales,121143,M,25880,4781,14641,,M,3
121107,"Anger, Rose",744,Chapwith Rd,Philadelphia,PA,19142,US,Sales Rep. IV,Sales,121143,F,31380,11071,18444,,M,1
121108,"Levi, Libby",1713,Barham Siding Rd,Miami-Dade,FL,33013,US,Sales Rep. I,Sales,121143,F,25930,11873,18567,18748,S,0
121109,"Boulus, Harold",4320,Colony Woods Dr,San Diego,CA,92054,US,Sales Rep. I,Sales,121143,M,26035,5057,12539,,M,1
121110,"Knapp, Albert",4368,Farrington Dr,Miami-Dade,FL,33165,US,Temp. Sales Rep.,Sales,121145,M,26370,-4279,18597,18627,M,1
121111,"Maholo, Salim",91,Gardner St,San Diego,CA,92057,US,Temp. Sales Rep.,Sales,121145,M,26885,-4185,18597,18747,S,0
121112,"Stouchko, Lee",101,Avent Ferry Rd,Miami-Dade,FL,33178,US,Temp. Sales Rep.,Sales,121145,M,26855,11304,18597,18627,S,0
121113,"Costine, Karen",522,Buncombe St,Miami-Dade,FL,33031,US,Temp. Sales Rep.,Sales,121145,F,27480,-679,18597,18658,O,1
121114,"Whipkey, Okema",7834,Briar Oaks Ln,San Diego,CA,92104,US,Temp. Sales Rep.,Sales,121145,F,26515,-4075,18597,18808,M,3
121115,"O'Carroll, Aquilla",5194,Calm Winds Ct,San Diego,CA,92071,US,Temp. Sales Rep.,Sales,121145,M,26430,1139,18597,18747,S,0
121116,"Bond-Teague, Mary",24,Bashford Rd,San Diego,CA,92106,US,Temp. Sales Rep.,Sales,121145,F,26670,3188,18597,18717,M,3
121117,"Sergi, Teresa",3,Altair Cir,Philadelphia,PA,19131,US,Temp. Sales Rep.,Sales,121145,F,26640,6651,18597,18627,S,0
121118,"Lawson, Paul",598,Lake Ct,Philadelphia,Pa,19122,US,Temp. Sales Rep.,Sales,121145,M,25725,8460,18597,18778,S,0
121119,"Armogida, Bruce",1914,Lansing St,Philadelphia,PA,19119,US,Temp. Sales Rep.,Sales,121145,M,25205,3229,18597,18686,M,3
121120,"Labach, Susan",1624,Fox Trail Ln,Philadelphia,PA,19146,US,Temp. Sales Rep.,Sales,121145,F,25020,6872,18597,18686,S,0
121121,"Cassone, Halouise",6,Frissell Ave,Philadelphia,PA,19142,US,Temp. Sales Rep.,Sales,121145,F,25735,11021,18597,18778,S,0
121122,"Scarbrough, Stancey",701,Glenridge Dr,Miami-Dade,FL,33177,US,Temp. Sales Rep.,Sales,121145,M,26265,11017,18597,18717,S,0
121123,"Helyar, Randy",3313,Dothan Ct,Philadelphia,PA,19107,US,Temp. Sales Rep.,Sales,121145,M,26410,-4266,18597,18717,M,3
121124,"Gonzalez, Deginald",1611,Kronos Ln,Miami-Dade,FL,33054,US,Temp. Sales Rep.,Sales,121145,M,26925,4794,18597,18627,S,0
121125,"Holt, Michael",270,Johnson St,Philadelphia,PA,19138,US,Trainee,Sales,121145,M,25315,6681,17167,17347,S,0
121126,"Penhale, James",142,Bluffridge Dr,Philadelphia,PA,19141,US,Trainee,Sales,121145,M,26015,-432,17167,17347,M,1
121127,"Mangini, Keyna",9,Garner Rd,San Diego,CA,91910,US,Trainee,Sales,121145,F,25435,11203,18049,18231,M,2
121128,"Nazar, Glacia",1250,Kingston Ridge Rd,San Diego,CA,92128,US,Trainee,Sales,121145,F,25405,6751,17167,17347,M,3
121129,"Hafley, Yusef",192,Beaufort St,Miami-Dade,FL,33133,US,Trainee,Sales,121145,M,30945,3043,17167,17347,S,0
121130,"Herndon, Gary",11,Langdale Pl,Philadelphia,PA,19143,US,Trainee,Sales,121145,M,25255,10247,17563,17744,S,0
121131,"Pantages, William",198,Botany Bay Dr,San Diego,CA,92021,US,Trainee,Sales,121145,M,25445,4929,17167,17347,M,2
121132,"Digiorgio, Shia-Ling",97,Gentlewoods Dr,San Diego,CA,92040,US,Trainee,Sales,121145,M,24390,-692,17167,17347,M,1
121133,"Pringley, Peter",4002,Brassfield Rd,Philadelphia,PA,19134,US,Trainee,Sales,121145,M,25405,8714,17167,17347,M,1
121134,"Tacosa, Paul",2733,Balfour Downs Cir,San Diego,CA,92109,US,Trainee,Sales,121145,M,25585,3105,17167,17347,S,0
121135,"Ruta, Tammy",89,Ashley Brook Ct,Philadelphia,PA,19131,US,Sales Rep. I,Sales,121145,F,27010,-573,6787,,S,0
121136,"Galarneau, Lesia",3,Altair Cir,Philadelphia,PA,19131,US,Sales Rep. I,Sales,121145,F,27460,6770,17136,17805,S,0
121137,"Boocks, Michael. R.",1555,Laurdane Rd,Miami-Dade,FL,33183,US,Sales Rep. I,Sales,121145,M,27055,11705,18353,,O,0
121138,"Tolley, Hershell",3,Altair Cir,Philadelphia,PA,19131,US,Sales Rep. I,Sales,121145,M,27265,-2498,6575,,M,1
121139,"Mckee, Diosdado",81,Hanska Way,San Diego,CA,92014,US,Sales Rep. II,Sales,121145,F,27700,1326,11504,,M,2
121140,"Briggi, Saunders",991,Holman St,San Diego,CA,92021,US,Sales Rep. I,Sales,121145,M,26335,8423,16527,18293,S,0
121141,"Bleu, Henri Le",29,Joliesse Ln,Philadelphia,PA,19103,US,Vice President,Sales Management,120261,M,194885,-4213,6575,,S,0
121142,"Steiber, Reginald",15,Kilmorack Dr,Philadelphia,PA,19136,US,Director,Sales Management,121141,M,156065,4793,13635,,M,2
121143,"Favaron, Louis",163,Horseshoe Bend,Miami-Dade,FL,33176,US,Senior Sales Manager,Sales Management,121142,M,95090,5078,15157,,M,3
121144,"Capachietti, Renee",379,Edgeside Ct,Miami-Dade,FL,33012,US,Sales Manager,Sales Management,121142,F,83505,3101,13088,,M,3
121145,"Lansberry, Dennis",7508,Declaration Dr,Miami-Dade,FL,33012,US,Sales Manager,Sales Management,121142,M,84260,-2231,7396,,M,2
121146,"Sangiorgio, Julieanne",6042,Farmstone Dr,Philadelphia,PA,19125,US,Secretary III,Sales Management,121141,F,29320,11300,18353,,M,1
121147,"Sneed, Christine",151,Gail Ridge Ln,Miami-Dade,FL,33182,US,Secretary II,Sales Management,121142,F,29145,4896,11566,,M,2
121148,"Sadig, Shane",5857,Academy St,Miami-Dade,FL,33133,US,Business Analyst II,Sales Management,121141,M,52930,4749,15341,17197,M,1
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

data ORION.EMPLOYEE_ADDRESSES2;
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
121044,"Abbott, Ray",9260116912,2267,Edwards Mill Rd,Miami-Dade,FL,33135,
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

data ORION.GROWTH;
   attrib Department length=$20;
   attrib Total_Employees length=8;
   attrib Increase length=8;

   infile datalines dsd;
   input
      Department
      Total_Employees
      Increase
   ;
datalines4;
Administration,34,0.25
Engineering,9,0.3
IS,25,0.1
Marketing,20,0.2
Sales,201,0.3
Sales Management,11,0.1
;;;;
run;

data ORION.MAILING_LIST;
   attrib Name length=$40;
   attrib Address1 length=$200;
   attrib Address3 length=$200;

   infile datalines dsd;
   input
      Name
      Address1
      Address3
   ;
datalines4;
"Abbott, Ray",2267 Edwards Mill Rd,"Miami-Dade, FL, 33135, US"
"Aisbitt, Sandy",30 Bingera Street,"Melbourne, 2001, AU"
"Akinfolarin, Tameaka",5 Donnybrook Rd,"Philadelphia, PA, 19145, US"
"Amos, Salley",3524 Calico Ct,"San Diego, CA, 92116, US"
"Anger, Rose",744 Chapwith Rd,"Philadelphia, PA, 19142, US"
"Anstey, David",939 Hilltop Needmore Rd,"Miami-Dade, FL, 33157, US"
"Antonini, Doris",681 Ferguson Rd,"Miami-Dade, FL, 33141, US"
"Apr, Nishan",105 Brack Penny Rd,"San Diego, CA, 92071, US"
"Ardskin, Elizabeth",701 Glenridge Dr,"Miami-Dade, FL, 33177, US"
"Areu, Jeryl",265 Fyfe Ct,"Miami-Dade, Fl, 33133, US"
"Arizmendi, Gilbert",379 Englehardt Dr,"San Diego, CA, 91950, US"
"Armant, Debra",10398 Crown Forest Ct,"San Diego, CA, 92025, US"
"Armogida, Bruce",1914 Lansing St,"Philadelphia, PA, 19119, US"
"Arruza, Fauver",265 Fyfe Ct,"Miami-Dade, FL, 33133, US"
"Asta, Wendy",3565 Lake Park Dr,"Philadelphia, PA, 19145, US"
"Atkins, John",6137 Blue Water Ct,"Miami-Dade, FL, 33161, US"
"Bahlman, Sharon",24 LaTrobe Street,"Sydney, 2165, AU"
"Baker, Gabriele",166 Toorak Road,"Sydney, 2119, AU"
"Baltzell, Timothy",31 Castalia Dr,"Philadelphia, PA, 19140, US"
"Banaszak, John",77 Lake Tillery Dr,"Philadelphia, PA, 19139, US"
"Banchi, Steven",522 Buncombe St,"Miami-Dade, FL, 33031, US"
"Baran, Shanmuganathan",207 Canterbury Road,"Sydney, 1225, AU"
"Barbis, Viney",3 Alice Street,"Sydney, 2114, AU"
"Barcoe, Selina",435 Sherwood Rd,"Melbourne, 8003, AU"
"Barreto, Geok-Seng",241 Royal Perade,"Sydney, 1115, AU"
"Bataineh, Perrior",892 Birchland Dr,"San Diego, CA, 92126, US"
"Benedicto, Tondelayo",2902 Gable Ridge Ln,"San Diego, CA, 92118, US"
"Benyami, Fred",1498 Falconwood Dr,"San Diego, CA, 92069, US"
"Bergeron-Jeter, Dale",2356 Aileen Dr,"Miami-Dade, FL, 33010, US"
"Bezinque, Michael",2732 Bell Dr,"Miami-Dade, FL, 33033, US"
"Billington, Kareen",40 Smith Street,"Sydney, 1670, AU"
"Bilobran, Brenda",11217 Avent Ferry Rd,"Miami-Dade, FL, 33160, US"
"Blackley, James",41 Dubose St,"San Diego, CA, 92110, US"
"Blanton, Brig",6 Palmiston Cresent,"Melbourne, 3150, AU"
"Bleu, Henri Le",29 Joliesse Ln,"Philadelphia, PA, 19103, US"
"Boatright, Lorraine",110 Glascock St,"San Diego, CA, 91950, US"
"Body, Meera",51 Martin Place,"Sydney, 1131, AU"
"Bolster, Bernard",77 Braswell Ct,"San Diego, CA, 91950, US"
"Bond-Teague, Mary",24 Bashford Rd,"San Diego, CA, 92106, US"
"Boocks, Michael. R.",1555 Laurdane Rd,"Miami-Dade, FL, 33183, US"
"Borge, Kathryn",360 Bridgepath Dr,"Miami-Dade, FL, 33150, US"
"Boulus, Harold",4320 Colony Woods Dr,"San Diego, CA, 92054, US"
"Branly, Wanda",21 Lake Pine Dr,"Philadelphia, PA, 19135, US"
"Briggi, Saunders",991 Holman St,"San Diego, CA, 92021, US"
"Broome, Carmelo",368 Buck Jones Rd,"Miami-Dade, FL, 33144, US"
"Brown, Hampie",1951 Cobble Creek Ln,"San Diego, CA, 92054, US"
"Buckner, Burnetta",3385 Hampton Ridge Rd,"San Diego, CA, 92114, US"
"Buddery, Jeannette",12 Hunua Road Papakura,"Sydney, 1004, AU"
"Burroughs, Lemonica",2565 Bledsoe Ave,"Miami-Dade, FL, 33176, US"
"Burt, Woodson",136 Fox Rd,"San Diego, CA, 92128, US"
"Campbell, Carston",19 Fairwinds Dr,"San Diego, CA, 92069, US"
"Cantatore, Lorian",207 Canterbury Road,"Sydney, 1225, AU"
"Capachietti, Renee",379 Edgeside Ct,"Miami-Dade, FL, 33012, US"
"Capps, Ramond",3384 Cotton Mill Dr,"San Diego, CA, 92113, US"
"Capristo-Abramczyk, Patricia",157 Ithaca Ln,"San Diego, CA, 91950, US"
"Carcaterra, Lisa",91 Langstonshire Ln,"San Diego, Ca, 92119, US"
"Carhide, Jacqulin",5637 Greenfield Dr,"San Diego, CA, 91911, US"
"Cassey, Barnaby",1609 Abbey Ln,"Miami-Dade, FL, 33134, US"
"Cassone, Halouise",6 Frissell Ave,"Philadelphia, PA, 19142, US"
"Catenacci, Reyne",44 Gow Street,"Melbourne, 2066, AU"
"Cederlund, Wendall",1 Pacific Rise Mount Wellington,"Sydney, 20000, AU"
"Chantharasy, Judy",1 Embarcadero Center Site 1500,"Melbourne, 3000, AU"
"Chernega, Willeta",17 Cottonwood Ln,"Philadelphia, PA, 19111, US"
"Chinnis, Kumar",60 Hodge Rd,"Miami-Dade, FL, 33138, US"
"Chiseloff, Richard",1726 Evans Rd,"San Diego, CA, 92067, US"
"Clark, Lawrie",5716 Deacons Bend Ct,"Miami-Dade, FL, 33184, US"
"Clark, Terry-Ann",57 Hickory Dr,"San Diego, CA, 92104, US"
"Clarkson, Sharryn",21 Albert St,"Sydney, 1170, AU"
"Cleverley, Bobby",622 Boylan Ave,"San Diego, CA, 92054, US"
"Cobb, Micah",37 Glencoe Dr,"Philadelphia, Pa, 19138, US"
"Comber, Edwin",121 Blackburn Road,"Sydney, 2580, AU"
"Conolly, Andrew",79 Old Port Road,"Sydney, 2144, AU"
"Cooper, Bryon",5857 Academy St,"Miami-Dade, FL, 33133, US"
"Cormell, Tzue-Ing",4104 Blackwolf Run Ln,"San Diego, CA, 92114, US"
"Costine, Karen",522 Buncombe St,"Miami-Dade, FL, 33031, US"
"Court, Donald",4498 Calumet Dr,"Miami-Dade, FL, 33144, US"
"Court, Keisha",88 Kershaw Dr,"Philadelphia, PA, 19130, US"
"Croome, Latonya",1722 Calm Winds Ct,"San Diego, CA, 91941, US"
"Cross, Samantha",699 Buck Rowland Rd,"Miami-Dade, FL, 33169, US"
"Crown, Max",1823 Ashley Rd,"Philadelphia, PA, 19111, US"
"Cutucache, Chrisy",1541 Highland Trl,"San Diego, CA, 92103, US"
"Czernezkyi, Ivor",21 Market Street,"Sydney, 2113, AU"
"Dannin, Freda",674 Friar Tuck Rd,"Miami-Dade, FL, 33193, US"
"Darrohn, Brienne",3941 Belford Valley Ln,"Philadelphia, PA, 19103, US"
"Davis, Clement",1305 Kyle Dr,"Miami-Dade, FL, 33172, US"
"Dawes, Wilson",166 Toorak Road,"Sydney, 2119, AU"
"Daymond, Lucian",1 Julius Avenue,"Sydney, 2233, AU"
"Deacon, David",1636 Gorman St,"Miami-Dade, FL, 33012, US"
"Debank, Richard",608 Campbell Rd,"Miami-Dade, FL, 33129, US"
"Delafuente, Chris-Anne",1329 Cross Link Rd,"Miami-Dade, FL, 33016, US"
"Denhollem, Julius",147 Clearport Dr,"Miami-Dade, FL, 33135, US"
"Denny, Satyakam",7 Boundary Street,"Sydney, 2099, AU"
"Der Wiele, Troyce Van",1787 Brushy Meadows Dr,"Philadelphia, PA, 19148, US"
"Desanctis, Scott",765 Greenhaven Ln,"Philadelphia, PA, 19102, us"
"Desaulniers, Raymondria",2409 Carnegie Ln,"Philadelphia, PA, 19145, US"
"Digiorgio, Shia-Ling",97 Gentlewoods Dr,"San Diego, CA, 92040, US"
"Dillin, Kerrin",29 Emily Bullock Cres,"Melbourne, 8007, AU"
"Dinley, Robert",182 Fort Sumter Rd,"Miami-Dade, FL, 33160, US"
"Dives, Sean",69 Bourke St,"Sydney, 1460, AU"
"Dolan, Thyland",744 Farmington Grove Dr,"Miami-Dade, FL, 33141, US"
"Donathan, Mary",4923 Gateridge Dr,"Philadelphia, PA, 19152, us"
"Donnell, Damesha",1947 Bromley Way,"San Diego, CA, 92024, US"
"Drew, Gloria",17 Kempwood Dr,"Philadelphia, PA, 19119, US"
"Droste, Edwin",1661 Hanna Ln,"Miami-Dade, FL, 33014, US"
"Droste, Victor",1722 Calm Winds Ct,"San Diego, CA, 91941, US"
"Duckett, Shani",9 Northgate Drive,"Melbourne, 3168, AU"
"Dunlap, Kareema",181 Falls River Ave,"San Diego, CA, 92021, US"
"Dupree, Marcel",3231 Amity Hill Ct,"San Diego, CA, 92064, US"
"Eastley, Vincent",4 Dalmore Drive,"Melbourne, 3095, AU"
"Eggleston, Jennifer",140 Hollow Ct,"Miami-Dade, FL, 33032, US"
"El-Amin, Sue",1030 Indigo Dr,"Philadelphia, PA, 19122, US"
"Elleman, Lal",1021 Haupapa Street,"Sydney, 1219, AU"
"Elmoslamy, Wilson",3118 Iris Dr,"San Diego, CA, 92105, US"
"Elvish, Irenie",3 Mundi Place,"Sydney, 1232, AU"
"Entwisle, Dennis",9 Grayson Avenue Papatoetoe,"Sydney, 1226, AU"
"Esguerra, Loyal",2726 Fairfax Woods Dr,"Miami-Dade, FL, 33162, US"
"Farnsworth, Brian",8458 Crispwood Ct,"San Diego, Ca, 91901, US"
"Farren, Priscilla",1538 Dacian Rd,"San Diego, CA, 92124, US"
"Farthing, Zashia",763 Chatterson Dr,"San Diego, CA, 92116, us"
"Favaron, Louis",163 Horseshoe Bend,"Miami-Dade, FL, 33176, US"
"Fay, Richard",7660 Calvary Dr,"Philadelphia, PA, 19107, US"
"Feigenbaum, Alden",43 Glen Bonnie Ln,"San Diego, CA, 92122, US"
"Ferrari, Ralph",309 Gilliam Ln,"Miami-Dade, FL, 33172, US"
"Filan, Scott",375 Foxmoor Ct,"Philadelphia, PA, 19142, US"
"Filo, John",5 Sun Pl,"Melbourne, 3001, AU"
"Fiocca, Jina",81 Burwood Road,"Melbourne, 3155, AU"
"Flammia, Rocheal",1201 Hoyle Dr,"San Diego, CA, 91978, us"
"Fletcher, Christine",2416 Cove Point Dr,"San Diego, CA, 91910, US"
"Flow, Febin",461 Kimberly Dr,"Philadelphia, PA, 19121, US"
"Fouche, Madelaine",1 Embarcadero Center Site 1500,"Melbourne, 3000, AU"
"Fuller, Shawn",1195 Echo Glen Ln,"San Diego, CA, 92028, US"
"Galarneau, Lesia",3 Altair Cir,"Philadelphia, PA, 19131, US"
"Gardner, Angela",349 Eason Cir,"Philadelphia, PA, 19104, US"
"George, Vino",9 Adelaide Terrace,"Melbourne, 3000, AU"
"Glattback, Ellis",7 Vulture Street,"Melbourne, 3174, AU"
"Gonzalez, Deginald",1611 Kronos Ln,"Miami-Dade, FL, 33054, US"
"Goodwin, Robert",31 Friendly Dr,"San Diego, CA, 92116, US"
"Gordo, Lily-Ann",545 Jones Sausage Rd,"Philadelphia, PA, 19144, US"
"Graham-Rowe, Jannene",1 Embarcadero Center Site 1500,"Melbourne, 3000, AU"
"Gromek, Gladys",6 George Street,"Melbourne, 3000, AU"
"Grzebien, Karen",627 Chenworth Dr,"San Diego, CA, 92082, US"
"Guscott, Verne",249 Collins Street,"Sydney, 2009, AU"
"Habres, Sek",11 Reid Street,"Sydney, 1005, AU"
"Hafley, Yusef",192 Beaufort St,"Miami-Dade, FL, 33133, US"
"Hampton, Cascile",8560 Carlton Ave,"San Diego, CA, 92027, US"
"Hargrave, Seco",3 Altair Cir,"Philadelphia, PA, 19131, US"
"Harrison, Chimena",77 Braswell Ct,"San Diego, CA, 91950, US"
"Hart, Tessia",2170 Buttercup Ln,"Miami-Dade, FL, 33055, US"
"Hartshorn, Darshi",1 Waterloo Street,"Sydney, 2065, AU"
"Harvill, Barbara",23 Alderman Cir,"Philadelphia, PA, 19129, US"
"Harwood, Reece",81 Burwood Road,"Melbourne, 3155, AU"
"Hassam, Lauris",4407 Fountain Dr,"Miami-Dade, FL, 33178, US"
"Havasy, Jay",1930 Apple Meadow Dr,"Philadelphia, PA, 19145, US"
"Hayawardhana, Caterina",21 Albert St,"Sydney, 1170, AU"
"Heatwole, Hal",1543 Cherrycrest Ct,"Philadelphia, PA, 19154, US"
"Heilmann, Sherelyn",3750 Langley Cir,"San Diego, CA, 92025, US"
"Heinsler, John",39 Brush Stream Dr,"Miami-Dade, FL, 33179, US"
"Helyar, Randy",3313 Dothan Ct,"Philadelphia, PA, 19107, US"
"Hennington, Charles",40 Elsbeth Ct,"Philadelphia, PA, 19144, US"
"Herndon, Gary",11 Langdale Pl,"Philadelphia, PA, 19143, US"
"Hieds, Merle",5 Sun Pl,"Melbourne, 3001, AU"
"Highpoint, Harry",18 Antler Ct,"Miami-Dade, FL, 33135, US"
"Hilburger, James",139 Barton Pines Rd,"Miami-Dade, FL, 33189, US"
"Hill, Ronald",2823 Eagles Landing Dr,"Philadelphia, PA, 19146, US"
"Hofmeister, Fong",17 Druitt Street,"Sydney, 2122, AU"
"Holt, Michael",270 Johnson St,"Philadelphia, PA, 19138, US"
"Holthouse, Agnieszka",41 Hawthorne Way,"Miami-Dade, FL, 33018, US"
"Honore, Craig",7766 Brimfield Ct,"Miami-Dade, FL, 33141, US"
"Hoppmann, John",744 Farmington Grove Dr,"Miami-Dade, FL, 33141, US"
"Horne, Entrisse",7497 Holly Pointe Dr,"Miami-Dade, FL, 33133, US"
"Horne, Omeba",4750 Jet Ln,"Philadelphia, PA, 19119, US"
"Hornsey, John",325 Sherwood Road,"Sydney, 1100, AU"
"Horsey, Riu",45 Talavera Road,"Melbourne, 3146, AU"
"Hotstone, Kimiko",54 Overseas Drive,"Sydney, 2066, AU"
"House, Tony",1 Bona Ct,"Miami-Dade, FL, 33140, US"
"Howard, Anita",1455 Emerywood Dr,"Philadelphia, PA, 19124, US"
"Howell, Kimberly",260 Langstonshire Ln,"Miami-Dade, FL, 33134, US"
"Huslage, Rebecca",1984 Dunhill Ter,"San Diego, CA, 92008, US"
"Iyengar, Marina",9 Crusin Place,"Melbourne, 3086, AU"
"Jaime, Terrill",697 Harcourt Dr,"Philadelphia, PA, 19136, US"
"James, Narelle",30 Thorncraft Parade,"Melbourne, 2113, AU"
"Johnson, Leoma",4002 Brassfield Rd,"Philadelphia, PA, 19134, US"
"Jones, Sherrie",19 Dutch Creek Dr,"Miami-Dade, FL, 33186, US"
"Jongleux, Binit",3053 Blackpine Ct,"San Diego, CA, 91910, US"
"Juif, Kenneth",881 Green Downs Dr,"Philadelphia, PA, 19143, US"
"Kadiri, Ernest",6 Frissell Ave,"Philadelphia, Pa, 19142, US"
"Kagarise, Sigrid",3313 Dothan Ct,"Philadelphia, PA, 19107, US"
"Kagolanu, Shrimatee",65 Applecross Cir,"Philadelphia, PA, 19131, US"
"Kaiser, Fancine",33 Great South Road Riccarton,"Sydney, 2000, AU"
"Karavdic, Leonid",121 Blackburn Road,"Sydney, 2580, AU"
"Karp, Davis",458 Huckleberry Dr,"Philadelphia, PA, 19104, US"
"Kellis, Philip",40 Elsbeth Ct,"Philadelphia, PA, 19144, US"
"Kempster, Janelle",8 Ashwood Dr,"Miami-Dade, FL, 33173, US"
"Kennedy, Barbara",1635 Auburn Church Rd,"Philadelphia, PA, 19119, US"
"Kennedy, Kathryn",353 Cameron Woods Dr,"Philadelphia, PA, 19148, US"
"Kennedy, Kenneth",3118 Iris Dr,"San Diego, CA, 92105, US"
"Kernitzki, Momolu",422 Brentwood Rd,"Philadelphia, PA, 19134, US"
"Kicak, Lisa",1974 Clear Brook Dr,"Miami-Dade, FL, 33172, US"
"Kiemle, Parie",26 Holly Park Dr,"Miami-Dade, FL, 33130, US"
"Kierce, Franca",120 Walkers Road,"Sydney, 2015, AU"
"Kimmerle, Kevie",162 Horsetrail Way,"Philadelphia, PA, 19121, US"
"Kingston, Alban",5 Buffalo Road,"Sydney, 1042, AU"
"Kinol, Regi",63 Fountainhead Dr,"Miami-Dade, FL, 33180, US"
"Kirkman, John",40 Dry Fork Ln,"Miami-Dade, FL, 33193, US"
"Kistanna, Geoff",28 Fonceca Street,"Sydney, 1171, au"
"Kletschkus, Monica",26 Bay Street,"Melbourne, 3050, AU"
"Klibbe, Betty",3750 Langley Cir,"San Diego, CA, 92025, US"
"Knapp, Albert",4368 Farrington Dr,"Miami-Dade, FL, 33165, US"
"Knopfmacher, Paul",804 Calebra Way,"San Diego, CA, 92104, US"
"Knudson, Susie",110 Glascock St,"San Diego, CA, 91950, US"
"Knust, Dlutomi",744 Brannigan Pl,"Philadelphia, PA, 19141, US"
"Kochneff, Deven",765 Greenhaven Ln,"Philadelphia, PA, 19102, US"
"Kohake, Del",181 Falls River Ave,"San Diego, CA, 92021, US"
"Kokoszka, Nikeisha",2416 Cove Point Dr,"San Diego, Ca, 91910, US"
"Koonce, Lisa",1636 Gorman St,"Miami-Dade, FL, 33012, US"
"Kornblith, Anglar",4407 Fountain Dr,"Miami-Dade, FL, 33178, US"
"Krafve, Bao",12 Brigadoon Dr,"San Diego, CA, 92040, US"
"Kratzke, Sara",4137 Deer Haven Dr,"San Diego, CA, 92101, US"
"Labach, Susan",1624 Fox Trail Ln,"Philadelphia, PA, 19146, US"
"Lachlan, Mihailo",17 Elsie St,"Sydney, 2154, AU"
"Lamp, Donald",509 Green Level To Durham Rd,"Miami-Dade, FL, 33142, US"
"Landry, Angela",162 Horsetrail Way,"Philadelphia, PA, 19121, US"
"Langston, Taronda",1635 Auburn Church Rd,"Philadelphia, PA, 19119, US"
"Lansberry, Dennis",7508 Declaration Dr,"Miami-Dade, FL, 33012, US"
"Lapsley, Jason",2148 Circlebank Dr,"San Diego, CA, 92064, US"
"Lattimer, Brandy",56 Cahill Rd,"San Diego, CA, 92065, US"
"Latty, William",422 Brentwood Rd,"Philadelphia, PA, 19134, US"
"Laurer, Jaime",211 Hamstead Crossing Dr,"Philadelphia, PA, 19124, US"
"Lawson, Paul",598 Lake Ct,"Philadelphia, Pa, 19122, US"
"Leacock, Jill",1288 Joe Leach Rd,"San Diego, CA, 91945, US"
"Leazer, Sharon",29 Lawson Ave,"Sydney, 1220, AU"
"Leone, Marvin",2898 Cookshire Dr,"Philadelphia, PA, 19121, US"
"Lerew, Robert",2254 Appledown Dr,"San Diego, CA, 92008, US"
"Levi, Libby",1713 Barham Siding Rd,"Miami-Dade, FL, 33013, US"
"Leyden, Atul",12 Hunua Road Papakura,"Sydney, 1004, AU"
"Liebman, Amanda",46 George Street,"Sydney, 2012, AU"
"Lightbourne, Abelino",6137 Blue Water Ct,"Miami-Dade, FL, 33161, US"
"Liguori, Donelle",6 Gamelyn Walk,"Miami-Dade, FL, 33183, US"
"Lisowe, Smitty",1058 Atchison St,"San Diego, CA, 92120, US"
"Lu, Patrick",51 Botany Road,"Sydney, 1230, AU"
"Lyon, Kevin",2 Hill St,"Sydney, 1044, AU"
"Lyszyk, Stacey",3118 Iris Dr,"San Diego, CA, 92105, US"
"Macnair, Jeanilla",1984 Dunhill Ter,"San Diego, CA, 92008, US"
"Magolan, Julienne",522 Buncombe St,"Miami-Dade, FL, 33031, US"
"Magrath, Brett",253 Princess Hwy,"Melbourne, 3000, AU"
"Maholo, Salim",91 Gardner St,"San Diego, CA, 92057, US"
"Malta, Corneille",1793 Falcon Rest Cir,"San Diego, CA, 92113, US"
"Mamo, William",183 Dacus Pl,"Miami-Dade, FL, 33055, US"
"Mandzak, Roger",443 High Country Dr,"Philadelphia, PA, 19147, US"
"Mangini, Keyna",9 Garner Rd,"San Diego, CA, 91910, US"
"Marion, Chiorene",89 Atchison St,"Miami-Dade, FL, 33129, US"
"Marples, Donald",2227 Calais Ct,"San Diego, CA, 92122, US"
"Martines, Rosette",147 North Clark Street,"Melbourne, 3156, AU"
"Mccleary, Bill",6 Palmiston Cresent,"Melbourne, 3150, AU"
"Mcdade, Tywanna",87 Christofle Ln,"San Diego, CA, 92082, US"
"Mcelwee, Kuo-Chung",1538 Dacian Rd,"San Diego, CA, 92124, US"
"Mckee, Diosdado",81 Hanska Way,"San Diego, CA, 92014, US"
"Mckenzie, Eron",131 Gem Dr,"Philadelphia, PA, 19122, US"
"Mclamb, Yuh-Lang",9891 Glendower Rd,"Miami-Dade, FL, 33154, US"
"Mea, Azavi0us",649 Buckboard Ln,"Miami-Dade, FL, 33014, US"
"Mees, Azmi",824 Beaufort St,"Philadelphia, PA, 19128, US"
"Mesley, Teresa",967 Hearthside Ct,"Philadelphia, PA, 19148, US"
"Michonski, Eric",1921 Kingston Ridge Rd,"San Diego, CA, 92129, US"
"Miketa, Muthukumar",2185 Ileagnes Rd,"Miami-Dade, FL, 33176, US"
"Miller, Anthony",522 Buncombe St,"Miami-Dade, FL, 33031, US"
"Miller, Pamela",108 Elmview Dr,"San Diego, CA, 92111, US"
"Minas, Michael",95 Miller St,"Sydney, 2125, AU"
"Moffat, Trent",8 Learmonth Road,"Melbourne, 3101, au"
"Moody, Alena",248 Port Road,"Sydney, 2020, AU"
"Moore, Ari",241 Royal Perade,"Sydney, 1115, AU"
"Motashaw, Elisabeth",360 Bridgepath Dr,"Miami-Dade, FL, 33150, US"
"Mrvichin, Royall",31 Cantwell Ct,"Philadelphia, PA, 19141, US"
"Myers, Glorina",335 Fox Ct,"San Diego, CA, 92029, US"
"Nazar, Glacia",1250 Kingston Ridge Rd,"San Diego, CA, 92128, US"
"Neal, Angelia",6278 Aqua Marine Ln,"San Diego, CA, 92054, US"
"Newstead, Robert",683 Lake Hill Dr,"Miami-Dade, FL, 33176, US"
"Ngan, Christina",11 Prospect Hill Road,"Melbourne, 3001, AU"
"Nichollas, Anthony",66 Phillip Street,"Sydney, 2124, AU"
"Nichollas, Hugh",30 Hotham Parade,"Sydney, 2600, AU"
"Niemann, Kevin",651 Bluebird Ct,"San Diego, CA, 92027, US"
"Norman, Ceresh",251 Lake Tillery Dr,"Philadelphia, PA, 19148, US"
"North, Christer",2765 Eaglesham Way,"Philadelphia, PA, 19121, US"
"Nowd, Fadi",17 Elsie St,"Sydney, 2154, AU"
"Nuss, Grezegorz",1916 Hebron Church Rd,"Miami-Dade, FL, 33186, US"
"O'Carroll, Aquilla",5194 Calm Winds Ct,"San Diego, CA, 92071, US"
"O'Suilleabhain, Virtina",219 Ivydale Dr,"Miami-Dade, FL, 33178, US"
"O'Toole, Tara",461 Kimberly Dr,"Philadelphia, Pa, 19121, US"
"Obermeyer, Lutezenia",3246 Cartier Dr,"Philadelphia, PA, 19140, US"
"Octetree, Lucretta",433 Farmington Woods Dr,"San Diego, CA, 92054, US"
"Olsen, Deanna",218 Hillsford Ln,"Philadelphia, PA, 19146, US"
"Onuscheck, John",215 Alercia Ct,"San Diego, CA, 92029, US"
"Osborn, Hernani",8 Cannon Lane Whitby,"Melbourne, 3350, AU"
"Osuba, Salaheloin",2546 Belford Valley Ln,"San Diego, CA, 91932, US"
"Ould, Tulsidas",1025 Coronado Dr,"San Diego, Ca, 92028, US"
"Ousley, Lorna",881 Kettlebridge Dr,"Miami-Dade, FL, 33183, US"
"Overdorff, Erich",1407 Coorsdale Dr,"Miami-Dade, FL, 33161, US"
"Pa, Koavea",1 Endeavour Road,"Melbourne, 3225, AU"
"Pantages, William",198 Botany Bay Dr,"San Diego, CA, 92021, US"
"Parker, U'Vonda",11 Kinderston Dr,"Philadelphia, PA, 19104, US"
"Pascoe, Julia",973 Chris Dr,"Miami-Dade, FL, 33183, US"
"Peachey, Carl",175 Carteret Dr,"San Diego, CA, 92025, US"
"Peiris, Krishna",46 George Street,"Sydney, 2012, AU"
"Penhale, James",142 Bluffridge Dr,"Philadelphia, PA, 19141, US"
"Peppers, Gerlinde",1209 Fraternity Court Dr,"San Diego, CA, 92173, US"
"Pettolino, Peter",1 Endeavour Road,"Melbourne, 3225, AU"
"Phaiyakounh, Julianna",3 Evans St,"Sydney, 2011, AU"
"Phoumirath, Lynelle",166 Toorak Road,"Sydney, 2119, AU"
"Pilgrim, Daniel",8 Nicholson Street,"Sydney, 4720, AU"
"Pinol, Jennifer",9 Chastain Dr,"Philadelphia, PA, 19132, US"
"Platts, Alexei",39 Station Street,"Sydney, 2000, au"
"Plested, Billy",51 Martin Place,"Sydney, 1131, AU"
"Plybon, John-Michael",890 Dinwiddie Ct,"Miami-Dade, FL, 33174, US"
"Plybon, Nicholas",2975 Foxbury Dr,"Philadelphia, Pa, 19120, US"
"Polky, Asishana",41 Dubose St,"San Diego, CA, 92110, US"
"Pongor, Katherine",4750 Cottonwood Ln,"Philadelphia, PA, 19148, US"
"Post, Nahliah",52 Landor Rd,"Miami-Dade, FL, 33169, US"
"Povey, Liz",23 Garden Street,"Melbourne, 8004, AU"
"Pretorius, Tadashi",30 Hotham Parade,"Sydney, 2600, AU"
"Pringley, Peter",4002 Brassfield Rd,"Philadelphia, PA, 19134, US"
"Pritt, Gynell",8112 Kenna Ct,"San Diego, CA, 92116, US"
"Pulliam, Daniel",651 Bluebird Ct,"San Diego, CA, 92027, US"
"Quinby, Merryn",54 Dunning Street,"Sydney, 2120, AU"
"Racine, Cynthia",63 Cane Creek Dr,"San Diego, CA, 92131, US"
"Ralston, Austen",12 Hunua Road Papakura,"Sydney, 1004, AU"
"Rayburn, Roland",31 Castalia Dr,"Philadelphia, PA, 19140, US"
"Ridley, Cherda",30 Aiken Pkwy,"Philadelphia, PA, 19142, US"
"Ridley, Roya",6121 Birklands Dr,"San Diego, CA, 92025, US"
"Rink, Belanda",43 Grist Mill Rd,"San Diego, CA, 92122, US"
"Robbin-Coker, Joseph",2645 Berkshire Downs Dr,"San Diego, CA, 92008, US"
"Roebuck, Alvin",6 Palmiston Cresent,"Melbourne, 3150, AU"
"Rudder, Allan",941 Dixon Dr,"San Diego, CA, 91911, US"
"Rusli, Skev",26 St Kilda Road,"Sydney, 2022, AU"
"Ruta, Tammy",89 Ashley Brook Ct,"Philadelphia, PA, 19131, US"
"Sacher, Kary",2547 Allenby Dr,"San Diego, CA, 91913, US"
"Sadig, Shane",5857 Academy St,"Miami-Dade, FL, 33133, US"
"Sangiorgio, Julieanne",6042 Farmstone Dr,"Philadelphia, PA, 19125, US"
"Santomaggio, Pearl",2 Stephen Road,"Melbourne, 3181, AU"
"Sauder, Gregory",974 Joel Ct,"Miami-Dade, FL, 33030, US"
"Savacool, Jessica",618 Darlington Pl,"Miami-Dade, FL, 33143, US"
"Saylor, Svein",3707 Hillside Dr,"Philadelphia, PA, 19144, US"
"Scarbrough, Stancey",701 Glenridge Dr,"Miami-Dade, FL, 33177, US"
"Scordia, Randal",45 Talavera Road,"Melbourne, 3146, AU"
"Scroggin, Victor",1058 Atchison St,"San Diego, CA, 92120, US"
"Segrave, Chuck",1 Sleigh Street,"Sydney, 1164, AU"
"Senchak, Brock",1779 Greymist Ln,"Philadelphia, PA, 19142, US"
"Sergeant, Danelle",734 Ladys Slipper Ct,"San Diego, CA, 92105, us"
"Sergi, Teresa",3 Altair Cir,"Philadelphia, PA, 19131, US"
"Shannan, Sian",5 Rosebery Ave,"Sydney, 2010, AU"
"Sheedy, Sherie",12 Sir William Pickering Drive,"Melbourne, 3175, AU"
"Sheffield, Ishmar",939 Hilltop Needmore Rd,"Miami-Dade, FL, 33157, US"
"Shewitz, Ronald",507 Carriage Pine Dr,"Philadelphia, PA, 19125, US"
"Shirts, Wesley",710 Crawford Rd,"Miami-Dade, FL, 33015, US"
"Silverthorne, Ratna",284 Forest Dr,"Miami-Dade, FL, 33142, US"
"Simms, Doungkamol",30 Goodall Ave,"Melbourne, 3053, AU"
"Sines, Rilma",142 Bluffridge Dr,"Philadelphia, PA, 19141, US"
"Sitnik, Sarah",6846 Glastonbury Rd,"San Diego, CA, 91941, US"
"Sleva, Jon",472 Big Bend Ct,"Miami-Dade, FL, 33155, US"
"Sloey, Phu",1 Pacific Rise Mount Wellington,"Sydney, 20000, AU"
"Smades, William",6 Gamelyn Walk,"Miami-Dade, FL, 33183, US"
"Smith, Kellen",1466 Horne St,"San Diego, CA, 92117, US"
"Smith, Nasim",340 Bellevue Rd,"San Diego, CA, 92027, US"
"Smith, Robert",4156 Hwy 42,"Miami-Dade, FL, 33180, US"
"Smotherly, Bryce",4396 Burntwood Cir,"Miami-Dade, FL, 33193, US"
"Sneed, Christine",151 Gail Ridge Ln,"Miami-Dade, FL, 33182, US"
"Snellings, Gerry",26 St Kilda Road,"Sydney, 2022, AU"
"Snitzer, Kristie",2157 Denberg Ln,"Philadelphia, PA, 19140, US"
"Sochacki, Suad",3519 Amersham Ln,"Miami-Dade, FL, 33160, US"
"Soltau, Petrea",105 East St,"Melbourne, 8060, AU"
"Spillane, Ubaldo",325 Sherwood Road,"Sydney, 1100, AU"
"Spingola, John",1219 Hawkshead Rd,"Philadelphia, PA, 19139, US"
"Spofford, Elizabeth",4368 Farrington Dr,"Miami-Dade, FL, 33165, US"
"Stamalis, Ranj",435 Sherwood Rd,"Melbourne, 8003, AU"
"Stefandonovan, Jeffery",47 Dixie Trl,"Philadelphia, PA, 19136, US"
"Steiber, Reginald",15 Kilmorack Dr,"Philadelphia, PA, 19136, US"
"Stevens, Robert",224 Horsham Way,"San Diego, CA, 91950, US"
"Stouchko, Lee",101 Avent Ferry Rd,"Miami-Dade, FL, 33178, US"
"Streit, Russell",176 Exhibition Street,"Melbourne, 3170, AU"
"Sugg, Kasha",4137 Deer Haven Dr,"San Diego, CA, 92101, US"
"Sullivan, Lutezenia",4758 Barbara Dr,"Miami-Dade, FL, 33180, US"
"Supple, Herman",4 Kimbrook Dr,"Miami-Dade, Fl, 33187, US"
"Surawski, Marinus",163 Nebo Road,"Sydney, 1117, AU"
"Sutton, Tingmei",6940 Hunt Farms Ln,"Miami-Dade, FL, 33147, US"
"Swaiti, Huilun",211 Hamstead Crossing Dr,"Philadelphia, PA, 19124, US"
"Tacosa, Paul",2733 Balfour Downs Cir,"San Diego, CA, 92109, US"
"Tannous, Cos",13 Symonds Street,"Melbourne, 3005, AU"
"Tate, Larry",2704 Lake Wheeler Rd,"San Diego, CA, 92082, US"
"Tellam, Diaz",8 Aboukis Street,"Sydney, 1223, AU"
"Terricciano, Legette",6348 Draper Rd,"Philadelphia, PA, 19131, US"
"Thoits, Elizabeth",5 Green Lantern St,"San Diego, CA, 92128, US"
"Thompson, Tanya",509 Green Level To Durham Rd,"Miami-Dade, FL, 33142, US"
"Tilley, Kimiko",153 High St,"Sydney, 2006, AU"
"Tolbet, Elery",63 Bishops Park Dr,"Miami-Dade, FL, 33016, US"
"Tolley, Hershell",3 Altair Cir,"Philadelphia, PA, 19131, US"
"Toner, Brenner",36 Enka Dr,"San Diego, CA, 92037, US"
"Tregonning, Rit",26 Brisbane Avenue,"Sydney, 2064, AU"
"Tucker, Berether",1999 Avery St,"San Diego, CA, 91941, US"
"Uenking, Kent",2853 Birchford Ct,"Miami-Dade, FL, 33142, US"
"Van Damme, Jean-Claude",973 Chris Dr,"Miami-Dade, FL, 33183, US"
"Vasconcellos, Carl",5194 Calm Winds Ct,"San Diego, CA, 92071, US"
"Villeneuve, Jacques",11 Kinderston Dr,"Philadelphia, PA, 19104, US"
"Voltz, Sal",34 Flicker Ct,"Miami-Dade, FL, 33168, US"
"Voron, Tachaun",990 Center Pointe Dr,"Philadelphia, PA, 19143, US"
"Waal, Samantha",121 Blackburn Road,"Sydney, 2580, AU"
"Wade, Johannes",139 Deer Hunter Ct,"San Diego, CA, 91950, US"
"Walcott, Kimberly",967 Hearthside Ct,"Philadelphia, PA, 19148, US"
"Walker, Robert",153 Dawson Mill Run,"Philadelphia, PA, 19143, US"
"Washington, Donald",1668 Bladen St,"Miami-Dade, FL, 33055, US"
"Weisbarth, Theresa",1571 Edenton St,"San Diego, CA, 92114, US"
"Wende, Lionel",52 Landor Rd,"Miami-Dade, FL, 33169, US"
"Westlund, Michael",198 Botany Bay Dr,"San Diego, CA, 92021, US"
"Wetherington, Jaime",1428 Brandywine Dr,"San Diego, CA, 92071, US"
"Whipkey, Okema",7834 Briar Oaks Ln,"San Diego, CA, 92104, US"
"Whitlock, Robert",456 Avent Hill,"San Diego, CA, 92117, US"
"Wills, Matsuoka",5059 Great Eastern Highway,"Melbourne, 8010, AU"
"Wilson, Fang",354 St Kilda Rd,"Sydney, 2145, AU"
"Winge, Kenisha",94 Irelan Dr,"Miami-Dade, FL, 33144, US"
"Woods, Connie",4407 Fountain Dr,"Miami-Dade, FL, 33178, US"
"Worton, Steven",3100 Erinsbrook Dr,"San Diego, CA, 92026, US"
"Woyach, Suzon",1107 Caswell Ct,"Miami-Dade, FL, 33141, US"
"Xing Moore, Wei",84 Holt Dr,"Miami-Dade, FL, 33183, US"
"Zhou, Tom",1 Adelaide Street MIC Court,"Melbourne, 3125, AU"
"Zied, Ahmed",101 Avent Ferry Rd,"Miami-Dade, FL, 33178, US"
"Zisek, Odudu",114 Lakerun Ct,"Philadelphia, PA, 19146, US"
"Zubak, Michael",51 Court Crescent Panmure,"Sydney, 2041, AU"
;;;;
run;

data ORION.MONTHLY_DONATIONS;
   attrib Employee_ID length=8 label='Employee_ID';
   attrib Qtr length=8 label='Qtr';
   attrib Amount length=8 label='Amount';
   attrib Acct_Code length=$5 label='Acct_Code' format=$5. informat=$5.;

   infile datalines dsd;
   input
      Employee_ID
      Qtr
      Amount
      Acct_Code:$5.
   ;
datalines4;
11036,2,20,AQI2
11036,3,25,CCI2
11057,1,10,CS2
11057,2,10,CS2
11057,3,10,CS2
11608,1,50,ES2
11608,3,50,AQ12
11945,1,15,MI2
11945,2,20,YYCR2
11945,3,20,YYCR2
12321,1,100,V22
12325,4,125,V22
12447,1,35,ES2
12447,2,35,ES2
12447,3,35,ES2
12447,4,35,ES2
;;;;
run;

data ORION.NEWCODES;
   attrib fmtname length=$8;
   attrib start length=$2;
   attrib end length=$2;
   attrib label length=$11;

   infile datalines dsd;
   input
      fmtname
      start
      end
      label
   ;
datalines4;
$country,CH,CH,Switzerland
$country,BR,BR,Brazil
$country,MX,MX,Mexico
;;;;
run;

data ORION.NEWCOMPETITORS;
   attrib ID length=$8;
   attrib City length=$9;
   attrib Postal_Code length=$7;

   infile datalines dsd;
   input
      ID
      City
      Postal_Code
   ;
datalines4;
AU15301W,PERTH,6002
AU12217E,SYDNEY,2000
CA   150,Toronto,M5V 3C6
CA   238,Edmonton,T5T 2B2
US 356NC,charlotte,28203
US1013CO,denver,80201
US  12CA,San diego,92139
;;;;
run;

data ORION.NEWCONTINENT;
   attrib fmtname length=$9;
   attrib start length=$2;
   attrib end length=$2;
   attrib label length=$30;

   infile datalines dsd;
   input
      fmtname
      start
      end
      label
   ;
datalines4;
continent,90,90,Antarctica
continent,92,92,South America
;;;;
run;

data ORION.ORDERS;
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
1230058123,1,121039,63,17177,17177
1230080101,2,99999999,5,17181,17185
1230106883,2,99999999,45,17186,17188
1230147441,1,120174,41,17194,17194
1230315085,1,120134,183,17224,17224
1230333319,2,99999999,79,17227,17228
1230338566,2,99999999,23,17228,17233
1230371142,2,99999999,45,17234,17236
1230404278,1,121059,56,17240,17240
1230440481,1,120149,183,17247,17247
1230450371,2,99999999,16,17249,17251
1230453723,2,99999999,79,17249,17250
1230455630,1,120134,183,17250,17250
1230478006,2,99999999,2788,17253,17255
1230498538,1,121066,20,17257,17257
1230500669,3,99999999,70046,17258,17259
1230503155,2,99999999,12386,17258,17259
1230591673,2,99999999,23,17274,17279
1230591675,3,99999999,36,17274,17276
1230591684,1,121045,79,17274,17274
1230619748,2,99999999,61,17280,17285
1230642273,2,99999999,13,17284,17289
1230657844,3,99999999,171,17287,17290
1230690733,3,99999999,11171,17293,17295
1230699509,2,99999999,14703,17294,17297
1230700421,2,99999999,79,17294,17295
1230738723,2,99999999,928,17301,17305
1230744524,2,99999999,19444,17302,17307
1230745294,1,121060,71,17302,17302
1230754828,1,121039,12,17304,17304
1230771337,2,99999999,544,17307,17308
1230778996,1,120148,111,17309,17309
1230793366,2,99999999,88,17311,17314
1230804171,2,99999999,23,17313,17318
1230825762,1,121064,71,17317,17317
1230841456,2,99999999,23,17320,17325
1230841466,1,121094,75,17320,17320
1230885738,1,121043,56,17328,17328
1230912536,1,121086,18,17333,17333
1230931366,3,99999999,17023,17337,17342
1231002241,3,99999999,171,17350,17353
1231008713,2,99999999,70108,17351,17352
1231014780,2,99999999,2806,17351,17355
1231023774,1,120145,215,17354,17354
1231035308,2,99999999,13,17356,17361
1231071449,3,99999999,36,17362,17364
1231077006,1,121064,12,17363,17363
1231094514,2,99999999,61,17367,17372
1231135703,1,121027,79,17374,17374
1231169108,1,121059,31,17380,17380
1231176288,1,120164,215,17382,17382
1231188317,2,99999999,111,17384,17386
1231194004,3,99999999,3959,17384,17385
1231204878,1,120732,71,17386,17386
1231206746,1,120134,215,17387,17387
1231227910,2,99999999,70187,17391,17396
1231231220,1,121040,20,17391,17391
1231259703,1,121045,45,17396,17396
1231270767,3,99999999,52,17398,17404
1231292064,1,121037,12,17402,17402
1231305521,2,99999999,16,17405,17413
1231305531,2,99999999,16,17405,17407
1231314893,1,121109,20,17406,17406
1231316727,2,99999999,2806,17406,17410
1231317443,2,99999999,61,17407,17412
1231341359,1,121057,71,17411,17411
1231392762,3,99999999,36,17420,17422
1231414059,3,99999999,36,17424,17426
1231453831,3,99999999,70046,17432,17433
1231468750,1,121044,52,17434,17439
1231500373,2,99999999,19444,17440,17445
1231501254,1,121043,88,17440,17440
1231522431,3,99999999,52,17444,17450
1231544990,2,99999999,14703,17448,17451
1231614059,2,99999999,70108,17461,17462
1231619928,2,99999999,61,17462,17467
1231653765,3,99999999,11,17468,17473
1231657078,1,121061,63,17468,17472
1231663230,1,121025,5,17469,17469
1231734609,2,99999999,544,17482,17483
1231734615,3,99999999,1033,17482,17486
1231757107,1,121037,17,17486,17486
1231773634,2,99999999,14703,17489,17492
1231780610,1,121025,71,17490,17490
1231842118,2,99999999,5,17501,17503
1231858937,1,121060,45,17504,17504
1231861295,2,99999999,70187,17505,17510
1231891098,1,121043,71,17510,17510
1231896710,1,120733,88,17511,17511
1231898348,1,120127,183,17512,17512
1231908237,1,120132,215,17514,17514
1231928627,1,121020,17,17517,17517
1231930216,1,120127,111,17518,17518
1231936241,1,120127,111,17519,17519
1231950921,2,99999999,5,17521,17523
1231952752,2,99999999,111,17522,17524
1231953192,3,99999999,70210,17522,17523
1231956902,1,121037,5,17522,17522
1231976710,3,99999999,19,17526,17530
1231982684,1,120158,183,17527,17527
1231986335,1,120148,195,17528,17528
1232003930,3,99999999,70046,17531,17532
1232007693,2,99999999,5,17531,17535
1232007700,1,121066,45,17531,17531
1232087464,1,120143,53,17544,17544
1232092527,1,121039,49,17544,17544
1232161564,1,121040,34,17554,17554
1232173841,3,99999999,2618,17556,17561
1232217725,2,99999999,89,17563,17566
1232240447,1,120150,195,17567,17567
1232241009,3,99999999,70046,17567,17568
1232307056,1,120148,171,17577,17577
1232311932,1,121039,20,17577,17577
1232331499,2,99999999,23,17580,17584
1232373481,2,99999999,13,17587,17590
1232410925,3,99999999,4,17593,17594
1232455720,1,121100,4,17600,17600
1232517885,3,99999999,70201,17610,17615
1232530384,3,99999999,4,17611,17612
1232530393,1,121037,49,17611,17611
1232554759,1,121068,92,17615,17615
1232590052,1,120160,195,17621,17621
1232601472,2,99999999,89,17622,17625
1232618023,2,99999999,54655,17625,17628
1232648239,1,121031,49,17629,17637
1232654929,3,99999999,4,17630,17631
1232672914,3,99999999,11171,17633,17635
1232698281,3,99999999,9,17637,17642
1232709099,1,121041,4,17638,17638
1232709115,1,121105,34,17638,17638
1232723799,3,99999999,41,17641,17645
1232728634,2,99999999,5,17641,17645
1232777080,1,120151,215,17649,17649
1232790793,1,120143,195,17651,17651
1232857157,2,99999999,45,17660,17664
1232889267,2,99999999,908,17665,17669
1232897220,1,121021,34,17666,17666
1232936635,2,99999999,544,17672,17673
1232946301,2,99999999,111,17674,17676
1232956741,3,99999999,52,17675,17676
1232972274,1,120145,171,17678,17678
1232985693,1,120122,183,17680,17680
1232998740,1,121109,4,17681,17681
1233003688,1,121025,34,17682,17682
1233049735,3,99999999,14104,17689,17692
1233066745,1,120148,215,17692,17692
1233078086,1,121060,49,17693,17693
1233092596,1,121054,12,17695,17695
1233131266,1,121084,45,17701,17701
1233166411,1,120121,171,17707,17707
1233167161,2,99999999,70187,17707,17712
1233243603,1,121109,49,17718,17718
1233248920,2,99999999,19444,17719,17724
1233270605,1,121029,75,17722,17722
1233280857,3,99999999,70059,17724,17728
1233315988,1,121053,5,17729,17729
1233378724,2,99999999,13,17739,17742
1233482761,1,121105,34,17754,17754
1233484749,3,99999999,2550,17754,17759
1233514453,3,99999999,70201,17759,17764
1233531965,1,120123,215,17762,17762
1233543560,3,99999999,4,17763,17764
1233545775,1,120134,41,17764,17764
1233545781,1,120150,215,17764,17764
1233597637,2,99999999,89,17771,17774
1233618453,1,120177,215,17775,17775
1233682051,2,99999999,5,17784,17788
1233689304,1,121053,49,17785,17785
1233837302,1,120148,195,17808,17808
1233895201,2,99999999,111,17817,17819
1233913196,2,99999999,544,17819,17820
1233920786,1,121030,34,17820,17820
1233920795,1,121135,52,17820,17820
1233920805,1,121064,52,17820,17820
1233998114,2,99999999,19873,17832,17839
1234033037,1,121039,92,17837,17837
1234092222,1,121069,75,17846,17846
1234133789,1,120123,195,17853,17853
1234186330,1,120121,53,17861,17861
1234198497,1,121035,49,17862,17862
1234235150,2,99999999,54655,17868,17871
1234247283,1,121042,49,17869,17869
1234255111,1,121135,17,17870,17870
1234279341,2,99999999,23,17874,17878
1234301319,1,121109,92,17877,17877
1234323012,3,99999999,70210,17881,17882
1234348668,1,121069,4,17884,17884
1234360543,1,121071,17,17886,17886
1234373539,1,121069,12,17888,17888
1234414529,1,120123,111,17895,17895
1234419240,1,121109,17,17895,17895
1234437760,1,120150,195,17899,17899
1234534069,3,99999999,36,17908,17911
1234537441,1,120121,183,17909,17909
1234538390,2,99999999,16,17909,17911
1234588648,2,99999999,16,17914,17916
1234659163,2,99999999,16,17921,17923
1234665265,2,99999999,63,17921,17922
1234709803,3,99999999,171,17926,17930
1234727966,1,120179,183,17928,17928
1234891576,3,99999999,70221,17944,17946
1234897732,1,121021,18,17944,17944
1234958242,2,99999999,24,17950,17955
1234972570,2,99999999,16,17952,17954
1235176942,3,99999999,11171,17971,17973
1235236723,1,120160,215,17977,17977
1235275513,1,121043,89,17980,17980
1235306679,1,120122,111,17984,17984
1235384426,1,121109,63,17991,17991
1235591214,2,99999999,16,18012,18014
1235611754,2,99999999,16,18014,18016
1235744141,2,99999999,16,18027,18029
1235830338,2,99999999,24,18035,18041
1235856852,1,120127,171,18038,18038
1235881915,3,99999999,36,18040,18043
1235913793,1,121040,49,18043,18043
1235926178,3,99999999,79,18044,18051
1235963427,2,99999999,12386,18048,18049
1236017640,1,120127,183,18054,18054
1236028541,3,99999999,9,18055,18060
1236055696,1,121136,10,18057,18057
1236066649,2,99999999,908,18058,18062
1236113431,3,99999999,36,18063,18066
1236128445,2,99999999,26148,18065,18067
1236128456,2,99999999,16,18065,18067
1236183578,2,99999999,23,18070,18075
1236216065,1,120131,41,18074,18074
1236349115,1,121051,92,18086,18086
1236369939,1,120123,111,18089,18089
1236483576,2,99999999,70108,18100,18111
1236673732,3,99999999,9,18119,18124
1236694462,3,99999999,70221,18121,18123
1236701935,1,121027,34,18121,18121
1236783056,1,120136,183,18130,18130
1236852196,1,120170,215,18137,18137
1236923123,3,99999999,3959,18143,18144
1236965430,3,99999999,70165,18148,18158
1237165927,3,99999999,79,18167,18178
1237218771,1,120143,111,18173,18173
1237272696,1,120124,195,18178,18178
1237327705,1,121043,10,18183,18183
1237331045,3,99999999,2618,18183,18188
1237370327,1,120145,41,18188,18188
1237450174,3,99999999,171,18196,18200
1237478988,2,99999999,908,18198,18202
1237507462,2,99999999,1100,18201,18203
1237517484,1,121081,79,18202,18202
1237664026,3,99999999,65,18217,18223
1237670443,2,99999999,10,18217,18222
1237695520,1,120190,53,18220,18220
1237751376,2,99999999,10,18225,18230
1237789102,1,121027,56,18229,18229
1237825036,3,99999999,9,18233,18238
1237890730,1,121041,5,18239,18239
1237894107,2,99999999,29,18240,18245
1237894966,2,99999999,70187,18240,18245
1237928021,2,99999999,23,18243,18248
1237974997,1,120158,41,18248,18248
1237989406,3,99999999,36,18249,18252
1238013821,3,99999999,46966,18252,18253
1238053337,3,99999999,9,18256,18261
1238161695,2,99999999,41,18268,18272
1238168538,1,121064,63,18268,18268
1238231237,1,121106,10,18276,18276
1238255107,1,121039,88,18279,18279
1238273927,1,120127,215,18282,18282
1238305578,3,99999999,70210,18286,18287
1238319276,1,121025,52,18287,18287
1238319281,1,121106,89,18287,18287
1238353296,1,120127,111,18292,18292
1238367238,1,121044,31,18293,18293
1238370259,3,99999999,19,18294,18299
1238377562,1,120151,41,18295,18295
1238393448,1,121073,10,18296,18296
1238426415,3,99999999,19,18301,18306
1238440880,1,121042,52,18302,18302
1238474357,2,99999999,50,18307,18308
1238510159,1,121054,71,18311,18311
1238553101,3,99999999,19,18317,18322
1238605995,1,121033,88,18323,18323
1238637449,1,121023,88,18327,18327
1238646479,1,121069,12,18328,18328
1238646484,1,121072,90,18328,18328
1238674844,1,120121,53,18332,18332
1238678581,1,121051,12,18332,18332
1238686430,1,121044,10,18333,18333
1238696385,2,99999999,2806,18334,18338
1238712056,1,120127,53,18337,18337
1238735750,1,120177,195,18340,18340
1238797437,2,99999999,928,18347,18351
1238805678,1,121024,52,18348,18348
1238805703,1,121039,89,18348,18348
1238812262,2,99999999,14703,18349,18352
1238846184,1,121056,88,18353,18353
1238856867,2,99999999,70187,18355,18360
1238870441,1,121105,39,18356,18356
1238872273,3,99999999,3959,18356,18358
1238910092,1,121042,89,18361,18361
1238928257,1,120172,215,18364,18364
1238968334,2,99999999,29,18369,18373
1238985782,2,99999999,29,18371,18375
1239003827,3,99999999,19,18373,18378
1239018454,3,99999999,70221,18375,18377
1239057268,1,121030,12,18379,18379
1239172417,2,99999999,29,18394,18398
1239179935,2,99999999,39,18394,18399
1239194032,1,121040,52,18396,18396
1239201604,1,121020,90,18397,18397
1239220388,2,99999999,29,18400,18404
1239226632,3,99999999,20,18400,18406
1239248786,1,121087,63,18403,18403
1239258470,1,120152,41,18405,18405
1239266107,1,120143,53,18406,18406
1239312711,1,121075,45,18411,18411
1239320891,2,99999999,1100,18412,18414
1239346133,1,121037,52,18415,18415
1239353855,1,120143,183,18417,18417
1239368476,1,121105,89,18418,18418
1239408849,1,121105,52,18423,18423
1239410348,2,99999999,29,18424,18428
1239416627,1,121036,88,18424,18424
1239418524,1,120127,195,18425,18425
1239442095,2,99999999,41,18428,18432
1239498112,3,99999999,17023,18435,18440
1239543223,1,121040,90,18440,18440
1239615368,1,121127,45,18449,18449
1239693951,1,121040,88,18459,18459
1239713046,2,99999999,16,18462,18463
1239735632,1,121073,71,18464,18464
1239744161,2,99999999,13,18466,18471
1239765451,1,121036,60,18468,18468
1239785436,3,99999999,65,18471,18477
1239821232,2,99999999,1684,18475,18478
1239823829,2,99999999,54655,18476,18479
1239836937,1,121090,12,18477,18477
1239874523,1,121042,12,18482,18482
1239932984,2,99999999,16,18490,18491
1239962634,1,120732,52,18493,18493
1239972644,2,99999999,53,18495,18497
1239994933,1,121060,90,18497,18497
1240051245,3,99999999,71,18504,18510
1240060066,1,121066,60,18505,18505
1240137702,2,99999999,544,18515,18516
1240173354,3,99999999,70165,18520,18521
1240187143,2,99999999,29,18522,18526
1240201886,1,121039,10,18523,18523
1240283215,1,121051,52,18533,18533
1240306942,1,121071,90,18536,18536
1240314947,2,99999999,908,18537,18541
1240314956,1,121074,17,18537,18537
1240355393,1,121063,10,18542,18542
1240379679,1,120733,63,18545,18545
1240387741,1,121140,89,18546,18546
1240430921,1,120153,183,18552,18552
1240446608,2,99999999,29,18554,18558
1240447572,2,99999999,50,18554,18555
1240461993,1,121036,10,18555,18555
1240485814,2,99999999,29,18559,18563
1240509842,1,121033,63,18561,18561
1240512744,2,99999999,50,18562,18563
1240549230,1,121061,89,18566,18566
1240568966,3,99999999,19,18569,18574
1240581932,1,120192,215,18571,18571
1240588370,2,99999999,2788,18571,18573
1240599396,2,99999999,16,18573,18574
1240604971,1,121071,63,18573,18573
1240613362,1,121069,20,18574,18574
1240692950,1,121086,88,18584,18584
1240782710,2,99999999,544,18595,18596
1240856801,2,99999999,544,18604,18605
1240870047,2,99999999,1100,18606,18608
1240886449,1,121030,52,18608,18608
1240903120,1,121044,52,18610,18610
1240961599,2,99999999,16,18618,18619
1241054779,3,99999999,24,18629,18632
1241063739,1,121135,89,18630,18631
1241066216,1,120134,171,18631,18631
1241086052,3,99999999,53,18633,18636
1241147641,1,120131,53,18640,18640
1241235281,1,120136,171,18650,18657
1241244297,1,120164,111,18651,18651
1241263172,3,99999999,3959,18652,18653
1241286432,3,99999999,27,18655,18660
1241298131,2,99999999,2806,18656,18666
1241359997,1,121043,12,18663,18663
1241371145,1,120124,171,18665,18665
1241390440,1,120131,41,18667,18667
1241461856,1,121042,18,18674,18675
1241561055,1,120127,171,18686,18686
1241623505,3,99999999,24,18692,18695
1241645664,2,99999999,70100,18695,18699
1241652707,3,99999999,27,18695,18700
1241686210,1,121040,10,18699,18705
1241715610,1,121106,92,18702,18702
1241731828,1,121025,31,18704,18704
1241789227,3,99999999,17023,18711,18716
1241895594,1,121051,56,18722,18726
1241909303,3,99999999,46966,18724,18725
1241930625,3,99999999,27,18726,18731
1241977403,1,120152,171,18732,18732
1242012259,1,121040,10,18735,18735
1242012269,1,121040,45,18735,18735
1242035131,1,120132,183,18738,18738
1242076538,3,99999999,31,18742,18746
1242130888,1,121086,92,18748,18748
1242140006,3,99999999,5,18749,18754
1242140009,2,99999999,90,18749,18751
1242149082,1,121032,90,18750,18750
1242159212,3,99999999,5,18751,18756
1242161468,3,99999999,2550,18751,18756
1242162201,3,99999999,46966,18752,18753
1242173926,3,99999999,1033,18753,18757
1242185055,1,120136,41,18755,18755
1242214574,3,99999999,70079,18758,18761
1242229985,1,120127,171,18760,18760
1242259863,2,99999999,70187,18763,18768
1242265757,1,121105,10,18763,18763
1242449327,3,99999999,27,18783,18788
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
1242691897,2,99999999,90,18810,18812
1242736731,1,121107,10,18815,18815
1242773202,3,99999999,24,18819,18822
1242782701,3,99999999,27,18820,18825
1242827683,1,121105,10,18825,18825
1242836878,1,121027,10,18826,18826
1242838815,1,120195,41,18827,18827
1242848557,2,99999999,2806,18827,18831
1242923327,3,99999999,70165,18836,18837
1242938120,1,120124,171,18838,18838
1242977743,2,99999999,65,18842,18846
1243012144,2,99999999,2806,18845,18849
1243026971,1,120733,10,18847,18847
1243039354,1,120143,41,18849,18849
1243049938,3,99999999,53,18850,18853
1243110343,1,121032,10,18856,18856
1243127549,1,120159,171,18859,18859
1243152030,1,120734,45,18861,18862
1243152039,1,121089,90,18861,18861
1243165497,3,99999999,70201,18863,18868
1243198099,1,121061,10,18866,18866
1243227745,1,120141,171,18870,18880
1243269405,2,99999999,928,18874,18878
1243279343,3,99999999,27,18875,18880
1243290080,1,121057,31,18876,18876
1243290089,1,121065,45,18876,18876
1243315613,1,121026,5,18879,18879
1243398628,1,121051,12,18888,18888
1243417726,1,121029,69,18890,18890
1243462945,3,99999999,24,18895,18898
1243465031,1,120195,41,18896,18896
1243485097,3,99999999,11,18898,18902
1243515588,1,121024,89,18901,18901
1243568955,1,121060,31,18907,18907
1243643970,1,120138,171,18916,18916
1243644877,3,99999999,70079,18916,18919
1243661763,1,120124,41,18918,18918
1243670182,1,121065,69,18918,18918
1243680376,1,121061,31,18919,18919
1243797399,1,121053,10,18932,18932
1243799681,1,120128,41,18933,18933
1243815198,1,120732,10,18934,18934
1243817278,1,120127,171,18935,18935
1243887390,2,99999999,908,18942,18946
1243951648,1,121068,34,18949,18949
1243960910,1,121028,90,18950,18950
1243963366,1,120175,215,18951,18951
1243991721,1,120124,171,18954,18954
1243992813,2,99999999,70187,18954,18959
1244066194,2,99999999,2806,18961,18965
1244086685,3,99999999,14104,18964,18967
1244107612,1,121107,45,18966,18966
1244117101,1,121109,45,18967,18967
1244117109,1,121117,49,18967,18967
1244171290,1,121121,31,18973,18973
1244181114,1,121092,10,18974,18974
1244197366,1,121118,89,18976,18976
1244296274,1,121040,5,18987,18987
;;;;
run;

data ORION.ORDERS_MIDYEAR;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Month1 length=8;
   attrib Month2 length=8;
   attrib Month3 length=8;
   attrib Month4 length=8;
   attrib Month5 length=8;
   attrib Month6 length=8;

   infile datalines dsd;
   input
      Customer_ID
      Month1
      Month2
      Month3
      Month4
      Month5
      Month6
   ;
datalines4;
5,213.1,,478,525.8,394.35,191.79
10,188.099999999999,414.09,2876.9,3164.59,2373.4425,169.289999999999
11,78.2,,,,,70.38
12,135.6,,117.6,129.36,97.02,122.04
18,,,29.4,32.34,24.255,
24,93,265.8,,,,83.7
27,310.7,782.9,,,,279.63
31,1484.3,293.3,,,,1335.87
34,642.5,,86.3,94.93,71.1975,578.25
41,134,119.2,313,344.3,258.225,120.6
45,443.88,216.2,40.2,44.22,33.165,399.492
49,24.8,,,,,22.32
53,,400.4,180.4,198.44,148.83,
56,,37.9,,,,
65,,,351.4,386.54,289.905,
69,23.5,3.2,,,,21.15
89,209.8,526.8,,,,188.82
90,33.6,110.2,396.9,436.59,327.4425,30.24
92,16.9,,160.5,176.55,132.4125,15.21
111,,697.6,,,,
171,73.99,534.6,1241.4,1365.54,1024.155,66.591
183,,147.1,,,,
215,,,60.8,66.88,50.16,
908,,,519.3,571.23,428.4225,
;;;;
run;

data ORION.ORDERS_QTR1;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib month1 length=8;
   attrib month2 length=8;
   attrib month3 length=8;

   infile datalines dsd;
   input
      Customer_ID
      month1
      month2
      month3
   ;
datalines4;
5,213.1,,478
10,188.099999999999,414.09,2876.9
11,78.2,,
12,135.6,,117.6
18,,,29.4
24,93,265.8,
27,310.7,782.9,
31,1484.3,293.3,
34,642.5,,86.3
41,134,119.2,313
45,443.88,216.2,40.2
49,24.8,,
53,,400.4,180.4
56,,37.9,
65,,,351.4
69,23.5,3.2,
89,209.8,526.8,
90,33.6,110.2,396.9
92,16.9,,160.5
111,,697.6,
171,73.99,534.6,1241.4
183,,147.1,
215,,,60.8
908,,,519.3
928,86.3,,
1033,,,355.8
2550,,,231.6
2806,994.4,91.7,420.8
3959,,215.6,
14104,194.6,,
17023,289,,
46966,,107.3,174.4
70079,,14.6,29.4
70100,2087.3,,
70165,702,16.6,
70187,,,714.4
70201,,,1075.5
;;;;
run;

data ORION.ORDERS_TWO_MONTHS;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib month1 length=8;
   attrib month2 length=8;

   infile datalines dsd;
   input
      Customer_ID
      month1
      month2
   ;
datalines4;
5,213.1,
10,188.099999999999,414.09
11,78.2,
12,135.6,
18,,
24,93,265.8
27,310.7,782.9
31,1484.3,293.3
34,642.5,
41,134,119.2
45,443.88,216.2
49,24.8,
53,,400.4
56,,37.9
65,,
69,23.5,3.2
89,209.8,526.8
90,33.6,110.2
92,16.9,
111,,697.6
171,73.99,534.6
183,,147.1
215,,
908,,
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
   attrib Discount length=8 label='Discount in percent of Normal Total Retail Price' format=PERCENT.;

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

data ORION.ORDER_QTRSUM;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Qtr length=8;
   attrib Order_Month length=8;
   attrib Sale_Amt length=8;

   infile datalines dsd;
   input
      Customer_ID
      Order_Qtr
      Order_Month
      Sale_Amt
   ;
datalines4;
69,4,10,3.2
70187,4,11,8.2
10,2,6,12.2
70079,4,10,14.6
70165,3,7,16.6
92,1,3,16.9
41,3,8,17.6
171,2,4,19.1
41,2,5,19.9
69,3,9,23.5
49,4,12,24.8
171,3,8,25.5
18,1,2,29.4
70079,2,5,29.4
41,4,10,29.4
10,1,3,32.6
90,2,6,33.6
5,4,12,33.8
171,3,7,35.2
41,1,2,36.2
2806,1,1,37.4
56,2,4,37.9
45,3,8,40.2
24,3,9,46.1
24,1,3,46.9
90,3,8,47.6
12,2,6,48.4
171,4,11,48.9
31,3,9,50.3
5,3,9,52.5
2806,3,7,54.3
45,2,6,56
31,2,4,57.3
215,4,11,60.8
31,1,3,64.2
90,4,11,69.4
24,3,7,70.2
171,2,6,73.99
89,4,12,75.2
11,3,9,78.2
45,3,9,78.2
27,3,9,78.4
10,2,5,79.8
928,3,9,86.3
34,4,11,86.3
12,3,9,87.2
41,3,7,89.8
27,2,6,91.6
171,4,10,101.5
46966,2,4,107.3
90,3,7,110.2
12,1,2,117.6
17023,1,3,121
5,2,6,126.8
41,3,9,134
89,2,6,134.6
27,1,3,140.7
10,4,12,143.3
183,2,4,147.1
70100,1,3,150.1
92,2,5,160.5
89,1,1,160.8
10,3,7,163.29
17023,2,6,168
27,1,1,174.4
46966,2,5,174.4
2806,4,11,176
53,3,8,180.4
171,2,5,189.4
14104,4,12,194.6
24,1,1,195.6
27,2,4,205
3959,1,1,215.6
45,2,4,216.2
2550,2,5,231.6
31,4,10,236
41,4,11,239.3
2806,3,8,244.8
10,2,4,250.8
90,2,5,279.9
45,4,12,309.68
65,3,8,351.4
1033,2,5,355.8
89,4,10,366
171,1,1,378.8
53,1,1,400.4
27,3,7,403.5
5,2,5,478
908,4,11,519.3
31,2,6,609
34,2,6,642.5
111,1,1,697.6
70165,2,6,702
70187,2,5,706.2
31,4,12,760.8
10,3,8,902.5
171,1,2,977.6
2806,2,6,994.4
70201,3,8,1075.5
10,4,11,1894.6
70100,2,6,1937.2
;;;;
run;

data ORION.ORDER_SUMMARY;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Month length=8;
   attrib Sale_Amt length=8;

   infile datalines dsd;
   input
      Customer_ID
      Order_Month
      Sale_Amt
   ;
datalines4;
5,5,478
5,6,126.8
5,9,52.5
5,12,33.8
10,3,32.6
10,4,250.8
10,5,79.8
10,6,12.2
10,7,163.29
10,8,902.5
10,11,1894.6
10,12,143.3
11,9,78.2
12,2,117.6
12,6,48.4
12,9,87.2
18,2,29.4
24,1,195.6
24,3,46.9
24,7,70.2
24,9,46.1
27,1,174.4
27,3,140.7
27,4,205
27,6,91.6
27,7,403.5
27,9,78.4
31,3,64.2
31,4,57.3
31,6,609
31,9,50.3
31,10,236
31,12,760.8
34,6,642.5
34,11,86.3
41,2,36.2
41,5,19.9
41,7,89.8
41,8,17.6
41,9,134
41,10,29.4
41,11,239.3
45,4,216.2
45,6,56
45,8,40.2
45,9,78.2
45,12,309.68
49,12,24.8
53,1,400.4
53,8,180.4
56,4,37.9
65,8,351.4
69,9,23.5
69,10,3.2
89,1,160.8
89,6,134.6
89,10,366
89,12,75.2
90,5,279.9
90,6,33.6
90,7,110.2
90,8,47.6
90,11,69.4
92,3,16.9
92,5,160.5
111,1,697.6
171,1,378.8
171,2,977.6
171,4,19.1
171,5,189.4
171,6,73.99
171,7,35.2
171,8,25.5
171,10,101.5
171,11,48.9
183,4,147.1
215,11,60.8
908,11,519.3
928,9,86.3
1033,5,355.8
2550,5,231.6
2806,1,37.4
2806,6,994.4
2806,7,54.3
2806,8,244.8
2806,11,176
3959,1,215.6
14104,12,194.6
17023,3,121
17023,6,168
46966,4,107.3
46966,5,174.4
70079,5,29.4
70079,10,14.6
70100,3,150.1
70100,6,1937.2
70165,6,702
70165,7,16.6
70187,5,706.2
70187,11,8.2
70201,8,1075.5
;;;;
run;

data ORION.PRICES;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Unit_Price length=8 label='Unit Sales Price' format=DOLLAR13.2;
   attrib Factor length=8 label='Yearly increase in Price' format=5.2;

   infile datalines dsd;
   input
      Product_ID
      Unit_Price
      Factor
   ;
datalines4;
210200100009,34.7,1.01
210200100017,40,1.01
210200200023,19.8,1.01
210200600067,67,1.01
210200600085,39.4,1.01
210200600112,21.8,1.01
210200900033,14.2,1.01
210200900038,20.3,1.01
210201000050,19.6,1.01
210201000126,6.5,1.01
210201000198,60.1,1.01
210201100004,49.2,1.0201
220100100189,94.7,1.01
220100100192,27.4,1.01
220100100309,96.3,1.01
220100100354,17,1.01
220100200004,6.5,1.01
220100300008,85.7,1.01
220100300042,208.6,1.01
220100400023,93.6,1.01
220100700002,188.6,1.01
220100700022,56.9,1.01
220100700024,104.6,1.01
220100700027,59.5,1.01
220100700042,90.6,1.01
220100700046,154.4,1.0201
220100700052,121.6,1.0201
220100800001,38.6,1.01
220100800009,52.5,1.01
220100800040,126.5,1.01
220100800071,33.7,1.0201
220100800096,74.1,1.01
220100900006,88.4,1.01
220101200006,55.2,1.01
220101200025,26.9,1.01
220101200029,54.8,1.01
220101300001,33.6,1.01
220101300012,19.4,1.01
220101300017,16.6,1.01
220101400004,105.7,1.01
220101400017,11.1,1.01
220101400047,24.2,1.01
220101400060,32.4,1.01
220101400061,51,1.01
220101400088,38.4,1.01
220101400091,34,1.01
220101400098,32.7,1.01
220101400117,46.4,1.01
220101400130,16.9,1.01
220101400145,16.7,1.01
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

data ORION.PRODUCT_LIST;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_ID length=8 label='Supplier ID' format=12.;
   attrib Product_Level length=8 label='Product Level' format=12.;
   attrib Product_Ref_ID length=8 label='Product Reference ID' format=12.;

   infile datalines dsd;
   input
      Product_ID
      Product_Name
      Supplier_ID
      Product_Level
      Product_Ref_ID
   ;
datalines4;
210000000000,Children,,4,
210100000000,Children Outdoors,,3,210000000000
210100100000,"Outdoor things, Kids",,2,210100000000
210200000000,Children Sports,,3,210000000000
210200100000,"A-Team, Kids",,2,210200000000
210200100009,"Kids Sweat Round Neck,Large Logo",3298,1,210200100000
210200100017,Sweatshirt Children's O-Neck,3298,1,210200100000
210200200000,"Bathing Suits, Kids",,2,210200000000
210200200022,Sunfit Slow Swimming Trunks,6153,1,210200200000
210200200023,Sunfit Stockton Swimming Trunks Jr.,6153,1,210200200000
210200300000,"Eclipse, Kid's Clothes",,2,210200000000
210200300006,Fleece Cuff Pant Kid'S,1303,1,210200300000
210200300007,Hsc Dutch Player Shirt Junior,1303,1,210200300000
210200300052,Tony's Cut & Sew T-Shirt,1303,1,210200300000
210200400000,"Eclipse, Kid's Shoes",,2,210200000000
210200400020,Kids Baby Edge Max Shoes,1303,1,210200400000
210200400070,Tony's Children's Deschutz (Bg) Shoes,1303,1,210200400000
210200500000,"Lucky Guy, Kids",,2,210200000000
210200500002,Children's Mitten,772,1,210200500000
210200500006,"Rain Suit, Plain w/backpack Jacket",772,1,210200500000
210200500007,Bozeman Rain & Storm Set,772,1,210200500000
210200500016,Teen Profleece w/Zipper,772,1,210200500000
210200600000,"N.D. Gear, Kids",,2,210200000000
210200600056,Butch T-Shirt with V-Neck,4742,1,210200600000
210200600067,Children's Knit Sweater,4742,1,210200600000
210200600085,Gordon Children's Tracking Pants,4742,1,210200600000
210200600112,O'my Children's T-Shirt with Logo,4742,1,210200600000
210200700000,"Olssons, Kids",,2,210200000000
210200700016,Strap Pants BBO,798,1,210200700000
210200800000,Orion Kid's Clothes,,2,210200000000
210200900000,"Osprey, Kids",,2,210200000000
210200900004,Kid Basic Tracking Suit,3664,1,210200900000
210200900033,Osprey France Nylon Shorts,3664,1,210200900000
210200900038,Osprey Girl's Tights,3664,1,210200900000
210201000000,Tracker Kid's Clothes,,2,210200000000
210201000050,Kid Children's T-Shirt,2963,1,210201000000
210201000067,Logo Coord.Children's Sweatshirt,2963,1,210201000000
210201000126,Toddler Footwear Socks with Knobs,2963,1,210201000000
210201000198,South Peak Junior Training Shoes,2963,1,210201000000
210201000199,Starlite Baby Shoes,2963,1,210201000000
210201100000,"Ypsilon, Kids",,2,210200000000
210201100004,Ypsilon Children's Sweat w/Big Logo,14624,1,210201100000
220000000000,Clothes & Shoes,,4,
220100000000,Clothes,,3,220000000000
220100100000,Eclipse Clothing,,2,220100000000
220100100019,Fit Racing Cap,1303,1,220100100000
220100100025,Knit Hat,1303,1,220100100000
220100100044,Sports glasses Satin Alumin.,1303,1,220100100000
220100100101,Big Guy Men's Chaser Poplin Pants,1303,1,220100100000
220100100105,Big Guy Men's Clima Fit Jacket,1303,1,220100100000
220100100125,Big Guy Men's Dri Fit Singlet,1303,1,220100100000
220100100153,Big Guy Men's Fresh Soft Nylon Pants,1303,1,220100100000
220100100185,Big Guy Men's Micro Fiber Full Zip Jacket,1303,1,220100100000
220100100189,Big Guy Men's Micro Fibre Jacket,1303,1,220100100000
220100100192,Big Guy Men's Micro Fibre Shorts XXL,1303,1,220100100000
220100100197,Big Guy Men's Mid Layer Jacket,1303,1,220100100000
220100100235,Big Guy Men's Running Shorts Dri.Fit,1303,1,220100100000
220100100241,Big Guy Men's Santos Shorts Dri Fit,1303,1,220100100000
220100100272,Big Guy Men's T-Shirt,1303,1,220100100000
220100100273,Big Guy Men's T-Shirt Dri Fit,1303,1,220100100000
220100100298,Big Guy Men's Twill Pants Golf,1303,1,220100100000
220100100304,Big Guy Men's Victory Peach Poplin Pants,1303,1,220100100000
220100100309,Big Guy Men's Woven Warm Up,1303,1,220100100000
220100100354,Insu F.I.T Basic,1303,1,220100100000
220100100371,Northern Fleece Scarf,1303,1,220100100000
220100100410,Toto Tube Socks,1303,1,220100100000
220100100421,Trois-fit Running Qtr Socks (Non-Cush),1303,1,220100100000
220100100513,Woman's Deception Dress,1303,1,220100100000
220100100516,Woman's Dri Fit Airborne Top,1303,1,220100100000
220100100523,Woman's Dri-Fit Scoop Neck Bra,1303,1,220100100000
220100100530,Woman's Emblished Work-Out Pants,1303,1,220100100000
220100100536,Woman's Foxhole Jacket,1303,1,220100100000
220100100553,Woman's Short Top Dri Fit,1303,1,220100100000
220100100568,Woman's Micro Fibre Anorak,1303,1,220100100000
220100100581,Woman's Out & Sew Airborn Top,1303,1,220100100000
220100100592,Woman's Short Tights,1303,1,220100100000
220100100609,Woman's Sweatshirt w/Hood,1303,1,220100100000
220100100617,Woman's T-Shirt w/Hood,1303,1,220100100000
220100100629,Woman's Winter Tights,1303,1,220100100000
220100100631,Woman's Work Out Pants Dri Fit,1303,1,220100100000
220100100635,Woman's Woven Warm Up,1303,1,220100100000
220100200000,Green Tomato,,2,220100000000
220100200004,Green Lime Atletic Socks,18139,1,220100200000
220100300000,Knitwear,,2,220100000000
220100300001,Fleece Jacket Compass,772,1,220100300000
220100300008,Dp Roller High-necked Knit,4646,1,220100300000
220100300019,Instyle Pullover Mid w/Small Zipper,772,1,220100300000
220100300020,Instyle T-Shirt,772,1,220100300000
220100300025,Lucky Knitwear Wool Sweater,772,1,220100300000
220100300037,Mayday Resque Fleece Pullover,4646,1,220100300000
220100300042,Truls Polar Fleece Cardigan,12869,1,220100300000
220100400000,LSF,,2,220100000000
220100400005,Big Guy Men's Air Force 1 Sc,1303,1,220100400000
220100400022,Ultra M803 Ng Men's Street Shoes,5503,1,220100400000
220100400023,Ultra W802 All Terrain Women's Shoes,5503,1,220100400000
220100500000,Leisure,,2,220100000000
220100600000,Massif,,2,220100000000
220100700000,Orion,,2,220100000000
220100700002,Dmx 10 Women's Aerobic Shoes,16733,1,220100700000
220100700022,Alexis Women's Classic Shoes,16733,1,220100700000
220100700023,Armadillo Road Dmx Men's Running Shoes,16733,1,220100700000
220100700024,Armadillo Road Dmx Women's Running Shoes,16733,1,220100700000
220100700027,Duration Women's Trainer Aerobic Shoes,16733,1,220100700000
220100700042,"Power Women's Dmx Wide, Walking Shoes",16733,1,220100700000
220100700046,Tcp 6 Men's Running Shoes,16733,1,220100700000
220100700052,Trooper Ii Dmx-2x Men's Walking Shoes,16733,1,220100700000
220100800000,Orion Clothing,,2,220100000000
220100800001,Bra Top Wom.Fitn.Cl,16733,1,220100800000
220100800009,Peacock Pants,16733,1,220100800000
220100800040,Mick's Men's Cl.Tracksuit,16733,1,220100800000
220100800071,Tx Tribe Tank Top,16733,1,220100800000
220100800096,Zx Women's Dance Pants,16733,1,220100800000
220100900000,Osprey,,2,220100000000
220100900006,Osprey Cabri Micro Suit,3664,1,220100900000
220100900029,Osprey Men's King T-Shirt w/Small Logo,3664,1,220100900000
220100900035,Osprey Shadow Indoor,3664,1,220100900000
220101000000,Shorts,,2,220100000000
220101000002,Carribian Women's Jersey Shorts,3298,1,220101000000
220101100000,Stockings & Socks,,2,220100000000
220101200000,Street Wear,,2,220100000000
220101200006,Anthony Bork Maggan 3/4 Long Pique,4646,1,220101200000
220101200020,Tyfoon Flex Shorts,11427,1,220101200000
220101200025,Tyfoon Ketch T-Shirt,11427,1,220101200000
220101200029,Tyfoon Oliver Sweatshirt,11427,1,220101200000
220101300000,T-Shirts,,2,220100000000
220101300001,"T-Shirt, Short-sleeved, Big Logo",3298,1,220101300000
220101300012,Men's T-Shirt Small Logo,3298,1,220101300000
220101300017,Toncot Beefy-T Emb T-Shirt,3298,1,220101300000
220101400000,Tracker Clothes,,2,220100000000
220101400004,Badminton Cotton,2963,1,220101400000
220101400017,Men's Cap,2963,1,220101400000
220101400018,Men's Running Tee Short Sleeves,2963,1,220101400000
220101400032,Socks Wmns'Fitness,1303,1,220101400000
220101400047,Swimming Trunks Struc,2963,1,220101400000
220101400060,2bwet 3 Cb Swimming Trunks,2963,1,220101400000
220101400061,2bwet 3 Solid Bikini,2963,1,220101400000
220101400088,Casual Genuine Polo-Shirt,2963,1,220101400000
220101400091,Casual Genuine Tee,2963,1,220101400000
220101400092,Casual Logo Men's Sweatshirt,2963,1,220101400000
220101400098,Casual Sport Shorts,2963,1,220101400000
220101400117,Casual.st.polo Long-sleeved Polo-shirt,2963,1,220101400000
220101400130,Comp. Women's Sleeveless Polo,2963,1,220101400000
220101400138,Dima 2-Layer Men's Suit,2963,1,220101400000
220101400145,Essence.baseball Cap,2963,1,220101400000
220101400148,Essence.cap Men's Bag,2963,1,220101400000
220101400150,Essential Suit 2 Swim Suit,2963,1,220101400000
220101400152,Essential Trunk 2 Swimming Trunks,2963,1,220101400000
220101400201,Kaitum Women's Swim Suit,2963,1,220101400000
220101400216,Mm Daypouch Shoulder Bag,2963,1,220101400000
220101400237,Mns.jacket Jacket,2963,1,220101400000
220101400238,Mns.long Tights,2963,1,220101400000
220101400265,Ottis Pes Men's Pants,2963,1,220101400000
220101400269,Outfit Women's Shirt,2963,1,220101400000
220101400276,Pine Sweat with Hood,2963,1,220101400000
220101400285,Quali Jacket with Hood,2963,1,220101400000
220101400289,Quali Sweatpant,2963,1,220101400000
220101400290,Quali Sweatshirt,2963,1,220101400000
220101400306,Sherpa Pes Shiny Cotton,2963,1,220101400000
220101400310,Short Women's Tights,2963,1,220101400000
220101400328,Stars Swim Suit,2963,1,220101400000
220101400339,Tims Shorts,2963,1,220101400000
220101400349,Tracker Fitness Stockings,2963,1,220101400000
220101400363,Brafit Swim Tights,4742,1,220101400000
220101400373,Jogging Pants  Men's Tracking Pants w/Small L,14682,1,220101400000
220101400385,N.d.gear Basic T-Shirt,14682,1,220101400000
220101400387,N.d.gear Cap,14682,1,220101400000
220101500000,Twain,,2,220100000000
220200000000,Shoes,,3,220000000000
220200100000,Eclipse Shoes,,2,220200000000
220200100002,Cnv Plus Men's Off Court Tennis,1303,1,220200100000
220200100009,Atmosphere Imara Women's Running Shoes,1303,1,220200100000
220200100012,Atmosphere Shatter Mid Shoes,1303,1,220200100000
220200100035,Big Guy Men's Air Deschutz Viii Shoes,1303,1,220200100000
220200100090,Big Guy Men's Air Terra Reach Shoes,1303,1,220200100000
220200100092,Big Guy Men's Air Terra Sebec Shoes,1303,1,220200100000
220200100129,Big Guy Men's International Triax Shoes,1303,1,220200100000
220200100137,Big Guy Men's Multicourt Ii Shoes,1303,1,220200100000
220200100171,Woman's Air Amend Mid,1303,1,220200100000
220200100179,Woman's Air Converge Triax X,1303,1,220200100000
220200100190,Woman's Air Imara,1303,1,220200100000
220200100202,Woman's Air Rasp Suede,1303,1,220200100000
220200100226,Woman's Air Zoom Drive,1303,1,220200100000
220200100229,Woman's Air Zoom Sterling,1303,1,220200100000
220200200000,Shoes,,2,220200000000
220200200014,Dubby Low Men's Street Shoes,109,1,220200200000
220200200018,Lulu Men's Street Shoes,109,1,220200200000
220200200022,Pro Fit Gel Ds Trainer Women's Running Shoes,1747,1,220200200000
220200200024,Pro Fit Gel Gt 2030 Women's Running Shoes,1747,1,220200200000
220200200035,Soft Alta Plus Women's Indoor Shoes,1747,1,220200200000
220200200036,Soft Astro Men's Running Shoes,1747,1,220200200000
220200200071,Twain Men's Exit Low 2000 Street Shoes,13198,1,220200200000
220200200073,Twain Stf6 Gtx M Men's Trekking Boot,13198,1,220200200000
220200200077,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,13198,1,220200200000
220200200079,Twain Women's Expresso X-Hiking Shoes,13198,1,220200200000
220200300000,Tracker Shoes,,2,220200000000
220200300002,Pytossage Bathing Sandal,2963,1,220200300000
220200300005,Liga Football Boot,2963,1,220200300000
220200300015,Men's Running Shoes Piedmmont,2963,1,220200300000
220200300079,Hilly Women's Crosstrainer Shoes,2963,1,220200300000
220200300082,Indoor Handbold Special Shoes,2963,1,220200300000
220200300096,Mns.raptor Precision Sg Football,2963,1,220200300000
220200300116,South Peak Men's Running Shoes,2963,1,220200300000
220200300129,Torino Men's Leather Adventure Shoes,2963,1,220200300000
220200300154,Hardcore Junior/Women's Street Shoes Large,14682,1,220200300000
220200300157,Hardcore Men's Street Shoes Large,14682,1,220200300000
230000000000,Outdoors,,4,
230100000000,Outdoors,,3,230000000000
230100100000,Anoraks & Parkas,,2,230100000000
230100100006,Jacket Nome,4742,1,230100100000
230100100013,Jacket with Removable Fleece,772,1,230100100000
230100100015,Men's Jacket Caians,50,1,230100100000
230100100017,Men's Jacket Rem,50,1,230100100000
230100100018,Men's Jacket Sandy,4742,1,230100100000
230100100025,Women's Shorts,50,1,230100100000
230100100028,4men Men's Polar Down Jacket,772,1,230100100000
230100100033,Big Guy Men's Packable Hiking Shorts,15218,1,230100100000
230100100045,Duwall Pants,772,1,230100100000
230100100051,Lucky Voss Jacket,772,1,230100100000
230100100053,Monster Men's Pants with Zipper,50,1,230100100000
230100100062,Topper Pants,772,1,230100100000
230100100063,Tx Peak Parka,15218,1,230100100000
230100200000,Backpacks,,2,230100000000
230100200004,Black/Black,755,1,230100200000
230100200006,X-Large Bottlegreen/Black,755,1,230100200000
230100200019,Commanche Women's 6000 Q Backpack. Bark,755,1,230100200000
230100200022,Expedition Camp Duffle Medium Backpack,15218,1,230100200000
230100200025,Feelgood 55-75 Litre Black Women's Backpack,10692,1,230100200000
230100200029,Jaguar 50-75 Liter Blue Women's Backpack,10692,1,230100200000
230100200043,Medium Black/Bark Backpack,755,1,230100200000
230100200047,Medium Gold Black/Gold Backpack,755,1,230100200000
230100200048,Medium Olive Olive/Black Backpack,755,1,230100200000
230100200054,Trekker 65 Royal Men's Backpack,10692,1,230100200000
230100200056,Victor Grey/Olive Women's Backpack,755,1,230100200000
230100200059,Deer Backpack,4742,1,230100200000
230100200066,Deer Waist Bag,4742,1,230100200000
230100200073,Hammock Sports Bag,4742,1,230100200000
230100200074,Sioux Men's Backpack 26 Litre.,15218,1,230100200000
230100300000,Gloves & Mittens,,2,230100000000
230100300006,Gloves Le Fly Mitten,1684,1,230100300000
230100300010,Massif Dual Gloves,13199,1,230100300000
230100300013,Montana Adult Gloves,6355,1,230100300000
230100300023,Scania Unisex Gloves,6355,1,230100300000
230100400000,Knitted Accessories,,2,230100000000
230100400007,Breaker Commandos Cap,4793,1,230100400000
230100400010,Breaker Frozen Husky Hat,4793,1,230100400000
230100400012,Breaker Russia Cap,4793,1,230100400000
230100400025,Mayday Serious Headband,4646,1,230100400000
230100500000,Outdoor Gear,,2,230100000000
230100500004,"Backpack Flag, 6,5x9 Cm.",316,1,230100500000
230100500006,Collapsible Water Can,316,1,230100500000
230100500008,Dome Tent Monodome Alu,316,1,230100500000
230100500012,Inflatable 3.5,316,1,230100500000
230100500013,Lamp with Battery Box,316,1,230100500000
230100500016,"Money Purse, Black",755,1,230100500000
230100500020,Pocket Light with Crypton Bulb,316,1,230100500000
230100500023,Proofing Spray,316,1,230100500000
230100500024,"Small Belt Bag, Black",755,1,230100500000
230100500026,Trekking Tent,316,1,230100500000
230100500045,Cup Picnic Mug 25 Cl.,316,1,230100500000
230100500056,Knife,4718,1,230100500000
230100500058,Mattress with 5 channels 196x72,316,1,230100500000
230100500066,Outback Spirits Kitchen,316,1,230100500000
230100500068,Plate Picnic Deep,316,1,230100500000
230100500072,Single Full Box Madras honeycomb-weave,316,1,230100500000
230100500074,"Tent Milano Tent,4 Persons, about 4.8",316,1,230100500000
230100500077,Jl Legacy Curig I.A.Jacket,772,1,230100500000
230100500080,Jl Rainlight Essential Pants,772,1,230100500000
230100500081,Lucky Tech Classic Rain Pants,772,1,230100500000
230100500082,Lucky Tech Intergal Wp/B Rain Pants,772,1,230100500000
230100500087,Mayday Qd Zip Pants,4646,1,230100500000
230100500091,Mayday Soul Ht Jacket,4646,1,230100500000
230100500092,Mayday Sports Pullover,4646,1,230100500000
230100500093,Mayday W'S Sports Pullover,4646,1,230100500000
230100500094,"Men's Pants, Basic",4646,1,230100500000
230100500095,Men's Sports Pullover,4646,1,230100500000
230100500096,Rain Jacket,772,1,230100500000
230100500101,Ultra Ht Lightning Set,772,1,230100500000
230100600000,Sleepingbags,,2,230100000000
230100600003,"Sheet Sleeping Bag, Red",16422,1,230100600000
230100600005,"Basic 10, Left , Yellow/Black",755,1,230100600000
230100600015,"Expedition Zero,Medium,Left,Charcoal",755,1,230100600000
230100600016,"Expedition Zero,Medium,Right,Charcoal",755,1,230100600000
230100600017,"Expedition Zero,Small,Left,Charcoal",755,1,230100600000
230100600018,"Expedition Zero,Small,Right,Charcoal",755,1,230100600000
230100600022,"Expedition10,Medium,Right,Blue Ribbon",755,1,230100600000
230100600023,"Expedition 10,Small,Left,Blue Ribbon",755,1,230100600000
230100600024,"Expedition 10,Small,Right,Blue Ribbon",755,1,230100600000
230100600026,"Expedition 20,Large,Right,Forestgreen",755,1,230100600000
230100600028,"Expedition 20,Medium,Right,Forestgreen",755,1,230100600000
230100600030,"Outback Sleeping Bag, Large,Left,Blue/Black",755,1,230100600000
230100600031,"Outback Sleeping Bag, Large,Right, Blue/Black",755,1,230100600000
230100600035,"Polar Bear Sleeping mat, Olive Green",16422,1,230100600000
230100600036,Tent Summer 195 Twin Sleeping Bag,16422,1,230100600000
230100600038,Tipee Summer Sleeping Bag,16422,1,230100600000
230100600039,Tipee Twin Blue/Orange,16422,1,230100600000
230100700000,Tents,,2,230100000000
230100700002,Comfort Shelter,16422,1,230100700000
230100700004,Expedition Dome 3,16422,1,230100700000
230100700008,Family Holiday 4,109,1,230100700000
230100700009,Family Holiday 6,109,1,230100700000
230100700011,Hurricane 4,109,1,230100700000
240000000000,Sports,,4,
240100000000,Assorted Sports Articles,,3,240000000000
240100100000,Assorted Sports articles,,2,240100000000
240100100029,Buzz Saw,16814,1,240100100000
240100100031,Capsy Hood,6153,1,240100100000
240100100063,Grey Met.,16814,1,240100100000
240100100065,Grey,16814,1,240100100000
240100100148,Wood Box for 6 Balls,4514,1,240100100000
240100100159,A-team Smoothsport Bra,3298,1,240100100000
240100100184,Barret 2.12 Men's Softboot,3815,1,240100100000
240100100186,Barret 3.1 Women's Softboot,3815,1,240100100000
240100100232,Dartsharpener Key ring,4514,1,240100100000
240100100305,Hiclass Mundo 78a 36x72mm Pink-Swirl,3815,1,240100100000
240100100312,Hot Mini Backboard Bulls,2995,1,240100100000
240100100354,Mk Splinter 66 5m 88a Pea.,1684,1,240100100000
240100100365,Northern Coach,12283,1,240100100000
240100100366,Northern Liquid Belt with Bottle,12283,1,240100100000
240100100403,Proskater Viablade Tx Women's Fitness,3815,1,240100100000
240100100410,Prosoccer  Club Football 4/32 (Replica) Synth,5810,1,240100100000
240100100433,Shoelace White 150 Cm,5810,1,240100100000
240100100434,Shoeshine Black,16814,1,240100100000
240100100463,Sparkle Spray Orange,16814,1,240100100000
240100100477,Stout Brass 18 Gram,4514,1,240100100000
240100100508,Top Elite Kit Small,3815,1,240100100000
240100100535,Victor 76 76mm Optics Blue,1684,1,240100100000
240100100581,Eliza T-Shirt,4742,1,240100100000
240100100605,Fred T-Shirt,4742,1,240100100000
240100100610,Goodtime Bag,4742,1,240100100000
240100100615,Goodtime Toilet Bag,4742,1,240100100000
240100100646,Lyon Men's Jacket,4742,1,240100100000
240100100654,Montevideo Men's Shorts,4742,1,240100100000
240100100665,Pool Shorts,4742,1,240100100000
240100100672,Ribstop Jacket,4742,1,240100100000
240100100676,Roth T-Shirt,4742,1,240100100000
240100100679,Saturn Big Bag,4742,1,240100100000
240100100690,Shirt Termir,4742,1,240100100000
240100100703,Stream Sweatshirt with Tube,4742,1,240100100000
240100100714,Tybor Sweatshirt with Hood,4742,1,240100100000
240100100734,Wyoming Men's Socks,4742,1,240100100000
240100100737,Wyoming Men's T-Shirt with V-Neck,4742,1,240100100000
240100200000,Darts,,2,240100000000
240100200001,Aim4it 16 Gram Softtip Pil,4514,1,240100200000
240100200004,Aim4it 80% Tungsten 22 Gram,4514,1,240100200000
240100200014,Pacific 95% 23 Gram,4514,1,240100200000
240100300000,Petanque - Boule,,2,240100000000
240100400000,Skates,,2,240100000000
240100400004,Children's Roller Skates,1684,1,240100400000
240100400005,Cool Fit Men's Roller Skates,13198,1,240100400000
240100400006,Cool Fit Women's Roller Skates,13198,1,240100400000
240100400037,N.d.gear Roller Skates Ff80 80 millimetre78a,1684,1,240100400000
240100400043,Perfect Fit Men's  Roller Skates,13198,1,240100400000
240100400044,Perfect Fit Men's Roller Skates,13198,1,240100400000
240100400046,Perfect Fit Men's Stunt Skates,13198,1,240100400000
240100400049,Perfect Fit Women's Roller Skates Custom,13198,1,240100400000
240100400058,Pro-roll Hot Rod Roller Skates,1684,1,240100400000
240100400062,Pro-roll Lazer Roller Skates,1684,1,240100400000
240100400069,Pro-roll Panga Roller Skates,1684,1,240100400000
240100400070,Pro-roll Sabotage-Rp  Roller Skates,1684,1,240100400000
240100400076,Pro-roll Sq9 80-76mm/78a Roller Skates,1684,1,240100400000
240100400080,Proskater Kitalpha Gamma Roller Skates,3815,1,240100400000
240100400083,Proskater Viablade S Roller Skates,3815,1,240100400000
240100400085,Proskater W-500 Jr.Roller Skates,3815,1,240100400000
240100400095,Rollerskate Roller Skates Control Xi Adult,1684,1,240100400000
240100400098,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,1684,1,240100400000
240100400100,Rollerskate Roller Skates Gretzky Mvp S.B.S,1684,1,240100400000
240100400112,Rollerskate Roller Skates Panga 72mm/78a,1684,1,240100400000
240100400125,Rollerskate Roller Skates Sq5 76mm/78a,1684,1,240100400000
240100400128,Rollerskate Roller Skates Sq7-Ls 76mm/78a,1684,1,240100400000
240100400129,Rollerskate Roller Skates Sq9 80-76mm/78a,1684,1,240100400000
240100400136,Rollerskate Roller Skates Xpander,1684,1,240100400000
240100400142,Twain Ac7/Ft7 Men's Roller Skates,13198,1,240100400000
240100400143,Twain Ac7/Ft7 Women's Roller Skates,13198,1,240100400000
240100400147,Twain Tr7 Men's Roller Skates,13198,1,240100400000
240100400151,Weston F4 Men's Hockey Skates,3815,1,240100400000
240200000000,Golf,,3,240000000000
240200100000,Golf,,2,240200000000
240200100007,Ball Bag,2995,1,240200100000
240200100020,Red/White/Black Staff 9 Bag,17832,1,240200100000
240200100021,Tee Holder,2995,1,240200100000
240200100034,Bb Softspikes - Xp 22-pack,15938,1,240200100000
240200100043,Bretagne Performance Tg Men's Golf Shoes L.,2995,1,240200100000
240200100046,"Bretagne Soft-Tech Men's Glove, left",2995,1,240200100000
240200100050,"Bretagne St2 Men's Golf Glove, left",2995,1,240200100000
240200100051,Bretagne Stabilites 2000 Goretex Shoes,2995,1,240200100000
240200100052,Bretagne Stabilities Tg Men's Golf Shoes,2995,1,240200100000
240200100053,Bretagne Stabilities Women's Golf Shoes,2995,1,240200100000
240200100056,Carolina,3808,1,240200100000
240200100057,Carolina II,3808,1,240200100000
240200100073,Donald Plush Headcover,15938,1,240200100000
240200100076,Expert Men's Firesole Driver,13198,1,240200100000
240200100081,Extreme Distance 90 3-pack,3808,1,240200100000
240200100095,Grandslam Staff Fs Copper Insert Putter,17832,1,240200100000
240200100098,Grandslam Staff Grip Llh Golf Gloves,3808,1,240200100000
240200100101,Grandslam Staff Tour Mhl Golf Gloves,3808,1,240200100000
240200100116,Hi-fly Intimidator Ti R80/10,2995,1,240200100000
240200100118,Hi-fly Intrepid Stand 8  Black,2995,1,240200100000
240200100124,Hi-fly Staff Towel Blue/Black,2995,1,240200100000
240200100131,Hi-fly Tour Advance Flex Steel,2995,1,240200100000
240200100154,"Men's.m Men's Winter Gloves, Medium",2995,1,240200100000
240200100157,Normal Standard,15938,1,240200100000
240200100164,Precision Jack 309 Lh Balata,17832,1,240200100000
240200100173,Proplay Executive Bi-Metal Graphite,2995,1,240200100000
240200100180,Proplay Men's Tour Force Lp 7-Wood,2995,1,240200100000
240200100181,Proplay Men's Tour Force Lp Driver,2995,1,240200100000
240200100183,Proplay Men's Tour Force Ti 5w,2995,1,240200100000
240200100207,Proplay Stand Black,2995,1,240200100000
240200100211,Proplay Women's Tour Force 7w,2995,1,240200100000
240200100221,Rosefinch Cart 8 1/2  Black,2995,1,240200100000
240200100225,Rubby Men's Golf Shoes w/Goretex,4168,1,240200100000
240200100226,Rubby Men's Golf Shoes w/Goretex Plain Toe,4168,1,240200100000
240200100227,Rubby Women's Golf Shoes w/Gore-Tex,4168,1,240200100000
240200100230,Score Counter Scoreboard De Luxe,2995,1,240200100000
240200100232,Tee18 Ascot Chipper,2995,1,240200100000
240200100233,Tee18 Troon 7  Black,2995,1,240200100000
240200100246,"White 90,Top.Flite Strata Tour 3-pack",2995,1,240200100000
240200200000,Golf Clothes,,2,240200000000
240200200007,Golf Polo(1/400),7511,1,240200200000
240200200011,Golf Windstopper,7511,1,240200200000
240200200013,Master Golf Rain Suit,7511,1,240200200000
240200200015,Tek Cap,13198,1,240200200000
240200200020,Big Boss Houston Pants,7511,1,240200200000
240200200024,Bogie Golf Fleece with small Zipper,7511,1,240200200000
240200200026,Eagle 5 Pocket Pants with Stretch,10225,1,240200200000
240200200035,Eagle Pants with Cross Pocket,10225,1,240200200000
240200200039,Eagle Plain Cap,10225,1,240200200000
240200200044,Eagle Polo-Shirt Interlock,10225,1,240200200000
240200200060,Eagle Windstopper Knit Neck,10225,1,240200200000
240200200061,Eagle Windstopper Sweat Neck,10225,1,240200200000
240200200068,Hi-fly Staff Rain Suit,2995,1,240200200000
240200200071,Hi-fly Strata Cap Offwhite/Green,2995,1,240200200000
240200200080,Release Golf Sweatshirt w/Logo(1/100),7511,1,240200200000
240200200081,Top (1/100),7511,1,240200200000
240200200091,Wind Proof Windstopper Merino/Acryl,10225,1,240200200000
240300000000,Indoor Sports,,3,240000000000
240300100000,Fitness,,2,240300000000
240300100001,Abdomen Shaper,16542,1,240300100000
240300100020,Fitness Dumbbell Foam 0.90,16542,1,240300100000
240300100028,Letour Heart Bike,16542,1,240300100000
240300100032,Letour Trimag Bike,16542,1,240300100000
240300100046,Weight  5.0 Kg,16542,1,240300100000
240300100048,Wrist Weight 1.10 Kg,16542,1,240300100000
240300100049,Wrist Weight  2.25 Kg,16542,1,240300100000
240300200000,Gymnastic Clothing,,2,240300000000
240300200009,Blues Jazz Pants Suplex,798,1,240300200000
240300200018,Cougar Fleece Jacket with Zipper,13710,1,240300200000
240300200058,Cougar Windbreaker Vest,13710,1,240300200000
240300300000,Top Trim,,2,240300000000
240300300024,Men's Summer Shorts,14648,1,240300300000
240300300065,Top Men's Goretex Ski Pants,14648,1,240300300000
240300300070,Top Men's R&D Ultimate Jacket,14648,1,240300300000
240300300071,Top Men's Retro T-Neck,14648,1,240300300000
240300300090,Top R&D Long Jacket,14648,1,240300300000
240400000000,Racket Sports,,3,240000000000
240400100000,Badminton,,2,240400000000
240400200000,Racket Sports,,2,240400000000
240400200003,Bat 5-Ply,3808,1,240400200000
240400200012,Sledgehammer 120 Ph Black,17832,1,240400200000
240400200022,Aftm 95 Vf Long Bg-65 White,1280,1,240400200000
240400200036,Bag  Tit.Weekend,13079,1,240400200000
240400200057,Grandslam Ultra Power Tennisketcher,17832,1,240400200000
240400200066,"Memhis 350,Yellow Medium, 6-pack tube",1280,1,240400200000
240400200091,Smasher Rd Ti 70 Tennis Racket,1280,1,240400200000
240400200093,Smasher Super Rq Ti 350 Tennis Racket,1280,1,240400200000
240400200094,Smasher Super Rq Ti 700 Long Tennis,1280,1,240400200000
240400200097,Smasher Tg 70 Tennis String Roll,1280,1,240400200000
240400300000,Tennis,,2,240400000000
240400300013,Anthony Women's Tennis Cable Vest,4646,1,240400300000
240400300033,Smasher Polo-Shirt w/V-Neck,1280,1,240400300000
240400300035,Smasher Shorts,1280,1,240400300000
240400300039,Smasher Tights,1280,1,240400300000
240500000000,Running - Jogging,,3,240000000000
240500100000,Jogging,,2,240500000000
240500100004,Pants N,4742,1,240500100000
240500100015,A-team Pants Taffeta,3298,1,240500100000
240500100017,"A-team Sweat Round Neck, Small Logo",3298,1,240500100000
240500100026,"Men's Sweat Pants without Rib, Small Logo",3298,1,240500100000
240500100029,Men's Sweatshirt w/Hood Big Logo,3298,1,240500100000
240500100039,Sweatshirt Women's Sweatshirt with O-Neck,3298,1,240500100000
240500100041,Triffy Jacket,13314,1,240500100000
240500100043,Triffy Logo T-Shirt with V-Neck,13314,1,240500100000
240500100057,"Woman Sweat with Round Neck, Big Logo",3298,1,240500100000
240500100062,Ypsilon Men's Sweatshirt w/Piping,14624,1,240500100000
240500200000,Running Clothes,,2,240500000000
240500200003,Men's Singlet,5922,1,240500200000
240500200007,Running Gloves,5922,1,240500200000
240500200016,T-Shirt,2963,1,240500200000
240500200042,Bike.Pants Short Biking Pants,5922,1,240500200000
240500200056,Breath-brief Long Underpants XXL,5922,1,240500200000
240500200073,Force Classic Men's Jacket,5922,1,240500200000
240500200081,Force Micro Men's Suit,5922,1,240500200000
240500200082,Force Short Sprinter Men's Tights,5922,1,240500200000
240500200083,Force Technical Jacket w/Coolmax,5922,1,240500200000
240500200093,Maxrun Running Tights,5922,1,240500200000
240500200100,Original Running Pants,5922,1,240500200000
240500200101,Polar Jacket,5922,1,240500200000
240500200121,Stout Running Shorts,5922,1,240500200000
240500200122,Stout Running Shorts Micro,5922,1,240500200000
240500200130,Topline Delphi Race Shorts,5922,1,240500200000
240600000000,Swim Sports,,3,240000000000
240600100000,Bathing Suits,,2,240600000000
240600100010,"Goggles, Assorted Colours",6153,1,240600100000
240600100016,Swim Suit Fabulo,6153,1,240600100000
240600100017,Swim Suit Laurel,4742,1,240600100000
240600100080,Sharky Swimming Trunks,16292,1,240600100000
240600100102,Sunfit Luffa Bikini,6153,1,240600100000
240600100181,Milan Swimming Trunks,4742,1,240600100000
240600100185,Pew Swimming Trunks,4742,1,240600100000
240700000000,Team Sports,,3,240000000000
240700100000,American Football,,2,240700000000
240700100001,Armour L,3298,1,240700100000
240700100004,Armour XL,3298,1,240700100000
240700100007,Football - Helmet M,3298,1,240700100000
240700100011,Football - Helmet Pro XL,3298,1,240700100000
240700100012,Football - Helmet S,3298,1,240700100000
240700100013,Football - Helmet XL,3298,1,240700100000
240700100017,Football Super Bowl,3808,1,240700100000
240700200000,Baseball,,2,240700000000
240700200004,Baseball Orange Small,14648,1,240700200000
240700200007,Baseball White Small,14648,1,240700200000
240700200009,Bat - Home Run M,15218,1,240700200000
240700200010,Bat - Home Run S,15218,1,240700200000
240700200018,Helmet L,15218,1,240700200000
240700200019,Helmet M,15218,1,240700200000
240700200021,Helmet XL,15218,1,240700200000
240700200024,Bat - Large,15218,1,240700200000
240700300000,Basket Ball,,2,240700000000
240700300002,Basket Ball Pro,10225,1,240700300000
240700400000,Soccer,,2,240700000000
240700400002,Stephens Shirt,5810,1,240700400000
240700400003,Red Cap,6071,1,240700400000
240700400004,Red Scarf,6071,1,240700400000
240700400017,Fga Home Shorts,14593,1,240700400000
240700400020,Norwood Player Shirt,14593,1,240700400000
240700400024,Prosoccer Away Shirt,14593,1,240700400000
240700400031,Soccer Fan Football Player Shirt,6071,1,240700400000
240800000000,Winter Sports,,3,240000000000
240800100000,Ski Dress,,2,240800000000
240800100026,Additive Women's Ski Pants Vent Air,50,1,240800100000
240800100039,Garbo Fleece Jacket,15218,1,240800100000
240800100041,Helmsdale Ski Jacket,772,1,240800100000
240800100042,Helmsdale Ski Pants,772,1,240800100000
240800100074,Mayday Soul Pro New Tech Ski Jacket,4646,1,240800100000
240800200000,Winter Sports,,2,240800000000
240800200002,Massif Bandit Ski Parcel Axial,13199,1,240800200000
240800200008,"Twain X-Scream 7.9 Ski,Sq 750 Dri",13198,1,240800200000
240800200009,Amber Cc,16814,1,240800200000
240800200010,Black Morphe,16814,1,240800200000
240800200020,"C.A.M.,Bone",16814,1,240800200000
240800200021,Cayenne Red,16814,1,240800200000
240800200030,"Ii Pmt,Bone",16814,1,240800200000
240800200034,"Regulator,Stopsign",16814,1,240800200000
240800200035,Shine Black PRO,16814,1,240800200000
240800200037,Coolman Pro 01 Neon Yellow,13198,1,240800200000
240800200062,Top Equipe 07 Green,13198,1,240800200000
240800200063,Top Equipe 99 Black,13198,1,240800200000
;;;;
run;

data ORION.PROJSALS;
   attrib Employee_ID length=8;
   attrib Salary length=8;
   attrib Proj length=$4;
   attrib Dept length=$6;

   infile datalines dsd;
   input
      Employee_ID
      Salary
      Proj
      Dept
   ;
datalines4;
110004,42000,EZ,HUMRES
110009,34000,WIN,ENGINR
110011,27000,WIN,FINANC
110036,20000,WIN,ENGINR
110037,19000,EZ,ENGINR
110048,19000,EZ,FINANC
110077,27000,CAP1,ADMIN
110097,20000,EZ,ADMIN
110107,31000,EZ,ENGINR
110123,20000,NGEN,ADMIN
110155,27000,WIN,ADMIN
110171,44000,WIN,SALES
110188,37000,WIN,HUMRES
110196,43000,CAP1,ADMIN
110210,31000,EZ,ADMIN
110222,250000,NGEN,SALES
110236,41000,WIN,ADMIN
110239,42000,EZ,FINANC
110259,32000,EZ,ADMIN
110260,39000,EZ,HUMRES
110262,36000,WIN,FINANC
110272,22000,EZ,ENGINR
110290,37000,EZ,ENGINR
110302,18000,NGEN,HUMRES
110333,36000,EZ,HUMRES
110367,33000,WIN,FINANC
110372,36000,EZ,HUMRES
110379,25000,WIN,ADMIN
110388,25000,EZ,HUMRES
110402,28000,NGEN,FINANC
110407,61000,EZ,FINANC
110421,31000,WIN,HUMRES
110424,17000,NGEN,HUMRES
110427,27000,WIN,ADMIN
110440,17000,NGEN,ADMIN
110454,45000,WIN,FINANC
110463,39000,WIN,SALES
110465,27000,WIN,FINANC
110470,40000,WIN,SALES
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

data ORION.SALES_MGMT;
   attrib Employee_Id length=8 label='Employee ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Job_Title length=$25 label='Employee Job Title';
   attrib Salary length=8 label='Employee Annual Salary' format=DOLLAR12.;
   attrib Gender length=$1 label='Employee Gender';
   attrib Birth_Date length=8 label='Birth Date' format=DATE9.;
   attrib Emp_Hire_Date length=8 label='Employee Hire Date' format=DATE9.;
   attrib Emp_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=DATE9.;
   attrib Manager_ID length=8 label='Manager for Employee' format=12.;

   infile datalines dsd;
   input
      Employee_Id
      Start_Date
      End_Date
      Job_Title
      Salary
      Gender
      Birth_Date
      Emp_Hire_Date
      Emp_Term_Date:BEST32.
      Manager_ID
   ;
datalines4;
121143,16618,2936547,Senior Sales Manager,95090,M,6539,16618,,121142
121144,14549,2936547,Sales Manager,83505,F,4562,14549,,121142
121145,8857,2936547,Sales Manager,84260,M,-770,8857,,121142
121147,13027,2936547,Secretary II,29145,F,6357,13027,,121142
;;;;
run;

data ORION.SHIPPED;
   attrib Product_ID length=8;
   attrib Ship_Date length=8 format=DATE9.;
   attrib Quantity length=8;
   attrib Price length=$7;

   infile datalines dsd;
   input
      Product_ID
      Ship_Date
      Quantity
      Price
   ;
datalines4;
240800200021,18632,2,$42.45
240800200035,18631,6,$12.15
240200100225,18631,2,$77.85
210200500002,18636,3,$5.70
240200200091,18640,2,$72.60
240300100001,18657,1,$36.25
240500100041,18651,2,$51.70
240500200042,18651,2,$19.35
240500200101,18651,3,$49.75
240100400004,18653,1,$51.15
240100400062,18653,1,$54.00
240800200009,18660,2,$34.90
240100400058,18666,1,$29.65
220100100105,18663,1,$58.90
240100400046,18665,2,$165.95
240100400085,18665,2,$30.95
240200100046,18667,2,$9.15
220100100523,18675,1,$14.80
220101400088,18686,5,$17.50
240700400017,18695,1,$21.95
240200200020,18699,1,$14.00
240700400017,18700,3,$21.95
220100100235,18705,1,$16.40
240700200019,18702,1,$8.60
240100100410,18704,1,$10.40
240100100665,18704,1,$17.25
240200100211,18716,1,$60.65
240200100034,18726,2,$4.45
240200100050,18726,1,$6.65
240200200081,18725,1,$10.75
220200100012,18731,1,$28.25
220200100171,18731,1,$31.05
220200200014,18731,1,$40.90
240400300035,18732,1,$7.70
220100300037,18735,2,$48.70
220101400032,18735,2,$4.85
220100300019,18735,4,$16.70
220101400216,18735,3,$11.30
240200200061,18738,1,$58.85
220200200022,18746,1,$33.90
240500100017,18748,3,$23.75
240100100159,18754,1,$13.90
240100100434,18751,1,$8.05
240100400128,18751,1,$89.90
210200300006,18750,1,$7.70
210200900033,18750,4,$6.45
230100200029,18756,2,$101.65
240100100232,18756,3,$1.30
240100400080,18756,1,$110.95
240200100053,18753,2,$44.95
230100600026,18757,3,$59.40
240300100049,18755,1,$8.90
240200100230,18761,2,$6.65
220100100189,18760,2,$47.45
240200100157,18768,2,$196.15
240700100004,18763,3,$13.75
240100100679,18788,2,$19.50
230100400007,18784,1,$4.90
240100100690,18791,2,$86.10
240100100737,18791,5,$20.65
220200200036,18790,2,$27.40
220200200077,18790,2,$63.15
220200100009,18788,2,$30.50
230100500056,18789,2,$3.50
230100500087,18789,2,$40.55
240200100057,18796,4,$20.25
240200100118,18800,4,$89.55
240500200083,18799,2,$28.00
220100700023,18796,1,$44.25
240100100029,18800,2,$51.70
240100400098,18800,3,$125.85
240200100173,18802,4,$247.70
220101400047,18801,2,$11.10
240700200009,18805,2,$11.35
220100100410,18806,3,$5.70
240500100062,18812,2,$24.05
240700200010,18815,3,$10.30
240600100185,18822,2,$15.60
240500200081,18825,3,$56.05
240700300002,18825,1,$7.25
210201000067,18826,2,$13.50
210200500007,18827,1,$17.80
210200600056,18827,1,$22.75
240100100312,18831,3,$7.70
240200100081,18837,2,$3.65
240100200004,18838,1,$14.80
240400200012,18846,2,$75.95
240100100615,18849,2,$5.45
240100400083,18849,2,$54.70
230100500082,18847,2,$58.60
230100600003,18849,1,$7.75
220100300001,18853,2,$38.30
210200600067,18856,2,$28.90
210200900038,18856,3,$9.30
240400300035,18859,1,$7.70
230100400010,18862,1,$16.85
240500200003,18861,2,$11.40
240200100052,18868,2,$51.90
240200100116,18868,3,$124.90
240200100207,18868,2,$53.35
220200200018,18866,3,$30.25
220200300154,18866,3,$39.80
230100500004,18880,2,$1.35
230100600030,18878,1,$41.40
240500200082,18880,2,$16.45
220200100137,18876,1,$25.25
230100600015,18876,1,$39.20
210200500016,18879,1,$22.25
240200100053,18888,1,$44.95
210200700016,18890,1,$9.20
240600100102,18898,1,$19.70
210200600067,18896,2,$28.90
220200100002,18902,2,$19.65
240100400098,18901,1,$125.85
240100400125,18901,1,$44.60
220200300096,18907,1,$78.50
220200200035,18916,1,$46.25
240200100098,18919,1,$6.75
240100100463,18918,2,$6.05
230100500004,18918,1,$1.35
220200100190,18919,1,$29.95
240300100028,18932,2,$251.35
240300300065,18932,1,$146.35
220100100354,18933,1,$8.45
220100800096,18933,3,$35.30
230100500092,18934,4,$49.05
230100500096,18934,1,$17.25
220101400328,18935,1,$8.85
230100700008,18946,1,$253.20
230100600030,18949,1,$41.40
210200100009,18950,2,$15.50
240600100080,18951,2,$9.20
240100100354,18954,1,$14.30
220100100421,18959,1,$4.15
240100100159,18965,1,$13.90
240100100605,18965,3,$20.75
220100100516,18967,2,$20.20
220100100631,18967,2,$28.65
240700100001,18966,5,$12.30
240700400031,18966,2,$31.60
240700100007,18967,2,$9.30
240700100017,18967,2,$11.40
240700400003,18967,2,$5.60
240800100042,18973,3,$105.30
240500200016,18974,3,$14.50
240500200122,18974,2,$11.50
240700200018,18976,4,$10.30
220101400130,18987,2,$5.70
;;;;
run;

data ORION.SHOE_VENDORS;
   attrib Product_Line length=8 label='Line Number';
   attrib Product_Category length=8 label='Category Number';
   attrib Product_Group length=8 label='Group Number';
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_ID length=5 label='Supplier ID' format=12.;
   attrib Supplier_Name length=$30 label='Supplier Name';
   attrib Supplier_Country length=$2 label='Country' format=$COUNTRY.;
   attrib Group_Name length=$45 label='Group Name';
   attrib Category_Name length=$45 label='Category Name';
   attrib Line_Name length=$45 label='Product Line Name';
   attrib Mfg_Suggested_Retail_Price length=8 label='Suggested Retail Price' format=DOLLAR12.2;

   infile datalines dsd;
   input
      Product_Line
      Product_Category
      Product_Group
      Product_ID
      Product_Name
      Supplier_ID
      Supplier_Name
      Supplier_Country
      Group_Name
      Category_Name
      Line_Name
      Mfg_Suggested_Retail_Price
   ;
datalines4;
21,2102,2102004,210200400002,Deschutes Boys Outdoors Training Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,69
21,2102,2102004,210200400005,Kid Air Terra Grande Running Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,73
21,2102,2102004,210200400007,Kid Equivalent Street Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,79
21,2102,2102004,210200400009,Kid Impeccably Strong(Bg) Basket Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,114
21,2102,2102004,210200400012,Kid Trainer Lite V(Bp) Street Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,54
21,2102,2102004,210200400014,Kid Trainer Lite(Bp) Street Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,58
21,2102,2102004,210200400018,Kiddy.summit  90 F.G.Rbr (Bg) Children's Shoe,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,75
21,2102,2102004,210200400019,Kiddy.turbo Premier F.G Children's Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,83
21,2102,2102004,210200400020,Kids Baby Edge Max Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,59
21,2102,2102004,210200400025,Toddle Children's Air Align(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,94
21,2102,2102004,210200400027,Toddle Children's Air Mantra (3) (Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,92
21,2102,2102004,210200400029,Toddle Children's Air Terra Grande Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,79
21,2102,2102004,210200400030,Toddle Children's Air Terra Humara(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,130
21,2102,2102004,210200400031,Toddle Children's Air Tuco(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,81
21,2102,2102004,210200400032,Toddle Children's Align(Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,73
21,2102,2102004,210200400033,Toddle Children's Baby Fit Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,46
21,2102,2102004,210200400034,Toddle Children's Edge Max(Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,71
21,2102,2102004,210200400037,Toddle Children's Perish Nubuck Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,72
21,2102,2102004,210200400039,Toddle Children's Quokka V (Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,57
21,2102,2102004,210200400040,Toddle Children's Tuco(Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,80
21,2102,2102004,210200400041,Toddle Children's Understudy(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,66
21,2102,2102004,210200400042,Toddle Children's Understudy(Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,73
21,2102,2102004,210200400043,Toddler Children's Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,61
21,2102,2102004,210200400047,Toddler Fit Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,49
21,2102,2102004,210200400069,Tony's Children's Classic Basket (Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,66
21,2102,2102004,210200400070,Tony's Children's Deschutz (Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,67
21,2102,2102004,210200400072,Tony's Children's Golden (Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,66
21,2102,2102004,210200400073,Tony's Children's Payoff Trainer (Bp) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,71
21,2102,2102004,210200400075,Tony's Children's Rockskipper Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,114
21,2102,2102004,210200400076,Tony's Children's Terra Reach(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,117
21,2102,2102004,210200400077,Tony's Children's Terra Sebec(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,60
21,2102,2102004,210200400078,Tony's Children's Trainer Lite (Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,68
21,2102,2102004,210200400097,Tony's Extra Children's Multicourt(Bg) Shoes,1303,Eclipse Inc,US,"Eclipse, Kid's Shoes",Children Sports,Children,68
21,2102,2102006,210200600015,Hardcore Kids Street Shoes,14682,Greenline Sports Ltd,GB,"N.D. Gear, Kids",Children Sports,Children,64
21,2102,2102006,210200600032,Atx 7500 Ch Children's Shoes,16733,Fuller Trading Co.,CA,"N.D. Gear, Kids",Children Sports,Children,74
21,2102,2102006,210200600048,Big Kid Children's Shoes,2963,3Top Sports,US,"N.D. Gear, Kids",Children Sports,Children,68
21,2102,2102006,210200600064,Children's Canvas Shoes,4742,Luna sastreria S.A.,ES,"N.D. Gear, Kids",Children Sports,Children,67
21,2102,2102007,210200700013,Slomo Balance Children's Shoes,798,Sportico,ES,"Olssons, Kids",Children Sports,Children,17
21,2102,2102007,210200700014,Slomo Children's Hop Shoes,798,Sportico,ES,"Olssons, Kids",Children Sports,Children,27
21,2102,2102007,210200700015,Slomo Turner Children's Gym Shoes,798,Sportico,ES,"Olssons, Kids",Children Sports,Children,40
21,2102,2102007,210200700020,Upright Shoe Balance Shoes,798,Sportico,ES,"Olssons, Kids",Children Sports,Children,19
21,2102,2102009,210200900027,Osprey Cuda Lo Jr. Shoes Synthetic,3664,Triple Sportswear Inc,US,"Osprey, Kids",Children Sports,Children,43
21,2102,2102010,210201000166,Children's Shoes Pleva,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,106
21,2102,2102010,210201000167,Children's Shoes Stratosphere,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,56
21,2102,2102010,210201000168,Children's Shoes Wilcox,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,53
21,2102,2102010,210201000169,Children's Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,40
21,2102,2102010,210201000174,Freestyle Children's Leather Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,57
21,2102,2102010,210201000175,Freestyle Children's Velcro Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,67
21,2102,2102010,210201000178,Infant Children's Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,84
21,2102,2102010,210201000179,K Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,62
21,2102,2102010,210201000182,Kola Cf Velcro Children's Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,72
21,2102,2102010,210201000183,Kola Children's Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,64
21,2102,2102010,210201000187,Mona  C- Children's Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,77
21,2102,2102010,210201000189,Mona  J- Children's Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,95
21,2102,2102010,210201000193,South Peak Children's Shoes J,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,113
21,2102,2102010,210201000195,South Peak Children's Shoes C,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,87
21,2102,2102010,210201000196,South Peak Children's Training Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,83
21,2102,2102010,210201000197,South Peak Infant Training Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,70
21,2102,2102010,210201000198,South Peak Junior Training Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,109
21,2102,2102010,210201000199,Starlite Baby Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,67
21,2102,2102010,210201000201,Suède Kid Allround Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,64
21,2102,2102010,210201000202,T&l Children's Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,57
21,2102,2102010,210201000205,Torino 2000 K Street Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,56
21,2102,2102010,210201000206,Trainer Children's Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,69
21,2102,2102010,210201000207,Training Kid Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,68
21,2102,2102010,210201000209,Universe 4 Children's Running Shoes,2963,3Top Sports,US,Tracker Kid's Clothes,Children Sports,Children,94
22,2201,2201001,220100100123,Big Guy Men's Dome Shorts Shoes,1303,Eclipse Inc,US,Eclipse Clothing,Clothes,Clothes & Shoes,92
22,2201,2201004,220100400007,Big Guy Men's Cortez Nb-Street Shoes,1303,Eclipse Inc,US,LSF,Clothes,Clothes & Shoes,141
22,2201,2201004,220100400010,Bill London Calling Shoes,109,Petterson AB,SE,LSF,Clothes,Clothes & Shoes,130
22,2201,2201004,220100400012,Bill V-3-London Calling Shoes,109,Petterson AB,SE,LSF,Clothes,Clothes & Shoes,140
22,2201,2201004,220100400013,Cross Nubuck Women's Street Shoes,2963,3Top Sports,US,LSF,Clothes,Clothes & Shoes,144
22,2201,2201004,220100400017,Cruise Roadstar Leather Shoes,109,Petterson AB,SE,LSF,Clothes,Clothes & Shoes,125
22,2201,2201004,220100400018,Osprey Men's Street Cat Nubuck Street Shoes,3664,Triple Sportswear Inc,US,LSF,Clothes,Clothes & Shoes,162
22,2201,2201004,220100400019,Osprey Men's Streetcat Leather Street Shoes,3664,Triple Sportswear Inc,US,LSF,Clothes,Clothes & Shoes,132
22,2201,2201004,220100400020,Ultra M802 All Terrain Men's Shoes,5503,Ultra Sporting Goods Inc,US,LSF,Clothes,Clothes & Shoes,160
22,2201,2201004,220100400022,Ultra M803 Ng Men's Street Shoes,5503,Ultra Sporting Goods Inc,US,LSF,Clothes,Clothes & Shoes,187
22,2201,2201004,220100400023,Ultra W802 All Terrain Women's Shoes,5503,Ultra Sporting Goods Inc,US,LSF,Clothes,Clothes & Shoes,168
22,2201,2201004,220100400024,Ultra W803 At Women's Street Shoes,5503,Ultra Sporting Goods Inc,US,LSF,Clothes,Clothes & Shoes,174
22,2201,2201004,220100400026,Vector Low Men's Shoes,109,Petterson AB,SE,LSF,Clothes,Clothes & Shoes,215
22,2201,2201004,220100400027,Wa.lbc Street Shoes,16733,Fuller Trading Co.,CA,LSF,Clothes,Clothes & Shoes,172
22,2201,2201004,220100400028,Wa.leather Street Shoes,16733,Fuller Trading Co.,CA,LSF,Clothes,Clothes & Shoes,130
22,2201,2201007,220100700001,Classic Men's Leisure Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,138
22,2201,2201007,220100700002,Dmx 10 Women's Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,345
22,2201,2201007,220100700003,Dmx 6 Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,224
22,2201,2201007,220100700005,Dmx Lite Women's Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,318
22,2201,2201007,220100700009,Mc Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,202
22,2201,2201007,220100700010,Men's Running Shoes Burn,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,93
22,2201,2201007,220100700013,Rugged Men's Walking Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,136
22,2201,2201007,220100700014,Rugged Women's Walking Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,99
22,2201,2201007,220100700016,Shoes Sphinx,14682,Greenline Sports Ltd,GB,Orion,Clothes,Clothes & Shoes,170
22,2201,2201007,220100700017,Trainer Women's Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,174
22,2201,2201007,220100700018,Women's Aerobic Shoes Leggera,2963,3Top Sports,US,Orion,Clothes,Clothes & Shoes,175
22,2201,2201007,220100700019,Women's Running Shoes Brevard,2963,3Top Sports,US,Orion,Clothes,Clothes & Shoes,92
22,2201,2201007,220100700020,Women's Trainer Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,202
22,2201,2201007,220100700021,Alexis Women's Classic Shoes Large,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,88
22,2201,2201007,220100700022,Alexis Women's Classic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,93
22,2201,2201007,220100700023,Armadillo Road Dmx Men's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,173
22,2201,2201007,220100700024,Armadillo Road Dmx Women's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,192
22,2201,2201007,220100700026,Del Sol Women's  Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,161
22,2201,2201007,220100700027,Duration Women's Trainer Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,98
22,2201,2201007,220100700028,H Ignitor Women's Aerobic Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,244
22,2201,2201007,220100700031,Jog Dmx 6 Iii Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,238
22,2201,2201007,220100700037,Original Women's Nylon Street Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,90
22,2201,2201007,220100700038,Power Dmx Wide Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,196
22,2201,2201007,220100700039,"Power Men's Dmx Wide, Walking Shoes",16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,90
22,2201,2201007,220100700042,"Power Women's Dmx Wide, Walking Shoes",16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,153
22,2201,2201007,220100700045,Quickstyle Dmx Women's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,216
22,2201,2201007,220100700046,Tcp 6 Men's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,277
22,2201,2201007,220100700047,Tcp 6 Women's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,241
22,2201,2201007,220100700050,Trailblaze Dmx Lite Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,340
22,2201,2201007,220100700051,Trailblaze Dmx Lite Women's Running Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,336
22,2201,2201007,220100700052,Trooper Ii Dmx-2x Men's Walking Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,216
22,2201,2201007,220100700053,Trooper Ii Dmx-2x Women's Walking Shoes,16733,Fuller Trading Co.,CA,Orion,Clothes,Clothes & Shoes,225
22,2201,2201009,220100900004,Osprey Bermuda Canvas Shoes,3664,Triple Sportswear Inc,US,Osprey,Clothes,Clothes & Shoes,34
22,2202,2202001,220200100004,Mercurail F.G. Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,318
22,2202,2202001,220200100005,4men Men's Air Golden Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,125
22,2202,2202001,220200100007,Atmosphere Acma Men's Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,85
22,2202,2202001,220200100008,Atmosphere Deschutz Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,98
22,2202,2202001,220200100009,Atmosphere Imara Women's Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,121
22,2202,2202001,220200100010,Atmosphere Mickey Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,346
22,2202,2202001,220200100011,Atmosphere Mic Plus.Men's Running Shoe,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,191
22,2202,2202001,220200100012,Atmosphere Shatter Mid Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,96
22,2202,2202001,220200100014,Atmosphere Terra Grande Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,131
22,2202,2202001,220200100021,Big Guy Men's Air 120 Soccer Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,294
22,2202,2202001,220200100023,Big Guy Men's Air 45 Trainer Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,144
22,2202,2202001,220200100025,Big Guy  Men's Air Ace 4 Plus Low-Tennis Shoe,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,166
22,2202,2202001,220200100026,Big Guy Men's Air Align Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,130
22,2202,2202001,220200100027,Big Guy Men's Air Aragon Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,152
22,2202,2202001,220200100029,Big Guy Men's Air Baltoro Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,201
22,2202,2202001,220200100030,Big Guy Men's Air Cortez Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,144
22,2202,2202001,220200100033,Big Guy Men's Air Croos Trainer Iii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,213
22,2202,2202001,220200100034,Big Guy Men's Air Deschutz Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,95
22,2202,2202001,220200100035,Big Guy Men's Air Deschutz Viii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,121
22,2202,2202001,220200100037,Big Guy Men's Air Escape Mid Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,201
22,2202,2202001,220200100038,Big Guy Men's Air Exploraid Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,210
22,2202,2202001,220200100039,Big Guy Men's Air Famished Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,168
22,2202,2202001,220200100041,Big Guy Men's Air Flight Determination Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,337
22,2202,2202001,220200100042,Big Guy Men's Air Flyer Plus Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,117
22,2202,2202001,220200100044,Big Guy Men's Air Force Strong Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,201
22,2202,2202001,220200100045,Big Guy Men's Air Humara Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,207
22,2202,2202001,220200100047,Big Guy Men's Air International Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,146
22,2202,2202001,220200100048,Big Guy Men's Air International Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,225
22,2202,2202001,220200100050,Big Guy Men's Air Mantra Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,147
22,2202,2202001,220200100051,Big Guy Men's Air Masai Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,236
22,2202,2202001,220200100052,Big Guy Men's Air Mickey 95 Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,385
22,2202,2202001,220200100053,Big Guy Men's Air Mickey Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,359
22,2202,2202001,220200100056,Big Guy Men's Air MickeyTailwind Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,279
22,2202,2202001,220200100057,Big Guy Men's Air Mickey Willy Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,246
22,2202,2202001,220200100058,Big Guy Men's Air Metal Mickey Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,335
22,2202,2202001,220200100059,Big Guy Men's Air Metal Mickey Shoes VI,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,277
22,2202,2202001,220200100060,Big Guy Men's Air One Eighty  Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,96
22,2202,2202001,220200100061,Big Guy Men's Air Orchestrate Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,147
22,2202,2202001,220200100062,Big Guy Men's Air Outland Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,179
22,2202,2202001,220200100063,Big Guy Men's Air Perish Nb Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,129
22,2202,2202001,220200100065,Big Guy Men's Air Pro I.C Indoor Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,138
22,2202,2202001,220200100066,Big Guy Men's Air Quest Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,170
22,2202,2202001,220200100067,Big Guy Men's Air Quintessential Tw-W Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,200
22,2202,2202001,220200100069,Big Guy Men's Air Reckoning Ii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,150
22,2202,2202001,220200100070,Big Guy Men's Air Reckoning Ii-Tennis Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,143
22,2202,2202001,220200100071,Big Guy Men's Air Rekoning Iii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,137
22,2202,2202001,220200100072,Big Guy Men's Air Skylon Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,197
22,2202,2202001,220200100077,Big Guy Men's Air Span Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,191
22,2202,2202001,220200100078,Big Guy Men's Air Stormy Skylon Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,215
22,2202,2202001,220200100079,Big Guy Men's Air Structure Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,240
22,2202,2202001,220200100082,Big Guy Men's Air Tailwind Iv Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,318
22,2202,2202001,220200100083,Big Guy Men's Air Tailwind  Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,307
22,2202,2202001,220200100084,Big Guy Men's Air Tailwind Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,202
22,2202,2202001,220200100086,Big Guy Men's Air Terra Central Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,225
22,2202,2202001,220200100087,Big Guy Men's Air Terra Clay-Tennis Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,221
22,2202,2202001,220200100089,Big Guy Men's Air Terra Humara Nb Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,268
22,2202,2202001,220200100090,Big Guy Men's Air Terra Reach Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,171
22,2202,2202001,220200100091,Big Guy Men's Air Terra Rise Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,169
22,2202,2202001,220200100092,Big Guy Men's Air Terra Sebec Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,161
22,2202,2202001,220200100093,Big Guy Men's Air Terra Train Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,195
22,2202,2202001,220200100094,Big Guy Men's Air Terra Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,232
22,2202,2202001,220200100096,Big Guy Men's Air Tiempo Pro Ic Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,143
22,2202,2202001,220200100097,Big Guy  Men's Air Trainer Structure Plu Shoe,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,175
22,2202,2202001,220200100098,Big Guy Men's Air Tuned Max Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,252
22,2202,2202001,220200100099,Big Guy Men's Air Tuned Sirocco Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,307
22,2202,2202001,220200100100,Big Guy Men's Air Turbino F.G. Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,168
22,2202,2202001,220200100101,Big Guy Men's Air Turbulence Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,115
22,2202,2202001,220200100104,Big Guy Men's Air Zoom 90 I.C. Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,185
22,2202,2202001,220200100105,Big Guy Men's Air Zoom Beyond-Tennis Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,346
22,2202,2202001,220200100107,Big Guy Men's Air Zoom Citizen Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,346
22,2202,2202001,220200100108,Big Guy Men's Air Zoom Drive Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,260
22,2202,2202001,220200100110,Big Guy Men's Air Zoom Italia F.G Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,355
22,2202,2202001,220200100113,Big Guy Men's Air Zoom Pivot Mid Ii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,268
22,2202,2202001,220200100116,Big Guy Men's Air Zoom Total 90 F.G Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,354
22,2202,2202001,220200100120,Big Guy Men's Cortez Iii Leather Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,130
22,2202,2202001,220200100121,Big Guy Men's Cortez Leather Street Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,134
22,2202,2202001,220200100122,Big Guy Men's Cortez Nbuck-Street Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,165
22,2202,2202001,220200100123,Big Guy Men's Deschutz Slide Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,56
22,2202,2202001,220200100124,Big Guy Men's First Set-Tennis Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,122
22,2202,2202001,220200100126,Big Guy Men's Gts Canvas Plus Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,57
22,2202,2202001,220200100128,Big Guy Men's Hermosa Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,94
22,2202,2202001,220200100129,Big Guy Men's International Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,152
22,2202,2202001,220200100132,Big Guy Men's Klickitat Mid Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,176
22,2202,2202001,220200100134,Big Guy Men's Maniacal Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,95
22,2202,2202001,220200100137,Big Guy Men's Multicourt Ii Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,89
22,2202,2202001,220200100139,Big Guy Men's Payoff Trainer Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,97
22,2202,2202001,220200100142,Big Guy Men's Span Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,205
22,2202,2202001,220200100143,Big Guy Men's Speedy Flight Plus Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,140
22,2202,2202001,220200100144,Big Guy Men's Strap Runner Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,87
22,2202,2202001,220200100145,Big Guy Men's Structure Triax Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,215
22,2202,2202001,220200100146,Big Guy Men's Tennis Classic Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,87
22,2202,2202001,220200100147,Big Guy Men's Terra Humara Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,224
22,2202,2202001,220200100149,Big Guy Men's Ultraccel 2 F.G. Soccer Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,91
22,2202,2202001,220200100153,Big Guy Men's Understudy Cross Train. Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,79
22,2202,2202001,220200100155,Big Guy Men's Zoom Explorage Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,247
22,2202,2202001,220200100156,Big Guy Men'sAir Duration Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,219
22,2202,2202001,220200100158,Delicate Distance Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,13
22,2202,2202001,220200100160,Eclipse Mens Off Court Tennis Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,60
22,2202,2202001,220200100161,Eclipse Women's Off Court Canvas Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,68
22,2202,2202001,220200100165,Sire Air Max-Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,334
22,2202,2202001,220200100166,Sire Air Tailwind 1v Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,279
22,2202,2202001,220200100173,Woman's Air Athena Triax-Running Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,212
22,2202,2202001,220200100235,Woman's Cortez Nubuck-Street Shoes,1303,Eclipse Inc,US,Eclipse Shoes,Shoes,Clothes & Shoes,164
22,2202,2202002,220200200002,Men's Nubuck-Retro Running Shoes Roadster,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,124
22,2202,2202002,220200200004,Allinall Star 2000 Women's Canvas Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,115
22,2202,2202002,220200200005,Allinall Star Men's Canvas Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,78
22,2202,2202002,220200200009,Cruise 1984 Men's Street Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,109
22,2202,2202002,220200200010,Cruise Men's Road Chunk Street Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,121
22,2202,2202002,220200200011,Cruise Platypus Men's Street Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,158
22,2202,2202002,220200200014,Dubby Low Men's Street Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,165
22,2202,2202002,220200200015,Dubby Low Men's Street Shoes Large,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,191
22,2202,2202002,220200200018,Lulu Men's Street Shoes,109,Petterson AB,SE,Shoes,Shoes,Clothes & Shoes,121
22,2202,2202002,220200200021,Pro Fit  Gel Ds Trainer Iv Men's Running Shoe,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,141
22,2202,2202002,220200200022,Pro Fit Gel Ds Trainer Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,100
22,2202,2202002,220200200024,Pro Fit Gel Gt 2030 Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,127
22,2202,2202002,220200200027,Salida Low Men's Outdoor Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,173
22,2202,2202002,220200200031,Soft 1040 Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,78
22,2202,2202002,220200200032,Soft 140 Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,178
22,2202,2202002,220200200034,Soft Alta Plus Men's Indoor Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,193
22,2202,2202002,220200200035,Soft Alta Plus Women's Indoor Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,183
22,2202,2202002,220200200036,Soft Astro Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,110
22,2202,2202002,220200200037,Soft Astro Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,128
22,2202,2202002,220200200038,Soft Court Women's Indoor Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,64
22,2202,2202002,220200200039,Soft Cumulus Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,175
22,2202,2202002,220200200041,Soft Ds Trainer Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,208
22,2202,2202002,220200200042,Soft Ds Trainer Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,233
22,2202,2202002,220200200043,Soft Gel Court Men's Indoor Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,63
22,2202,2202002,220200200045,Soft Gt 2040 Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,207
22,2202,2202002,220200200047,Soft Gt 2050 Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,263
22,2202,2202002,220200200050,Soft Integral Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,213
22,2202,2202002,220200200052,Soft Kayano Men's Running Shoes VI,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,363
22,2202,2202002,220200200054,Soft Kayano Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,379
22,2202,2202002,220200200055,Soft Kayano Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,354
22,2202,2202002,220200200057,Soft Modesto Women's Indoor Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,114
22,2202,2202002,220200200059,Soft Nimbus Men's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,248
22,2202,2202002,220200200060,Soft The Move Women's Running Shoes,1747,Pro Sportswear Inc,US,Shoes,Shoes,Clothes & Shoes,109
22,2202,2202002,220200200062,Top C-Tech 6000 Tennis Shoes,755,Top Sports,DK,Shoes,Shoes,Clothes & Shoes,158
22,2202,2202002,220200200066,Twain Inco Men's Street Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,163
22,2202,2202002,220200200067,Twain Inco Women's Street Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,152
22,2202,2202002,220200200068,Twain Men's Exentric Ii X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,188
22,2202,2202002,220200200069,Twain Men's Exit Ii Low X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,191
22,2202,2202002,220200200070,Twain Men's Exit Iii Mid Cd X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,222
22,2202,2202002,220200200071,Twain Men's Exit Low 2000 Street Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,184
22,2202,2202002,220200200072,Twain Men's Expresso X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,241
22,2202,2202002,220200200077,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,245
22,2202,2202002,220200200078,Twain Women's Exit Low 2000 Street Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,205
22,2202,2202002,220200200079,Twain Women's Expresso X-Hiking Shoes,13198,Twain Inc,US,Shoes,Shoes,Clothes & Shoes,246
22,2202,2202002,220200200080,Ultra M1210 Men's Running Shoes,5503,Ultra Sporting Goods Inc,US,Shoes,Shoes,Clothes & Shoes,337
22,2202,2202002,220200200081,Ultra M878 Men's Running Shoes,5503,Ultra Sporting Goods Inc,US,Shoes,Shoes,Clothes & Shoes,210
22,2202,2202003,220200300007,Low Women's Aerobic Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,117
22,2202,2202003,220200300009,Men's Indoor Shoes Uproar,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,94
22,2202,2202003,220200300012,Men's Mountain Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,156
22,2202,2202003,220200300013,Men's Running Shoes Estes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,115
22,2202,2202003,220200300014,Men's Running Shoes Ozweego,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,156
22,2202,2202003,220200300015,Men's Running Shoes Piedmmont,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,210
22,2202,2202003,220200300016,Men's Running Shoes Supernova,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,186
22,2202,2202003,220200300017,Men's Shoes Solace,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,178
22,2202,2202003,220200300018,Men's Shoes Tegern,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,114
22,2202,2202003,220200300020,Men's Skate Shoes Revel,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,135
22,2202,2202003,220200300021,Men's Street Shoes Cou,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,117
22,2202,2202003,220200300022,Men's Street Shoes Gazelle,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,131
22,2202,2202003,220200300025,Mid Women's Aerobic Shoes X,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,151
22,2202,2202003,220200300027,Smith Men's Street Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,116
22,2202,2202003,220200300032,Vigil Women's Tennis Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,134
22,2202,2202003,220200300033,Women's Aerobic Shoes Psych,16733,Fuller Trading Co.,CA,Tracker Shoes,Shoes,Clothes & Shoes,138
22,2202,2202003,220200300035,Women's Aerobic Shoes Speedster,16733,Fuller Trading Co.,CA,Tracker Shoes,Shoes,Clothes & Shoes,87
22,2202,2202003,220200300036,Women's Crosstraining Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,171
22,2202,2202003,220200300040,Women's Running Shoes Piedmont,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,199
22,2202,2202003,220200300051,Armadillo Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,109
22,2202,2202003,220200300052,Armadillo Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,124
22,2202,2202003,220200300056,Banto Light Men's Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,172
22,2202,2202003,220200300060,Cross Ripple Women's Street Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,147
22,2202,2202003,220200300061,Damaskus Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,196
22,2202,2202003,220200300062,Damaskus Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,190
22,2202,2202003,220200300066,Hawk Logo Women's Tennis Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,63
22,2202,2202003,220200300069,Hgf Incentive Men's Tennis Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,197
22,2202,2202003,220200300070,Hgf Low Men's Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,184
22,2202,2202003,220200300071,Hgf  Low Women's Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,190
22,2202,2202003,220200300072,Hgf Tarantula Men's Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,181
22,2202,2202003,220200300073,Hi Resolution Men's Tennis Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,144
22,2202,2202003,220200300076,Hi Response Women's Aerobic Shoes Large,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,157
22,2202,2202003,220200300077,Hilly Men's Crosstrainer Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,94
22,2202,2202003,220200300078,Hilly Women's Crosstrainer Shoes Large,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,89
22,2202,2202003,220200300079,Hilly Women's Crosstrainer Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,117
22,2202,2202003,220200300080,Hilo Mid Iii Women's Aerobic Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,123
22,2202,2202003,220200300081,Hilo Mid Women's Aerobic Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,110
22,2202,2202003,220200300082,Indoor Handbold Special Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,130
22,2202,2202003,220200300086,Mns Gazelle Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,252
22,2202,2202003,220200300087,Mns Light 4 Low  Women's Volley Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,209
22,2202,2202003,220200300088,Mns Mercury Crosstrainer Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,230
22,2202,2202003,220200300094,Mns.fastpace Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,262
22,2202,2202003,220200300095,Mns.light 4 Low Men's Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,215
22,2202,2202003,220200300098,Mns.riding Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,244
22,2202,2202003,220200300100,Mns.super Women's Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,135
22,2202,2202003,220200300101,Mns.winner Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,237
22,2202,2202003,220200300102,Mns.xzs Women's Aerobic Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,250
22,2202,2202003,220200300103,Multi L Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,104
22,2202,2202003,220200300106,Multi Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,145
22,2202,2202003,220200300107,Polly Millennium Men's Tennis Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,153
22,2202,2202003,220200300110,Qrs Men's Street Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,108
22,2202,2202003,220200300115,South Peak Men's Light Low Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,154
22,2202,2202003,220200300116,South Peak Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,154
22,2202,2202003,220200300117,South Peak Women's Light Indoor Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,183
22,2202,2202003,220200300120,Starlite Men's Street Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,137
22,2202,2202003,220200300121,Starlite Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,153
22,2202,2202003,220200300123,The Gonzales Men's Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,213
22,2202,2202003,220200300124,The Jet Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,132
22,2202,2202003,220200300126,The Wish L Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,94
22,2202,2202003,220200300127,The Wish M Men's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,87
22,2202,2202003,220200300129,Torino Men's Leather Adventure Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,151
22,2202,2202003,220200300130,Torino Men's Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,136
22,2202,2202003,220200300131,Torino Women's Leather Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,127
22,2202,2202003,220200300136,Trainer Women's Crosstrainer Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,61
22,2202,2202003,220200300137,Trapper Men's Crosstrainer Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,172
22,2202,2202003,220200300142,Vishnu Women's Running Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,203
22,2202,2202003,220200300143,W.a..trainer Leather Shoes,2963,3Top Sports,US,Tracker Shoes,Shoes,Clothes & Shoes,130
22,2202,2202003,220200300146,Arctic Children's Shoes,16733,Fuller Trading Co.,CA,Tracker Shoes,Shoes,Clothes & Shoes,62
22,2202,2202003,220200300151,Hardcore Junior/Women's Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,159
22,2202,2202003,220200300152,Hardcore Junior/Women's Street Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,160
22,2202,2202003,220200300153,Hardcore Junior/Women's Street Shoes Small,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,154
22,2202,2202003,220200300154,Hardcore Junior/Women's Street Shoes Large,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,150
22,2202,2202003,220200300155,Hardcore Men's Street Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,140
22,2202,2202003,220200300157,Hardcore Men's Street Shoes Large,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,142
22,2202,2202003,220200300158,Hardcore Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,172
22,2202,2202003,220200300159,Hispeed Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,174
22,2202,2202003,220200300160,Low Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,209
22,2202,2202003,220200300162,N.d.gear Men's Galileo Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,77
22,2202,2202003,220200300163,Traverse Junior/Women's Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,193
22,2202,2202003,220200300164,Traverse Shoes,14682,Greenline Sports Ltd,GB,Tracker Shoes,Shoes,Clothes & Shoes,154
24,2401,2401001,240100100229,Cruise First Star Baby Shoes,109,Petterson AB,SE,Assorted Sports articles,Assorted Sports Articles,Sports,33
24,2401,2401001,240100100429,"Shoelace 140 Cm, Assorted Colours",3815,Roll-Over Inc,US,Assorted Sports articles,Assorted Sports Articles,Sports,8
24,2401,2401001,240100100430,Shoelace Black 100 Cm,5810,Teamsports Inc,US,Assorted Sports articles,Assorted Sports Articles,Sports,5
24,2401,2401001,240100100431,Shoelace Black 150 Cm,5810,Teamsports Inc,US,Assorted Sports articles,Assorted Sports Articles,Sports,5
24,2401,2401001,240100100433,Shoelace White 150 Cm,5810,Teamsports Inc,US,Assorted Sports articles,Assorted Sports Articles,Sports,5
24,2401,2401001,240100100434,Shoeshine Black,16814,CrystalClear Optics Inc,CA,Assorted Sports articles,Assorted Sports Articles,Sports,27
24,2401,2401001,240100100437,Shoeshine Olive,16814,CrystalClear Optics Inc,CA,Assorted Sports articles,Assorted Sports Articles,Sports,65
24,2401,2401001,240100100601,Fred Shoes,4742,Luna sastreria S.A.,ES,Assorted Sports articles,Assorted Sports Articles,Sports,89
24,2402,2402001,240200100037,Bretagne Difference 2000 Goretex Shoes,2995,Van Dammeren International,NL,Golf,Golf,Sports,398
24,2402,2402001,240200100043,Bretagne Performance Tg Men's Golf Shoes L.,2995,Van Dammeren International,NL,Golf,Golf,Sports,271
24,2402,2402001,240200100051,Bretagne Stabilites 2000 Goretex Shoes,2995,Van Dammeren International,NL,Golf,Golf,Sports,285
24,2402,2402001,240200100052,Bretagne Stabilities Tg Men's Golf Shoes,2995,Van Dammeren International,NL,Golf,Golf,Sports,203
24,2402,2402001,240200100053,Bretagne Stabilities Women's Golf Shoes,2995,Van Dammeren International,NL,Golf,Golf,Sports,177
24,2402,2402001,240200100225,Rubby Men's Golf Shoes w/Goretex,4168,Rubby Zapatos S.A.,ES,Golf,Golf,Sports,302
24,2402,2402001,240200100226,Rubby Men's Golf Shoes w/Goretex Plain Toe,4168,Rubby Zapatos S.A.,ES,Golf,Golf,Sports,350
24,2402,2402001,240200100227,Rubby Women's Golf Shoes w/Gore-Tex,4168,Rubby Zapatos S.A.,ES,Golf,Golf,Sports,295
24,2402,2402001,240200100228,Rubby Women's Golf Shoes w/Goretex S,4168,Rubby Zapatos S.A.,ES,Golf,Golf,Sports,283
24,2402,2402001,240200100229,Rubby Women's Golf Shoes w/Goretex,4168,Rubby Zapatos S.A.,ES,Golf,Golf,Sports,314
;;;;
run;

data ORION.SPECIALSALS;
   attrib Employee_ID length=8;
   attrib Salary length=8;
   attrib Dept length=$6;

   infile datalines dsd;
   input
      Employee_ID
      Salary
      Dept
   ;
datalines4;
110004,42000,HUMRES
110009,34000,ENGINR
110011,27000,FINANC
110036,20000,ENGINR
110037,19000,ENGINR
110048,19000,FINANC
110077,27000,ADMIN
110097,20000,ADMIN
110107,31000,ENGINR
110123,20000,ADMIN
110155,27000,ADMIN
110171,44000,SALES
110188,37000,HUMRES
110196,43000,ADMIN
110210,31000,ADMIN
110222,250000,SALES
110236,41000,ADMIN
110239,42000,FINANC
110259,32000,ADMIN
110260,39000,ADMIN
110262,36000,FINANC
110272,22000,ENGINR
110290,37000,ENGINR
110302,18000,HUMRES
110333,36000,ADMIN
110367,33000,FINANC
110372,36000,HUMRES
110379,25000,ADMIN
110388,25000,ADMIN
110402,28000,FINANC
110407,61000,FINANC
110421,31000,HUMRES
110424,17000,HUMRES
110427,27000,ADMIN
110440,17000,ADMIN
110454,45000,FINANC
110463,39000,SALES
110465,27000,FINANC
110470,40000,SALES
;;;;
run;

data ORION.TEST_ANSWERS;
   attrib Employee_ID length=8;
   attrib Q1 length=$1;
   attrib Q2 length=$1;
   attrib Q3 length=$1;
   attrib Q4 length=$1;
   attrib Q5 length=$1;
   attrib Q6 length=$1;
   attrib Q7 length=$1;
   attrib Q8 length=$1;
   attrib Q9 length=$1;
   attrib Q10 length=$1;

   infile datalines dsd;
   input
      Employee_ID
      Q1
      Q2
      Q3
      Q4
      Q5
      Q6
      Q7
      Q8
      Q9
      Q10
   ;
datalines4;
121044,A,C,C,B,D,E,D,B,B,A
120145,B,C,C,,E,E,D,B,A,A
120761,A,C,C,B,D,D,E,B,B,C
120656,B,C,C,A,D,B,B,C,A,D
121107,A,C,C,B,E,E,D,B,B,A
121038,B,C,C,B,D,D,D,B,B,A
120273,C,C,C,B,E,E,E,B,B,A
120759,A,C,C,B,E,E,D,B,B,A
120798,,A,C,B,D,D,D,B,B,A
121030,C,C,C,C,E,E,D,B,B,B
121017,B,B,E,B,E,E,D,B,B,A
121062,A,C,C,B,E,E,D,B,B,A
121119,C,C,C,B,E,E,D,B,B,A
120812,A,C,C,B,E,E,E,B,B,A
120756,A,C,C,B,E,E,D,B,B,A
;;;;
run;

data ORION.TRAVEL_EXPENSE;
   attrib Trip_ID length=$6;
   attrib Employee_ID length=8;
   attrib Exp1 length=8;
   attrib Exp2 length=8;
   attrib Exp3 length=8;
   attrib Exp4 length=8;
   attrib Exp5 length=8;

   infile datalines dsd;
   input
      Trip_ID
      Employee_ID
      Exp1
      Exp2
      Exp3
      Exp4
      Exp5
   ;
datalines4;
1044-1,121044,345.97,568.54,235,320,
0145-1,120145,256,675.9,343.25,125,67.5
0656-1,120656,312.26,,236.98,325,45
1119-1,121119,597.8,780.99,345.87,195,50.75
0812-1,120812,345.24,865.45,534.2,430.5,76.75
0754-1,120754,456,677.4,348.9,,67
0198-1,120198,,175.9,173.25,167.4,65.5
0728-1,120728,256,675,215.25,205,95.5
0724-1,120724,,,343.85,125.45,61.18
1137-1,121137,564.9,345.87,267.5,120,50
;;;;
run;

data ORION.USORDERS04;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Order_Type length=8 label='Order Type';
   attrib Quantity length=8 label='Quantity Ordered';
   attrib Total_Retail_Price length=8 label='Total Retail Price for This Product' format=DOLLAR13.2;
   attrib Customer_Group length=$40 label='Customer Group Name';
   attrib Customer_Gender length=$1 label='Customer Gender';
   attrib Customer_BirthDate length=8 label='Customer Birth Date' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Customer_ID
      Customer_Name
      Order_Type
      Quantity
      Total_Retail_Price
      Customer_Group
      Customer_Gender
      Customer_BirthDate
   ;
datalines4;
1241054779,24,Robyn Klem,3,2,195.6,Internet/Catalog Customers,F,1248
1241063739,89,Wynella Lewis,1,6,160.8,Orion Club members,F,-7765
1241286432,27,Cynthia Mccluney,3,2,174.4,Internet/Catalog Customers,F,4853
1241359997,12,David Black,1,1,117.6,Orion Club members,M,4850
1241461856,18,Tonie Asmussen,1,1,29.4,Orion Club members,M,-698
1241623505,24,Robyn Klem,3,1,46.9,Internet/Catalog Customers,F,1248
1241652707,27,Cynthia Mccluney,3,3,140.7,Internet/Catalog Customers,F,4853
1241686210,10,Karen Ballinger,1,1,32.6,Orion Club members,F,10518
1241715610,92,Lendon Celii,1,1,16.9,Orion Club members,M,-4126
1241731828,31,Cynthia Martinez,1,1,41.5,Orion Club Gold members,F,1314
1241731828,31,Cynthia Martinez,1,1,22.7,Orion Club Gold members,F,1314
1241895594,56,Roy Siferd,1,1,13.5,Orion Club members,M,-8004
1241895594,56,Roy Siferd,1,2,24.4,Orion Club members,M,-8004
1241930625,27,Cynthia Mccluney,3,1,56.3,Internet/Catalog Customers,F,4853
1241930625,27,Cynthia Mccluney,3,1,58.7,Internet/Catalog Customers,F,4853
1241930625,27,Cynthia Mccluney,3,1,90,Internet/Catalog Customers,F,4853
1242012259,10,Karen Ballinger,1,2,19.2,Orion Club members,F,10518
1242012259,10,Karen Ballinger,1,2,231.6,Orion Club members,F,10518
1242012269,45,Dianne Patchin,1,3,73.8,Orion Club Gold members,F,8526
1242012269,45,Dianne Patchin,1,4,142.4,Orion Club Gold members,F,8526
1242076538,31,Cynthia Martinez,3,1,57.3,Orion Club Gold members,F,1314
1242130888,92,Lendon Celii,1,3,160.5,Orion Club members,M,-4126
1242140006,5,Sandrina Stephano,3,1,31.4,Orion Club Gold members,F,8590
1242140009,90,Kyndal Hooks,2,1,192.4,Orion Club Gold members,F,3135
1242140009,90,Kyndal Hooks,2,1,16.4,Orion Club Gold members,F,3135
1242149082,90,Kyndal Hooks,1,4,56.8,Orion Club Gold members,F,3135
1242149082,90,Kyndal Hooks,1,1,14.3,Orion Club Gold members,F,3135
1242159212,5,Sandrina Stephano,3,2,446.6,Orion Club Gold members,F,8590
1242265757,10,Karen Ballinger,1,3,79.8,Orion Club members,F,10518
1242449327,27,Cynthia Mccluney,3,2,91.6,Internet/Catalog Customers,F,4853
1242458099,10,Karen Ballinger,1,1,12.2,Orion Club members,F,10518
1242467585,34,Alvan Goheen,3,5,239.5,Orion Club members,M,10244
1242467585,34,Alvan Goheen,3,2,403,Orion Club members,M,10244
1242477751,31,Cynthia Martinez,3,2,277.6,Orion Club Gold members,F,1314
1242477751,31,Cynthia Martinez,3,2,120.4,Orion Club Gold members,F,1314
1242493791,5,Sandrina Stephano,1,2,126.8,Orion Club Gold members,F,8590
1242502670,31,Cynthia Martinez,1,2,195,Orion Club Gold members,F,1314
1242502670,31,Cynthia Martinez,1,2,16,Orion Club Gold members,F,1314
1242557584,89,Wynella Lewis,2,2,134.6,Orion Club members,F,-7765
1242610991,12,David Black,1,2,48.4,Orion Club members,M,4850
1242647539,45,Dianne Patchin,1,2,56,Orion Club Gold members,F,8526
1242657273,90,Kyndal Hooks,1,3,33.6,Orion Club Gold members,F,3135
1242691897,90,Kyndal Hooks,2,2,110.2,Orion Club Gold members,F,3135
1242736731,10,Karen Ballinger,1,3,80.7,Orion Club members,F,10518
1242773202,24,Robyn Klem,3,2,70.2,Internet/Catalog Customers,F,1248
1242782701,27,Cynthia Mccluney,3,3,403.5,Internet/Catalog Customers,F,4853
1242827683,10,Karen Ballinger,1,1,21.99,Orion Club members,F,10518
1242836878,10,Karen Ballinger,1,2,60.6,Orion Club members,F,10518
1243026971,10,Karen Ballinger,1,2,252.2,Orion Club members,F,10518
1243110343,10,Karen Ballinger,1,3,60.9,Orion Club members,F,10518
1243110343,10,Karen Ballinger,1,2,134,Orion Club members,F,10518
1243152030,45,Dianne Patchin,1,1,40.2,Orion Club Gold members,F,8526
1243152039,90,Kyndal Hooks,1,2,47.6,Orion Club Gold members,F,3135
1243198099,10,Karen Ballinger,1,3,256.2,Orion Club members,F,10518
1243198099,10,Karen Ballinger,1,3,199.2,Orion Club members,F,10518
1243279343,27,Cynthia Mccluney,3,2,78.4,Internet/Catalog Customers,F,4853
1243290080,31,Cynthia Martinez,1,1,50.3,Orion Club Gold members,F,1314
1243290089,45,Dianne Patchin,1,1,78.2,Orion Club Gold members,F,8526
1243315613,5,Sandrina Stephano,1,1,52.5,Orion Club Gold members,F,8590
1243398628,12,David Black,1,1,87.2,Orion Club members,M,4850
1243417726,69,Patricia Bertolozzi,1,1,23.5,Orion Club members,F,8533
1243462945,24,Robyn Klem,3,1,46.1,Internet/Catalog Customers,F,1248
1243515588,89,Wynella Lewis,1,1,251.8,Orion Club members,F,-7765
1243515588,89,Wynella Lewis,1,1,114.2,Orion Club members,F,-7765
1243568955,31,Cynthia Martinez,1,1,172.5,Orion Club Gold members,F,1314
1243670182,69,Patricia Bertolozzi,1,1,3.2,Orion Club members,F,8533
1243680376,31,Cynthia Martinez,1,1,63.5,Orion Club Gold members,F,1314
1243797399,10,Karen Ballinger,1,1,321.5,Orion Club members,F,10518
1243797399,10,Karen Ballinger,1,2,1066.4,Orion Club members,F,10518
1243815198,10,Karen Ballinger,1,1,35.5,Orion Club members,F,10518
1243815198,10,Karen Ballinger,1,4,471.2,Orion Club members,F,10518
1243951648,34,Alvan Goheen,1,1,86.3,Orion Club members,M,10244
1243960910,90,Kyndal Hooks,1,2,69.4,Orion Club Gold members,F,3135
1244107612,45,Dianne Patchin,1,2,126,Orion Club Gold members,F,8526
1244107612,45,Dianne Patchin,1,5,118,Orion Club Gold members,F,8526
1244117101,45,Dianne Patchin,1,2,19.98,Orion Club Gold members,F,8526
1244117101,45,Dianne Patchin,1,2,45.7,Orion Club Gold members,F,8526
1244117109,49,Annmarie Leveille,1,2,24.8,Orion Club Gold members,F,10424
1244171290,31,Cynthia Martinez,1,3,760.8,Orion Club Gold members,F,1314
1244181114,10,Karen Ballinger,1,2,48.2,Orion Club members,F,10518
1244181114,10,Karen Ballinger,1,3,95.1,Orion Club members,F,10518
1244197366,89,Wynella Lewis,1,4,75.2,Orion Club members,F,-7765
1244296274,5,Sandrina Stephano,1,2,33.8,Orion Club Gold members,F,8590
;;;;
run;

data ORION.US_NEWHIRE;
   attrib ID length=$15;
   attrib Telephone length=8;
   attrib Birthday length=$9;

   infile datalines dsd;
   input
      ID
      Telephone
      Birthday
   ;
datalines4;
120-012-40-4928,5467887,05DEC1972
120-012-83-3816,6888321,03MAY1969
120-341-44-0781,9418123,23NOV1976
120-423-01-7721,7839191,28JUN1971
120-448-23-8111,9428122,30NOV1964
120-723-14-8422,8280911,12FEB1968
120-819-32-1294,3878181,01SEP1972
120-831-34-2411,9677810,24DEC1976
120-837-33-8374,9927615,06OCT1975
120-877-22-7731,2337449,08JUL1973
;;;;
run;

data ORION.WEB_ORDERS;
   attrib Product_ID length=$12;
   attrib Quantity length=8;
   attrib Customer length=$20;

   infile datalines dsd;
   input
      Product_ID
      Quantity
      Customer
   ;
datalines4;
120400305288,16,Carglar Aydemir
120400305288,19,Sanelisiwe Collier
120400305846,13,Candy Kinsey
120400305846,13,Cynthia Martinez
120400305846,10,Rolf Robak
120400308766,13,Ahmet Canko
120400310496,15,Oliver S. Füßling
120400311220,13,Ramesh Trentholme
120400311220,9,Avni Argac
120400311465,13,Thomas Leitmann
120400312556,7,Robyn Klem
120400315078,23,Tonie Asmussen
120400315870,2,Serdar Yucel
120400315870,24,Raedene Van Den Berg
120400315870,20,Rita Lotz
120400315870,28,Bill Cuddy
120400315870,17,Avinoam Zweig
120400316344,19,Dianne Patchin
120400316344,15,Annmarie Leveille
120400316344,2,Cosi Rimmington
120400316890,15,Avni Umran
120400316890,19,Bulent Urfalioglu
120400316890,17,Selim Okay
120400317237,5,Jimmie Evans
120400319976,29,Cynthia Mccluney
120400319976,8,Candy Kinsey
120400319976,15,Cynthia Martinez
120400319976,1,Rolf Robak
120400319976,23,Alvan Goheen
120400326278,10,Theunis Brazier
120400327731,2,Alvan Goheen
120400327731,21,Phenix Hill
120400327731,21,Alphone Greenwald
120400327731,13,Wendell Summersby
120400329573,3,Avinoam Zweig
120400329573,19,Eyal Bloch
120400329573,18,Susan Krasowski
120400329573,3,Michael Dineley
120400329573,14,Tulio Devereaux
120400333060,1,Michael Dineley
120400333060,23,Tulio Devereaux
120400333060,16,Robyn Klem
120400333060,30,Cynthia Mccluney
;;;;
run;

data ORION.WEB_ORDERS2;
   attrib Product_ID length=$12;
   attrib Quantity length=8;
   attrib Name length=$20;

   infile datalines dsd;
   input
      Product_ID
      Quantity
      Name
   ;
datalines4;
120400305288,16,Carglar Aydemir
120400305288,19,Sanelisiwe Collier
120400305846,13,Candy Kinsey
120400305846,13,Cynthia Martinez
120400305846,10,Rolf Robak
120400308766,13,Ahmet Canko
120400310496,15,Oliver S. Füßling
120400311220,13,Ramesh Trentholme
120400311220,9,Avni Argac
120400311465,13,Thomas Leitmann
120400312556,7,Robyn Klem
120400315078,23,Tonie Asmussen
120400315870,2,Serdar Yucel
120400315870,24,Raedene Van Den Berg
120400315870,20,Rita Lotz
120400315870,28,Bill Cuddy
120400315870,17,Avinoam Zweig
120400316344,19,Dianne Patchin
120400316344,15,Annmarie Leveille
120400316344,2,Cosi Rimmington
120400316890,15,Avni Umran
120400316890,19,Bulent Urfalioglu
120400316890,17,Selim Okay
120400317237,5,Jimmie Evans
120400319976,29,Cynthia Mccluney
120400319976,8,Candy Kinsey
120400319976,15,Cynthia Martinez
120400319976,1,Rolf Robak
120400319976,23,Alvan Goheen
120400326278,10,Theunis Brazier
120400327731,2,Alvan Goheen
120400327731,21,Phenix Hill
120400327731,21,Alphone Greenwald
120400327731,13,Wendell Summersby
120400329573,3,Avinoam Zweig
120400329573,19,Eyal Bloch
120400329573,18,Susan Krasowski
120400329573,3,Michael Dineley
120400329573,14,Tulio Devereaux
120400333060,1,Michael Dineley
120400333060,23,Tulio Devereaux
120400333060,16,Robyn Klem
120400333060,30,Cynthia Mccluney
;;;;
run;

data ORION.WEB_PRODUCTS;
   attrib Product_ID length=$12;
   attrib Price length=8;
   attrib Product_Name length=$37;

   infile datalines dsd;
   input
      Product_ID
      Price
      Product_Name
   ;
datalines4;
120400304333,114.36,Smasher Super Rq Ti 350 Tennis Racket
120400305288,53.26,Knife
120400305846,107.74,Big Guy Men's Air Deschutz Viii Shoes
120400308766,40.96,Big Guy Men's Packable Hiking Shorts
120400308849,12.23,Wood Box for 6 Balls
120400310496,128.99,Comfort Shelter
120400311211,69.16,Tipee Summer Sleeping Bag
120400311220,160.49,Perfect Fit Men's Stunt Skates
120400315870,156.49,Grandslam Ultra Power Tennisketcher
120400316344,181.51,Pro-roll Sabotage-Rp  Roller Skates
120400316890,92.04,Red/White/Black Staff 9 Bag
120400317183,164.82,Smasher Rd Ti 70 Tennis Racket
120400317237,89.64,Tent Summer 195 Twin Sleeping Bag
120400319976,184.72,Smasher Super Rq Ti 700 Long Tennis
120400327731,140.75,Lucky Voss Jacket
120400329573,137.01,"Memhis 350,Yellow Medium, 6-pack tube"
120400329978,114.47,Tipee Twin Blue/Orange
120400330339,31.74,"Small Belt Bag, Black"
120400330967,38.73,Duwall Pants
120400333060,162.99,4men Men's Polar Down Jacket
;;;;
run;

data ORION.WEB_PRODUCTS2;
   attrib Product_ID length=8;
   attrib Price length=8;
   attrib Name length=$37;

   infile datalines dsd;
   input
      Product_ID
      Price
      Name
   ;
datalines4;
120400304333,114.36,Smasher Super Rq Ti 350 Tennis Racket
120400305288,53.26,Knife
120400305846,107.74,Big Guy Men's Air Deschutz Viii Shoes
120400308766,40.96,Big Guy Men's Packable Hiking Shorts
120400308849,12.23,Wood Box for 6 Balls
120400310496,128.99,Comfort Shelter
120400311211,69.16,Tipee Summer Sleeping Bag
120400311220,160.49,Perfect Fit Men's Stunt Skates
120400315870,156.49,Grandslam Ultra Power Tennisketcher
120400316344,181.51,Pro-roll Sabotage-Rp  Roller Skates
120400316890,92.04,Red/White/Black Staff 9 Bag
120400317183,164.82,Smasher Rd Ti 70 Tennis Racket
120400317237,89.64,Tent Summer 195 Twin Sleeping Bag
120400319976,184.72,Smasher Super Rq Ti 700 Long Tennis
120400327731,140.75,Lucky Voss Jacket
120400329573,137.01,"Memhis 350,Yellow Medium, 6-pack tube"
120400329978,114.47,Tipee Twin Blue/Orange
120400330339,31.74,"Small Belt Bag, Black"
120400330967,38.73,Duwall Pants
120400333060,162.99,4men Men's Polar Down Jacket
;;;;
run;


proc datasets lib=ORION nolist nowarn;
   modify CONTINENT ;
       ic create Primary Key (Continent_ID );
quit;

proc datasets lib=ORION nolist nowarn;
   modify COUNTRY ;
      index create Country ;
      index create Continent_ID ;
   modify PRODUCT_DIM ;
      index create Product_Category ;
      index create Product_Line ;
      index create Product_Group ;
   modify PRODUCT_LIST ;
      index create Product_Level ;
quit;

proc contents data=ORION._all_ nods;
run;

filename mydata "&rawdata";

data _null_;
infile datalines truncover length=length;
input;
file mydata(address.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
Ms. Sue Farr
15 Harvey Rd.
Macon, GA  31298
869-7008
Dr. Kay B. Cox
163 McNeil Pl.
Kern, CA  93280
483-3321
Mr. Ron Mason
442 Glen Ave.
Miami, FL  33054
589-9030
Ms. G. H. Ruth
2491 Brady St.
Munger, MI  48747
754-3582
Prof. Helen-Ashe H. Florentino
PO Box 2253
Washington, DC 22008
237-0893
Ms. Jan F. Van Allsburg
25 Chesire Pl.
Short Hills, NJ  07078
561-4832
Mr. Stanley X. Laff
1725 Airport Rd.
Springfield, IL  62707
421-5623
Mr. George Q. Rizen
11234 W Hoyt St.
Chicago, IL  60612
742-4513
Dr. Marc J. Mitchell
922 Mitchell Circle
Chicago, IL  60603
741-3982
Ms. Dorothy E. Mills
34 Clear Sky Rd.
Butte, MT  59750
284-3023
Dr. Jonathan W. Webb
1012 Hwy 54
Morrisville, NC  27560
271-9017
Mr. Maynard J. Keenan
1315 Green Valley Ln.
Sedona, AZ  86351
852-2034
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(salesemp.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou           Sales Manager       108255 AU
120103 Wilson     Dawes          Sales Manager       87975  AU
120121 Irenie     Elvish         Sales Rep. II       26600  AU
120122 Christina  Ngan           Sales Rep. II       27475  AU
120123 Kimiko     Hotstone       Sales Rep. I        26190  AU
120124 Lucian     Daymond        Sales Rep. I        26480  AU
120125 Fong       Hofmeister     Sales Rep. IV       32040  AU
120126 Satyakam   Denny          Sales Rep. II       26780  AU
120127 Sharryn    Clarkson       Sales Rep. II       28100  AU
120128 Monica     Kletschkus     Sales Rep. IV       30890  AU
120129 Alvin      Roebuck        Sales Rep. III      30070  AU
120130 Kevin      Lyon           Sales Rep. I        26955  AU
120131 Marinus    Surawski       Sales Rep. I        26910  AU
120132 Fancine    Kaiser         Sales Rep. III      28525  AU
120133 Petrea     Soltau         Sales Rep. II       27440  AU
120134 Sian       Shannan        Sales Rep. II       28015  AU
120135 Alexei     Platts         Sales Rep. IV       32490  AU
120136 Atul       Leyden         Sales Rep. I        26605  AU
120137 Marina     Iyengar        Sales Rep. III      29715  AU
120138 Shani      Duckett        Sales Rep. I        25795  AU
120139 Fang       Wilson         Sales Rep. II       26810  AU
120140 Michael    Minas          Sales Rep. I        26970  AU
120141 Amanda     Liebman        Sales Rep. II       27465  AU
120142 Vincent    Eastley        Sales Rep. III      29695  AU
120143 Phu        Sloey          Sales Rep. II       26790  AU
120144 Viney      Barbis         Sales Rep. III      30265  AU
120145 Sandy      Aisbitt        Sales Rep. II       26060  AU
120146 Wendall    Cederlund      Sales Rep. I        25985  AU
120147 Skev       Rusli          Sales Rep. II       26580  AU
120148 Michael    Zubak          Sales Rep. III      28480  AU
120149 Judy       Chantharasy    Sales Rep. I        26390  AU
120150 John       Filo           Sales Rep. III      29965  AU
120151 Julianna   Phaiyakounh    Sales Rep. II       26520  AU
120152 Sean       Dives          Sales Rep. I        26515  AU
120153 Samantha   Waal           Sales Rep. I        27260  AU
120154 Caterina   Hayawardhana a Sales Rep. III      30490  AU
120155 Narelle    James          Sales Rep. III      29990  AU
120156 Gerry      Snellings      Sales Rep. I        26445  AU
120157 Leonid     Karavdic       Sales Rep. II       27860  AU
120158 Daniel     Pilgrim        Sales Rep. III      36605  AU
120159 Lynelle    Phoumirath     Sales Rep. IV       30765  AU
120160 Chuck      Segrave        Sales Rep. I        27115  AU
120161 Rosette    Martines       Sales Rep. III      30785  AU
120162 Randal     Scordia        Sales Rep. I        27215  AU
120163 Brett      Magrath        Sales Rep. II       26735  AU
120164 Ranj       Stamalis       Sales Rep. II       27450  AU
120165 Tadashi    Pretorius      Sales Rep. I        27050  AU
120166 Fadi       Nowd           Sales Rep. IV       30660  AU
120167 Kimiko     Tilley         Sales Rep. I        25185  AU
120168 Selina     Barcoe         Sales Rep. I        25275  AU
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(charity.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
 AQI  495  CCI  200  CNI 249
CS  279  CU  780   DAI
875 ES  290  FFC 0  MI 745
SBA 900 V2 550 YYCR 0
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(emps.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
121044  Abbott, Ray                              2267      Edwards Mill Rd                          Miami-Dade                     FL        33135      US
120145  Aisbitt, Sandy                           30        Bingera Street                           Melbourne                                2001       AU
120761  Akinfolarin, Tameaka                     5         Donnybrook Rd                            Philadelphia                   PA        19145      US
120656  Amos, Salley                             3524      Calico Ct                                San Diego                      CA        92116      US
121107  Anger, Rose                              744       Chapwith Rd                              Philadelphia                   PA        19142      US
121038  Anstey, David                            939       Hilltop Needmore Rd                      Miami-Dade                     FL        33157      US
120273  Antonini, Doris                          681       Ferguson Rd                              Miami-Dade                     FL        33141      US
120759  Apr, Nishan                              105       Brack Penny Rd                           San Diego                      CA        92071      US
120798  Ardskin, Elizabeth                       701       Glenridge Dr                             Miami-Dade                     FL        33177      US
121030  Areu, Jeryl                              265       Fyfe Ct                                  Miami-Dade                     Fl        33133      US
121017  Arizmendi, Gilbert                       379       Englehardt Dr                            San Diego                      CA        91950      US
121062  Armant, Debra                            10398     Crown Forest Ct                          San Diego                      CA        92025      US
121119  Armogida, Bruce                          1914      Lansing St                               Philadelphia                   PA        19119      US
120812  Arruza, Fauver                           265       Fyfe Ct                                  Miami-Dade                     FL        33133      US
120756  Asta, Wendy                              3565      Lake Park Dr                             Philadelphia                   PA        19145      US
120754  Atkins, John                             6137      Blue Water Ct                            Miami-Dade                     FL        33161      US
120185  Bahlman, Sharon                          24        LaTrobe Street                           Sydney                                   2165       AU
120109  Baker, Gabriele                          166       Toorak Road                              Sydney                                   2119       AU
120710  Baltzell, Timothy                        31        Castalia Dr                              Philadelphia                   PA        19140      US
121007  Banaszak, John                           77        Lake Tillery Dr                          Philadelphia                   PA        19139      US
121011  Banchi, Steven                           522       Buncombe St                              Miami-Dade                     FL        33031      US
120188  Baran, Shanmuganathan                    207       Canterbury Road                          Sydney                                   1225       AU
120144  Barbis, Viney                            3         Alice Street                             Sydney                                   2114       AU
120168  Barcoe, Selina                           435       Sherwood Rd                              Melbourne                                8003       AU
120182  Barreto, Geok-Seng                       241       Royal Perade                             Sydney                                   1115       AU
121049  Bataineh, Perrior                        892       Birchland Dr                             San Diego                      CA        92126      US
120998  Benedicto, Tondelayo                     2902      Gable Ridge Ln                           San Diego                      CA        92118      US
120800  Benyami, Fred                            1498      Falconwood Dr                            San Diego                      CA        92069      US
120811  Bergeron-Jeter, Dale                     2356      Aileen Dr                                Miami-Dade                     FL        33010      US
120733  Bezinque, Michael                        2732      Bell Dr                                  Miami-Dade                     FL        33033      US
120104  Billington, Kareen                       40        Smith Street                             Sydney                                   1670       AU
120735  Bilobran, Brenda                         11217     Avent Ferry Rd                           Miami-Dade                     FL        33160      US
121035  Blackley, James                          41        Dubose St                                San Diego                      CA        92110      US
120183  Blanton, Brig                            6         Palmiston Cresent                        Melbourne                                3150       AU
121141  Bleu, Henri Le                           29        Joliesse Ln                              Philadelphia                   PA        19103      US
120993  Boatright, Lorraine                      110       Glascock St                              San Diego                      CA        91950      US
120198  Body, Meera                              51        Martin Place                             Sydney                                   1131       AU
121006  Bolster, Bernard                         77        Braswell Ct                              San Diego                      CA        91950      US
121116  Bond-Teague, Mary                        24        Bashford Rd                              San Diego                      CA        92106      US
121137  Boocks, Michael. R.                      1555      Laurdane Rd                              Miami-Dade                     FL        33183      US
120728  Borge, Kathryn                           360       Bridgepath Dr                            Miami-Dade                     FL        33150      US
121109  Boulus, Harold                           4320      Colony Woods Dr                          San Diego                      CA        92054      US
120265  Branly, Wanda                            21        Lake Pine Dr                             Philadelphia                   PA        19135      US
121140  Briggi, Saunders                         991       Holman St                                San Diego                      CA        92021      US
121012  Broome, Carmelo                          368       Buck Jones Rd                            Miami-Dade                     FL        33144      US
120724  Brown, Hampie                            1951      Cobble Creek Ln                          San Diego                      CA        92054      US
121101  Buckner, Burnetta                        3385      Hampton Ridge Rd                         San Diego                      CA        92114      US
120114  Buddery, Jeannette                       12        Hunua Road Papakura                      Sydney                                   1004       AU
120662  Burroughs, Lemonica                      2565      Bledsoe Ave                              Miami-Dade                     FL        33176      US
120730  Burt, Woodson                            136       Fox Rd                                   San Diego                      CA        92128      US
120713  Campbell, Carston                        19        Fairwinds Dr                             San Diego                      CA        92069      US
120181  Cantatore, Lorian                        207       Canterbury Road                          Sydney                                   1225       AU
121144  Capachietti, Renee                       379       Edgeside Ct                              Miami-Dade                     FL        33012      US
120763  Capps, Ramond                            3384      Cotton Mill Dr                           San Diego                      CA        92113      US
121050  Capristo-Abramczyk, Patricia             157       Ithaca Ln                                San Diego                      CA        91950      US
120688  Carcaterra, Lisa                         91        Langstonshire Ln                         San Diego                      Ca        92119      US
121059  Carhide, Jacqulin                        5637      Greenfield Dr                            San Diego                      CA        91911      US
121025  Cassey, Barnaby                          1609      Abbey Ln                                 Miami-Dade                     FL        33134      US
121121  Cassone, Halouise                        6         Frissell Ave                             Philadelphia                   PA        19142      US
120187  Catenacci, Reyne                         44        Gow Street                               Melbourne                                2066       AU
120146  Cederlund, Wendall                       1         Pacific Rise Mount Wellington            Sydney                                   20000      AU
120149  Chantharasy, Judy                        1         Embarcadero Center Site 1500             Melbourne                                3000       AU
121097  Chernega, Willeta                        17        Cottonwood Ln                            Philadelphia                   PA        19111      US
121080  Chinnis, Kumar                           60        Hodge Rd                                 Miami-Dade                     FL        33138      US
120791  Chiseloff, Richard                       1726      Evans Rd                                 San Diego                      CA        92067      US
121048  Clark, Lawrie                            5716      Deacons Bend Ct                          Miami-Dade                     FL        33184      US
121002  Clark, Terry-Ann                         57        Hickory Dr                               San Diego                      CA        92104      US
120127  Clarkson, Sharryn                        21        Albert St                                Sydney                                   1170       AU
120263  Cleverley, Bobby                         622       Boylan Ave                               San Diego                      CA        92054      US
121076  Cobb, Micah                              37        Glencoe Dr                               Philadelphia                   Pa        19138      US
120172  Comber, Edwin                            121       Blackburn Road                           Sydney                                   2580       AU
120175  Conolly, Andrew                          79        Old Port Road                            Sydney                                   2144       AU
120739  Cooper, Bryon                            5857      Academy St                               Miami-Dade                     FL        33133      US
121100  Cormell, Tzue-Ing                        4104      Blackwolf Run Ln                         San Diego                      CA        92114      US
121113  Costine, Karen                           522       Buncombe St                              Miami-Dade                     FL        33031      US
121073  Court, Donald                            4498      Calumet Dr                               Miami-Dade                     FL        33144      US
120741  Court, Keisha                            88        Kershaw Dr                               Philadelphia                   PA        19130      US
120264  Croome, Latonya                          1722      Calm Winds Ct                            San Diego                      CA        91941      US
120794  Cross, Samantha                          699       Buck Rowland Rd                          Miami-Dade                     FL        33169      US
120262  Crown, Max                               1823      Ashley Rd                                Philadelphia                   PA        19111      US
120679  Cutucache, Chrisy                        1541      Highland Trl                             San Diego                      CA        92103      US
120190  Czernezkyi, Ivor                         21        Market Street                            Sydney                                   2113       AU
120687  Dannin, Freda                            674       Friar Tuck Rd                            Miami-Dade                     FL        33193      US
121040  Darrohn, Brienne                         3941      Belford Valley Ln                        Philadelphia                   PA        19103      US
121055  Davis, Clement                           1305      Kyle Dr                                  Miami-Dade                     FL        33172      US
120103  Dawes, Wilson                            166       Toorak Road                              Sydney                                   2119       AU
120124  Daymond, Lucian                          1         Julius Avenue                            Sydney                                   2233       AU
120795  Deacon, David                            1636      Gorman St                                Miami-Dade                     FL        33012      US
121082  Debank, Richard                          608       Campbell Rd                              Miami-Dade                     FL        33129      US
120786  Delafuente, Chris-Anne                   1329      Cross Link Rd                            Miami-Dade                     FL        33016      US
120789  Denhollem, Julius                        147       Clearport Dr                             Miami-Dade                     FL        33135      US
120126  Denny, Satyakam                          7         Boundary Street                          Sydney                                   2099       AU
121003  Der Wiele, Troyce Van                    1787      Brushy Meadows Dr                        Philadelphia                   PA        19148      US
121019  Desanctis, Scott                         765       Greenhaven Ln                            Philadelphia                   PA        19102      us
120680  Desaulniers, Raymondria                  2409      Carnegie Ln                              Philadelphia                   PA        19145      US
121132  Digiorgio, Shia-Ling                     97        Gentlewoods Dr                           San Diego                      CA        92040      US
120197  Dillin, Kerrin                           29        Emily Bullock Cres                       Melbourne                                8007       AU
120714  Dinley, Robert                           182       Fort Sumter Rd                           Miami-Dade                     FL        33160      US
120152  Dives, Sean                              69        Bourke St                                Sydney                                   1460       AU
120668  Dolan, Thyland                           744       Farmington Grove Dr                      Miami-Dade                     FL        33141      US
120997  Donathan, Mary                           4923      Gateridge Dr                             Philadelphia                   PA        19152      us
120785  Donnell, Damesha                         1947      Bromley Way                              San Diego                      CA        92024      US
120711  Drew, Gloria                             17        Kempwood Dr                              Philadelphia                   PA        19119      US
120667  Droste, Edwin                            1661      Hanna Ln                                 Miami-Dade                     FL        33014      US
120803  Droste, Victor                           1722      Calm Winds Ct                            San Diego                      CA        91941      US
120138  Duckett, Shani                           9         Northgate Drive                          Melbourne                                3168       AU
120279  Dunlap, Kareema                          181       Falls River Ave                          San Diego                      CA        92021      US
120808  Dupree, Marcel                           3231      Amity Hill Ct                            San Diego                      CA        92064      US
120142  Eastley, Vincent                         4         Dalmore Drive                            Melbourne                                3095       AU
120779  Eggleston, Jennifer                      140       Hollow Ct                                Miami-Dade                     FL        33032      US
120774  El-Amin, Sue                             1030      Indigo Dr                                Philadelphia                   PA        19122      US
120119  Elleman, Lal                             1021      Haupapa Street                           Sydney                                   1219       AU
121015  Elmoslamy, Wilson                        3118      Iris Dr                                  San Diego                      CA        92105      US
120121  Elvish, Irenie                           3         Mundi Place                              Sydney                                   1232       AU
120110  Entwisle, Dennis                         9         Grayson Avenue Papatoetoe                Sydney                                   1226       AU
120810  Esguerra, Loyal                          2726      Fairfax Woods Dr                         Miami-Dade                     FL        33162      US
121103  Farnsworth, Brian                        8458      Crispwood Ct                             San Diego                      Ca        91901      US
121021  Farren, Priscilla                        1538      Dacian Rd                                San Diego                      CA        92124      US
120747  Farthing, Zashia                         763       Chatterson Dr                            San Diego                      CA        92116      us
121143  Favaron, Louis                           163       Horseshoe Bend                           Miami-Dade                     FL        33176      US
121052  Fay, Richard                             7660      Calvary Dr                               Philadelphia                   PA        19107      US
120744  Feigenbaum, Alden                        43        Glen Bonnie Ln                           San Diego                      CA        92122      US
120753  Ferrari, Ralph                           309       Gilliam Ln                               Miami-Dade                     FL        33172      US
121031  Filan, Scott                             375       Foxmoor Ct                               Philadelphia                   PA        19142      US
120150  Filo, John                               5         Sun Pl                                   Melbourne                                3001       AU
120195  Fiocca, Jina                             81        Burwood Road                             Melbourne                                3155       AU
121102  Flammia, Rocheal                         1201      Hoyle Dr                                 San Diego                      CA        91978      us
120260  Fletcher, Christine                      2416      Cove Point Dr                            San Diego                      CA        91910      US
120272  Flow, Febin                              461       Kimberly Dr                              Philadelphia                   PA        19121      US
120697  Fouche, Madelaine                        1         Embarcadero Center Site 1500             Melbourne                                3000       AU
121023  Fuller, Shawn                            1195      Echo Glen Ln                             San Diego                      CA        92028      US
121136  Galarneau, Lesia                         3         Altair Cir                               Philadelphia                   PA        19131      US
120778  Gardner, Angela                          349       Eason Cir                                Philadelphia                   PA        19104      US
120180  George, Vino                             9         Adelaide Terrace                         Melbourne                                3000       AU
120112  Glattback, Ellis                         7         Vulture Street                           Melbourne                                3174       AU
121124  Gonzalez, Deginald                       1611      Kronos Ln                                Miami-Dade                     FL        33054      US
121009  Goodwin, Robert                          31        Friendly Dr                              San Diego                      CA        92116      US
120995  Gordo, Lily-Ann                          545       Jones Sausage Rd                         Philadelphia                   PA        19144      US
120191  Graham-Rowe, Jannene                     1         Embarcadero Center Site 1500             Melbourne                                3000       AU
120108  Gromek, Gladys                           6         George Street                            Melbourne                                3000       AU
121047  Grzebien, Karen                          627       Chenworth Dr                             San Diego                      CA        92082      US
120672  Guscott, Verne                           249       Collins Street                           Sydney                                   2009       AU
120691  Habres, Sek                              11        Reid Street                              Sydney                                   1005       AU
121129  Hafley, Yusef                            192       Beaufort St                              Miami-Dade                     FL        33133      US
121045  Hampton, Cascile                         8560      Carlton Ave                              San Diego                      CA        92027      US
121013  Hargrave, Seco                           3         Altair Cir                               Philadelphia                   PA        19131      US
120743  Harrison, Chimena                        77        Braswell Ct                              San Diego                      CA        91950      US
120816  Hart, Tessia                             2170      Buttercup Ln                             Miami-Dade                     FL        33055      US
120118  Hartshorn, Darshi                        1         Waterloo Street                          Sydney                                   2065       AU
120745  Harvill, Barbara                         23        Alderman Cir                             Philadelphia                   PA        19129      US
120194  Harwood, Reece                           81        Burwood Road                             Melbourne                                3155       AU
121061  Hassam, Lauris                           4407      Fountain Dr                              Miami-Dade                     FL        33178      US
120659  Havasy, Jay                              1930      Apple Meadow Dr                          Philadelphia                   PA        19145      US
120154  Hayawardhana, Caterina                   21        Albert St                                Sydney                                   1170       AU
121098  Heatwole, Hal                            1543      Cherrycrest Ct                           Philadelphia                   PA        19154      US
120999  Heilmann, Sherelyn                       3750      Langley Cir                              San Diego                      CA        92025      US
120813  Heinsler, John                           39        Brush Stream Dr                          Miami-Dade                     FL        33179      US
121123  Helyar, Randy                            3313      Dothan Ct                                Philadelphia                   PA        19107      US
120718  Hennington, Charles                      40        Elsbeth Ct                               Philadelphia                   PA        19144      US
121130  Herndon, Gary                            11        Langdale Pl                              Philadelphia                   PA        19143      US
120196  Hieds, Merle                             5         Sun Pl                                   Melbourne                                3001       AU
120261  Highpoint, Harry                         18        Antler Ct                                Miami-Dade                     FL        33135      US
121106  Hilburger, James                         139       Barton Pines Rd                          Miami-Dade                     FL        33189      US
120669  Hill, Ronald                             2823      Eagles Landing Dr                        Philadelphia                   PA        19146      US
120125  Hofmeister, Fong                         17        Druitt Street                            Sydney                                   2122       AU
121125  Holt, Michael                            270       Johnson St                               Philadelphia                   PA        19138      US
121070  Holthouse, Agnieszka                     41        Hawthorne Way                            Miami-Dade                     FL        33018      US
120815  Honore, Craig                            7766      Brimfield Ct                             Miami-Dade                     FL        33141      US
121071  Hoppmann, John                           744       Farmington Grove Dr                      Miami-Dade                     FL        33141      US
120773  Horne, Entrisse                          7497      Holly Pointe Dr                          Miami-Dade                     FL        33133      US
120792  Horne, Omeba                             4750      Jet Ln                                   Philadelphia                   PA        19119      US
120106  Hornsey, John                            325       Sherwood Road                            Sydney                                   1100       AU
120113  Horsey, Riu                              45        Talavera Road                            Melbourne                                3146       AU
120123  Hotstone, Kimiko                         54        Overseas Drive                           Sydney                                   2066       AU
121001  House, Tony                              1         Bona Ct                                  Miami-Dade                     FL        33140      US
120685  Howard, Anita                            1455      Emerywood Dr                             Philadelphia                   PA        19124      US
120729  Howell, Kimberly                         260       Langstonshire Ln                         Miami-Dade                     FL        33134      US
121085  Huslage, Rebecca                         1984      Dunhill Ter                              San Diego                      CA        92008      US
120137  Iyengar, Marina                          9         Crusin Place                             Melbourne                                3086       AU
121026  Jaime, Terrill                           697       Harcourt Dr                              Philadelphia                   PA        19136      US
120155  James, Narelle                           30        Thorncraft Parade                        Melbourne                                2113       AU
121104  Johnson, Leoma                           4002      Brassfield Rd                            Philadelphia                   PA        19134      US
120797  Jones, Sherrie                           19        Dutch Creek Dr                           Miami-Dade                     FL        33186      US
120278  Jongleux, Binit                          3053      Blackpine Ct                             San Diego                      CA        91910      US
120716  Juif, Kenneth                            881       Green Downs Dr                           Philadelphia                   PA        19143      US
121091  Kadiri, Ernest                           6         Frissell Ave                             Philadelphia                   Pa        19142      US
121043  Kagarise, Sigrid                         3313      Dothan Ct                                Philadelphia                   PA        19107      US
120269  Kagolanu, Shrimatee                      65        Applecross Cir                           Philadelphia                   PA        19131      US
120132  Kaiser, Fancine                          33        Great South Road Riccarton               Sydney                                   2000       AU
120157  Karavdic, Leonid                         121       Blackburn Road                           Sydney                                   2580       AU
120783  Karp, Davis                              458       Huckleberry Dr                           Philadelphia                   PA        19104      US
120796  Kellis, Philip                           40        Elsbeth Ct                               Philadelphia                   PA        19144      US
120766  Kempster, Janelle                        8         Ashwood Dr                               Miami-Dade                     FL        33173      US
120682  Kennedy, Barbara                         1635      Auburn Church Rd                         Philadelphia                   PA        19119      US
120801  Kennedy, Kathryn                         353       Cameron Woods Dr                         Philadelphia                   PA        19148      US
120658  Kennedy, Kenneth                         3118      Iris Dr                                  San Diego                      CA        92105      US
121088  Kernitzki, Momolu                        422       Brentwood Rd                             Philadelphia                   PA        19134      US
120992  Kicak, Lisa                              1974      Clear Brook Dr                           Miami-Dade                     FL        33172      US
120736  Kiemle, Parie                            26        Holly Park Dr                            Miami-Dade                     FL        33130      US
120177  Kierce, Franca                           120       Walkers Road                             Sydney                                   2015       AU
120746  Kimmerle, Kevie                          162       Horsetrail Way                           Philadelphia                   PA        19121      US
120170  Kingston, Alban                          5         Buffalo Road                             Sydney                                   1042       AU
121063  Kinol, Regi                              63        Fountainhead Dr                          Miami-Dade                     FL        33180      US
121034  Kirkman, John                            40        Dry Fork Ln                              Miami-Dade                     FL        33193      US
120698  Kistanna, Geoff                          28        Fonceca Street                           Sydney                                   1171       au
120128  Kletschkus, Monica                       26        Bay Street                               Melbourne                                3050       AU
121090  Klibbe, Betty                            3750      Langley Cir                              San Diego                      CA        92025      US
121110  Knapp, Albert                            4368      Farrington Dr                            Miami-Dade                     FL        33165      US
120757  Knopfmacher, Paul                        804       Calebra Way                              San Diego                      CA        92104      US
121081  Knudson, Susie                           110       Glascock St                              San Diego                      CA        91950      US
120721  Knust, Dlutomi                           744       Brannigan Pl                             Philadelphia                   PA        19141      US
120683  Kochneff, Deven                          765       Greenhaven Ln                            Philadelphia                   PA        19102      US
121058  Kohake, Del                              181       Falls River Ave                          San Diego                      CA        92021      US
120765  Kokoszka, Nikeisha                       2416      Cove Point Dr                            San Diego                      Ca        91910      US
120740  Koonce, Lisa                             1636      Gorman St                                Miami-Dade                     FL        33012      US
120663  Kornblith, Anglar                        4407      Fountain Dr                              Miami-Dade                     FL        33178      US
120266  Krafve, Bao                              12        Brigadoon Dr                             San Diego                      CA        92040      US
121095  Kratzke, Sara                            4137      Deer Haven Dr                            San Diego                      CA        92101      US
121120  Labach, Susan                            1624      Fox Trail Ln                             Philadelphia                   PA        19146      US
120189  Lachlan, Mihailo                         17        Elsie St                                 Sydney                                   2154       AU
121010  Lamp, Donald                             509       Green Level To Durham Rd                 Miami-Dade                     FL        33142      US
120274  Landry, Angela                           162       Horsetrail Way                           Philadelphia                   PA        19121      US
120690  Langston, Taronda                        1635      Auburn Church Rd                         Philadelphia                   PA        19119      US
121145  Lansberry, Dennis                        7508      Declaration Dr                           Miami-Dade                     FL        33012      US
121069  Lapsley, Jason                           2148      Circlebank Dr                            San Diego                      CA        92064      US
120275  Lattimer, Brandy                         56        Cahill Rd                                San Diego                      CA        92065      US
120671  Latty, William                           422       Brentwood Rd                             Philadelphia                   PA        19134      US
120280  Laurer, Jaime                            211       Hamstead Crossing Dr                     Philadelphia                   PA        19124      US
121118  Lawson, Paul                             598       Lake Ct                                  Philadelphia                   Pa        19122      US
120665  Leacock, Jill                            1288      Joe Leach Rd                             San Diego                      CA        91945      US
120694  Leazer, Sharon                           29        Lawson Ave                               Sydney                                   1220       AU
120762  Leone, Marvin                            2898      Cookshire Dr                             Philadelphia                   PA        19121      US
120731  Lerew, Robert                            2254      Appledown Dr                             San Diego                      CA        92008      US
121108  Levi, Libby                              1713      Barham Siding Rd                         Miami-Dade                     FL        33013      US
120136  Leyden, Atul                             12        Hunua Road Papakura                      Sydney                                   1004       AU
120141  Liebman, Amanda                          46        George Street                            Sydney                                   2012       AU
120769  Lightbourne, Abelino                     6137      Blue Water Ct                            Miami-Dade                     FL        33161      US
121014  Liguori, Donelle                         6         Gamelyn Walk                             Miami-Dade                     FL        33183      US
120788  Lisowe, Smitty                           1058      Atchison St                              San Diego                      CA        92120      US
120101  Lu, Patrick                              51        Botany Road                              Sydney                                   1230       AU
120130  Lyon, Kevin                              2         Hill St                                  Sydney                                   1044       AU
121056  Lyszyk, Stacey                           3118      Iris Dr                                  San Diego                      CA        92105      US
121067  Macnair, Jeanilla                        1984      Dunhill Ter                              San Diego                      CA        92008      US
121018  Magolan, Julienne                        522       Buncombe St                              Miami-Dade                     FL        33031      US
120163  Magrath, Brett                           253       Princess Hwy                             Melbourne                                3000       AU
121111  Maholo, Salim                            91        Gardner St                               San Diego                      CA        92057      US
121065  Malta, Corneille                         1793      Falcon Rest Cir                          San Diego                      CA        92113      US
120793  Mamo, William                            183       Dacus Pl                                 Miami-Dade                     FL        33055      US
121046  Mandzak, Roger                           443       High Country Dr                          Philadelphia                   PA        19147      US
121127  Mangini, Keyna                           9         Garner Rd                                San Diego                      CA        91910      US
120809  Marion, Chiorene                         89        Atchison St                              Miami-Dade                     FL        33129      US
120727  Marples, Donald                          2227      Calais Ct                                San Diego                      CA        92122      US
120161  Martines, Rosette                        147       North Clark Street                       Melbourne                                3156       AU
120117  Mccleary, Bill                           6         Palmiston Cresent                        Melbourne                                3150       AU
121053  Mcdade, Tywanna                          87        Christofle Ln                            San Diego                      CA        92082      US
121029  Mcelwee, Kuo-Chung                       1538      Dacian Rd                                San Diego                      CA        92124      US
121139  Mckee, Diosdado                          81        Hanska Way                               San Diego                      CA        92014      US
121008  Mckenzie, Eron                           131       Gem Dr                                   Philadelphia                   PA        19122      US
121005  Mclamb, Yuh-Lang                         9891      Glendower Rd                             Miami-Dade                     FL        33154      US
120751  Mea, Azavi0us                            649       Buckboard Ln                             Miami-Dade                     FL        33014      US
121079  Mees, Azmi                               824       Beaufort St                              Philadelphia                   PA        19128      US
121036  Mesley, Teresa                           967       Hearthside Ct                            Philadelphia                   PA        19148      US
121074  Michonski, Eric                          1921      Kingston Ridge Rd                        San Diego                      CA        92129      US
121037  Miketa, Muthukumar                       2185      Ileagnes Rd                              Miami-Dade                     FL        33176      US
120259  Miller, Anthony                          522       Buncombe St                              Miami-Dade                     FL        33031      US
120760  Miller, Pamela                           108       Elmview Dr                               San Diego                      CA        92111      US
120140  Minas, Michael                           95        Miller St                                Sydney                                   2125       AU
120695  Moffat, Trent                            8         Learmonth Road                           Melbourne                                3101       au
120171  Moody, Alena                             248       Port Road                                Sydney                                   2020       AU
120184  Moore, Ari                               241       Royal Perade                             Sydney                                   1115       AU
120712  Motashaw, Elisabeth                      360       Bridgepath Dr                            Miami-Dade                     FL        33150      US
121099  Mrvichin, Royall                         31        Cantwell Ct                              Philadelphia                   PA        19141      US
121051  Myers, Glorina                           335       Fox Ct                                   San Diego                      CA        92029      US
121128  Nazar, Glacia                            1250      Kingston Ridge Rd                        San Diego                      CA        92128      US
120715  Neal, Angelia                            6278      Aqua Marine Ln                           San Diego                      CA        92054      US
121096  Newstead, Robert                         683       Lake Hill Dr                             Miami-Dade                     FL        33176      US
120122  Ngan, Christina                          11        Prospect Hill Road                       Melbourne                                3001       AU
120192  Nichollas, Anthony                       66        Phillip Street                           Sydney                                   2124       AU
120115  Nichollas, Hugh                          30        Hotham Parade                            Sydney                                   2600       AU
120749  Niemann, Kevin                           651       Bluebird Ct                              San Diego                      CA        92027      US
121066  Norman, Ceresh                           251       Lake Tillery Dr                          Philadelphia                   PA        19148      US
121072  North, Christer                          2765      Eaglesham Way                            Philadelphia                   PA        19121      US
120166  Nowd, Fadi                               17        Elsie St                                 Sydney                                   2154       AU
120270  Nuss, Grezegorz                          1916      Hebron Church Rd                         Miami-Dade                     FL        33186      US
121115  O'Carroll, Aquilla                       5194      Calm Winds Ct                            San Diego                      CA        92071      US
121087  O'Suilleabhain, Virtina                  219       Ivydale Dr                               Miami-Dade                     FL        33178      US
120790  O'Toole, Tara                            461       Kimberly Dr                              Philadelphia                   Pa        19121      US
120726  Obermeyer, Lutezenia                     3246      Cartier Dr                               Philadelphia                   PA        19140      US
120678  Octetree, Lucretta                       433       Farmington Woods Dr                      San Diego                      CA        92054      US
120723  Olsen, Deanna                            218       Hillsford Ln                             Philadelphia                   PA        19146      US
120666  Onuscheck, John                          215       Alercia Ct                               San Diego                      CA        92029      US
120173  Osborn, Hernani                          8         Cannon Lane Whitby                       Melbourne                                3350       AU
121068  Osuba, Salaheloin                        2546      Belford Valley Ln                        San Diego                      CA        91932      US
121084  Ould, Tulsidas                           1025      Coronado Dr                              San Diego                      Ca        92028      US
120806  Ousley, Lorna                            881       Kettlebridge Dr                          Miami-Dade                     FL        33183      US
120772  Overdorff, Erich                         1407      Coorsdale Dr                             Miami-Dade                     FL        33161      US
120176  Pa, Koavea                               1         Endeavour Road                           Melbourne                                3225       AU
121131  Pantages, William                        198       Botany Bay Dr                            San Diego                      CA        92021      US
120802  Parker, U'Vonda                          11        Kinderston Dr                            Philadelphia                   PA        19104      US
120770  Pascoe, Julia                            973       Chris Dr                                 Miami-Dade                     FL        33183      US
120787  Peachey, Carl                            175       Carteret Dr                              San Diego                      CA        92025      US
120120  Peiris, Krishna                          46        George Street                            Sydney                                   2012       AU
121126  Penhale, James                           142       Bluffridge Dr                            Philadelphia                   PA        19141      US
120807  Peppers, Gerlinde                        1209      Fraternity Court Dr                      San Diego                      CA        92173      US
120696  Pettolino, Peter                         1         Endeavour Road                           Melbourne                                3225       AU
120151  Phaiyakounh, Julianna                    3         Evans St                                 Sydney                                   2011       AU
120159  Phoumirath, Lynelle                      166       Toorak Road                              Sydney                                   2119       AU
120158  Pilgrim, Daniel                          8         Nicholson Street                         Sydney                                   4720       AU
120784  Pinol, Jennifer                          9         Chastain Dr                              Philadelphia                   PA        19132      US
120135  Platts, Alexei                           39        Station Street                           Sydney                                   2000       au
120178  Plested, Billy                           51        Martin Place                             Sydney                                   1131       AU
121086  Plybon, John-Michael                     890       Dinwiddie Ct                             Miami-Dade                     FL        33174      US
120276  Plybon, Nicholas                         2975      Foxbury Dr                               Philadelphia                   Pa        19120      US
121064  Polky, Asishana                          41        Dubose St                                San Diego                      CA        92110      US
120689  Pongor, Katherine                        4750      Cottonwood Ln                            Philadelphia                   PA        19148      US
120748  Post, Nahliah                            52        Landor Rd                                Miami-Dade                     FL        33169      US
120105  Povey, Liz                               23        Garden Street                            Melbourne                                8004       AU
120165  Pretorius, Tadashi                       30        Hotham Parade                            Sydney                                   2600       AU
121133  Pringley, Peter                          4002      Brassfield Rd                            Philadelphia                   PA        19134      US
121092  Pritt, Gynell                            8112      Kenna Ct                                 San Diego                      CA        92116      US
121054  Pulliam, Daniel                          651       Bluebird Ct                              San Diego                      CA        92027      US
120186  Quinby, Merryn                           54        Dunning Street                           Sydney                                   2120       AU
120661  Racine, Cynthia                          63        Cane Creek Dr                            San Diego                      CA        92131      US
120116  Ralston, Austen                          12        Hunua Road Papakura                      Sydney                                   1004       AU
120768  Rayburn, Roland                          31        Castalia Dr                              Philadelphia                   PA        19140      US
121020  Ridley, Cherda                           30        Aiken Pkwy                               Philadelphia                   PA        19142      US
120719  Ridley, Roya                             6121      Birklands Dr                             San Diego                      CA        92025      US
120267  Rink, Belanda                            43        Grist Mill Rd                            San Diego                      CA        92122      US
121042  Robbin-Coker, Joseph                     2645      Berkshire Downs Dr                       San Diego                      CA        92008      US
120129  Roebuck, Alvin                           6         Palmiston Cresent                        Melbourne                                3150       AU
121027  Rudder, Allan                            941       Dixon Dr                                 San Diego                      CA        91911      US
120147  Rusli, Skev                              26        St Kilda Road                            Sydney                                   2022       AU
121135  Ruta, Tammy                              89        Ashley Brook Ct                          Philadelphia                   PA        19131      US
120777  Sacher, Kary                             2547      Allenby Dr                               San Diego                      CA        91913      US
121148  Sadig, Shane                             5857      Academy St                               Miami-Dade                     FL        33133      US
121146  Sangiorgio, Julieanne                    6042      Farmstone Dr                             Philadelphia                   PA        19125      US
120673  Santomaggio, Pearl                       2         Stephen Road                             Melbourne                                3181       AU
121089  Sauder, Gregory                          974       Joel Ct                                  Miami-Dade                     FL        33030      US
121105  Savacool, Jessica                        618       Darlington Pl                            Miami-Dade                     FL        33143      US
120734  Saylor, Svein                            3707      Hillside Dr                              Philadelphia                   PA        19144      US
121122  Scarbrough, Stancey                      701       Glenridge Dr                             Miami-Dade                     FL        33177      US
120162  Scordia, Randal                          45        Talavera Road                            Melbourne                                3146       AU
120814  Scroggin, Victor                         1058      Atchison St                              San Diego                      CA        92120      US
120160  Segrave, Chuck                           1         Sleigh Street                            Sydney                                   1164       AU
120664  Senchak, Brock                           1779      Greymist Ln                              Philadelphia                   PA        19142      US
120994  Sergeant, Danelle                        734       Ladys Slipper Ct                         San Diego                      CA        92105      us
121117  Sergi, Teresa                            3         Altair Cir                               Philadelphia                   PA        19131      US
120134  Shannan, Sian                            5         Rosebery Ave                             Sydney                                   2010       AU
120107  Sheedy, Sherie                           12        Sir William Pickering Drive              Melbourne                                3175       AU
120722  Sheffield, Ishmar                        939       Hilltop Needmore Rd                      Miami-Dade                     FL        33157      US
120742  Shewitz, Ronald                          507       Carriage Pine Dr                         Philadelphia                   PA        19125      US
120277  Shirts, Wesley                           710       Crawford Rd                              Miami-Dade                     FL        33015      US
120776  Silverthorne, Ratna                      284       Forest Dr                                Miami-Dade                     FL        33142      US
120174  Simms, Doungkamol                        30        Goodall Ave                              Melbourne                                3053       AU
120782  Sines, Rilma                             142       Bluffridge Dr                            Philadelphia                   PA        19141      US
120781  Sitnik, Sarah                            6846      Glastonbury Rd                           San Diego                      CA        91941      US
120717  Sleva, Jon                               472       Big Bend Ct                              Miami-Dade                     FL        33155      US
120143  Sloey, Phu                               1         Pacific Rise Mount Wellington            Sydney                                   20000      AU
121028  Smades, William                          6         Gamelyn Walk                             Miami-Dade                     FL        33183      US
121004  Smith, Kellen                            1466      Horne St                                 San Diego                      CA        92117      US
121032  Smith, Nasim                             340       Bellevue Rd                              San Diego                      CA        92027      US
120660  Smith, Robert                            4156      Hwy 42                                   Miami-Dade                     FL        33180      US
121077  Smotherly, Bryce                         4396      Burntwood Cir                            Miami-Dade                     FL        33193      US
121147  Sneed, Christine                         151       Gail Ridge Ln                            Miami-Dade                     FL        33182      US
120156  Snellings, Gerry                         26        St Kilda Road                            Sydney                                   2022       AU
121033  Snitzer, Kristie                         2157      Denberg Ln                               Philadelphia                   PA        19140      US
120677  Sochacki, Suad                           3519      Amersham Ln                              Miami-Dade                     FL        33160      US
120133  Soltau, Petrea                           105       East St                                  Melbourne                                8060       AU
120111  Spillane, Ubaldo                         325       Sherwood Road                            Sydney                                   1100       AU
120720  Spingola, John                           1219      Hawkshead Rd                             Philadelphia                   PA        19139      US
121060  Spofford, Elizabeth                      4368      Farrington Dr                            Miami-Dade                     FL        33165      US
120164  Stamalis, Ranj                           435       Sherwood Rd                              Melbourne                                8003       AU
120799  Stefandonovan, Jeffery                   47        Dixie Trl                                Philadelphia                   PA        19136      US
121142  Steiber, Reginald                        15        Kilmorack Dr                             Philadelphia                   PA        19136      US
121022  Stevens, Robert                          224       Horsham Way                              San Diego                      CA        91950      US
121112  Stouchko, Lee                            101       Avent Ferry Rd                           Miami-Dade                     FL        33178      US
120193  Streit, Russell                          176       Exhibition Street                        Melbourne                                3170       AU
121075  Sugg, Kasha                              4137      Deer Haven Dr                            San Diego                      CA        92101      US
121016  Sullivan, Lutezenia                      4758      Barbara Dr                               Miami-Dade                     FL        33180      US
121000  Supple, Herman                           4         Kimbrook Dr                              Miami-Dade                     Fl        33187      US
120131  Surawski, Marinus                        163       Nebo Road                                Sydney                                   1117       AU
121083  Sutton, Tingmei                          6940      Hunt Farms Ln                            Miami-Dade                     FL        33147      US
120738  Swaiti, Huilun                           211       Hamstead Crossing Dr                     Philadelphia                   PA        19124      US
121134  Tacosa, Paul                             2733      Balfour Downs Cir                        San Diego                      CA        92109      US
120169  Tannous, Cos                             13        Symonds Street                           Melbourne                                3005       AU
121094  Tate, Larry                              2704      Lake Wheeler Rd                          San Diego                      CA        92082      US
120693  Tellam, Diaz                             8         Aboukis Street                           Sydney                                   1223       AU
120767  Terricciano, Legette                     6348      Draper Rd                                Philadelphia                   PA        19131      US
120755  Thoits, Elizabeth                        5         Green Lantern St                         San Diego                      CA        92128      US
120775  Thompson, Tanya                          509       Green Level To Durham Rd                 Miami-Dade                     FL        33142      US
120167  Tilley, Kimiko                           153       High St                                  Sydney                                   2006       AU
120681  Tolbet, Elery                            63        Bishops Park Dr                          Miami-Dade                     FL        33016      US
121138  Tolley, Hershell                         3         Altair Cir                               Philadelphia                   PA        19131      US
120737  Toner, Brenner                           36        Enka Dr                                  San Diego                      CA        92037      US
120692  Tregonning, Rit                          26        Brisbane Avenue                          Sydney                                   2064       AU
120686  Tucker, Berether                         1999      Avery St                                 San Diego                      CA        91941      US
120732  Uenking, Kent                            2853      Birchford Ct                             Miami-Dade                     FL        33142      US
120752  Van Damme, Jean-Claude                   973       Chris Dr                                 Miami-Dade                     FL        33183      US
121093  Vasconcellos, Carl                       5194      Calm Winds Ct                            San Diego                      CA        92071      US
120268  Villeneuve, Jacques                      11        Kinderston Dr                            Philadelphia                   PA        19104      US
120758  Voltz, Sal                               34        Flicker Ct                               Miami-Dade                     FL        33168      US
121057  Voron, Tachaun                           990       Center Pointe Dr                         Philadelphia                   PA        19143      US
120153  Waal, Samantha                           121       Blackburn Road                           Sydney                                   2580       AU
120996  Wade, Johannes                           139       Deer Hunter Ct                           San Diego                      CA        91950      US
120780  Walcott, Kimberly                        967       Hearthside Ct                            Philadelphia                   PA        19148      US
120805  Walker, Robert                           153       Dawson Mill Run                          Philadelphia                   PA        19143      US
121039  Washington, Donald                       1668      Bladen St                                Miami-Dade                     FL        33055      US
120657  Weisbarth, Theresa                       1571      Edenton St                               San Diego                      CA        92114      US
121078  Wende, Lionel                            52        Landor Rd                                Miami-Dade                     FL        33169      US
121024  Westlund, Michael                        198       Botany Bay Dr                            San Diego                      CA        92021      US
121041  Wetherington, Jaime                      1428      Brandywine Dr                            San Diego                      CA        92071      US
121114  Whipkey, Okema                           7834      Briar Oaks Ln                            San Diego                      CA        92104      US
120725  Whitlock, Robert                         456       Avent Hill                               San Diego                      CA        92117      US
120179  Wills, Matsuoka                          5059      Great Eastern Highway                    Melbourne                                8010       AU
120139  Wilson, Fang                             354       St Kilda Rd                              Sydney                                   2145       AU
120271  Winge, Kenisha                           94        Irelan Dr                                Miami-Dade                     FL        33144      US
120750  Woods, Connie                            4407      Fountain Dr                              Miami-Dade                     FL        33178      US
120764  Worton, Steven                           3100      Erinsbrook Dr                            San Diego                      CA        92026      US
120684  Woyach, Suzon                            1107      Caswell Ct                               Miami-Dade                     FL        33141      US
120771  Xing Moore, Wei                          84        Holt Dr                                  Miami-Dade                     FL        33183      US
120102  Zhou, Tom                                1         Adelaide Street MIC Court                Melbourne                                3125       AU
120804  Zied, Ahmed                              101       Avent Ferry Rd                           Miami-Dade                     FL        33178      US
120670  Zisek, Odudu                             114       Lakerun Ct                               Philadelphia                   PA        19146      US
120148  Zubak, Michael                           51        Court Crescent Panmure                   Sydney                                   2041       AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(offers.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
104012/02/11 Outdoors15%
202010/07/11 Golf     7%
103009/22/11 Shoes   10%
103009/22/11 Clothes 10%
202007/08/11 Clothes 15%
203007/08/11 Clothes 25%
301004/21/11 Golf    15%
104004/21/11 Golf    15%
203004/21/11 Golf    15%
301008/26/11 Clothes 25%
203006/25/11 Outdoors20%
104006/25/11 Outdoors20%
102006/25/11 Outdoors20%
103006/25/11 Outdoors20%
202004/02/11 Shoes   25%
203004/02/11 Shoes   25%
104005/17/11 Clothes 15%
203005/17/11 Clothes 15%
301005/17/11 Clothes 15%
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(sales.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
101  USA 1-20-2011 3295.50
3034 EUR 30JAN2011 1876,30
101  USA 1-30-2011 2938.00
128  USA 2-5-2011  2908.74
1345 EUR 6FEB2011  3145,60
109  USA 3-17-2011 2789.10
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(sales1.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom          Zhou               M  Sales Manager        $108,255 AU 08/11/1973 06/01/1993
120103 Wilson       Dawes              M  Sales Manager         $87,975 AU 01/22/1953 01/01/1978
120121 Irenie       Elvish             F  Sales Rep. II         $26,600 AU 08/02/1948 01/01/1978
120122 Christina    Ngan               F  Sales Rep. II         $27,475 AU 07/27/1958 07/01/1982
120123 Kimiko       Hotstone           F  Sales Rep. I          $26,190 AU 09/28/1968 10/01/2011
120124 Lucian       Daymond            M  Sales Rep. I          $26,480 AU 05/13/1963 03/01/2011
120125 Fong         Hofmeister         M  Sales Rep. IV         $32,040 AU 12/06/1958 03/01/1983
120126 Satyakam     Denny              M  Sales Rep. II         $26,780 AU 09/20/1992 08/01/2010
120127 Sharryn      Clarkson           F  Sales Rep. II         $28,100 AU 01/04/1983 11/01/2002
120128 Monica       Kletschkus         F  Sales Rep. IV         $30,890 AU 07/14/1990 11/01/2010
120129 Alvin        Roebuck            M  Sales Rep. III        $30,070 AU 11/22/1968 10/01/1989
120130 Kevin        Lyon               M  Sales Rep. I          $26,955 AU 12/14/1988 05/01/2011
120131 Marinus      Surawski           M  Sales Rep. I          $26,910 AU 09/25/1983 01/01/2011
120132 Fancine      Kaiser             F  Sales Rep. III        $28,525 AU 04/05/1953 10/01/1982
120133 Petrea       Soltau             F  Sales Rep. II         $27,440 AU 04/22/1990 10/01/2010
120134 Sian         Shannan            M  Sales Rep. II         $28,015 AU 06/06/1953 01/01/1978
120135 Alexei       Platts             M  Sales Rep. IV         $32,490 AU 01/26/1973 10/01/2001
120136 Atul         Leyden             M  Sales Rep. I          $26,605 AU 09/16/1983 02/01/2011
120137 Marina       Iyengar            F  Sales Rep. III        $29,715 AU 03/12/1983 03/01/2010
120138 Shani        Duckett            F  Sales Rep. I          $25,795 AU 07/11/1983 07/01/2011
120139 Fang         Wilson             F  Sales Rep. II         $26,810 AU 08/18/1990 09/01/2010
120140 Michael      Minas              M  Sales Rep. I          $26,970 AU 08/03/1992 10/01/2011
120141 Amanda       Liebman            F  Sales Rep. II         $27,465 AU 03/12/1992 05/01/2010
120142 Vincent      Eastley            M  Sales Rep. III        $29,695 AU 06/14/1990 07/01/2010
120143 Phu          Sloey              M  Sales Rep. II         $26,790 AU 05/17/1963 10/01/1986
120144 Viney        Barbis             M  Sales Rep. III        $30,265 AU 03/07/1990 10/01/2010
120145 Sandy        Aisbitt            M  Sales Rep. II         $26,060 AU 01/22/1968 06/01/1989
120146 Wendall      Cederlund          M  Sales Rep. I          $25,985 AU 10/02/1963 08/01/2011
120147 Skev         Rusli              F  Sales Rep. II         $26,580 AU 01/19/1992 10/01/2010
120148 Michael      Zubak              M  Sales Rep. III        $28,480 AU 09/13/1953 06/01/1982
120149 Judy         Chantharasy        F  Sales Rep. I          $26,390 AU 11/21/1978 01/01/2011
120150 John         Filo               M  Sales Rep. III        $29,965 AU 07/09/1958 08/01/1986
120151 Julianna     Phaiyakounh        F  Sales Rep. II         $26,520 AU 11/21/1948 01/01/1978
120152 Sean         Dives              M  Sales Rep. I          $26,515 AU 05/01/1983 04/01/2011
120153 Samantha     Waal               F  Sales Rep. I          $27,260 AU 05/07/1983 01/01/2011
120154 Caterina     Hayawardhana       F  Sales Rep. III        $30,490 AU 07/20/1948 01/01/1978
120155 Narelle      James              F  Sales Rep. III        $29,990 AU 04/22/1988 04/01/2010
120156 Gerry        Snellings          F  Sales Rep. I          $26,445 AU 09/01/1992 03/01/2011
120157 Leonid       Karavdic           M  Sales Rep. II         $27,860 AU 02/21/1990 12/01/2010
120158 Daniel       Pilgrim            M  Sales Rep. III        $36,605 AU 07/14/1968 07/01/1991
120159 Lynelle      Phoumirath         F  Sales Rep. IV         $30,765 AU 02/24/1968 07/01/1990
120160 Chuck        Segrave            M  Sales Rep. I          $27,115 AU 09/09/1958 10/01/2011
120161 Rosette      Martines           F  Sales Rep. III        $30,785 AU 03/07/1992 10/01/2010
120162 Randal       Scordia            M  Sales Rep. I          $27,215 AU 09/05/1992 02/01/2011
120163 Brett        Magrath            M  Sales Rep. II         $26,735 AU 05/22/1968 01/01/1995
120164 Ranj         Stamalis           F  Sales Rep. II         $27,450 AU 11/26/1963 02/01/1986
120165 Tadashi      Pretorius          M  Sales Rep. I          $27,050 AU 03/19/1988 03/01/2011
120166 Fadi         Nowd               M  Sales Rep. IV         $30,660 AU 06/14/1948 01/01/1978
120167 Kimiko       Tilley             F  Sales Rep. I          $25,185 AU 05/04/1958 02/01/2011
120168 Selina       Barcoe             F  Sales Rep. I          $25,275 AU 03/24/1988 11/01/2011
120169 Cos          Tannous            M  Sales Rep. III        $28,135 AU 01/02/1988 05/01/2010
120170 Alban        Kingston           M  Sales Rep. III        $28,830 AU 02/25/1978 10/01/1996
120171 Alena        Moody              F  Sales Rep. II         $26,205 AU 07/19/1988 09/01/2010
120172 Edwin        Comber             M  Sales Rep. III        $28,345 AU 04/01/1948 01/01/1978
120173 Hernani      Osborn             M  Sales Rep. I          $26,715 AU 02/23/1958 06/01/2011
120174 Doungkamol   Simms              F  Sales Rep. I          $26,850 AU 01/10/1948 01/01/2011
120175 Andrew       Conolly            M  Sales Rep. I          $25,745 AU 08/18/1992 10/01/2011
120176 Koavea       Pa                 M  Sales Rep. I          $26,095 AU 11/09/1990 11/01/2011
120177 Franca       Kierce             F  Sales Rep. III        $28,745 AU 04/05/1983 02/01/2002
120178 Billy        Plested            M  Sales Rep. II         $26,165 AU 11/23/1958 04/01/1978
120179 Matsuoka     Wills              M  Sales Rep. III        $28,510 AU 03/15/1978 01/01/2008
120180 Vino         George             M  Sales Rep. II         $26,970 AU 06/27/1958 12/01/1982
120198 Meera        Body               F  Sales Rep. III        $28,025 AU 01/21/1992 12/01/2010
120261 Harry        Highpoint          M  Chief Sales Officer  $243,190 US 02/21/1973 08/01/1991
121018 Julienne     Magolan            F  Sales Rep. II         $27,560 US 01/03/1948 01/01/1978
121019 Scott        Desanctis          M  Sales Rep. IV         $31,320 US 06/25/1990 06/01/2008
121020 Cherda       Ridley             F  Sales Rep. IV         $31,750 US 02/23/1988 05/01/2006
121021 Priscilla    Farren             F  Sales Rep. IV         $32,985 US 12/10/1978 03/01/1998
121022 Robert       Stevens            M  Sales Rep. IV         $32,210 US 10/28/1983 02/01/2006
121023 Shawn        Fuller             M  Sales Rep. I          $26,010 US 03/13/1968 05/01/2011
121024 Michael      Westlund           M  Sales Rep. II         $26,600 US 09/21/1988 05/01/2008
121025 Barnaby      Cassey             M  Sales Rep. II         $28,295 US 10/10/1953 09/01/1979
121026 Terrill      Jaime              M  Sales Rep. IV         $31,515 US 11/08/1990 04/01/2010
121027 Allan        Rudder             M  Sales Rep. II         $26,165 US 05/05/1968 12/01/1993
121028 William      Smades             M  Sales Rep. I          $26,585 US 04/27/1992 11/01/2011
121029 Kuo-Chung    Mcelwee            M  Sales Rep. I          $27,225 US 12/22/1968 12/01/2011
121030 Jeryl        Areu               M  Sales Rep. I          $26,745 US 11/12/1983 02/01/2011
121031 Scott        Filan              M  Sales Rep. III        $28,060 US 07/09/1968 08/01/1989
121032 Nasim        Smith              M  Sales Rep. IV         $31,335 US 02/24/1992 03/01/2010
121033 Kristie      Snitzer            F  Sales Rep. III        $29,775 US 11/06/1990 06/01/2008
121034 John         Kirkman            M  Sales Rep. II         $27,110 US 08/23/1992 01/01/2011
121035 James        Blackley           M  Sales Rep. II         $26,460 US 03/25/1948 01/01/1978
121036 Teresa       Mesley             F  Sales Rep. I          $25,965 US 07/18/1992 10/01/2011
121037 Muthukumar   Miketa             M  Sales Rep. III        $28,310 US 06/12/1978 03/01/2006
121038 David        Anstey             M  Sales Rep. I          $25,285 US 02/13/1992 08/01/2011
121039 Donald       Washington         M  Sales Rep. II         $27,460 US 06/03/1958 05/01/1984
121040 Brienne      Darrohn            F  Sales Rep. III        $29,525 US 07/06/1963 11/01/1986
121041 Jaime        Wetherington       F  Sales Rep. II         $26,120 US 02/04/1948 01/01/1978
121042 Joseph       Robbin-Coker       M  Sales Rep. III        $28,845 US 04/04/1983 11/01/2003
121043 Sigrid       Kagarise           F  Sales Rep. II         $28,225 US 11/09/1973 03/01/1996
121044 Ray          Abbott             M  Sales Rep. I          $25,660 US 12/11/1958 08/01/2011
121045 Cascile      Hampton            F  Sales Rep. II         $28,560 US 06/13/1968 01/01/1998
121046 Roger        Mandzak            M  Sales Rep. I          $25,845 US 09/07/1988 07/01/2011
121047 Karen        Grzebien           F  Sales Rep. I          $25,820 US 11/26/1983 09/01/2011
121048 Lawrie       Clark              F  Sales Rep. I          $26,560 US 06/24/1988 09/01/2011
121049 Perrior      Bataineh           F  Sales Rep. I          $26,930 US 02/14/1990 12/01/2011
121050 Patricia     Capristo-Abramczyk F  Sales Rep. II         $26,080 US 01/12/1990 12/01/2010
121051 Glorina      Myers              F  Sales Rep. I          $26,025 US 05/02/1953 11/01/2011
121052 Richard      Fay                M  Sales Rep. II         $26,900 US 01/09/1990 11/01/2010
121053 Tywanna      Mcdade             F  Sales Rep. III        $29,955 US 09/23/1948 02/01/1978
121054 Daniel       Pulliam            M  Sales Rep. III        $29,805 US 11/12/1958 11/01/1980
121055 Clement      Davis              M  Sales Rep. III        $30,185 US 01/08/1992 08/01/2010
121056 Stacey       Lyszyk             F  Sales Rep. II         $28,325 US 07/05/1988 05/01/2007
121057 Tachaun      Voron              M  Sales Rep. I          $25,125 US 12/26/1963 12/01/2011
121058 Del          Kohake             M  Sales Rep. I          $26,270 US 07/12/1978 10/01/2011
121059 Jacqulin     Carhide            F  Sales Rep. II         $27,425 US 10/25/1963 04/01/1985
121060 Elizabeth    Spofford           F  Sales Rep. III        $28,800 US 06/08/1948 01/01/1978
121061 Lauris       Hassam             M  Sales Rep. III        $29,815 US 07/16/1958 07/01/1988
121062 Debra        Armant             F  Sales Rep. IV         $30,305 US 10/28/1988 08/01/2010
121063 Regi         Kinol              M  Sales Rep. II         $35,990 US 07/27/1983 08/01/2009
121064 Asishana     Polky              M  Sales Rep. I          $25,110 US 01/28/1968 09/01/2011
121065 Corneille    Malta              F  Sales Rep. III        $28,040 US 09/05/1988 04/01/2010
121066 Ceresh       Norman             F  Sales Rep. II         $27,250 US 08/23/1948 01/01/1978
121067 Jeanilla     Macnair            F  Sales Rep. IV         $31,865 US 01/18/1990 03/01/2010
121068 Salaheloin   Osuba              M  Sales Rep. II         $27,550 US 12/02/1973 09/01/1996
121069 Jason        Lapsley            M  Sales Rep. II         $26,195 US 03/19/1973 10/01/1994
121070 Agnieszka    Holthouse          F  Sales Rep. III        $29,385 US 11/04/1988 02/01/2010
121071 John         Hoppmann           M  Sales Rep. III        $28,625 US 09/10/1963 09/01/1981
121072 Christer     North              M  Sales Rep. I          $26,105 US 01/10/1983 09/01/2011
121073 Donald       Court              M  Sales Rep. I          $27,100 US 05/15/1953 01/01/2011
121074 Eric         Michonski          M  Sales Rep. I          $26,990 US 03/01/1963 10/01/2011
121075 Kasha        Sugg               F  Sales Rep. II         $28,395 US 12/23/1948 01/01/1978
121076 Micah        Cobb               M  Sales Rep. II         $26,685 US 10/09/1968 01/01/1987
121077 Bryce        Smotherly          M  Sales Rep. III        $28,585 US 09/05/1988 10/01/2010
121078 Lionel       Wende              M  Sales Rep. I          $27,485 US 05/01/1953 11/01/2011
121079 Azmi         Mees               M  Sales Rep. I          $25,770 US 06/03/1978 11/01/2011
121080 Kumar        Chinnis            M  Sales Rep. I          $32,235 US 01/24/1963 09/01/2011
121081 Susie        Knudson            F  Sales Rep. III        $30,235 US 03/28/1953 04/01/1980
121082 Richard      Debank             M  Sales Rep. III        $28,510 US 07/05/1953 10/01/1981
121083 Tingmei      Sutton             F  Sales Rep. I          $27,245 US 03/11/1963 03/01/2011
121084 Tulsidas     Ould               M  Sales Rep. I          $22,710 US 08/16/1968 01/01/2011
121085 Rebecca      Huslage            M  Sales Rep. IV         $32,235 US 11/12/1990 01/01/2011
121086 John-Michael Plybon             M  Sales Rep. I          $26,820 US 12/16/1948 01/01/2011
121087 Virtina      O'Suilleabhain     F  Sales Rep. II         $28,325 US 12/07/1978 03/01/2003
121088 Momolu       Kernitzki          M  Sales Rep. I          $27,240 US 06/10/1992 01/01/2011
121089 Gregory      Sauder             M  Sales Rep. II         $28,095 US 08/21/1958 07/01/1978
121090 Betty        Klibbe             F  Sales Rep. I          $26,600 US 06/19/1958 02/01/2011
121091 Ernest       Kadiri             M  Sales Rep. II         $27,325 US 02/19/1973 01/01/1993
121092 Gynell       Pritt              F  Sales Rep. I          $25,680 US 03/08/1978 08/01/2011
121093 Carl         Vasconcellos       M  Sales Rep. I          $27,410 US 07/18/1968 01/01/2011
121094 Larry        Tate               M  Sales Rep. I          $26,555 US 01/07/1958 09/01/2011
121095 Sara         Kratzke            F  Sales Rep. II         $28,010 US 04/14/1973 07/01/1995
121096 Robert       Newstead           M  Sales Rep. I          $26,335 US 05/18/1973 05/01/2011
121097 Willeta      Chernega           F  Sales Rep. II         $26,830 US 10/23/1978 10/01/1999
121098 Hal          Heatwole           M  Sales Rep. I          $27,475 US 03/22/1992 05/01/2011
121099 Royall       Mrvichin           M  Sales Rep. IV         $32,725 US 03/19/1983 05/01/2004
121100 Tzue-Ing     Cormell            M  Sales Rep. II         $28,135 US 04/27/1953 04/01/1980
121101 Burnetta     Buckner            F  Sales Rep. I          $25,390 US 08/28/1990 11/01/2011
121102 Rocheal      Flammia            F  Sales Rep. I          $27,115 US 06/26/1983 06/01/2011
121103 Brian        Farnsworth         M  Sales Rep. I          $27,260 US 04/28/1992 09/01/2011
121104 Leoma        Johnson            F  Sales Rep. II         $28,315 US 11/12/1968 04/01/1990
121105 Jessica      Savacool           F  Sales Rep. III        $29,545 US 05/09/1983 01/01/2007
121106 James        Hilburger          M  Sales Rep. I          $25,880 US 02/02/1973 02/01/2011
121107 Rose         Anger              F  Sales Rep. IV         $31,380 US 04/24/1990 07/01/2010
121108 Libby        Levi               F  Sales Rep. I          $25,930 US 07/04/1992 11/01/2011
121109 Harold       Boulus             M  Sales Rep. I          $26,035 US 11/05/1973 05/01/2011
121135 Tammy        Ruta               F  Sales Rep. I          $27,010 US 06/07/1958 08/01/2011
121136 Lesia        Galarneau          F  Sales Rep. I          $27,460 US 07/15/1978 12/01/2011
121137 Michael. R.  Boocks             M  Sales Rep. I          $27,055 US 01/18/1992 04/01/2011
121138 Hershell     Tolley             M  Sales Rep. I          $27,265 US 02/28/1953 01/01/2011
121139 Diosdado     Mckee              F  Sales Rep. II         $27,700 US 08/19/1963 07/01/1991
121140 Saunders     Briggi             M  Sales Rep. I          $26,335 US 01/23/1983 04/01/2011
121143 Louis        Favaron            M  Senior Sales Manager  $95,090 US 11/26/1973 07/01/2001
121144 Renee        Capachietti        F  Sales Manager         $83,505 US 06/28/1968 11/01/1995
121145 Dennis       Lansberry          M  Sales Manager         $84,260 US 11/22/1953 04/01/1980
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(sales2.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom          Zhou
Sales Manager        06/01/1993 $108,255
M 08/11/1973 AU
120103 Wilson       Dawes
Sales Manager        01/01/1978  $87,975
M 01/22/1953 AU
120121 Irenie       Elvish
Sales Rep. II        01/01/1978  $26,600
F 08/02/1948 AU
120122 Christina    Ngan
Sales Rep. II        07/01/1982  $27,475
F 07/27/1958 AU
120123 Kimiko       Hotstone
Sales Rep. I         10/01/2011  $26,190
F 09/28/1968 AU
120124 Lucian       Daymond
Sales Rep. I         03/01/2011  $26,480
M 05/13/1963 AU
120125 Fong         Hofmeister
Sales Rep. IV        03/01/1983  $32,040
M 12/06/1958 AU
120126 Satyakam     Denny
Sales Rep. II        08/01/2010  $26,780
M 09/20/1992 AU
120127 Sharryn      Clarkson
Sales Rep. II        11/01/2002  $28,100
F 01/04/1983 AU
120128 Monica       Kletschkus
Sales Rep. IV        11/01/2010  $30,890
F 07/14/1990 AU
120129 Alvin        Roebuck
Sales Rep. III       10/01/1989  $30,070
M 11/22/1968 AU
120130 Kevin        Lyon
Sales Rep. I         05/01/2011  $26,955
M 12/14/1988 AU
120131 Marinus      Surawski
Sales Rep. I         01/01/2011  $26,910
M 09/25/1983 AU
120132 Fancine      Kaiser
Sales Rep. III       10/01/1982  $28,525
F 04/05/1953 AU
120133 Petrea       Soltau
Sales Rep. II        10/01/2010  $27,440
F 04/22/1990 AU
120134 Sian         Shannan
Sales Rep. II        01/01/1978  $28,015
M 06/06/1953 AU
120135 Alexei       Platts
Sales Rep. IV        10/01/2001  $32,490
M 01/26/1973 AU
120136 Atul         Leyden
Sales Rep. I         02/01/2011  $26,605
M 09/16/1983 AU
120137 Marina       Iyengar
Sales Rep. III       03/01/2010  $29,715
F 03/12/1983 AU
120138 Shani        Duckett
Sales Rep. I         07/01/2011  $25,795
F 07/11/1983 AU
120139 Fang         Wilson
Sales Rep. II        09/01/2010  $26,810
F 08/18/1990 AU
120140 Michael      Minas
Sales Rep. I         10/01/2011  $26,970
M 08/03/1992 AU
120141 Amanda       Liebman
Sales Rep. II        05/01/2010  $27,465
F 03/12/1992 AU
120142 Vincent      Eastley
Sales Rep. III       07/01/2010  $29,695
M 06/14/1990 AU
120143 Phu          Sloey
Sales Rep. II        10/01/1986  $26,790
M 05/17/1963 AU
120144 Viney        Barbis
Sales Rep. III       10/01/2010  $30,265
M 03/07/1990 AU
120145 Sandy        Aisbitt
Sales Rep. II        06/01/1989  $26,060
M 01/22/1968 AU
120146 Wendall      Cederlund
Sales Rep. I         08/01/2011  $25,985
M 10/02/1963 AU
120147 Skev         Rusli
Sales Rep. II        10/01/2010  $26,580
F 01/19/1992 AU
120148 Michael      Zubak
Sales Rep. III       06/01/1982  $28,480
M 09/13/1953 AU
120149 Judy         Chantharasy
Sales Rep. I         01/01/2011  $26,390
F 11/21/1978 AU
120150 John         Filo
Sales Rep. III       08/01/1986  $29,965
M 07/09/1958 AU
120151 Julianna     Phaiyakounh
Sales Rep. II        01/01/1978  $26,520
F 11/21/1948 AU
120152 Sean         Dives
Sales Rep. I         04/01/2011  $26,515
M 05/01/1983 AU
120153 Samantha     Waal
Sales Rep. I         01/01/2011  $27,260
F 05/07/1983 AU
120154 Caterina     Hayawardhana
Sales Rep. III       01/01/1978  $30,490
F 07/20/1948 AU
120155 Narelle      James
Sales Rep. III       04/01/2010  $29,990
F 04/22/1988 AU
120156 Gerry        Snellings
Sales Rep. I         03/01/2011  $26,445
F 09/01/1992 AU
120157 Leonid       Karavdic
Sales Rep. II        12/01/2010  $27,860
M 02/21/1990 AU
120158 Daniel       Pilgrim
Sales Rep. III       07/01/1991  $36,605
M 07/14/1968 AU
120159 Lynelle      Phoumirath
Sales Rep. IV        07/01/1990  $30,765
F 02/24/1968 AU
120160 Chuck        Segrave
Sales Rep. I         10/01/2011  $27,115
M 09/09/1958 AU
120161 Rosette      Martines
Sales Rep. III       10/01/2010  $30,785
F 03/07/1992 AU
120162 Randal       Scordia
Sales Rep. I         02/01/2011  $27,215
M 09/05/1992 AU
120163 Brett        Magrath
Sales Rep. II        01/01/1995  $26,735
M 05/22/1968 AU
120164 Ranj         Stamalis
Sales Rep. II        02/01/1986  $27,450
F 11/26/1963 AU
120165 Tadashi      Pretorius
Sales Rep. I         03/01/2011  $27,050
M 03/19/1988 AU
120166 Fadi         Nowd
Sales Rep. IV        01/01/1978  $30,660
M 06/14/1948 AU
120167 Kimiko       Tilley
Sales Rep. I         02/01/2011  $25,185
F 05/04/1958 AU
120168 Selina       Barcoe
Sales Rep. I         11/01/2011  $25,275
F 03/24/1988 AU
120169 Cos          Tannous
Sales Rep. III       05/01/2010  $28,135
M 01/02/1988 AU
120170 Alban        Kingston
Sales Rep. III       10/01/1996  $28,830
M 02/25/1978 AU
120171 Alena        Moody
Sales Rep. II        09/01/2010  $26,205
F 07/19/1988 AU
120172 Edwin        Comber
Sales Rep. III       01/01/1978  $28,345
M 04/01/1948 AU
120173 Hernani      Osborn
Sales Rep. I         06/01/2011  $26,715
M 02/23/1958 AU
120174 Doungkamol   Simms
Sales Rep. I         01/01/2011  $26,850
F 01/10/1948 AU
120175 Andrew       Conolly
Sales Rep. I         10/01/2011  $25,745
M 08/18/1992 AU
120176 Koavea       Pa
Sales Rep. I         11/01/2011  $26,095
M 11/09/1990 AU
120177 Franca       Kierce
Sales Rep. III       02/01/2002  $28,745
F 04/05/1983 AU
120178 Billy        Plested
Sales Rep. II        04/01/1978  $26,165
M 11/23/1958 AU
120179 Matsuoka     Wills
Sales Rep. III       01/01/2008  $28,510
M 03/15/1978 AU
120180 Vino         George
Sales Rep. II        12/01/1982  $26,970
M 06/27/1958 AU
120198 Meera        Body
Sales Rep. III       12/01/2010  $28,025
F 01/21/1992 AU
120261 Harry        Highpoint
Chief Sales Officer  08/01/1991 $243,190
M 02/21/1973 US
121018 Julienne     Magolan
Sales Rep. II        01/01/1978  $27,560
F 01/03/1948 US
121019 Scott        Desanctis
Sales Rep. IV        06/01/2008  $31,320
M 06/25/1990 US
121020 Cherda       Ridley
Sales Rep. IV        05/01/2006  $31,750
F 02/23/1988 US
121021 Priscilla    Farren
Sales Rep. IV        03/01/1998  $32,985
F 12/10/1978 US
121022 Robert       Stevens
Sales Rep. IV        02/01/2006  $32,210
M 10/28/1983 US
121023 Shawn        Fuller
Sales Rep. I         05/01/2011  $26,010
M 03/13/1968 US
121024 Michael      Westlund
Sales Rep. II        05/01/2008  $26,600
M 09/21/1988 US
121025 Barnaby      Cassey
Sales Rep. II        09/01/1979  $28,295
M 10/10/1953 US
121026 Terrill      Jaime
Sales Rep. IV        04/01/2010  $31,515
M 11/08/1990 US
121027 Allan        Rudder
Sales Rep. II        12/01/1993  $26,165
M 05/05/1968 US
121028 William      Smades
Sales Rep. I         11/01/2011  $26,585
M 04/27/1992 US
121029 Kuo-Chung    Mcelwee
Sales Rep. I         12/01/2011  $27,225
M 12/22/1968 US
121030 Jeryl        Areu
Sales Rep. I         02/01/2011  $26,745
M 11/12/1983 US
121031 Scott        Filan
Sales Rep. III       08/01/1989  $28,060
M 07/09/1968 US
121032 Nasim        Smith
Sales Rep. IV        03/01/2010  $31,335
M 02/24/1992 US
121033 Kristie      Snitzer
Sales Rep. III       06/01/2008  $29,775
F 11/06/1990 US
121034 John         Kirkman
Sales Rep. II        01/01/2011  $27,110
M 08/23/1992 US
121035 James        Blackley
Sales Rep. II        01/01/1978  $26,460
M 03/25/1948 US
121036 Teresa       Mesley
Sales Rep. I         10/01/2011  $25,965
F 07/18/1992 US
121037 Muthukumar   Miketa
Sales Rep. III       03/01/2006  $28,310
M 06/12/1978 US
121038 David        Anstey
Sales Rep. I         08/01/2011  $25,285
M 02/13/1992 US
121039 Donald       Washington
Sales Rep. II        05/01/1984  $27,460
M 06/03/1958 US
121040 Brienne      Darrohn
Sales Rep. III       11/01/1986  $29,525
F 07/06/1963 US
121041 Jaime        Wetherington
Sales Rep. II        01/01/1978  $26,120
F 02/04/1948 US
121042 Joseph       Robbin-Coker
Sales Rep. III       11/01/2003  $28,845
M 04/04/1983 US
121043 Sigrid       Kagarise
Sales Rep. II        03/01/1996  $28,225
F 11/09/1973 US
121044 Ray          Abbott
Sales Rep. I         08/01/2011  $25,660
M 12/11/1958 US
121045 Cascile      Hampton
Sales Rep. II        01/01/1998  $28,560
F 06/13/1968 US
121046 Roger        Mandzak
Sales Rep. I         07/01/2011  $25,845
M 09/07/1988 US
121047 Karen        Grzebien
Sales Rep. I         09/01/2011  $25,820
F 11/26/1983 US
121048 Lawrie       Clark
Sales Rep. I         09/01/2011  $26,560
F 06/24/1988 US
121049 Perrior      Bataineh
Sales Rep. I         12/01/2011  $26,930
F 02/14/1990 US
121050 Patricia     Capristo-Abramczyk
Sales Rep. II        12/01/2010  $26,080
F 01/12/1990 US
121051 Glorina      Myers
Sales Rep. I         11/01/2011  $26,025
F 05/02/1953 US
121052 Richard      Fay
Sales Rep. II        11/01/2010  $26,900
M 01/09/1990 US
121053 Tywanna      Mcdade
Sales Rep. III       02/01/1978  $29,955
F 09/23/1948 US
121054 Daniel       Pulliam
Sales Rep. III       11/01/1980  $29,805
M 11/12/1958 US
121055 Clement      Davis
Sales Rep. III       08/01/2010  $30,185
M 01/08/1992 US
121056 Stacey       Lyszyk
Sales Rep. II        05/01/2007  $28,325
F 07/05/1988 US
121057 Tachaun      Voron
Sales Rep. I         12/01/2011  $25,125
M 12/26/1963 US
121058 Del          Kohake
Sales Rep. I         10/01/2011  $26,270
M 07/12/1978 US
121059 Jacqulin     Carhide
Sales Rep. II        04/01/1985  $27,425
F 10/25/1963 US
121060 Elizabeth    Spofford
Sales Rep. III       01/01/1978  $28,800
F 06/08/1948 US
121061 Lauris       Hassam
Sales Rep. III       07/01/1988  $29,815
M 07/16/1958 US
121062 Debra        Armant
Sales Rep. IV        08/01/2010  $30,305
F 10/28/1988 US
121063 Regi         Kinol
Sales Rep. II        08/01/2009  $35,990
M 07/27/1983 US
121064 Asishana     Polky
Sales Rep. I         09/01/2011  $25,110
M 01/28/1968 US
121065 Corneille    Malta
Sales Rep. III       04/01/2010  $28,040
F 09/05/1988 US
121066 Ceresh       Norman
Sales Rep. II        01/01/1978  $27,250
F 08/23/1948 US
121067 Jeanilla     Macnair
Sales Rep. IV        03/01/2010  $31,865
F 01/18/1990 US
121068 Salaheloin   Osuba
Sales Rep. II        09/01/1996  $27,550
M 12/02/1973 US
121069 Jason        Lapsley
Sales Rep. II        10/01/1994  $26,195
M 03/19/1973 US
121070 Agnieszka    Holthouse
Sales Rep. III       02/01/2010  $29,385
F 11/04/1988 US
121071 John         Hoppmann
Sales Rep. III       09/01/1981  $28,625
M 09/10/1963 US
121072 Christer     North
Sales Rep. I         09/01/2011  $26,105
M 01/10/1983 US
121073 Donald       Court
Sales Rep. I         01/01/2011  $27,100
M 05/15/1953 US
121074 Eric         Michonski
Sales Rep. I         10/01/2011  $26,990
M 03/01/1963 US
121075 Kasha        Sugg
Sales Rep. II        01/01/1978  $28,395
F 12/23/1948 US
121076 Micah        Cobb
Sales Rep. II        01/01/1987  $26,685
M 10/09/1968 US
121077 Bryce        Smotherly
Sales Rep. III       10/01/2010  $28,585
M 09/05/1988 US
121078 Lionel       Wende
Sales Rep. I         11/01/2011  $27,485
M 05/01/1953 US
121079 Azmi         Mees
Sales Rep. I         11/01/2011  $25,770
M 06/03/1978 US
121080 Kumar        Chinnis
Sales Rep. I         09/01/2011  $32,235
M 01/24/1963 US
121081 Susie        Knudson
Sales Rep. III       04/01/1980  $30,235
F 03/28/1953 US
121082 Richard      Debank
Sales Rep. III       10/01/1981  $28,510
M 07/05/1953 US
121083 Tingmei      Sutton
Sales Rep. I         03/01/2011  $27,245
F 03/11/1963 US
121084 Tulsidas     Ould
Sales Rep. I         01/01/2011  $22,710
M 08/16/1968 US
121085 Rebecca      Huslage
Sales Rep. IV        01/01/2011  $32,235
M 11/12/1990 US
121086 John-Michael Plybon
Sales Rep. I         01/01/2011  $26,820
M 12/16/1948 US
121087 Virtina      O'Suilleabhain
Sales Rep. II        03/01/2003  $28,325
F 12/07/1978 US
121088 Momolu       Kernitzki
Sales Rep. I         01/01/2011  $27,240
M 06/10/1992 US
121089 Gregory      Sauder
Sales Rep. II        07/01/1978  $28,095
M 08/21/1958 US
121090 Betty        Klibbe
Sales Rep. I         02/01/2011  $26,600
F 06/19/1958 US
121091 Ernest       Kadiri
Sales Rep. II        01/01/1993  $27,325
M 02/19/1973 US
121092 Gynell       Pritt
Sales Rep. I         08/01/2011  $25,680
F 03/08/1978 US
121093 Carl         Vasconcellos
Sales Rep. I         01/01/2011  $27,410
M 07/18/1968 US
121094 Larry        Tate
Sales Rep. I         09/01/2011  $26,555
M 01/07/1958 US
121095 Sara         Kratzke
Sales Rep. II        07/01/1995  $28,010
F 04/14/1973 US
121096 Robert       Newstead
Sales Rep. I         05/01/2011  $26,335
M 05/18/1973 US
121097 Willeta      Chernega
Sales Rep. II        10/01/1999  $26,830
F 10/23/1978 US
121098 Hal          Heatwole
Sales Rep. I         05/01/2011  $27,475
M 03/22/1992 US
121099 Royall       Mrvichin
Sales Rep. IV        05/01/2004  $32,725
M 03/19/1983 US
121100 Tzue-Ing     Cormell
Sales Rep. II        04/01/1980  $28,135
M 04/27/1953 US
121101 Burnetta     Buckner
Sales Rep. I         11/01/2011  $25,390
F 08/28/1990 US
121102 Rocheal      Flammia
Sales Rep. I         06/01/2011  $27,115
F 06/26/1983 US
121103 Brian        Farnsworth
Sales Rep. I         09/01/2011  $27,260
M 04/28/1992 US
121104 Leoma        Johnson
Sales Rep. II        04/01/1990  $28,315
F 11/12/1968 US
121105 Jessica      Savacool
Sales Rep. III       01/01/2007  $29,545
F 05/09/1983 US
121106 James        Hilburger
Sales Rep. I         02/01/2011  $25,880
M 02/02/1973 US
121107 Rose         Anger
Sales Rep. IV        07/01/2010  $31,380
F 04/24/1990 US
121108 Libby        Levi
Sales Rep. I         11/01/2011  $25,930
F 07/04/1992 US
121109 Harold       Boulus
Sales Rep. I         05/01/2011  $26,035
M 11/05/1973 US
121135 Tammy        Ruta
Sales Rep. I         08/01/2011  $27,010
F 06/07/1958 US
121136 Lesia        Galarneau
Sales Rep. I         12/01/2011  $27,460
F 07/15/1978 US
121137 Michael. R.  Boocks
Sales Rep. I         04/01/2011  $27,055
M 01/18/1992 US
121138 Hershell     Tolley
Sales Rep. I         01/01/2011  $27,265
M 02/28/1953 US
121139 Diosdado     Mckee
Sales Rep. II        07/01/1991  $27,700
F 08/19/1963 US
121140 Saunders     Briggi
Sales Rep. I         04/01/2011  $26,335
M 01/23/1983 US
121143 Louis        Favaron
Senior Sales Manager 07/01/2001  $95,090
M 11/26/1973 US
121144 Renee        Capachietti
Sales Manager        11/01/1995  $83,505
F 06/28/1968 US
121145 Dennis       Lansberry
Sales Manager        04/01/1980  $84,260
M 11/22/1953 US
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(sales3.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom          Zhou                  Sales Manager
$108.255 AU 11/08/1973 01/06/1993
120103 Wilson       Dawes                 Sales Manager
 $87.975 AU 22/01/1953 01/01/1978
120121 Irenie       Elvish                Sales Rep. II
 $26.600 AU 02/08/1948 01/01/1978
120122 Christina    Ngan                  Sales Rep. II
 $27.475 AU 27/07/1958 01/07/1982
120123 Kimiko       Hotstone              Sales Rep. I
 $26.190 AU 28/09/1968 01/10/2011
120124 Lucian       Daymond               Sales Rep. I
 $26.480 AU 13/05/1963 01/03/2011
120125 Fong         Hofmeister            Sales Rep. IV
 $32.040 AU 06/12/1958 01/03/1983
120126 Satyakam     Denny                 Sales Rep. II
 $26.780 AU 20/09/1992 01/08/2010
120127 Sharryn      Clarkson              Sales Rep. II
 $28.100 AU 04/01/1983 01/11/2002
120128 Monica       Kletschkus            Sales Rep. IV
 $30.890 AU 14/07/1990 01/11/2010
120129 Alvin        Roebuck               Sales Rep. III
 $30.070 AU 22/11/1968 01/10/1989
120130 Kevin        Lyon                  Sales Rep. I
 $26.955 AU 14/12/1988 01/05/2011
120131 Marinus      Surawski              Sales Rep. I
 $26.910 AU 25/09/1983 01/01/2011
120132 Fancine      Kaiser                Sales Rep. III
 $28.525 AU 05/04/1953 01/10/1982
120133 Petrea       Soltau                Sales Rep. II
 $27.440 AU 22/04/1990 01/10/2010
120134 Sian         Shannan               Sales Rep. II
 $28.015 AU 06/06/1953 01/01/1978
120135 Alexei       Platts                Sales Rep. IV
 $32.490 AU 26/01/1973 01/10/2001
120136 Atul         Leyden                Sales Rep. I
 $26.605 AU 16/09/1983 01/02/2011
120137 Marina       Iyengar               Sales Rep. III
 $29.715 AU 12/03/1983 01/03/2010
120138 Shani        Duckett               Sales Rep. I
 $25.795 AU 11/07/1983 01/07/2011
120139 Fang         Wilson                Sales Rep. II
 $26.810 AU 18/08/1990 01/09/2010
120140 Michael      Minas                 Sales Rep. I
 $26.970 AU 03/08/1992 01/10/2011
120141 Amanda       Liebman               Sales Rep. II
 $27.465 AU 12/03/1992 01/05/2010
120142 Vincent      Eastley               Sales Rep. III
 $29.695 AU 14/06/1990 01/07/2010
120143 Phu          Sloey                 Sales Rep. II
 $26.790 AU 17/05/1963 01/10/1986
120144 Viney        Barbis                Sales Rep. III
 $30.265 AU 07/03/1990 01/10/2010
120145 Sandy        Aisbitt               Sales Rep. II
 $26.060 AU 22/01/1968 01/06/1989
120146 Wendall      Cederlund             Sales Rep. I
 $25.985 AU 02/10/1963 01/08/2011
120147 Skev         Rusli                 Sales Rep. II
 $26.580 AU 19/01/1992 01/10/2010
120148 Michael      Zubak                 Sales Rep. III
 $28.480 AU 13/09/1953 01/06/1982
120149 Judy         Chantharasy           Sales Rep. I
 $26.390 AU 21/11/1978 01/01/2011
120150 John         Filo                  Sales Rep. III
 $29.965 AU 09/07/1958 01/08/1986
120151 Julianna     Phaiyakounh           Sales Rep. II
 $26.520 AU 21/11/1948 01/01/1978
120152 Sean         Dives                 Sales Rep. I
 $26.515 AU 01/05/1983 01/04/2011
120153 Samantha     Waal                  Sales Rep. I
 $27.260 AU 07/05/1983 01/01/2011
120154 Caterina     Hayawardhana          Sales Rep. III
 $30.490 AU 20/07/1948 01/01/1978
120155 Narelle      James                 Sales Rep. III
 $29.990 AU 22/04/1988 01/04/2010
120156 Gerry        Snellings             Sales Rep. I
 $26.445 AU 01/09/1992 01/03/2011
120157 Leonid       Karavdic              Sales Rep. II
 $27.860 AU 21/02/1990 01/12/2010
120158 Daniel       Pilgrim               Sales Rep. III
 $36.605 AU 14/07/1968 01/07/1991
120159 Lynelle      Phoumirath            Sales Rep. IV
 $30.765 AU 24/02/1968 01/07/1990
120160 Chuck        Segrave               Sales Rep. I
 $27.115 AU 09/09/1958 01/10/2011
120161 Rosette      Martines              Sales Rep. III
 $30.785 AU 07/03/1992 01/10/2010
120162 Randal       Scordia               Sales Rep. I
 $27.215 AU 05/09/1992 01/02/2011
120163 Brett        Magrath               Sales Rep. II
 $26.735 AU 22/05/1968 01/01/1995
120164 Ranj         Stamalis              Sales Rep. II
 $27.450 AU 26/11/1963 01/02/1986
120165 Tadashi      Pretorius             Sales Rep. I
 $27.050 AU 19/03/1988 01/03/2011
120166 Fadi         Nowd                  Sales Rep. IV
 $30.660 AU 14/06/1948 01/01/1978
120167 Kimiko       Tilley                Sales Rep. I
 $25.185 AU 04/05/1958 01/02/2011
120168 Selina       Barcoe                Sales Rep. I
 $25.275 AU 24/03/1988 01/11/2011
120169 Cos          Tannous               Sales Rep. III
 $28.135 AU 02/01/1988 01/05/2010
120170 Alban        Kingston              Sales Rep. III
 $28.830 AU 25/02/1978 01/10/1996
120171 Alena        Moody                 Sales Rep. II
 $26.205 AU 19/07/1988 01/09/2010
120172 Edwin        Comber                Sales Rep. III
 $28.345 AU 01/04/1948 01/01/1978
120173 Hernani      Osborn                Sales Rep. I
 $26.715 AU 23/02/1958 01/06/2011
120174 Doungkamol   Simms                 Sales Rep. I
 $26.850 AU 10/01/1948 01/01/2011
120175 Andrew       Conolly               Sales Rep. I
 $25.745 AU 18/08/1992 01/10/2011
120176 Koavea       Pa                    Sales Rep. I
 $26.095 AU 09/11/1990 01/11/2011
120177 Franca       Kierce                Sales Rep. III
 $28.745 AU 05/04/1983 01/02/2002
120178 Billy        Plested               Sales Rep. II
 $26.165 AU 23/11/1958 01/04/1978
120179 Matsuoka     Wills                 Sales Rep. III
 $28.510 AU 15/03/1978 01/01/2008
120180 Vino         George                Sales Rep. II
 $26.970 AU 27/06/1958 01/12/1982
120198 Meera        Body                  Sales Rep. III
 $28.025 AU 21/01/1992 01/12/2010
120261 Harry        Highpoint             Chief Sales Officer
$243,190 US 02/21/1973 08/01/1991
121018 Julienne     Magolan               Sales Rep. II
 $27,560 US 01/03/1948 01/01/1978
121019 Scott        Desanctis             Sales Rep. IV
 $31,320 US 06/25/1990 06/01/2008
121020 Cherda       Ridley                Sales Rep. IV
 $31,750 US 02/23/1988 05/01/2006
121021 Priscilla    Farren                Sales Rep. IV
 $32,985 US 12/10/1978 03/01/1998
121022 Robert       Stevens               Sales Rep. IV
 $32,210 US 10/28/1983 02/01/2006
121023 Shawn        Fuller                Sales Rep. I
 $26,010 US 03/13/1968 05/01/2011
121024 Michael      Westlund              Sales Rep. II
 $26,600 US 09/21/1988 05/01/2008
121025 Barnaby      Cassey                Sales Rep. II
 $28,295 US 10/10/1953 09/01/1979
121026 Terrill      Jaime                 Sales Rep. IV
 $31,515 US 11/08/1990 04/01/2010
121027 Allan        Rudder                Sales Rep. II
 $26,165 US 05/05/1968 12/01/1993
121028 William      Smades                Sales Rep. I
 $26,585 US 04/27/1992 11/01/2011
121029 Kuo-Chung    Mcelwee               Sales Rep. I
 $27,225 US 12/22/1968 12/01/2011
121030 Jeryl        Areu                  Sales Rep. I
 $26,745 US 11/12/1983 02/01/2011
121031 Scott        Filan                 Sales Rep. III
 $28,060 US 07/09/1968 08/01/1989
121032 Nasim        Smith                 Sales Rep. IV
 $31,335 US 02/24/1992 03/01/2010
121033 Kristie      Snitzer               Sales Rep. III
 $29,775 US 11/06/1990 06/01/2008
121034 John         Kirkman               Sales Rep. II
 $27,110 US 08/23/1992 01/01/2011
121035 James        Blackley              Sales Rep. II
 $26,460 US 03/25/1948 01/01/1978
121036 Teresa       Mesley                Sales Rep. I
 $25,965 US 07/18/1992 10/01/2011
121037 Muthukumar   Miketa                Sales Rep. III
 $28,310 US 06/12/1978 03/01/2006
121038 David        Anstey                Sales Rep. I
 $25,285 US 02/13/1992 08/01/2011
121039 Donald       Washington            Sales Rep. II
 $27,460 US 06/03/1958 05/01/1984
121040 Brienne      Darrohn               Sales Rep. III
 $29,525 US 07/06/1963 11/01/1986
121041 Jaime        Wetherington          Sales Rep. II
 $26,120 US 02/04/1948 01/01/1978
121042 Joseph       Robbin-Coker          Sales Rep. III
 $28,845 US 04/04/1983 11/01/2003
121043 Sigrid       Kagarise              Sales Rep. II
 $28,225 US 11/09/1973 03/01/1996
121044 Ray          Abbott                Sales Rep. I
 $25,660 US 12/11/1958 08/01/2011
121045 Cascile      Hampton               Sales Rep. II
 $28,560 US 06/13/1968 01/01/1998
121046 Roger        Mandzak               Sales Rep. I
 $25,845 US 09/07/1988 07/01/2011
121047 Karen        Grzebien              Sales Rep. I
 $25,820 US 11/26/1983 09/01/2011
121048 Lawrie       Clark                 Sales Rep. I
 $26,560 US 06/24/1988 09/01/2011
121049 Perrior      Bataineh              Sales Rep. I
 $26,930 US 02/14/1990 12/01/2011
121050 Patricia     Capristo-Abramczyk    Sales Rep. II
 $26,080 US 01/12/1990 12/01/2010
121051 Glorina      Myers                 Sales Rep. I
 $26,025 US 05/02/1953 11/01/2011
121052 Richard      Fay                   Sales Rep. II
 $26,900 US 01/09/1990 11/01/2010
121053 Tywanna      Mcdade                Sales Rep. III
 $29,955 US 09/23/1948 02/01/1978
121054 Daniel       Pulliam               Sales Rep. III
 $29,805 US 11/12/1958 11/01/1980
121055 Clement      Davis                 Sales Rep. III
 $30,185 US 01/08/1992 08/01/2010
121056 Stacey       Lyszyk                Sales Rep. II
 $28,325 US 07/05/1988 05/01/2007
121057 Tachaun      Voron                 Sales Rep. I
 $25,125 US 12/26/1963 12/01/2011
121058 Del          Kohake                Sales Rep. I
 $26,270 US 07/12/1978 10/01/2011
121059 Jacqulin     Carhide               Sales Rep. II
 $27,425 US 10/25/1963 04/01/1985
121060 Elizabeth    Spofford              Sales Rep. III
 $28,800 US 06/08/1948 01/01/1978
121061 Lauris       Hassam                Sales Rep. III
 $29,815 US 07/16/1958 07/01/1988
121062 Debra        Armant                Sales Rep. IV
 $30,305 US 10/28/1988 08/01/2010
121063 Regi         Kinol                 Sales Rep. II
 $35,990 US 07/27/1983 08/01/2009
121064 Asishana     Polky                 Sales Rep. I
 $25,110 US 01/28/1968 09/01/2011
121065 Corneille    Malta                 Sales Rep. III
 $28,040 US 09/05/1988 04/01/2010
121066 Ceresh       Norman                Sales Rep. II
 $27,250 US 08/23/1948 01/01/1978
121067 Jeanilla     Macnair               Sales Rep. IV
 $31,865 US 01/18/1990 03/01/2010
121068 Salaheloin   Osuba                 Sales Rep. II
 $27,550 US 12/02/1973 09/01/1996
121069 Jason        Lapsley               Sales Rep. II
 $26,195 US 03/19/1973 10/01/1994
121070 Agnieszka    Holthouse             Sales Rep. III
 $29,385 US 11/04/1988 02/01/2010
121071 John         Hoppmann              Sales Rep. III
 $28,625 US 09/10/1963 09/01/1981
121072 Christer     North                 Sales Rep. I
 $26,105 US 01/10/1983 09/01/2011
121073 Donald       Court                 Sales Rep. I
 $27,100 US 05/15/1953 01/01/2011
121074 Eric         Michonski             Sales Rep. I
 $26,990 US 03/01/1963 10/01/2011
121075 Kasha        Sugg                  Sales Rep. II
 $28,395 US 12/23/1948 01/01/1978
121076 Micah        Cobb                  Sales Rep. II
 $26,685 US 10/09/1968 01/01/1987
121077 Bryce        Smotherly             Sales Rep. III
 $28,585 US 09/05/1988 10/01/2010
121078 Lionel       Wende                 Sales Rep. I
 $27,485 US 05/01/1953 11/01/2011
121079 Azmi         Mees                  Sales Rep. I
 $25,770 US 06/03/1978 11/01/2011
121080 Kumar        Chinnis               Sales Rep. I
 $32,235 US 01/24/1963 09/01/2011
121081 Susie        Knudson               Sales Rep. III
 $30,235 US 03/28/1953 04/01/1980
121082 Richard      Debank                Sales Rep. III
 $28,510 US 07/05/1953 10/01/1981
121083 Tingmei      Sutton                Sales Rep. I
 $27,245 US 03/11/1963 03/01/2011
121084 Tulsidas     Ould                  Sales Rep. I
 $22,710 US 08/16/1968 01/01/2011
121085 Rebecca      Huslage               Sales Rep. IV
 $32,235 US 11/12/1990 01/01/2011
121086 John-Michael Plybon                Sales Rep. I
 $26,820 US 12/16/1948 01/01/2011
121087 Virtina      O'Suilleabhain        Sales Rep. II
 $28,325 US 12/07/1978 03/01/2003
121088 Momolu       Kernitzki             Sales Rep. I
 $27,240 US 06/10/1992 01/01/2011
121089 Gregory      Sauder                Sales Rep. II
 $28,095 US 08/21/1958 07/01/1978
121090 Betty        Klibbe                Sales Rep. I
 $26,600 US 06/19/1958 02/01/2011
121091 Ernest       Kadiri                Sales Rep. II
 $27,325 US 02/19/1973 01/01/1993
121092 Gynell       Pritt                 Sales Rep. I
 $25,680 US 03/08/1978 08/01/2011
121093 Carl         Vasconcellos          Sales Rep. I
 $27,410 US 07/18/1968 01/01/2011
121094 Larry        Tate                  Sales Rep. I
 $26,555 US 01/07/1958 09/01/2011
121095 Sara         Kratzke               Sales Rep. II
 $28,010 US 04/14/1973 07/01/1995
121096 Robert       Newstead              Sales Rep. I
 $26,335 US 05/18/1973 05/01/2011
121097 Willeta      Chernega              Sales Rep. II
 $26,830 US 10/23/1978 10/01/1999
121098 Hal          Heatwole              Sales Rep. I
 $27,475 US 03/22/1992 05/01/2011
121099 Royall       Mrvichin              Sales Rep. IV
 $32,725 US 03/19/1983 05/01/2004
121100 Tzue-Ing     Cormell               Sales Rep. II
 $28,135 US 04/27/1953 04/01/1980
121101 Burnetta     Buckner               Sales Rep. I
 $25,390 US 08/28/1990 11/01/2011
121102 Rocheal      Flammia               Sales Rep. I
 $27,115 US 06/26/1983 06/01/2011
121103 Brian        Farnsworth            Sales Rep. I
 $27,260 US 04/28/1992 09/01/2011
121104 Leoma        Johnson               Sales Rep. II
 $28,315 US 11/12/1968 04/01/1990
121105 Jessica      Savacool              Sales Rep. III
 $29,545 US 05/09/1983 01/01/2007
121106 James        Hilburger             Sales Rep. I
 $25,880 US 02/02/1973 02/01/2011
121107 Rose         Anger                 Sales Rep. IV
 $31,380 US 04/24/1990 07/01/2010
121108 Libby        Levi                  Sales Rep. I
 $25,930 US 07/04/1992 11/01/2011
121109 Harold       Boulus                Sales Rep. I
 $26,035 US 11/05/1973 05/01/2011
121135 Tammy        Ruta                  Sales Rep. I
 $27,010 US 06/07/1958 08/01/2011
121136 Lesia        Galarneau             Sales Rep. I
 $27,460 US 07/15/1978 12/01/2011
121137 Michael. R.  Boocks                Sales Rep. I
 $27,055 US 01/18/1992 04/01/2011
121138 Hershell     Tolley                Sales Rep. I
 $27,265 US 02/28/1953 01/01/2011
121139 Diosdado     Mckee                 Sales Rep. II
 $27,700 US 08/19/1963 07/01/1991
121140 Saunders     Briggi                Sales Rep. I
 $26,335 US 01/23/1983 04/01/2011
121143 Louis        Favaron               Senior Sales Manager
 $95,090 US 11/26/1973 07/01/2001
121144 Renee        Capachietti           Sales Manager
 $83,505 US 06/28/1968 11/01/1995
121145 Dennis       Lansberry             Sales Manager
 $84,260 US 11/22/1953 04/01/1980
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(seminar.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
J. Mitchell         Very Well done!  Rating:5
Amy Jung            Rating:4
Carl Heisman           Rating:4
Linda Deal          Not enough give aways  Rating:3
Gabrielle Heron     Nice! Rating:4
                    Not helpful at all Rating:2
Kyle Patterson      Very good. Need more like it  Rating:5
;;;;
run;

data _null_;
infile datalines truncover length=length;
input;
file mydata(Ship02.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
50001, 4feb2008, 1320
50002, 11feb2008, 1520, 140
50003, 22feb2008, 900, 130
50004, 24feb2008, 1720
50005, 28feb2008, 1700, 110
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(supply.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
50 Scandinavian Clothing A/S NO
109 Petterson AB SE
316 Prime Sports Ltd GB
755 Top Sports DK
772 AllSeasons Outdoor Clothing US
798 Sportico ES
1280 British Sports Ltd GB
1303 Eclipse Inc US
1684 Magnifico Sports PT
1747 Pro Sportswear Inc US
2963 3Top Sports US
2995 Van Dammeren International NL
3298 A Team Sports US
3664 Triple Sportswear Inc US
3808 Carolina Sports US
3815 Roll-Over Inc US
4168 Rubby Zapatos S.A. ES
4514 Royal Darts Ltd GB
4646 Mayday Inc US
4718 KN Outdoor Trading Inc US
4742 Luna sastreria S.A. ES
4793 Norsok A/S DK
5503 Ultra Sporting Goods Inc US
5810 Teamsports Inc US
5922 Force Sports BE
6071 SportsFan Products Ltd GB
6153 Nautlius SportsWear Inc US
6355 Svensson Trading AB SE
7511 Mike Schaeffer Inc US
10225 HighPoint Trading US
10692 Toto Outdoor Gear AU
11427 Typhoon Clothing AU
12283 EA Sports Limited GB
12869 Truls Sporting Goods NO
13079 Le Blanc S.A. FR
13198 Twain Inc US
13199 Massif S.A. FR
13314 Triffy B.V. NL
13710 SD Sporting Goods Inc US
14593 Fga Sports Inc US
14624 Ypsilon S.A. FR
14648 Top Sports Inc US
14682 Greenline Sports Ltd GB
15218 Miller Trading Inc US
15938 TeeTime Ltd GB
16292 Dolphin Sportswear Inc US
16422 Outback Outfitters Ltd GB
16542 TrimSport B.V. NL
16733 Fuller Trading Co. CA
16814 CrystalClear Optics Inc CA
17832 GrandSlam Sporting Goods Ltd GB
18139 Green Lime Sports Inc US
;;;;
run;
filename mydata clear;



 