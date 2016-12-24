/*************************************************************\
| Copyright (C) 2015 by SAS Institute Inc., Cary, NC, USA.    |
|                                                             |
| SAS (R) is a registered trademark of SAS Institute Inc.     |
|                                                             |
| This program sets up practice data for the SAS e-course     |
| ECST131.                                                     |
\*************************************************************/


options nosource nonotes;
options nocardimage validvarname=V7 replace ls=200;

%let location=statdata;

data _null_;

   /* determine fileref paths, delimiters, file options */

   length fileno fileyes $18 fileset $ 1024;

   oshost=trim(substr(symget('sysscp'),1,2));
   filepath=trim(pathname("&location"));
      if (oshost = "OS") and (length(symget('sysscp'))=2) then
         do;
            filepath=scan(filepath,1);
            dlm=".";
            fileno="disp=(new,catlg)";
            fileyes="disp=(old,catlg)";
         end;
      else do;
         host=trim(substr(symget('sysscp'),1,3));
            if (host in ('WIN','OS2')) then
               do;
                  filepath=trim(pathname("&location"));
                  dlm="\";
                  fileno="";
                  fileyes="";
               end;
           else
               do;
                  filepath=trim(pathname("&location"));
                  dlm="/";
                  fileno="";
                  fileyes="";
               end;
         
     end;
     call symputx("filemac",filepath);
     if (oshost = "OS") and (length(symget('sysscp'))=2) then
        call symputx("sasmac","Your SAS library path for z/OS: " ||
                               trim(pathname("&location")));
     else call symputx("sasmac","");

run;

  /* create formats */


proc format library=library;
	value dosefmt 
			1='Placebo'
			2='50 mg'
			3='100 mg'
			4='200 mg';
	value survfmt 
			1 = "Survived"
			0 = "Died";		
    value purfmt 1 = "$100 +"
                 0 = "< $100";
    value incfmt 1='Low Income'
                 2='Medium Income'
                 3='High Income';
    value safefmt 0='Average or Above'
                  1='Below Average';
    value sizefmt 1='Small'
                  2='Medium'
                  3='Large';
    value vstfmt 0='staff only'
                 1='physician';
    value spcfmt 1='oncologist'
                 2='internal med'
                 3='family prac'
                 4='pulmonolgist'
                 5='other special'
				 ;
	value $MS_SubClass
		   "020"="1-STORY 1946 AND NEWER ALL STYLES"
		   "030"="1-STORY 1945 AND OLDER"
		   "040"="1-STORY W/FINISHED ATTIC ALL AGES"
		   "045"="1-1/2 STORY - UNFINISHED ALL AGES"
		   "050"="1-1/2 STORY FINISHED ALL AGES"
		   "060"="2-STORY 1946 AND NEWER"
		   "070"="2-STORY 1945 AND OLDER"
		   "075"="2-1/2 STORY ALL AGES"
		   "080"="SPLIT OR MULTI-LEVEL"
		   "085"="SPLIT FOYER"
		   "090"="DUPLEX - ALL STYLES AND AGES"
		   "120"="1-STORY PUD (Planned Unit Development) - 1946 AND NEWER"
		   "150"="1-1/2 STORY PUD - ALL AGES"
		   "160"="2-STORY PUD - 1946 AND NEWER"
		   "180"="PUD - MULTILEVEL - INCL SPLIT LEV/FOYER"
		   "190"="2 FAMILY CONVERSION - ALL STYLES AND AGES"
		   ;
	value $MS_Zoning
		   "A"="Agriculture"
		   "C"="Commercial"
		   "FV"="Floating Village Residential"
		   "I"="Industrial"
		   "RH"="Residential High Density"
		   "RL"="Residential Low Density"
		   "RP"="Residential Low Density Park"
		   "RM"="Residential Medium Density"
		   ;
	value $Street
		   "Grvl"="Gravel"
		   "Pave"="Paved"
		   ;
	value $Alley
		   "Grvl"="Gravel"
		   "Pave"="Paved"
		   "NA "="No alley access"
		   ;
	value $Lot_Shape
		   "Reg"="Regular"
		   "IR1"="Slightly irregular"
		   "IR2"="Moderately Irregular"
		   "IR3"="Irregular"
		   ;
	value $Land_Contour
		   "Lvl"="Near Flat/Level"
		   "Bnk"="Banked - Quick and significant rise from street grade to building"
		   "HLS"="Hillside - Significant slope from side to side"
		   "Low"="Depression"
		   ;
	value $Utilities
		   "AllPub"="All public Utilities (E,G,W,AND S)"
		   "NoSewr"="Electricity, Gas, and Water (Septic Tank)"
		   "NoSeWa"="Electricity and Gas Only"
		   "ELO"="Electricity only"
		   ;
	value $Lot_Config
		   "Inside"="Inside lot"
		   "Corner"="Corner lot"
		   "CulDSac"="Cul-de-sac"
		   "FR2"="Frontage on 2 sides of property"
		   "FR3"="Frontage on 3 sides of property"
		   ;
	value $Land_Slope
		   "Gtl"="Gentle slope"
		   "Mod"="Moderate Slope"
		   "Sev"="Severe Slope"
		   ;
	value $Neighborhood
		   "Blmngtn"="Bloomington Heights"
		   "Blueste"="Bluestem"
		   "BrDale"="Briardale"
		   "BrkSide"="Brookside"
		   "ClearCr"="Clear Creek"
		   "CollgCr"="College Creek"
		   "Crawfor"="Crawford"
		   "Edwards"="Edwards"
		   "Gilbert"="Gilbert"
		   "Greens"="Greens"
		   "GrnHill"="Green Hills"
		   "IDOTRR"="Iowa DOT and Rail Road"
		   "Landmrk"="Landmark"
		   "MeadowV"="Meadow Village"
		   "Mitchel"="Mitchell"
		   "Names"="North Ames"
		   "NoRidge"="Northridge"
		   "NPkVill"="Northpark Villa"
		   "NridgHt"="Northridge Heights"
		   "NWAmes"="Northwest Ames"
		   "OldTown"="Old Town"
		   "SWISU"="South AND West of Iowa State University"
		   "Sawyer"="Sawyer"
		   "SawyerW"="Sawyer West"
		   "Somerst"="Somerset"
		   "StoneBr"="Stone Brook"
		   "Timber"="Timberland"
		   "Veenker"="Veenker"
		   ;
	value $Condition
		   "Artery"="Adjacent to arterial street"
		   "Feedr"="Adjacent to feeder street"
		   "Norm"="Normal"
		   "RRNn"="Within 200' of North-South Railroad"
		   "RRAn"="Adjacent to North-South Railroad"
		   "PosN"="Near positive off-site feature--park, greenbelt, etc."
		   "PosA"="Adjacent to postive off-site feature"
		   "RRNe"="Within 200' of East-West Railroad"
		   "RRAe"="Adjacent to East-West Railroad"
		   ;
	value $Bldg_Type
		   "1Fam"="Single-family Detached"
		   "2FmCon"="Two-family Conversion; originally built as one-family dwelling"
		   "Duplx"="Duplex"
		   "TwnhsE"="Townhouse End Unit"
		   "TwnhsI"="Townhouse Inside Unit"
		   ;
	value $House_Style
		   "1Story"="One story"
		   "1.5Fin"="One and one-half story: 2nd level finished"
		   "1.5Unf"="One and one-half story: 2nd level unfinished"
		   "2Story"="Two story"
		   "2.5Fin"="Two and one-half story: 2nd level finished"
		   "2.5Unf"="Two and one-half story: 2nd level unfinished"
		   "SFoyer"="Split Foyer"
		   "SLvl"="Split Level"
		   ;
	value Overall
		   10="10 Very Excellent"
		   9="09 Excellent"
		   8="08 Very Good"
		   7="07 Good"
		   6="06 Above Average"
		   5="05 Average"
		   4="04 Below Average"
		   3="03 Fair"
		   2="02 Poor"
		   1="01 Very Poor"
		   ;
	value $Roof_Style
		   "Flat"="Flat"
		   "Gable"="Gable"
		   "Gambrel"="Gabrel (Barn)"
		   "Hip"="Hip"
		   "Mansard"="Mansard"
		   "Shed"="Shed"
		   ;
	value $Roof_Matl
		   "ClyTile"="Clay or Tile"
		   "CompShg"="Standard (Composite) Shingle"
		   "Membran"="Membrane"
		   "Metal"="Metal"
		   "Roll"="Roll"
		   "TarANDGrv"="Gravel AND Tar"
		   "WdShake"="Wood Shakes"
		   "WdShngl"="Wood Shingles"
		   ;
	value $Exterior
		   "AsbShng"="Asbestos Shingles"
		   "AsphShn"="Asphalt Shingles"
		   "BrkComm"="Brick Common"
		   "BrkFace"="Brick Face"
		   "CBlock"="Cinder Block"
		   "CemntBd"="Cement Board"
		   "HdBoard"="Hard Board"
		   "ImStucc"="Imitation Stucco"
		   "MetalSd"="Metal Siding"
		   "Other"="Other"
		   "Plywood"="Plywood"
		   "PreCast"="PreCast"
		   "Stone"="Stone"
		   "Stucco"="Stucco"
		   "VinylSd"="Vinyl Siding"
		   "Wd Sdng"="Wood Siding"
		   "WdShing"="Wood Shingles"
		   ;
	value $Mas_Vnr_Type
		   "BrkCmn"="Brick Common"
		   "BrkFace"="Brick Face"
		   "CBlock"="Cinder Block"
		   "None"="None"
		   "Stone"="Stone"
		   ;
	value $Exter_Qual 
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Average/Typical"
		   "Fa"="Fair"
		   "Po"="Poor"
		   ;
	value $Exter_Cond
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Average/Typical"
		   "Fa"="Fair"
		   "Po"="Poor"
		   ;
	value $Foundation
		   "BrkTil"="Brick AND Tile"
		   "CBlock"="Cinder Block"
		   "PConc"="Poured Contrete"
		   "Slab"="Slab"
		   "Stone"="Stone"
		   "Wood"="Wood"
		   ;
	value $Bsmt_Qual
		   "Ex"="Excellent (100+ inches)"
		   "Gd"="Good (90-99 inches)"
		   "TA"="Typical (80-89 inches)"
		   "Fa"="Fair (70-79 inches)"
		   "Po"="Poor (<70 inches"
		   "NA"="No Basement"
		   ;
	value $Bsmt_Cond
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Typical - slight dampness allowed"
		   "Fa"="Fair - dampness or some cracking or settling"
		   "Po"="Poor - Severe cracking, settling, or wetness"
		   "NA"="No Basement"
		   ;
	value $Bsmt_Exposure
		   "Gd"="Good Exposure"
		   "Av"="Average Exposure (split levels or foyers typically score average or above)"
		   "Mn"="Mimimum Exposure"
		   "No"="No Exposure"
		   "NA"="No Basement"
		   ;
	value $BsmtFinType
		   "GLQ"="Good Living Quarters"
		   "ALQ"="Average Living Quarters"
		   "BLQ"="Below Average Living Quarters"
		   "Rec"="Average Rec Room"
		   "LwQ"="Low Quality"
		   "Unf"="Unfinshed"
		   "NA"="No Basement"
		   ;
	value $Heating
		   "Floor"="Floor Furnace"
		   "GasA"="Gas forced warm air furnace"
		   "GasW"="Gas hot water or steam heat"
		   "Grav"="Gravity furnace"
		   "OthW"="Hot water or steam heat other than gas"
		   "Wall"="Wall furnace"
		   ;
	value $Heating_QC
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Average/Typical"
		   "Fa"="Fair"
		   "Po"="Poor"
		   ;
	value $NoYes
		   "N"="No"
		   "Y"="Yes"
		   ;
	value $Electrical
		   "SBrkr"="Standard Circuit Breakers AND Romex"
		   "FuseA"="Fuse Box over 60 AMP and all Romex wiring (Average)"
		   "FuseF"="60 AMP Fuse Box and mostly Romex wiring (Fair)"
		   "FuseP"="60 AMP Fuse Box and mostly knob AND tube wiring (poor)"
		   "Mix"="Mixed"
		   ;
	value $KitchenQual
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Typical/Average"
		   "Fa"="Fair"
		   "Po"="Poor"
		   ;
	value $Functional
		   "Typ"="Typical Functionality"
		   "Min1"="Minor Deductions 1"
		   "Min2"="Minor Deductions 2"
		   "Mod"="Moderate Deductions"
		   "Maj1"="Major Deductions 1"
		   "Maj2"="Major Deductions 2"
		   "Sev"="Severely Damaged"
		   "Sal"="Salvage only"
		   ;
	value $FireplaceQu
		   "Ex"="Excellent - Exceptional Masonry Fireplace"
		   "Gd"="Good - Masonry Fireplace in main level"
		   "TA"="Average - Prefabricated Fireplace in main living area or Masonry Fireplace in basement"
		   "Fa"="Fair - Prefabricated Fireplace in basement"
		   "Po"="Poor - Ben Franklin Stove"
		   "NA"="No Fireplace"
		   ;
	value $Garage_Type
		   "2Types"="More than one type of garage"
		   "Attchd"="Attached to home"
		   "Basment"="Basement Garage"
		   "BuiltIn"="Built-In (Garage part of house - typically has room above garage)"
		   "CarPort"="Car Port"
		   "Detchd"="Detached from home"
		   "NA"="No Garage"
		   ;
	value $Garage_Finish
		   "Fin"="Finished"
		   "RFn"="Rough Finished"
		   "Unf"="Unfinished"
		   "NA"="No Garage"
		   ;
	value $Garage_Qual
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Typical/Average"
		   "Fa"="Fair"
		   "Po"="Poor"
		   "NA"="No Garage"
		   ;
	value $Garage_Cond
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Typical/Average"
		   "Fa"="Fair"
		   "Po"="Poor"
		   "NA"="No Garage"
		   ;
	value $Paved_Drive
		   "Y"="Paved "
		   "P"="Partial Pavement"
		   "N"="Dirt/Gravel";
	value $Value_Pool_QC
		   "Ex"="Excellent"
		   "Gd"="Good"
		   "TA"="Average/Typical"
		   "Fa"="Fair"
		   "NA"="No Pool";
	value $Value_Fence
		   "GdPrv"="Good Privacy"
		   "MnPrv"="Minimum Privacy"
		   "GdWo"="Good Wood"
		   "MnWw"="Minimum Wood/Wire"
		   "NA"="No Fence"
		   ;
	value $Misc_Feature
		   "Elev"="Elevator"
		   "Gar2"="2nd Garage (if not described in garage section)"
		   "Othr"="Other"
		   "Shed"="Shed (over 100 SF)"
		   "TenC"="Tennis Court"
		   "NA"="None"
		   ;
	value $Sale_Type
		   "WD "="Warranty Deed - Conventional"
		   "CWD"="Warranty Deed - Cash"
		   "VWD"="Warranty Deed - VA Loan"
		   "New"="Home just constructed and sold"
		   "COD"="Court Officer Deed/Estate"
		   "Con"="Contract 15% Down payment regular terms"
		   "ConLw"="Contract Low Down payment and low interest"
		   "ConLI"="Contract Low Interest"
		   "ConLD"="Contract Low Down"
		   "Oth"="Other"
		   ;
	value $Sale_Condition
		   "Normal"="Normal Sale"
		   "Abnorml"="Abnormal Sale - trade, foreclosure, short sale"
		   "AdjLand"="Adjoining Land Purchase"
		   "Alloca"="Allocation - two linked properties with separate deeds, typically condo with a garage unit"
		   "Family"="Sale between family members"
		   "Partial"="Home was not completed when last assessed (associated with New Homes)"
		   ;
	value season 
		   1="Winter"
		   2="Spring"
		   3="Summer"
		   4="Fall"
		   ;
	run;


data statdata.testscores;
    input Gender $ 1-6 SATScore 8-11 IDNumber 13-20;
    datalines;
Male   1170 61469897
Female 1090 33081197
Male   1240 68137597
Female 1000 37070397
Male   1210 64608797
Female  970 60714297
Male   1020 16907997
Female 1490  9589297
Male   1200 93891897
Female 1260 85859397
Male   1150 38152597
Female 1390 99108497
Male   1240 59666697
Female 1370 70847197
Male   1140 47613397
Female 1160 53750297
Male   1050 95948597
Female 1110  3873197
Male   1100 25756097
Female 1080 43493297
Male   1120 27543197
Female 1080 26212897
Male   1050  8945097
Female 1200 51799397
Male   1600 39196697
Female 1100 48154497
Male   1050 55189597
Female 1060 46028397
Male   1140 75332897
Female 1100 29520797
Male   1340 55983497
Female 1240 93236497
Male   1090  6975697
Female 1180 29686297
Male   1170 76815697
Female 1130 64045497
Male   1290  9880297
Female 1380 23048597
Male   1010 76058697
Female 1280 42586897
Male   1050 62688897
Female 1520 73461797
Male   1360 44327297
Female 1260  2854197
Male   1290 42401697
Female 1070 51266697
Male   1260 61195297
Female 1350 71681397
Male   1140 43230697
Female 1330  6520097
Male    990 61728297
Female 1300 64179097
Male   1150 20494697
Female 1520 40177297
Male   1200 43183797
Female 1120 47146397
Male   1020 60633297
Female 1250 72168497
Male   1330 98377897
Female 1170 20745097
Male   1110 91775997
Female 1230 82634897
Male   1310 73772397
Female 1270 20755897
Male   1210 57288097
Female 1120 55860697
Male   1200 65246997
Female 1380 81994397
Male    890 76526697
Female 1590 23573597
Male   1110 61160997
Female 1150 23359697
Male   1280 19108097
Female  910 30834797
Male   1060 46806897
Female 1270 62919297
Male   1020 37534197
Female 1300  4440297
Male   1050  2012997
Female 1060 59149297
;
run;

data statdata.fitness; 
    input @1 Name $8. @10 Gender $1. @12 RunTime 5.2 @18 Age 2. @21 Weight 5.2 
          @27 Oxygen_Consumption 5.2 @33 Run_Pulse 3.
          @37 Rest_Pulse 2. @40 Maximum_Pulse 3.;
    Performance=260-round(10*runtime + 2*age + 4*(Gender='F'));
    datalines;
Donna    F  8.17 42 68.15 59.57 166 40 172
Gracie   F  8.63 38 81.87 60.06 170 48 186
Luanne   F  8.65 43 85.84 54.30 156 45 168
Mimi     F  8.92 50 70.87 54.63 146 48 155
Chris    M  8.95 49 81.42 49.16 180 44 185
Allen    M  9.22 38 89.02 49.87 178 55 180
Nancy    F  9.40 49 76.32 48.67 186 56 188
Patty    F  9.63 52 76.32 45.44 164 48 166
Suzanne  F  9.93 57 59.08 50.55 148 49 155
Teresa   F 10.00 51 77.91 46.67 162 48 168
Bob      M 10.07 40 75.07 45.31 185 62 185
Harriett F 10.08 49 73.37 50.39 168 67 168
Jane     F 10.13 44 73.03 50.54 168 45 168
Harold   M 10.25 48 91.63 46.77 162 48 164
Sammy    M 10.33 54 83.12 51.85 166 50 170
Buffy    F 10.47 52 73.71 45.79 186 59 188
Trent    M 10.50 52 82.78 47.47 170 53 172
Jackie   F 10.60 47 79.15 47.27 162 47 164
Ralph    M 10.85 43 81.19 49.09 162 64 170
Jack     M 10.95 51 69.63 40.84 168 57 172
Annie    F 11.08 51 67.25 45.12 172 48 172
Kate     F 11.12 45 66.45 44.75 176 51 176
Carl     M 11.17 54 79.38 46.08 156 62 165
Don      M 11.37 44 89.47 44.61 178 62 182
Effie    F 11.50 48 61.24 47.92 170 52 176
George   M 11.63 47 77.45 44.81 176 58 176
Iris     F 11.95 40 75.98 45.68 176 70 180
Mark     M 12.63 57 73.37 39.41 174 58 176
Steve    M 12.88 54 91.63 39.20 168 44 172
Vaughn   M 13.08 44 81.42 39.44 174 63 176
William  M 14.03 45 87.66 37.39 186 56 192
;
run;

data statdata.NormTemp;
    input @1 ID 3. @5 BodyTemp 5.1 @11 Gender $6. @18 HeartRate 3.;
    datalines;
  1  96.3 Male    70
  2  96.7 Male    71
  3  96.9 Male    74
  4  97.0 Male    80
  5  97.1 Male    73
  6  97.1 Male    75
  7  97.1 Male    82
  8  97.2 Male    64
  9  97.3 Male    69
 10  97.4 Male    70
 11  97.4 Male    68
 12  97.4 Male    72
 13  97.4 Male    78
 14  97.5 Male    70
 15  97.5 Male    75
 16  97.6 Male    74
 17  97.6 Male    69
 18  97.6 Male    73
 19  97.7 Male    77
 20  97.8 Male    58
 21  97.8 Male    73
 22  97.8 Male    65
 23  97.8 Male    74
 24  97.9 Male    76
 25  97.9 Male    72
 26  98.0 Male    78
 27  98.0 Male    71
 28  98.0 Male    74
 29  98.0 Male    67
 30  98.0 Male    64
 31  98.0 Male    78
 32  98.1 Male    73
 33  98.1 Male    67
 34  98.2 Male    66
 35  98.2 Male    64
 36  98.2 Male    71
 37  98.2 Male    72
 38  98.3 Male    86
 39  98.3 Male    72
 40  98.4 Male    68
 41  98.4 Male    70
 42  98.4 Male    82
 43  98.4 Male    84
 44  98.5 Male    68
 45  98.5 Male    71
 46  98.6 Male    77
 47  98.6 Male    78
 48  98.6 Male    83
 49  98.6 Male    66
 50  98.6 Male    70
 51  98.6 Male    82
 52  98.7 Male    73
 53  98.7 Male    78
 54  98.8 Male    78
 55  98.8 Male    81
 56  98.8 Male    78
 57  98.9 Male    80
 58  99.0 Male    75
 59  99.0 Male    79
 60  99.0 Male    81
 61  99.1 Male    71
 62  99.2 Male    83
 63  99.3 Male    63
 64  99.4 Male    70
 65  99.5 Male    75
 66  96.4 Female  69
 67  96.7 Female  62
 68  96.8 Female  75
 69  97.2 Female  66
 70  97.2 Female  68
 71  97.4 Female  57
 72  97.6 Female  61
 73  97.7 Female  84
 74  97.7 Female  61
 75  97.8 Female  77
 76  97.8 Female  62
 77  97.8 Female  71
 78  97.9 Female  68
 79  97.9 Female  69
 80  97.9 Female  79
 81  98.0 Female  76
 82  98.0 Female  87
 83  98.0 Female  78
 84  98.0 Female  73
 85  98.0 Female  89
 86  98.1 Female  81
 87  98.2 Female  73
 88  98.2 Female  64
 89  98.2 Female  65
 90  98.2 Female  73
 91  98.2 Female  69
 92  98.2 Female  57
 93  98.3 Female  79
 94  98.3 Female  78
 95  98.3 Female  80
 96  98.4 Female  79
 97  98.4 Female  81
 98  98.4 Female  73
 99  98.4 Female  74
100  98.4 Female  84
101  98.5 Female  83
102  98.6 Female  82
103  98.6 Female  85
104  98.6 Female  86
105  98.6 Female  77
106  98.7 Female  72
107  98.7 Female  79
108  98.7 Female  59
109  98.7 Female  64
110  98.7 Female  65
111  98.7 Female  82
112  98.8 Female  64
113  98.8 Female  70
114  98.8 Female  83
115  98.8 Female  89
116  98.8 Female  69
117  98.8 Female  73
118  98.8 Female  84
119  98.9 Female  76
120  99.0 Female  79
121  99.0 Female  81
122  99.1 Female  80
123  99.1 Female  74
124  99.2 Female  77
125  99.2 Female  66
126  99.3 Female  68
127  99.4 Female  77
128  99.9 Female  79
129 100.0 Female  78
130 100.8 Female  77
;
run;

data statdata.German;
    input @1 ID 3. @5 Pre 6.2 @12 Retain 6.2 @19 Group $9. @29 Gender $6.;
    Change=Retain-Pre;
cards;
101  56.41  89.19 Treatment Male
103  66.67  86.49 Treatment Male
105  58.97  56.76 Treatment Male
107  79.49  62.16 Treatment Male
110  46.15  56.76 Treatment Male
112  58.97  59.46 Treatment Male
121  56.41  75.68 Treatment Male
104  71.79  81.08 Treatment Female
109  51.28  75.68 Treatment Female
115  71.79  81.08 Treatment Female
116  76.92  67.57 Treatment Female
118  58.97  91.89 Treatment Female
119  74.36  81.08 Treatment Female
120  53.85  81.08 Treatment Female
123  69.23  75.68 Treatment Female
302  66.67  81.08 Control   Male
303  82.05  86.49 Control   Male
306  71.79  86.49 Control   Male
308  71.79  70.27 Control   Male
312  53.85  70.27 Control   Male
316  84.62  78.38 Control   Male
320  58.97  78.38 Control   Male
322  30.77  40.54 Control   Male
304  71.79  86.49 Control   Female
307  74.36  81.08 Control   Female
309 100.00  94.59 Control   Female
313  79.49  81.08 Control   Female
317  79.49  81.08 Control   Female
;
run;


data statdata.MGGarlic;
    input @1 Fertilizer 1. @3 BulbWt 7.5 @11 Cloves 7.4 @19 BedID 5.;
    datalines;
4 0.20901 11.5062 30402
3 0.25792 12.2550 23423
2 0.21588 12.0982 20696
4 0.24754 12.9199 25412
1 0.24402 12.5793 10575
3 0.20150 10.6891 21466
1 0.20891 11.5416 14749
4 0.15173 14.0173 25342
2 0.24114  9.9072 20383
3 0.23350 11.2130 23306
3 0.21481 11.2933 22730
2 0.19560 10.0428 19533
3 0.22271 11.4917 23104
2 0.15851 12.4579 19316
4 0.17713 12.6372 25759
1 0.23277 11.1439 18057
3 0.23229 12.5118 22934
3 0.18914 12.1337 21414
1 0.20161 13.1160 14158
3 0.21213 11.8415 22006
1 0.25285 12.0435 18652
2 0.22152 11.6716 20805
1 0.25362 11.4838 16662
1 0.24118 12.5481 14607
3 0.25785 10.1495 22981
3 0.27828 10.7842 22741
3 0.22790 11.7475 24758
1 0.20530 12.0564 14192
1 0.18840 13.0964 14578
2 0.23194 10.9575 20897
2 0.18979 12.0743 19493
2 0.21414 12.7071 19588
;
run;

data statdata.MGGarlic_Block;
    input @1 Sector 1. @3 Position 1. @5 Fertilizer 1. @7 BulbWt 7.5 @15 Cloves 7.4 @23 BedId 5.;
    datalines;
1 1 3 0.25881 11.6322 22961
1 2 4 0.20746 12.5837 23884
1 3 1 0.27453 12.0597 19642
1 4 2 0.24467 12.1001 20384
2 1 3 0.21454 11.5863 20303
2 2 4 0.16953 12.7132 21004
2 3 1 0.22504 12.0470 16117
2 4 2 0.16809 11.9071 19686
3 1 4 0.21720 12.3655 26527
3 2 3 0.22551 11.6864 23574
3 3 2 0.23536 12.0258 17499
3 4 1 0.24937 11.6668 16636
4 1 4 0.20811 12.5996 24834
4 2 1 0.21138 12.1393 19946
4 3 2 0.19320 12.0792 21504
4 4 3 0.19256 11.6464 23181
5 1 4 0.19851 12.5355 24533
5 2 1 0.18603 12.3307 15009
5 3 3 0.19698 11.5608 23845
5 4 2 0.15745 11.8735 18948
6 1 2 0.20058 11.9077 20019
6 2 3 0.25346 11.7294 22228
6 3 4 0.19838 12.7670 24424
6 4 1 0.25439 12.0139 13755
7 1 3 0.26578 11.7448 21087
7 2 4 0.21678 12.8531 25751
7 3 2 0.26183 12.3990 20296
7 4 1 0.27506 11.9383 20038
8 1 1 0.21420 12.1034 17843
8 2 3 0.17877 11.5682 21394
8 3 4 0.20714 12.5213 27191
8 4 2 0.22803 12.2317 20202
;
run;

data statdata.Drug;
    input @1 PatientID 4. @6 DrugDose 1. @8 Disease $1. @10 BloodP 4.;
    datalines;
  69 2 B   13
 162 4 A  -47
 181 1 B   12
 209 4 A   -4
 308 2 A    4
 331 4 C   37
 340 4 C  -19
 350 1 B   -9
 360 2 B  -17
 363 4 A  -41
 382 2 C   -5
 531 2 C   -1
 595 4 B   23
 601 1 A   -2
 750 1 C   -1
 864 1 B  -17
 868 1 C   -5
 886 4 C  -28
 900 3 C  -16
 943 1 A    5
1005 4 B   38
1025 3 A  -12
1026 1 B   -5
1094 4 B   44
1150 2 B   35
1175 4 B   -7
1260 4 A  -48
1400 1 A   16
1415 2 A   14
1479 3 A  -33
1507 4 A  -20
1685 3 B  -10
1733 3 A  -24
1758 1 B  -12
1765 2 B   34
1836 1 C  -16
1975 4 B   42
2118 2 C  -10
2185 4 B   55
2210 2 C   32
2295 3 B   44
2345 2 A  -33
2387 4 B   42
2463 4 A   -6
2547 3 C   -5
2580 4 C  -57
2589 3 B   25
2880 1 B  -14
2896 4 A  -24
2911 1 A   25
2935 1 A  -22
2944 1 C   22
3026 3 C   -6
3043 3 A  -48
3104 3 A  -40
3162 4 A  -37
3172 4 C   27
3211 3 A  -51
3233 3 C   27
3261 1 C  -10
3265 1 C    4
3329 1 B   22
3426 2 A    1
3486 2 A   -1
3590 4 B   39
3631 4 C   23
3696 4 A   11
3726 2 A  -12
3735 2 A   -7
3877 3 C    2
3878 3 A  -28
3970 2 A  -37
4002 2 A   12
4027 3 B   22
4193 2 A  -27
4247 4 C    2
4305 2 B   -9
4688 1 C   -0
4777 4 A   -8
4796 1 C   -9
4817 4 A  -19
4878 4 B   26
4921 2 B    8
5083 2 A   19
5095 3 C  -21
5121 1 A    1
5174 4 A  -37
5240 3 C    4
5290 1 A   -4
5312 2 B   12
5314 4 C  -23
5462 1 B   -6
5530 4 C  -18
5545 4 C    9
5701 3 B    9
5704 1 B   -3
5848 4 A  -24
5878 2 C  -36
5879 4 C   11
5917 2 C  -10
5956 3 C   -0
5962 3 C  -12
5973 3 B    7
5992 4 B   20
6203 1 C   17
6222 2 B   -6
6264 4 A  -61
6307 2 B    6
6308 4 B    8
6420 4 C   11
6439 3 A  -25
6443 3 B   40
6652 3 B   15
6711 3 A  -20
6838 2 A  -22
6892 4 B   -6
6897 2 C  -14
7080 3 C  -19
7084 1 A  -22
7120 3 B   50
7364 3 C  -26
7420 1 B   -6
7582 1 B  -11
7616 2 B  -45
7698 4 A   12
7767 1 C   45
7801 3 A   -2
7823 2 C  -17
7827 3 C    4
7829 2 A    0
7850 1 A   10
7922 1 C  -15
7954 2 C   50
7999 3 A  -23
8003 2 A  -30
8009 3 B   42
8090 1 A   -0
8139 2 C   -5
8158 4 A  -30
8196 4 A  -29
8223 1 B   19
8229 2 A  -37
8339 3 B   42
8368 4 C   42
8394 3 A   11
8467 1 C  -38
8518 3 C  -12
8542 2 B  -23
8554 2 C    9
8669 1 A    4
8836 1 B  -35
8923 1 B  -39
8952 2 A    1
8953 3 C    8
9039 3 A  -46
9099 2 B   14
9120 3 B   60
9159 4 B  -22
9237 3 B   25
9530 1 B  -18
9679 2 B   15
9682 2 B   21
9693 4 A    6
9714 2 C  -32
9735 1 C   -7
9865 3 B  -24
9878 1 C   19
9941 2 B   23
9947 1 A    5
9990 2 C  -24
;
run;

data statdata.ads(keep=ad sales) statdata.ads1;
    length Ad $8;
    input Ad Area Sales;
    datalines;
paper        1       75
radio        1       69
people       1       63
display      1       52
paper        2       57
radio        2       51
people       2       67
display      2       61
paper        3       76
radio        3      100
people       3       85
display      3       61
paper        4       77
radio        4       90
people       4       80
display      4       76
paper        5       75
radio        5       77
people       5       87
display      5       57
paper        6       72
radio        6       60
people       6       62
display      6       52
paper        7       76
radio        7       33
people       7       70
display      7       33
paper        8       81
radio        8       79
people       8       75
display      8       69
paper        9       63
radio        9       73
people       9       40
display      9       60
paper       10       94
radio       10      100
people      10       64
display     10       61
paper       11       54
radio       11       61
people      11       40
paper       12       70
radio       12       68
people      12       67
display     12       66
paper       13       87
radio       13       68
people      13       51
display     11       41
display     13       65
paper       14       65
radio       14       63
people      14       61
display     14       58
paper       15       65
radio       15       83
people      15       75
display     15       50
paper       16       79
radio       16       76
people      16       64
display     16       44
paper       17       62
radio       17       73
people      17       50
display     17       45
paper       18       75
radio       18       74
people      18       62
display     18       58
paper        1       68
radio        1       54
people       1       58
display      1       41
paper        2       75
radio        2       78
people       2       82
display      2       44
paper        3       83
radio        3       79
people       3       78
display      3       86
paper        4       66
radio        4       83
people       4       87
display      4       75
paper        5       66
radio        5       74
people       5       70
display      5       75
paper        6       76
radio        6       69
people       6       77
display      6       63
paper        7       70
radio        7       68
people       7       68
display      7       52
paper        8       86
radio        8       75
people       8       61
display      8       61
paper        9       62
radio        9       65
people       9       55
display      9       43
paper       10       88
radio       10       70
people      10       76
display     10       69
paper       11       56
radio       11       53
people      11       70
display     11       43
paper       12       86
radio       12       73
people      12       77
display     12       51
paper       13       84
radio       13       79
people      13       42
display     13       60
paper       14       77
radio       14       66
people      14       71
display     14       52
paper       15       78
radio       15       65
people      15       65
display     15       55
paper       16       80
radio       16       81
people      16       78
display     16       52
paper       17       62
radio       17       57
people      17       37
display     17       45
paper       18       70
radio       18       65
people      18       83
display     18       60
run;

data statdata.concrete;
    infile datalines dsd dlm=' ';
    input Brand : $12. Additive : $10. Strength;
datalines;
Graystone reinforced 32.6
Graystone reinforced 31.5
Graystone reinforced 30.0
Graystone standard 29.8
Graystone reinforced 29.7
Graystone reinforced 29.5
Consolidated reinforced 29.3
"EZ Mix" reinforced 30.2
"EZ Mix" reinforced 28.2
"EZ Mix" standard 28.0
"EZ Mix" standard 28.0
"EZ Mix" reinforced 26.7
Graystone standard 26.4
Consolidated reinforced 26.3
"EZ Mix" reinforced 25.7
"EZ Mix" reinforced 25.5
Consolidated reinforced 25.4
Consolidated reinforced 25.3
"EZ Mix" standard 24.9
Graystone standard 24.6
Graystone standard 24.4
Consolidated standard 24.2
Consolidated standard 23.9
Consolidated reinforced 22.7
Consolidated standard 22.4
Consolidated standard 22.1
"EZ Mix" standard 21.3
Graystone standard 21.2
Consolidated standard 20.4
"EZ Mix" standard 19.8
;
run;

data statdata.BodyFat;
    input Case PctBodyFat1 PctBodyFat2 Density Age Weight Height
          Adioposity FatFreeWt Neck Chest Abdomen Hip Thigh
          Knee Ankle Biceps Forearm Wrist;
datalines;
  1      12.6    12.3  1.0708      23  154.25   67.75    23.7   134.9    36.2   93.1    85.2    94.5     59      37.3    21.9    32      27.4    17.1
  2      6.9     6.1   1.0853      22  173.25   72.25    23.4   161.3    38.5   93.6    83      98.7     58.7    37.3    23.4    30.5    28.9    18.2
  3      24.6    25.3  1.0414      22  154      66.25    24.7   116      34     95.8    87.9    99.2     59.6    38.9    24      28.8    25.2    16.6
  4      10.9    10.4  1.0751      26  184.75   72.25    24.9   164.7    37.4   101.8   86.4    101.2    60.1    37.3    22.8    32.4    29.4    18.2
  5      27.8    28.7  1.034       24  184.25   71.25    25.6   133.1    34.4   97.3    100     101.9    63.2    42.2    24      32.2    27.7    17.7
  6      20.6    20.9  1.0502      24  210.25   74.75    26.5   167      39     104.5   94.4    107.8    66      42      25.6    35.7    30.6    18.8
  7      19      19.2  1.0549      26  181      69.75    26.2   146.6    36.4   105.1   90.7    100.3    58.4    38.3    22.9    31.9    27.8    17.7
  8      12.8    12.4  1.0704      25  176      72.5     23.6   153.6    37.8   99.6    88.5    97.1     60      39.4    23.2    30.5    29      18.8
  9      5.1     4.1   1.09        25  191      74       24.6   181.3    38.1   100.9   82.5    99.9     62.9    38.3    23.8    35.9    31.1    18.2
  10     12      11.7  1.0722      23  198.25   73.5     25.8   174.4    42.1   99.6    88.6    104.1    63.1    41.7    25      35.6    30      19.2
  11     7.5     7.1   1.083       26  186.25   74.5     23.6   172.3    38.5   101.5   83.6    98.2     59.7    39.7    25.2    32.8    29.4    18.5
  12     8.5     7.8   1.0812      27  216      76       26.3   197.7    39.4   103.6   90.9    107.7    66.2    39.2    25.9    37.2    30.2    19
  13     20.5    20.8  1.0513      32  180.5    69.5     26.3   143.5    38.4   102     91.6    103.9    63.4    38.3    21.5    32.5    28.6    17.7
  14     20.8    21.2  1.0505      30  205.25   71.25    28.5   162.5    39.4   104.1   101.8   108.6    66      41.5    23.7    36.9    31.6    18.8
  15     21.7    22.1  1.0484      35  187.75   69.5     27.4   147      40.5   101.3   96.4    100.1    69      39      23.1    36.1    30.5    18.2
  16     20.5    20.9  1.0512      35  162.75   66       26.3   129.3    36.4   99.1    92.8    99.2     63.1    38.7    21.7    31.1    26.4    16.9
  17     28.1    29    1.0333      34  195.75   71       27.3   140.8    38.9   101.9   96.4    105.2    64.8    40.8    23.1    36.2    30.8    17.3
  18     22.4    22.9  1.0468      32  209.25   71       29.2   162.5    42.1   107.6   97.5    107      66.9    40      24.4    38.2    31.6    19.3
  19     16.1    16    1.0622      28  183.75   67.75    28.2   154.3    38     106.8   89.6    102.4    64.2    38.7    22.9    37.2    30.5    18.5
  20     16.5    16.5  1.061       33  211.75   73.5     27.6   176.8    40     106.2   100.5   109      65.8    40.6    24      37.1    30.1    18.2
  21     19      19.1  1.0551      28  179      68       27.3   145.1    39.1   103.3   95.9    104.9    63.5    38      22.1    32.5    30.3    18.4
  22     15.3    15.2  1.064       28  200.5    69.75    29.1   169.8    41.3   111.4   98.8    104.8    63.4    40.6    24.6    33      32.8    19.9
  23     15.7    15.6  1.0631      31  140.25   68.25    21.2   118.2    33.9   86      76.4    94.6     57.4    35.3    22.2    27.9    25.9    16.7
  24     17.6    17.7  1.0584      32  148.75   70       21.4   122.6    35.5   86.7    80      93.4     54.9    36.2    22.1    29.8    26.7    17.1
  25     14.2    14    1.0668      28  151.25   67.75    23.2   129.8    34.5   90.2    76.3    95.8     58.4    35.5    22.9    31.1    28      17.6
  26     4.6     3.7   1.0911      27  159.25   71.5     21.9   151.9    35.7   89.6    79.7    96.5     55      36.7    22.5    29.9    28.2    17.7
  27     8.5     7.9   1.0811      34  131.5    67.5     20.3   120.3    36.2   88.6    74.6    85.3     51.7    34.7    21.4    28.7    27      16.5
  28     22.4    22.9  1.0468      31  148      67.5     22.9   114.9    38.8   97.4    88.7    94.7     57.5    36      21      29.2    26.6    17
  29     4.7     3.7   1.091       27  133.25   64.75    22.4   127      36.4   93.5    73.9    88.5     50.1    34.5    21.3    30.5    27.9    17.2
  30     9.4     8.8   1.079       29  160.75   69       23.8   145.7    36.7   97.4    83.5    98.7     58.9    35.3    22.6    30.1    26.7    17.6
  31     12.3    11.9  1.0716      32  182      73.75    23.6   159.7    38.7   100.5   88.7    99.8     57.5    38.7    33.9    32.5    27.7    18.4
  32     6.5     5.7   1.0862      29  160.25   71.25    22.2   149.8    37.3   93.5    84.5    100.6    58.5    38.8    21.5    30.1    26.4    17.9
  33     13.4    11.8  1.0719      27  168      71.25    23.3   142.5    38.1   93      79.1    94.5     57.3    36.2    24.5    29      30      18.8
  34     20.9    21.3  1.0502      41  218.5    71       30.5   172.7    39.8   111.7   100.5   108.3    67.1    44.2    25.2    37.5    31.5    18.7
  35     31.1    32.3  1.0263      41  247.25   73.5     32.2   170.4    42.1   117     115.6   116.1    71.2    43.3    26.3    37.3    31.7    19.7
  36     38.2    40.1  1.0101      49  191.75   65       32     118.4    38.4   118.5   113.1   113.8    61.9    38.3    21.9    32      29.8    17
  37     23.6    24.2  1.0438      40  202.25   70       29.1   154.5    38.5   106.5   100.9   106.2    63.5    39.9    22.6    35.1    30.6    19
  38     27.5    28.4  1.0346      50  196.75   68.25    29.7   142.6    42.1   105.6   98.8    104.8    66      41.5    24.7    33.2    30.5    19.4
  39     33.8    35.2  1.0202      46  363.15   72.25    48.9   240.5    51.2   136.2   148.1   147.7    87.3    49.1    29.6    45      29      21.4
  40     31.3    32.6  1.0258      50  203      67       31.8   139.4    40.2   114.8   108.1   102.5    61.3    41.1    24.7    34.1    31      18.3
  41     33.1    34.5  1.0217      45  262.75   68.75    39.1   175.8    43.2   128.3   126.2   125.6    72.5    39.6    26.6    36.4    32.7    21.4
  42     31.7    32.9  1.025       44  205      29.5     29.9   140.1    36.6   106     104.3   115.5    70.6    42.5    23.7    33.6    28.7    17.4
  43     30.4    31.6  1.0279      48  217      70       31.2   151.1    37.3   113.3   111.2   114.1    67.7    40.9    25      36.7    29.8    18.4
  44     30.8    32    1.0269      41  212      71.5     29.2   146.7    41.5   106.6   104.3   106      65      40.2    23      35.8    31.5    18.8
  45     8.4     7.7   1.0814      39  125.25   68       19.1   114.7    31.5   85.1    76      88.2     50      34.7    21      26.1    23.1    16.1
  46     14.1    13.9  1.067       43  164.25   73.25    21.3   141.1    35.7   96.6    81.5    97.2     58.4    38.2    23.4    29.7    27.4    18.3
  47     11.2    10.8  1.0742      40  133.5    67.5     20.6   118.5    33.6   88.2    73.7    88.5     53.3    34.5    22.5    27.9    26.2    17.3
  48     6.4     5.6   1.0665      39  148.5    71.25    20.6   139      34.6   89.8    79.5    92.7     52.7    37.5    21.9    28.8    26.8    17.9
  49     13.4    13.6  1.0678      45  135.75   68.5     20.4   117.6    32.8   92.3    83.4    90.4     52      35.8    20.6    28.8    25.5    16.3
  50     5       4     1.0903      47  127.5    66.75    20.2   121.2    34     83.4    70.4    87.2     50.6    34.4    21.9    26.8    25.8    16.8
  51     10.7    10.2  1.0756      47  158.25   72.25    21.3   141.4    34.9   90.2    86.7    98.3     52.6    37.2    22.4    26      25.8    17.3
  52     7.4     6.6   1.084       40  139.25   69       20.6   129      34.3   89.2    77.9    91       51.4    34.9    21      26.7    26.1    17.2
  53     8.7     8     1.0807      51  137.25   67.75    21.1   125.3    36.5   89.7    82      89.1     49.3    33.7    21.4    29.6    26      16.9
  54     7.1     6.3   1.0848      49  152.75   73.5     19.9   142      35.1   93.3    79.6    91.6     52.6    37.6    22.6    38.5    27.4    18.5
  55     4.9     3.9   1.0906      42  136.25   67.5     21.1   129.6    37.8   87.6    77.6    88.6     51.9    34.9    22.5    27.7    27.5    18.5
  56     22.2    22.6  1.0473      54  198      72       26.9   154.1    39.9   107.6   100     99.6     57.2    38      22      35.9    30.2    18.9
  57     20.1    20.4  1.0524      58  181.5    68       27.6   145.1    39.1   100     99.8    102.5    62.1    39.6    22.5    33.1    28.3    18.5
  58     27.1    28    1.0356      62  201.25   69.5     29.3   146.7    40.5   111.5   104.2   105.8    61.8    39.8    22.7    37.7    30.9    19.2
  59     30.4    31.5  1.028       54  202.5    70.75    28.4   141      40.5   115.4   105.3   97       59.1    38      22.5    31.6    28.8    18.2
  60     24      24.6  1.043       61  179.75   65.75    29.2   136.7    38.4   104.8   98.3    99.6     60.6    37.7    22.9    34.5    29.6    18.5
  61     25.4    26.1  1.0396      62  216      73.25    28.2   161.2    41.4   112.3   104.8   103.1    61.6    40.9    23.1    36.2    31.8    20.2
  62     28.8    29.8  1.0317      56  178.75   68.5     26.8   127.4    35.6   102.9   94.7    100.8    60.9    38      22.1    32.5    29.8    18.3
  63     29.6    30.7  1.0298      54  193.25   70.25    27.6   136.1    38     107.6   102.4   99.4     61      39.4    23.6    32.7    29.9    19.1
  64     25.1    25.8  1.0403      61  178      67       27.9   133.3    37.4   105.3   99.7    99.7     60.8    40.1    22.7    33.6    29      18.8
  65     31      32.3  1.0264      57  205.5    70       29.5   141.7    40.1   105.3   105.5   108.3    65      41.2    24.7    35.3    31.1    18.4
  66     28.9    30    1.0313      55  183.5    67.5     28.3   130.4    40.9   103     100.3   104.2    64.8    40.2    22.7    34.8    30.1    18.7
  67     21.1    21.5  1.0499      54  151.5    70.75    21.3   119.6    35.6   90      83.9    93.9     55      36.1    21.7    29.6    27.4    17.4
  68     14      13.8  1.0673      55  154.75   71.5     21.3   133.1    36.9   95.4    86.6    91.8     54.3    35.4    21.5    32.8    27.4    18.7
  69     7.1     6.3   1.0847      54  155.25   69.25    22.8   144.2    37.5   89.3    78.4    96.1     56      37.4    22.4    32.6    28.1    18.1
  70     13.2    12.9  1.0693      55  156.75   71.5     21.6   136.1    36.3   94.4    84.6    94.3     51.2    37.4    21.6    27.3    27.1    17.3
  71     23.7    24.3  1.0439      62  167.5    71.5     23.1   127.8    35.5   97.6    91.5    98.5     56.6    38.6    22.4    31.5    27.3    18.6
  72     9.4     8.8   1.0788      55  146.75   68.75    21.9   132.9    38.7   88.5    82.8    95.5     58.9    37.6    21.6    30.3    27.3    18.3
  73     9.1     8.5   1.0796      56  160.75   73.75    20.8   146.1    36.4   93.6    82.9    96.3     52.9    37.5    23.1    29.7    27.3    18.2
  74     13.7    13.5  1.068       55  125      64       21.5   107.9    33.2   87.7    76      88.6     50.9    35.4    19.1    29.3    25.7    16.9
  75     12      11.8  1.072       61  143      65.75    23.3   125.9    36.5   93.4    83.3    93       55.5    35.2    20.9    29.4    27      16.8
  76     18.3    18.5  1.0666      61  148.25   67.5     22.9   121.1    36     91.6    81.8    94.8     54.5    37      21.4    29.3    27      18.3
  77     9.2     8.8   1.079       57  162.5    69.5     23.7   147.5    38.7   91.6    78.8    94.3     56.7    39.7    24.2    30.2    29.2    18.1
  78     21.7    22.2  1.0483      69  177.75   68.5     26.7   139.1    38.7   102     95      98.3     55      38.3    21.8    30.8    25.7    18.8
  79     21.1    21.5  1.0498      81  161.25   70.25    23     127.2    37.8   96.4    95.4    99.3     53.5    37.5    21.5    31.4    26.8    18.3
  80     18.6    18.8  1.056       66  171.25   69.25    25.1   139.5    37.4   102.7   98.6    100.2    56.5    39.3    22.7    30.3    28.7    19
  81     30.2    31.4  1.0283      67  163.75   67.75    25.1   114.3    38.4   97.7    95.8    97.1     54.8    38.2    23.7    29.4    27.2    19
  82     26      26.8  1.0382      64  150.25   67.25    23.4   111.2    38.1   97.1    89      96.9     54.8    38      22      29.9    25.2    17.7
  83     18.2    18.4  1.0568      64  190.25   72.75    25.3   155.6    39.3   103.1   97.8    99.6     58.9    39      23      34.3    29.6    19
  84     26.2    27    1.0377      70  170.75   70       24.5   126      38.7   101.8   94.9    95       56      36.5    24.1    31.2    27.3    19.2
  85     26.1    27    1.0378      72  168      69.25    24.7   124.1    38.5   101.4   99.8    96.2     56.3    36.6    22      29.7    26.3    18
  86     25.8    26.6  1.0386      67  167      67.5     26     123.9    36.5   98.9    89.7    96.2     54.7    37.8    33.7    32.4    27.7    18.2
  87     15      14.9  1.0648      72  157.75   67.25    24.6   134.1    37.7   97.5    88.1    96.9     57.2    37.7    21.8    32.6    28      18.8
  88     22.6    23.1  1.0462      64  160      65.75    26     123.8    36.5   104.3   90.9    93.8     57.8    39.5    23.3    29.2    28.4    18.1
  89     8.8     8.3   1.08        46  176.75   72.5     23.7   161.1    38     97.3    86      99.3     61      38.4    23.8    30.2    29.3    18.8
  90     14.3    14.1  1.0666      48  176      73       23.3   150.9    36.7   96.7    86.5    98.3     60.4    39.9    24.4    28.8    29.6    18.7
  91     20.2    20.5  1.052       46  177      70       25.4   141.3    37.2   99.7    95.6    102.2    58.3    38.2    22.5    29.1    27.7    17.7
  92     18.1    18.2  1.0573      44  179.75   69.5     26.2   147.3    39.2   101.9   93.2    100.6    58.9    39.7    23.1    31.4    28.4    18.8
  93     9.2     8.5   1.0795      47  165.25   70.5     23.4   150.1    37.5   97.2    83.1    95.4     56.9    38.3    22.1    30.1    28.2    18.4
  94     24.2    24.9  1.0424      46  192.5    71.75    26.3   145.9    38     106.6   97.5    100.6    58.9    40.5    24.5    33.3    29.6    19.1
  95     9.6     9     1.0785      47  184.25   74.5     23.4   166.6    37.3   99.6    88.8    101.4    57.4    39.6    24.6    30.3    27.9    17.8
  96     17.3    17.4  1.0991      53  224.5    77.75    26.1   185.7    41.1   113.2   99.2    107.5    61.7    42.3    23.2    32.9    30.8    20.4
  97     10.1    9.6   1.077       38  188.75   73.25    24.8   169.6    37.5   99.1    91.6    102.4    60.6    39.4    22.9    31.6    30.1    18.5
  98     11.1    11.3  1.073       50  162.5    66.5     25.9   143.5    38.7   99.4    86.7    96.2     62.1    39.3    23.3    30.6    27.8    18.2
  99     17.7    17.8  1.0582      46  156.5    68.25    23.7   128.8    35.9   95.1    88.2    92.8     54.7    37.3    21.9    31.6    27.5    18.2
  100    21.7    22.2  1.0484      47  197      72       26.7   154.2    40     107.5   94      103.7    62.7    39      22.3    35.3    30.9    18.3
  101    20.8    21.2  1.0506      49  198.5    73.5     25.9   157.2    40.1   106.5   95      101.7    59      39.4    22.3    32.2    31      18.6
  102    20.1    20.4  1.0524      48  173.75   72       23.6   138.9    37     99.1    92      98.3     59.3    38.4    22.4    27.9    26.2    17
  103    19.8    20.1  1.053       41  172.75   71.25    24     138.6    36.3   96.7    89.2    98.3     60      38.4    23.2    31      29.2    18.4
  104    21.9    22.3  1.048       49  196.75   73.75    25.5   153.7    40.7   103.5   95.5    101.6    59.1    39.8    25.4    31      30.3    19.7
  105    24.7    25.4  1.0412      43  177      69.25    26     133.2    39.6   104     98.6    99.5     59.5    36.1    22      30.1    27.2    17.7
  106    17.8    18    1.0578      43  165.5    68.5     24.8   136      31.1   93.1    87.3    96.6     54.7    39      24.8    31      29.4    18.8
  107    19.1    19.3  1.0547      43  200.25   73.5     26     162      38.6   105.2   102.8   103.6    61.2    39.3    23.5    30.5    28.5    18.1
  108    18.2    18.3  1.0569      52  203.25   74.25    26     166.3    42     110     101.6   100.7    55.8    38.7    23.4    35.1    29.6    19.1
  109    17.2    17.3  1.0593      43  194      75.5     24     160.6    38.5   110.1   88.7    102.1    57.5    40      24.8    35.1    30.7    19.2
  110    21      21.4  1.05        40  168.5    69.25    24.7   133.1    34.2   97.8    92.3    100.6    57.5    36.8    22.8    32.1    26      17.3
  111    19.5    19.7  1.0538      43  170.75   68.5     25.6   137.5    37.2   96.3    90.6    99.3     61.9    38      22.3    33.3    28.2    18.1
  112    27.1    28    1.0355      43  183.25   70       26.3   133.5    37.1   108     105     103      63.7    40      23.6    33.5    27.8    17.4
  113    21.6    22.1  1.0486      47  178.25   70       25.6   139.7    40.2   99.7    95      98.6     62.3    38.1    23.9    35.3    31.1    19.8
  114    20.9    21.3  1.0503      42  163      70.25    23.3   128.9    35.3   93.5    89.6    99.8     61.5    37.8    21.9    30.7    27.6    17.4
  115    25.9    26.7  1.0384      48  175.25   71.75    24     129.9    38     100.7   92.4    97.5     59.3    38.1    21.8    31.8    27.3    17.5
  116    16.7    16.7  1.0607      40  158      69.25    23.4   131.7    36.3   97      86.6    92.6     55.9    36.3    22.1    29.8    26.3    17.3
  117    19.8    20.1  1.0529      48  177.25   72.75    23.6   142.1    36.8   96      90      99.7     58.8    38.4    22.8    29.9    28      18.1
  118    14.1    13.9  1.0671      51  179      72       24.3   153.8    41     99.2    90      96.4     56.8    38.8    23.3    33.4    29.8    19.5
  119    25.1    25.8  1.0404      40  191      74       24.6   143.1    38.3   95.4    92.4    104.3    64.6    41.1    24.8    33.6    29.5    18.5
  120    17.9    18.1  1.0575      44  187.5    72.25    25.3   153.8    38     101.8   87.5    101      58.5    39.2    24.5    32.1    28.6    18
  121    27      27.9  1.0358      52  206.5    74.5     26.2   150.7    40.8   104.3   99.2    104.1    58.5    39.3    24.6    33.9    31.2    19.5
  122    24.6    25.3  1.0414      44  185.25   71.5     25.5   139.6    39.5   99.2    98.1    101.4    57.1    40.5    23.2    33      29.6    18.4
  123    14.8    14.7  1.0652      40  160.25   68.75    23.9   136.5    36.9   99.3    83.3    97.5     60.5    38.7    22.6    34.4    28      17.6
  124    16      16    1.0623      47  151.5    66.75    23.9   127.3    36.9   94      86.1    95.2     58.1    36.5    22.1    30.6    27.5    17.6
  125    14      13.8  1.0674      50  161      66.5     25.6   138.5    37.7   98.9    84.1    94       58.5    36.6    23.5    34.4    29.2    18
  126    17.4    17.5  1.0587      46  167      67       26.2   137.9    36.6   101     89.9    100      60.7    36      21.9    35.6    30.2    17.6
  127    26.4    27.2  1.0373      42  177.5    68.75    26.4   130.7    38.9   98.7    92.1    98.5     60.7    36.8    22.2    33.8    30.3    17.2
  128    17.4    17.4  1.059       43  152.25   67.75    23.4   125.8    37.5   95.9    78      93.2     53.5    35.8    20.8    33.9    28.2    17.4
  129    20.4    20.8  1.0515      40  192.25   73.25    25.2   153      39.8   103.9   93.5    99.5     61.7    39      21.8    33.3    29.6    18.1
  130    15      14.9  1.0648      42  165.25   69.75    23.9   140.5    38.3   96.2    87      97.8     57.4    36.9    22.2    31.6    27.8    17.7
  131    18      18.1  1.0575      49  171.75   71.5     23.7   140.9    35.5   97.8    90.1    95.8     57      38.7    23.2    27.5    26.5    17.6
  132    22.2    22.7  1.0472      40  171.25   70.5     24.3   133.3    36.3   94.6    90.3    99.1     60.3    38.5    23      31.2    28.4    17.1
  133    23.1    23.6  1.0452      47  197      73.25    25.8   151.2    37.8   103.6   99.8    103.2    61.2    38.1    22.6    33.5    28.6    17.9
  134    25.3    26.1  1.0398      50  157      66.75    24.8   117.2    37.8   100.4   89.4    92.3     56.1    35.6    20.5    33.6    29.3    17.3
  135    23.8    24.4  1.0435      41  168.25   69.5     24.5   128.3    36.5   98.4    87.2    98.4     56      36.9    23      34      29.8    18.1
  136    26.3    27.1  1.0374      44  186      69.75    26.8   137.1    37.8   104.6   101.1   102.1    58.9    37.9    22.7    30.9    28.8    17.6
  137    21.4    21.8  1.0491      39  166.75   70.75    23.5   131      37     92.9    86.1    95.6     58.8    36.1    22.4    32.7    28.3    17.1
  138    28.4    29.4  1.0325      43  187.75   74       24.1   134.4    37.7   97.8    98.6    100.6    63.6    39.2    23.8    34.3    28.4    17.7
  139    21.8    22.4  1.0481      40  168.25   71.25    23.3   131.6    34.3   98.3    88.5    98.3     58.1    38.4    22.5    31.7    27.4    17.6
  140    20.1    20.4  1.0522      49  212.75   75       26.6   169.9    40.8   104.7   106.6   107.7    66.5    42.5    24.5    35.5    29.8    18.7
  141    24.3    24.9  1.0422      40  176.75   71       24.6   133.8    37.4   98.6    93.1    101.6    59.1    39.6    21.6    30.8    27.9    16.6
  142    18.1    18.3  1.0571      40  173.25   69.5     25.3   141.8    36.5   99.5    93      99.3     60.4    38.2    22      32      28.5    17.8
  143    22.7    23.3  1.0459      52  167      67.75    25.6   129      37.5   102.7   91      98.9     57.1    36.7    22.3    31.6    27.5    17.9
  144    9.9     9.4   1.0775      23  159.75   72.25    21.6   143.9    35.5   92.1    77.1    93.9     56.1    36.1    22.7    30.5    27.2    18.2
  145    10.8    10.3  1.0754      23  188.15   77.5     22.1   168.4    38     96.6    85.3    102.5    59.1    37.6    23.2    31.8    29.7    18.3
  146    14.4    14.2  1.0664      24  156      70.75    21.9   133.6    35.7   92.7    81.9    95.3     56.4    36.5    22      33.5    28.3    17.3
  147    19      19.2  1.055       24  208.5    72.75    27.7   168.9    39.2   102     99.1    110.1    71.2    43.5    25.2    36.1    30.3    18.7
  148    28.6    29.6  1.0322      25  206.5    69.75    29.8   147.5    40.9   110.9   100.5   106.2    68.4    40.8    24.6    33.3    29.7    18.4
  149    6.1     5.3   1.0873      25  143.75   72.5     19.3   135      35.2   92.3    76.5    92.1     51.9    35.7    22      25.8    25.2    16.9
  150    24.5    25.2  1.0416      26  223      70.25    31.8   168.3    40.6   114.1   106.8   113.9    67.6    42.7    24.7    36      30.4    18.4
  151    9.9     9.4   1.0776      26  152.25   69       22.5   137.2    35.4   92.9    77.6    93.5     56.9    35.9    20.4    31.6    29      17.8
  152    19.1    19.6  1.0542      26  241.75   74.5     30.7   195.1    41.8   108.3   102.9   114.4    72.9    43.5    25.1    38.5    33.8    19.6
  153    10.6    10.1  1.0758      27  146      72.25    19.7   130.5    34.1   88.5    72.8    91.1     53.6    36.8    23.8    27.8    26.3    17.4
  154    16.5    16.5  1.061       27  156.75   67.25    24.4   130.9    37.9   94      88.2    95.2     56.8    37.4    22.8    30.6    28.3    17.9
  155    20.5    21    1.051       27  200.25   73.5     26.1   159.3    38.2   101.1   100.1   105      62.1    40      24.9    33.7    29.2    19.4
  156    17.2    17.3  1.0594      28  171.5    75.25    21.6   142      35.6   92.1    83.5    98.3     57.3    37.8    21.7    32.2    27.7    17.7
  157    30.1    31.2  1.0287      28  205.75   69       30.4   143.9    38.5   105.6   105     106.4    68.6    40      25.2    35.2    30.7    19.1
  158    10.5    10    1.0761      28  182.5    72.25    24.6   163.4    37     98.5    90.8    102.5    60.8    38.5    25      31.6    28      18.6
  159    12.8    12.5  1.0704      30  136.5    68.75    20.3   119.1    35.9   88.7    76.6    89.8     50.1    34.8    21.8    27      34.9    16.9
  160    22      22.5  1.0477      31  177.25   71.5     24.4   138.3    36.2   101.1   92.4    99.3     59.4    39      24.6    30.1    28.2    18.2
  161    9.9     9.4   1.0775      31  151.25   72.25    20.4   136.2    35     94      81.2    91.5     52.5    36.6    21      27      26.3    16.5
  162    14.8    14.6  1.0653      33  196      73       25.9   167      38.5   103.8   95.6    105.1    61.4    40.6    25      31.3    29.2    19.1
  163    13.3    13    1.069       33  184.25   68.75    24.4   159.8    40.7   98.9    92.1    103.5    64      37.3    23.5    33.5    30.6    19.7
  164    15.2    15.1  1.0644      34  140      70.5     19.8   118.8    36     89.2    83.4    89.6     52.4    35.6    20.4    28.3    26.2    16.5
  165    26.5    27.3  1.037       34  218.75   72       29.7   160.8    39.5   111.4   106     108.8    63.8    42      23.4    34      31.2    18.5
  166    19      19.2  1.0549      35  217      73.75    28.1   175.8    40.5   107.5   95.1    104.5    64.8    41.3    25.6    36.4    33.7    19.4
  167    21.4    21.8  1.0492      35  166.25   68       25.3   130.7    38.5   99.1    90.4    95.6     55.5    34.2    21.9    30.2    28.7    17.7
  168    20      20.3  1.0525      35  224.75   72.25    30.3   179.7    43.9   108.2   100.4   106.8    63.3    41.7    24.6    37.2    33.1    19.8
  169    34.7    34.3  1.018       35  228.25   69.5     33.3   149.3    40.4   114.9   115.9   111.9    74.4    40.6    24      36.1    31.8    18.8
  170    16.5    16.5  1.061       35  172.75   69.5     25.2   144.2    37.6   99.1    90.8    98.1     60.1    39.1    23.4    32.5    29.8    17.4
  171    4.1     3     1.0926      35  152.25   67.75    23.4   146.1    37     92.2    81.9    92.8     54.7    36.2    22.1    30.4    27.4    17.7
  172    1.9     0.7   1.0983      35  125.75   65.5     20.6   123.4    34     90.8    75      89.2     50      34.8    22      24.8    25.9    16.9
  173    20.2    20.5  1.0521      35  177.25   71       24.8   141.7    38.4   100.5   90.3    98.7     57.8    37.3    22.4    31      28.7    17.7
  174    16.8    16.9  1.0603      36  176.25   71.5     24.3   146.6    38.7   98.2    90.3    99.9     59.2    37.7    21.5    32.4    28.4    17.8
  175    24.6    25.3  1.0414      36  226.75   71.75    31     170.9    41.5   115.3   108.8   114.4    69.2    42.4    24      35.4    21      20.1
  176    10.4    9.9   1.0763      37  145.25   69.25    21.3   130.2    36     96.8    79.4    89.2     50.3    34.8    22.2    31      26.9    16.9
  177    13.4    13.1  1.0689      37  151      67       23.7   130.8    35.3   92.6    83.2    96.4     60      38.1    22      31.5    26.6    16.7
  178    28.8    29.9  1.0316      37  241.25   71.5     33.2   171.7    42.1   119.2   110.3   113.9    69.8    42.6    24.8    34.4    29.5    18.4
  179    22      22.5  1.0477      38  187.25   69.25    27.5   146.1    38     102.7   92.7    101.9    64.7    39.5    24.7    34.8    30.3    18.1
  180    16.8    16.9  1.0603      39  234.75   74.5     29.8   195.3    42.8   109.5   104.5   109.9    69.5    43.1    25.8    39.1    32.5    19.9
  181    25.8    26.6  1.0387      39  219.25   74.25    28     162.7    40     108.5   104.6   109.8    68.1    42.8    24.1    35.6    29      19
  182    0       0     1.1089      40  118.5    68       18.1   118.5    33.8   79.3    69.4    85       47.2    33.5    20.2    27.7    24.6    16.5
  183    11.9    11.5  1.0725      40  145.75   67.25    22.7   128.4    35.5   95.5    83.6    91.6     54.1    36.2    21.8    31.4    28.3    17.2
  184    12.4    12.1  1.0713      40  159.25   69.75    23     139.5    35.3   92.3    86.8    96.1     58      39.4    22.7    30      26.4    17.4
  185    17.4    17.5  1.0587      40  170.5    74.25    21.8   140.8    37.7   98.9    90.4    95.5     55.4    38.9    22.4    30.5    28.9    17.7
  186    9.2     8.6   1.0794      40  167.5    71.5     23.1   152.1    39.4   89.5    83.7    98.1     57.3    39.7    22.6    32.9    29.3    18.2
  187    23      23.6  1.0453      41  232.75   74.25    29.7   179.2    41.9   117.5   109.3   108.8    67.7    41.3    24.7    37.2    31.8    20
  188    20.1    20.4  1.0524      41  210.5    72       28.6   168.3    38.5   107.4   98.9    104.1    63.5    39.8    23.5    36.4    30.4    19.1
  189    20.2    20.5  1.052       41  202.25   72.5     27     161.4    40.8   109.2   98      101.8    62.8    41.3    24.8    36.6    32.4    18.8
  190    23.8    24.4  1.0434      41  185      68.25    28     141      38     103.4   101.2   103.1    61.5    40.4    22.9    33.4    29.2    18.5
  191    11.8    11.4  1.0728      41  153      69.25    22.5   135      36.4   91.4    80.6    92.3     54.3    36.3    21.8    29.6    27.3    17.9
  192    36.5    38.1  1.014       42  244.25   76       29.8   155.2    41.8   115.2   113.7   112.4    68.5    45      25.5    37.1    31.2    19.9
  193    16      15.9  1.0624      42  193.5    70.5     27.4   162.6    40.7   104.9   94.1    102.7    60.6    38.6    24.7    34      30.1    18.7
  194    24      24.7  1.0429      42  224.75   74.75    28.3   170.8    38.5   106.7   105.7   111.8    65.3    43.3    26      33.7    29.9    18.5
  195    22.3    22.8  1.047       42  162.75   72.75    21.6   126.5    35.4   92.2    85.6    96.5     60.2    38.9    22.4    31.7    27.1    17.1
  196    24.8    25.5  1.0411      42  180      68.25    27.2   135.4    38.5   101.6   96.6    100.6    61.1    38.4    24.1    32.9    29.8    18.8
  197    21.5    22    1.0488      42  156.25   69       23.1   122.6    35.5   97.8    86      96.2     57.7    38.6    24      31.2    27.3    17.4
  198    17.6    17.7  1.0583      42  168      71.5     23.1   138.4    36.5   92      89.7    101      62.3    38      22.3    30.8    27.8    16.9
  199    7.3     6.6   1.0841      42  167.25   72.75    22.3   155.1    37.6   94      78      99       57.5    40      22.5    30.6    30      18.5
  200    22.6    23.6  1.0462      43  170.75   67.5     26.4   132.1    37.4   103.7   89.7    94.2     58.5    39      24.1    33.8    28.8    18.8
  201    12.5    12.2  1.0709      43  178.25   70.25    25.4   155.9    37.8   102.7   89.2    99.2     60.2    39.2    23.8    31.7    28.4    18.6
  202    21.7    22.1  1.0484      43  150      69.25    22     117.5    35.2   91.1    85.7    96.9     55.5    35.7    22      29.4    26.6    17.4
  203    27.7    28.7  1.034       43  200.5    71.5     27.6   144.9    37.9   107.2   103.1   105.5    68.8    38.3    23.7    32.1    28.9    18.7
  204    6.8     6     1.0854      44  184      74       23.7   171.4    37.9   100.8   89.1    102.6    60.6    39      24      32.9    29.2    18.4
  205    33.4    34.8  1.0209      44  223      69.75    32.3   148.5    40.9   121.6   113.9   107.1    63.5    40.3    21.8    34.8    30.7    17.4
  206    16.6    16.6  1.061       44  208.75   73       27.6   174.2    41.9   105.6   96.3    102      63.3    39.8    24.1    37.3    23.1    19.4
  207    31.7    32.9  1.025       44  166      65.5     27.2   113.5    39.1   100.6   93.9    100.1    58.9    37.6    21.4    33.1    29.5    17.3
  208    31.5    32.8  1.0254      47  195      72.5     26.1   133.6    40.2   102.7   101.3   101.7    60.7    39.4    23.3    36.7    31.6    18.4
  209    10.1    9.6   1.0771      47  160.5    70.25    22.9   144.3    36     99.8    83.9    91.8     53      36.2    22.5    31.4    27.5    17.7
  210    11.3    10.8  1.0742      47  159.75   70.75    22.5   141.8    34.5   92.9    84.4    94       56      38.2    22.6    29      26.2    17.6
  211    7.8     7.1   1.0829      49  140.5    68       21.4   129.5    35.8   91.2    79.4    89       51.1    35      21.7    30.9    28.8    17.4
  212    26.4    27.2  1.0373      49  216.25   74.5     27.4   159.3    40.2   115.6   104     109      63.7    40.3    23.2    36.8    31      18.9
  213    19.3    19.5  1.0543      49  168.25   71.75    23     135.9    38.3   98.3    89.7    99.1     56.3    38.8    23      29.5    27.9    18.6
  214    18.5    18.7  1.0561      50  194.75   70.75    27.4   158.7    39     103.7   97.6    104.2    60      40.9    25.5    32.7    30      19
  215    19.3    19.5  1.0543      50  172.75   73       22.8   139.4    37.4   98.7    87.6    96.1     57.1    38.1    21.8    28.6    26.7    18
  216    45.1    47.5  0.995       51  219      64       37.6   120.2    41.2   119.8   122.1   112.8    62.5    36.9    23.6    34.7    29.1    18.4
  217    13.8    13.6  1.0678      51  149.25   69.75    21.6   128.7    34.8   92.8    81.1    96.3     53.8    36.5    21.5    31.3    26.3    17.8
  218    8.2     7.5   1.0819      51  154.5    70       22.2   141.9    36.9   93.3    81.5    94.4     54.7    39      22.6    27.5    25.9    18.6
  219    23.9    24.5  1.0433      52  199.25   71.75    27.2   151.7    39.4   106.8   100     105      63.9    39.2    22.9    35.7    30.4    19.2
  220    15.1    15    1.0646      53  154.5    69.25    22.7   131.2    37.6   93.9    88.7    94.5     53.7    36.2    22      28.5    25.7    17.1
  221    12.7    12.4  1.0706      54  153.25   70.5     24.5   151.3    38.5   99      91.8    96.2     57.7    38.1    23.9    31.4    29.9    18.9
  222    25.3    26    1.0399      54  230      72.25    31     171.9    42.5   119.9   110.4   105.5    64.2    42.7    27      38.4    32      19.6
  223    11.9    11.5  1.0726      54  161.75   67.5     25     142.6    37.4   94.2    87.6    95.6     59.7    40.2    23.4    27.9    27      17.8
  224    6.1     5.2   1.0874      55  142.25   67.25    22.2   133.6    35.2   92.7    82.8    91.9     54.4    35.2    22.5    29.4    26.8    17
  225    11.3    10.9  1.074       55  179.75   68.75    26.8   159.5    41.1   106.9   95.3    98.2     57.4    37.1    21.8    34.1    31.1    19.2
  226    12.8    12.5  1.0703      55  126.5    66.75    20     110.3    33.4   88.8    78.2    87.5     50.8    33      19.7    25.3    22      15.8
  227    14.9    14.8  1.065       55  169.5    68.25    25.6   144.2    37.2   101.7   91.1    97.1     56.6    38.5    22.6    33.4    29.3    18.8
  228    24.5    25.2  1.0418      55  198.5    74.25    25.3   149.9    38.3   105.3   96.7    106.6    64      42.6    23.4    33.2    30      18.4
  229    15      14.9  1.0647      56  174.5    69.5     25.4   148.3    38.1   104     89.4    98.4     58.4    37.4    22.5    34.6    30.1    18.8
  230    16.9    17    1.0601      56  167.75   68.5     25.2   139.4    37.4   98.6    93      97       55.4    38.8    23.2    32.4    29.7    19
  231    11.1    10.6  1.0745      57  147.75   65.75    24.1   131.4    35.2   99.6    86.4    90.1     53      35      21.3    31.7    27.3    16.9
  232    16.1    16.1  1.062       57  182.25   71.75    24.9   152.9    39.4   103.4   96.7    100.7    59.3    38.6    22.8    31.8    29.1    19
  233    15.5    15.4  1.0636      58  175.5    71.5     24.2   148.4    38     100.2   88.1    97.8     57.1    38.9    23.6    30.9    29.6    18
  234    25.9    26.7  1.0384      58  161.75   67.25    25.2   119.9    35.1   94.9    94.9    100.2    56.8    35.9    21      27.8    26.1    17.6
  235    25.5    25.8  1.0403      60  157.75   67.5     24.1   117.5    40.4   97.2    93.3    94       54.3    35.7    21      31.3    28.7    18.3
  236    18.4    18.6  1.0563      62  168.75   67.5     26.1   137.6    38.3   104.7   95.6    93.7     54.4    37.1    22.7    30.3    26.3    18.3
  237    24      24.8  1.0424      62  191.5    72.25    25.8   145.2    40.6   104     98.2    101.1    59.3    40.3    23      32.6    28.5    19
  238    26.4    27.3  1.0372      63  219.15   69.5     31.9   161.2    40.2   117.6   113.8   111.8    63.4    41.1    22.3    35.1    29.6    18.5
  239    12.7    12.4  1.0705      64  155.25   69.5     22.6   135.5    37.9   95.8    82.8    94.5     61.2    39.1    22.3    29.8    28.9    18.3
  240    28.8    29.9  1.0316      65  189.75   65.75    30.9   135.1    40.8   106.4   100.5   100.5    59.2    38.1    24      35.9    30.5    19.1
  241    17      17    1.0599      65  127.5    65.75    20.8   105.9    34.7   93      79.7    87.6     50.7    33.4    20.1    28.5    24.8    16.5
  242    33.6    35    1.0207      65  224.5    68.25    33.9   149.2    38.8   119.6   118     114.3    61.3    42.1    23.4    34.9    30.1    19.4
  243    29.3    30.4  1.0304      66  234.25   72       31.8   165.6    41.4   119.7   109     109.1    63.7    42.4    24.6    35.6    30.7    19.5
  244    31.4    32.6  1.0256      67  227.75   72.75    30.3   156.3    41.3   115.8   113.4   109.8    65.6    46      25.4    35.3    29.8    19.5
  245    28.1    29    1.0334      67  199.5    68.5     29.9   143.6    40.7   118.3   106.1   101.6    58.2    38.8    24.1    32.1    29.3    18.5
  246    15.3    15.2  1.0641      68  155.5    69.25    22.8   131.8    36.3   97.4    84.3    94.4     54.3    37.5    22.6    29.2    27.3    18.5
  247    29.1    30.2  1.0308      69  215.5    70.5     30.5   152.7    40.8   113.7   107.6   110      63.3    44      22.6    37.5    32.6    18.8
  248    11.5    11    1.0736      70  134.25   67       21.1   118.9    34.9   89.2    83.6    88.8     49.6    34.8    21.5    25.6    25.7    18.5
  249    32.3    33.6  1.0236      72  201      69.75    29.1   136.1    40.9   108.5   105     104.5    59.6    40.8    23.2    35.2    28.6    20.1
  250    28.3    29.3  1.0328      72  186.75   66       30.2   133.9    38.9   111.1   111.5   101.7    60.3    37.3    21.5    31.3    27.2    18
  251    25.3    26    1.0399      72  190.75   70.5     27     142.6    38.9   108.3   101.3   97.8     56      41.6    22.7    30.5    29.4    19.8
  252    30.7    31.9  1.0271      74  207.5    70       29.8   143.7    40.8   112.4   108.5   107.1    59.3    42.2    24.6    33.7    30      20.9
;
run;

data statdata.BodyFat2;
    set statdata.BodyFat;
    if Height=29.5 then Height=69.5;
run;


data statdata.sales;
    input @1 Purchase 1. @3 Gender $6. @10 Income $6. @17 Age 2.;
    datalines;
0 Female Low    40
0 Female Low    46
1 Female Low    41
1 Female Low    39
0 Female Low    31
0 Female Low    31
0 Female Low    32
0 Female Low    44
0 Female Low    42
0 Female Low    39
0 Female Low    38
1 Female Low    46
0 Female Low    37
0 Female Low    37
1 Female Low    44
0 Female Low    38
0 Female Low    25
0 Female Low    44
0 Female Low    39
0 Female Low    34
1 Female Low    30
0 Female Low    43
1 Female Low    47
1 Female Low    35
0 Female Low    35
0 Female Low    33
1 Female Low    38
0 Female Low    37
0 Female Low    46
0 Female Low    40
0 Female Low    44
1 Female Low    37
1 Female Low    38
1 Female Low    29
1 Female Low    40
0 Female Low    34
0 Female Low    43
0 Female Low    38
1 Female Low    50
1 Female Low    41
0 Female Low    40
0 Female Low    39
1 Female Low    38
1 Female Low    36
1 Female Low    37
0 Female Low    38
0 Female Low    40
1 Female Low    33
1 Female Low    51
0 Female Low    30
0 Female Low    30
0 Female Low    34
0 Female Low    45
1 Female Low    39
0 Female Low    46
0 Female Low    39
1 Female Low    56
0 Female Low    35
0 Female Low    36
0 Female Low    35
0 Female Low    43
1 Female Low    36
0 Female Low    39
1 Female Low    38
0 Female Low    34
1 Female Low    35
0 Female Low    44
0 Female Low    40
0 Female Low    41
1 Female Low    37
0 Female Low    54
1 Female Low    41
1 Female Low    33
1 Female Low    36
0 Female Low    32
0 Female Low    37
0 Female Low    37
0 Female Low    54
0 Female Low    49
1 Female Low    31
1 Female Low    37
1 Female Low    37
0 Female Low    37
0 Female Low    40
0 Female Low    41
1 Female Low    34
1 Female Low    31
0 Female Low    27
1 Female Low    35
1 Female Medium 39
0 Female Medium 38
1 Female Medium 34
1 Female Medium 45
0 Female Medium 40
0 Female Medium 41
0 Female Medium 45
0 Female Medium 41
0 Female Medium 32
1 Female Medium 47
1 Female Medium 39
0 Female Medium 40
0 Female Medium 32
0 Female Medium 42
1 Female Medium 31
1 Female Medium 43
0 Female Medium 44
1 Female Medium 48
0 Female Medium 39
1 Female Medium 35
0 Female Medium 32
1 Female Medium 34
1 Female Medium 43
0 Female Medium 34
1 Female Medium 31
0 Female Medium 47
1 Female Medium 36
0 Female Medium 38
0 Female Medium 36
0 Female Medium 39
0 Female Medium 38
1 Female Medium 44
0 Female Medium 34
0 Female Medium 32
1 Female Medium 34
0 Female Medium 49
1 Female Medium 44
0 Female Medium 39
0 Female Medium 35
1 Female Medium 41
1 Female Medium 37
1 Female Medium 38
0 Female Medium 37
1 Female Medium 41
0 Female Medium 35
0 Female Medium 41
1 Female Medium 43
0 Female Medium 42
0 Female Medium 49
0 Female Medium 41
0 Female Medium 41
0 Female Medium 37
0 Female Medium 32
0 Female Medium 38
1 Female Medium 41
1 Female Medium 44
0 Female Medium 41
1 Female Medium 33
1 Female Medium 49
0 Female Medium 39
1 Female Medium 37
0 Female Medium 37
0 Female Medium 35
0 Female Medium 38
1 Female Medium 34
0 Female Medium 43
1 Female Medium 34
0 Female Medium 38
1 Female Medium 38
1 Female Medium 34
1 Female Medium 52
1 Female High   41
0 Female High   40
0 Female High   36
0 Female High   44
0 Female High   43
1 Female High   35
0 Female High   29
0 Female High   27
1 Female High   40
0 Female High   32
1 Female High   44
0 Female High   38
0 Female High   41
0 Female High   30
0 Female High   28
0 Female High   48
1 Female High   33
1 Female High   35
0 Female High   33
1 Female High   40
1 Female High   40
0 Female High   31
1 Female High   38
1 Female High   23
1 Female High   49
1 Female High   39
0 Female High   31
0 Female High   42
1 Female High   38
0 Female High   33
0 Female High   37
0 Female High   34
0 Female High   44
1 Female High   28
1 Female High   35
0 Female High   25
1 Female High   38
1 Female High   34
1 Female High   46
0 Female High   34
0 Female High   35
0 Female High   36
0 Female High   47
0 Female High   40
0 Female High   39
1 Female High   51
1 Female High   45
0 Female High   32
1 Female High   37
1 Female High   36
0 Female High   41
1 Female High   51
1 Female High   51
1 Female High   41
1 Female High   26
1 Female High   49
0 Female High   45
0 Female High   40
0 Female High   39
1 Female High   44
0 Female High   34
0 Female High   39
0 Female High   36
1 Female High   32
1 Female High   45
1 Female High   29
1 Female High   41
1 Female High   39
0 Female High   25
0 Female High   29
1 Female High   38
0 Female High   34
0 Female High   38
0 Female High   23
0 Female High   31
0 Female High   45
1 Female High   40
0 Female High   37
1 Female High   42
0 Female High   42
0 Male   Low    28
0 Male   Low    57
0 Male   Low    39
0 Male   Low    34
0 Male   Low    46
0 Male   Low    32
0 Male   Low    39
0 Male   Low    36
0 Male   Low    36
0 Male   Low    39
0 Male   Low    35
0 Male   Low    31
0 Male   Low    36
1 Male   Low    49
0 Male   Low    37
1 Male   Low    36
0 Male   Low    41
0 Male   Low    43
0 Male   Low    37
0 Male   Low    39
0 Male   Low    40
0 Male   Low    39
0 Male   Low    46
1 Male   Low    39
0 Male   Low    37
0 Male   Low    42
0 Male   Low    45
1 Male   Low    48
1 Male   Low    38
0 Male   Low    34
0 Male   Low    37
0 Male   Low    36
0 Male   Low    31
0 Male   Low    28
1 Male   Low    41
1 Male   Low    39
0 Male   Low    39
1 Male   Low    48
0 Male   Low    36
0 Male   Low    39
0 Male   Low    41
0 Male   Low    41
0 Male   Low    37
0 Male   Medium 45
0 Male   Medium 44
0 Male   Medium 32
0 Male   Medium 33
1 Male   Medium 33
0 Male   Medium 41
1 Male   Medium 47
0 Male   Medium 42
0 Male   Medium 34
0 Male   Medium 42
1 Male   Medium 33
0 Male   Medium 25
0 Male   Medium 33
0 Male   Medium 42
0 Male   Medium 40
0 Male   Medium 37
0 Male   Medium 24
1 Male   Medium 45
0 Male   Medium 36
0 Male   Medium 33
0 Male   Medium 38
0 Male   Medium 31
0 Male   Medium 43
0 Male   Medium 38
0 Male   Medium 29
0 Male   Medium 35
0 Male   Medium 44
0 Male   Medium 38
0 Male   Medium 43
0 Male   Medium 46
0 Male   Medium 45
1 Male   Medium 34
1 Male   Medium 38
0 Male   Medium 30
0 Male   Medium 33
1 Male   Medium 33
0 Male   Medium 37
1 Male   Medium 43
0 Male   Medium 42
1 Male   Medium 47
0 Male   Medium 40
1 Male   Medium 37
1 Male   Medium 38
0 Male   Medium 37
1 Male   Medium 35
0 Male   Medium 33
0 Male   Medium 32
0 Male   Medium 39
0 Male   Medium 38
0 Male   Medium 40
1 Male   Medium 44
0 Male   Medium 36
0 Male   Medium 40
0 Male   Medium 44
0 Male   Medium 28
0 Male   Medium 39
0 Male   Medium 39
0 Male   Medium 34
0 Male   Medium 48
0 Male   Medium 39
0 Male   Medium 37
0 Male   Medium 40
0 Male   Medium 34
0 Male   Medium 32
0 Male   Medium 46
0 Male   Medium 35
0 Male   Medium 36
0 Male   Medium 39
1 Male   Medium 44
0 Male   Medium 47
1 Male   Medium 43
0 Male   Medium 40
0 Male   Medium 29
0 Male   High   41
0 Male   High   32
1 Male   High   41
0 Male   High   32
0 Male   High   36
1 Male   High   42
0 Male   High   24
1 Male   High   39
0 Male   High   38
0 Male   High   35
0 Male   High   42
0 Male   High   40
0 Male   High   33
0 Male   High   36
1 Male   High   46
1 Male   High   42
0 Male   High   39
0 Male   High   40
1 Male   High   39
1 Male   High   34
1 Male   High   35
1 Male   High   35
0 Male   High   43
1 Male   High   45
1 Male   High   38
0 Male   High   38
0 Male   High   37
0 Male   High   42
0 Male   High   30
1 Male   High   45
1 Male   High   36
1 Male   High   33
1 Male   High   49
1 Male   High   41
1 Male   High   41
1 Male   High   31
0 Male   High   33
1 Male   High   39
0 Male   High   43
1 Male   High   46
0 Male   High   31
1 Male   High   52
0 Male   High   40
1 Male   High   48
0 Male   High   49
1 Male   High   38
0 Male   High   35
1 Male   High   34
1 Male   High   37
0 Male   High   37
0 Male   High   41
1 Male   High   33
1 Male   High   35
0 Male   High   29
0 Male   High   47
1 Male   High   35
0 Male   High   43
0 Male   High   40
0 Male   High   36
1 Male   High   35
0 Male   High   45
0 Male   High   36
1 Male   High   47
1 Male   High   39
1 Male   High   47
1 Male   High   45
1 Male   High   37
1 Male   High   37
1 Male   High   33
0 Male   High   39
1 Male   High   43
0 Male   High   30
1 Male   High   32
0 Male   High   33
0 Male   High   33
;
run;

data statdata.Exact;
  input A B;
  datalines;
1 2
1 2
1 2
2 1
2 1
2 2
2 2
;
run;

data statdata.Safety;
     input @1 Unsafe 1. @3 Size 1. @5 Weight 2. @8 Region $9. @18 Type $13.;
datalines;
0 2  3 N America Medium       
0 3  4 N America Sport/Utility
0 2  3 N America Medium       
0 1  3 N America Small        
0 2  3 N America Medium       
0 2  3 N America Medium       
0 3  4 N America Sport/Utility
0 2  3 Asia      Medium       
0 2  4 N America Medium       
0 1  3 N America Small        
1 1  3 N America Small        
0 1  3 Asia      Small        
0 2  3 N America Medium       
0 2  3 N America Medium       
0 2  3 N America Medium       
0 3  3 N America Large        
0 3  4 N America Large        
0 3  4 N America Large        
0 3  4 N America Large        
0 3  4 N America Large        
1 1  3 N America Small        
1 2  3 N America Medium       
1 2  3 N America Medium       
0 3  4 N America Large        
1 1  3 N America Sports       
0 1  3 N America Sports       
0 3  6 N America Sport/Utility
0 3  4 N America Large        
0 3  4 N America Large        
0 3  3 N America Large        
0 1  3 N America Small        
1 1  2 N America Small        
0 3  4 N America Large        
1 1  3 N America Sports       
1 1  3 N America Small        
0 3  4 N America Large        
1 1  3 N America Sports       
1 1  3 N America Sports       
0 3  1 N America Sport/Utility
0 3  5 N America Sport/Utility
0 3  6 N America Sport/Utility
0 3  5 N America Sport/Utility
1 1  3 N America Small        
1 1  2 N America Small        
1 3  3 N America Sport/Utility
1 1  2 Asia      Small        
0 2  3 Asia      Medium       
1 1  3 Asia      Sports       
1 1  2 Asia      Sports       
0 3  4 Asia      Sport/Utility
0 2  3 Asia      Medium       
0 2  4 Asia      Medium       
0 3  4 Asia      Sport/Utility
0 3  4 Asia      Sport/Utility
0 3  4 N America Sport/Utility
0 3  3 N America Sport/Utility
0 3  3 N America Sport/Utility
0 2  3 Asia      Medium       
0 3  4 N America Large        
1 1  3 Asia      Small        
0 2  3 Asia      Medium       
0 1  2 Asia      Sports       
0 1  3 Asia      Sports       
1 1  3 N America Small        
0 2  3 N America Medium       
0 3  4 N America Large        
1 1  2 Asia      Small        
0 2  4 Asia      Medium       
1 2  3 Asia      Medium       
0 1  4 Asia      Sports       
1 1  3 Asia      Sports       
1 1  3 Asia      Small        
0 2  3 Asia      Medium       
1 2  3 Asia      Medium       
0 1  4 Asia      Sports       
0 2  3 N America Medium       
0 2  3 N America Medium       
0 2  3 N America Medium       
0 3  3 N America Large        
0 3  4 N America Large        
0 2  3 N America Medium       
0 2  4 N America Medium       
0 3  4 N America Large        
1 1  4 N America Sports       
0 1  2 N America Small        
0 1  2 N America Sports       
0 1  2 Asia      Small        
0 2  3 Asia      Medium       
1 1  2 Asia      Small        
1 3  3 Asia      Sport/Utility
1 1  2 Asia      Small        
1 1  3 Asia      Small        
0 2  3 Asia      Medium       
1 2  3 Asia      Medium       
1 1  3 Asia      Sports       
0 3  5 Asia      Sport/Utility
;
run;

data statdata.market;
    input pre post @@;
    datalines;
 9.52 10.28  9.63 10.45
 7.71  8.51  7.83  8.62
 8.97 10.03  8.62  9.45
10.11  9.68  9.96  9.62
 8.50 11.84  9.62 11.95
10.29 10.52 10.13 10.67
 9.11 11.03  8.95 10.53
10.86 10.70  9.31 10.24
 9.59 10.82  9.27 10.16
11.86 12.12 10.15 11.28
12.83 13.11 11.40 12.09
11.19 13.43 11.97 14.45
11.47 12.49 10.06 12.26
11.15 10.67 10.74 11.25
 9.99 11.16  7.56  7.33
;
run;

data statdata.hosp;
    input id 1-2 visit 4 code 5 @6 date mmddyy6. ref3p 12 ref2p 13
          ref1p 14 ref1a 15 ref2a 16-17 ref3a 18;

    if ref3p=. then ref3p=0;
    if ref2p=. then ref2p=0;
    if ref1p=. then ref1p=0;
    if ref1a=. then ref1a=0;
    if ref2a=. then ref2a=0;
    if ref3a=. then ref3a=0;
    avgprior = mean(ref3p, ref2p, ref1p);
    diff1 = ref1a-avgprior;
    diff2 = ref2a-avgprior;
    diff3 = ref3a-avgprior;
    diffbys1 = ref1a-ref3p;
    diffbys2 = ref2a-ref3p;
    diffbys3 = ref3a-ref3p;
  
    if code < 4 then output;

    format
        visit vstfmt.
        code spcfmt.
        date mmddyy8.;

    label id='physician identification number'
          visit='visit code'
          code='specialty code'
          date='date of visit'
          ref3p='number referrals 3 mnths prior 2 visit'
          ref2p='number referrals 2 mnths prior 2 visit'
          ref1p='number referrals 1 mnth prior 2 visit'
          ref1a='number referrals 1 mnth after visit'
          ref2a='number referrals 2 mnths after visit'
          ref3a='number referrals 3 mnths after visit'
          avgprior='average # referrals prior 2 visit'
          diff1='# refs 1 mnth after minus average prior'
          diff2='# refs 2 mnth after minus average prior'
          diff3='# refs 3 mnth after minus average prior'
          diffbys1='# refs 1 mnth after minus # 3 mths prior'
          diffbys2='# refs 2 mnth after minus # 3 mths prior'
          diffbys3='# refs 3 mnth after minus # 3 mths prior'
    ;
    datalines;
01 15100695
02 13103195    01
04 13102795  3 011
06 111023951  1
07 131019953 1
08 111030951221  2
10 13110895
13 111005957641046
14 111030952  3011
15 12111095   1011
16 111030954143045
18 12100995
22 11103195  2
23 11103095  1
24 12110195    011
26 11103195724401
27 111011952234023
28 12110395      1
29 111030952 21032
30 13101995   1
31 13103195 111  1
32 12110395      1
33 12100395
34 12100395    01
35 12110395      2
36 111012956161  4
39 11103195 115  1
42 13102095   1
44 1311019511
45 13102595
47 111005956678114
48 13101895
49 111011954223024
50 12102095
51 12102095
52 15102095      1
54 13103095  1
55 12110895   1
56 13101995
57 11101395
60 11112095 211021
61 15103195 211011
62 12111095
63 111012953223033
03 01101395 1
05 031018952412022
09 021017951 13  3
11 03102595
12 011031953411058
17 03103195 1  01
19 03102595  1 012
20 05101795
21 02100995   1
25 05100695
37 03101795    01
38 04103195
40 03102595
41 02112895 11   1
43 05101795
46 05100995
53 02101195 1
58 03110695   1
59 04103195      1
;
run;

data statdata.ven;
    length brand $ 5;
    input brand $ wear;
    datalines;
Acme  2.3
Acme  2.1
Acme  2.4
Acme  2.5
Champ 2.2
Champ 2.3
Champ 2.4
Champ 2.6
Ajax  2.2
Ajax  2.0
Ajax  1.9
Ajax  2.1
;
run;

data statdata.titanic2;
   attrib Class length=$9;
   attrib Age length=$9;
   attrib Gender length=$9;
   attrib Survived length=$9;

   infile datalines dsd;
   input
      Class
      Age
      Gender
      Survived
   ;
datalines4;
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,yes
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,male,no
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,yes
first,adult,female,no
first,adult,female,no
first,adult,female,no
first,adult,female,no
first,child,male,yes
first,child,male,yes
first,child,male,yes
first,child,male,yes
first,child,male,yes
first,child,female,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,yes
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,male,no
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,yes
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,adult,female,no
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,male,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
second,child,female,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,yes
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,male,no
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,yes
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,adult,female,no
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,yes
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,male,no
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,yes
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
third,child,female,no
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,yes
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,male,no
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,yes
crew,adult,female,no
crew,adult,female,no
crew,adult,female,no
;;;;
run;

data statdata.market;
  input pre post @@;
  datalines;
 9.52 10.28  9.63 10.45
 7.71  8.51  7.83  8.62
 8.97 10.03  8.62  9.45
10.11  9.68  9.96  9.62
 8.50 11.84  9.62 11.95
10.29 10.52 10.13 10.67
 9.11 11.03  8.95 10.53
10.86 10.70  9.31 10.24
 9.59 10.82  9.27 10.16
11.86 12.12 10.15 11.28
12.83 13.11 11.40 12.09
11.19 13.43 11.97 14.45
11.47 12.49 10.06 12.26
11.15 10.67 10.74 11.25
 9.99 11.16  7.56  7.33
;
run;

data statdata.hosp;
  input id 1-2 visit 4 code 5 @6 date mmddyy6. ref3p 12 ref2p 13
        ref1p 14 ref1a 15 ref2a 16-17 ref3a 18;

  if ref3p=. then ref3p=0;
  if ref2p=. then ref2p=0;
  if ref1p=. then ref1p=0;
  if ref1a=. then ref1a=0;
  if ref2a=. then ref2a=0;
  if ref3a=. then ref3a=0;
  avgprior = mean(ref3p, ref2p, ref1p);
  diff1 = ref1a-avgprior;
  diff2 = ref2a-avgprior;
  diff3 = ref3a-avgprior;
  diffbys1 = ref1a-ref3p;
  diffbys2 = ref2a-ref3p;
  diffbys3 = ref3a-ref3p;

  format
    visit vstfmt.
    code spcfmt.
    date mmddyy8.;

  label id='physician identification number'
        visit='visit code'
        code='specialty code'
        date='date of visit'
        ref3p='number referrals 3 mnths prior 2 visit'
        ref2p='number referrals 2 mnths prior 2 visit'
        ref1p='number referrals 1 mnth prior 2 visit'
        ref1a='number referrals 1 mnth after visit'
        ref2a='number referrals 2 mnths after visit'
        ref3a='number referrals 3 mnths after visit'
        avgprior='average # referrals prior 2 visit'
        diff1='# refs 1 mnth after minus average prior'
        diff2='# refs 2 mnth after minus average prior'
        diff3='# refs 3 mnth after minus average prior'
        diffbys1='# refs 1 mnth after minus # 3 mths prior'
        diffbys2='# refs 2 mnth after minus # 3 mths prior'
        diffbys3='# refs 3 mnth after minus # 3 mths prior'
   ;
  datalines;
01 15100695
02 13103195    01
04 13102795  3 011
06 111023951  1
07 131019953 1
08 111030951221  2
10 13110895
13 111005957641046
14 111030952  3011
15 12111095   1011
16 111030954143045
18 12100995
22 11103195  2
23 11103095  1
24 12110195    011
26 11103195724401
27 111011952234023
28 12110395      1
29 111030952 21032
30 13101995   1
31 13103195 111  1
32 12110395      1
33 12100395
34 12100395    01
35 12110395      2
36 111012956161  4
39 11103195 115  1
42 13102095   1
44 1311019511
45 13102595
47 111005956678114
48 13101895
49 111011954223024
50 12102095
51 12102095
52 15102095      1
54 13103095  1
55 12110895   1
56 13101995
57 11101395
60 11112095 211021
61 15103195 211011
62 12111095
63 111012953223033
03 01101395 1
05 031018952412022
09 021017951 13  3
11 03102595
12 011031953411058
17 03103195 1  01
19 03102595  1 012
20 05101795
21 02100995   1
25 05100695
37 03101795    01
38 04103195
40 03102595
41 02112895 11   1
43 05101795
46 05100995
53 02101195 1
58 03110695   1
59 04103195      1
;
run;

data statdata.hosp;
  set statdata.hosp;
  where code < 4;
run;


data statdata.ven;
  length brand $ 5;
  input brand $ wear;
  datalines;
Acme  2.3
Acme  2.1
Acme  2.4
Acme  2.5
Champ 2.2
Champ 2.3
Champ 2.4
Champ 2.6
Ajax  2.2
Ajax  2.0
Ajax  1.9
Ajax  2.1
;
run;



data statdata.cars;   
  input Manufacturer $ 1-14 Model $ 15-30 MidPrice CityMPG HighwayMPG
                EngineSize HorsePower RPM Revolutions FuelTankSize Weight;
  datalines;
Acura         Integra         15.9 25 31 1.8 140 6300 2890 13.2 2705
Acura         Legend          33.9 18 25 3.2 200 5500 2335 18 3560
Audi          90              29.1 20 26 2.8 172 5500 2280 16.9 3375
Audi          100             37.7 19 26 2.8 172 5500 2535 21.1 3405
BMW           535i            30 22 30 3.5 208 5700 2545 21.1 3640
Buick         Century         15.7 22 31 2.2 110 5200 2565 16.4 2880
Buick         LeSabre         20.8 19 28 3.8 170 4800 1570 18 3470
Buick         Roadmaster      23.7 16 25 5.7 180 4000 1320 23 4105
Buick         Riviera         26.3 19 27 3.8 170 4800 1690 18.8 3495
Cadillac      DeVille         34.7 16 25 4.9 200 4100 1510 18 3620
Cadillac      Seville         40.1 16 25 4.6 295 6000 1985 20 3935
Chevrolet     Cavalier        13.4 25 36 2.2 110 5200 2380 15.2 2490
Chevrolet     Corsica         11.4 25 34 2.2 110 5200 2665 15.6 2785
Chevrolet     Camaro          15.1 19 28 3.4 160 4600 1805 15.5 3240
Chevrolet     Lumina          15.9 21 29 2.2 110 5200 2595 16.5 3195
Chevrolet     Lumina_APV      16.3 18 23 3.8 170 4800 1690 20 3715
Chevrolet     Astro           16.6 15 20 4.3 165 4000 1790 27 4025
Chevrolet     Caprice         18.8 17 26 5 170 4200 1350 23 3910
Chevrolet     Corvette        38 17 25 5.7 300 5000 1450 20 3380
Chrylser      Concorde        18.4 20 28 3.3 153 5300 1990 18 3515
Chrysler      LeBaron         15.8 23 28 3 141 5000 2090 16 3085
Chrysler      Imperial        29.5 20 26 3.3 147 4800 1785 16 3570
Dodge         Colt            9.2 29 33 1.5 92 6000 3285 13.2 2270
Dodge         Shadow          11.3 23 29 2.2 93 4800 2595 14 2670
Dodge         Spirit          13.3 22 27 2.5 100 4800 2535 16 2970
Dodge         Caravan         19 17 21 3 142 5000 1970 20 3705
Dodge         Dynasty         15.6 21 27 2.5 100 4800 2465 16 3080
Dodge         Stealth         25.8 18 24 3 300 6000 2120 19.8 3805
Eagle         Summit          12.2 29 33 1.5 92 6000 2505 13.2 2295
Eagle         Vision          19.3 20 28 3.5 214 5800 1980 18 3490
Ford          Festiva         7.4 31 33 1.3 63 5000 3150 10 1845
Ford          Escort          10.1 23 30 1.8 127 6500 2410 13.2 2530
Ford          Tempo           11.3 22 27 2.3 96 4200 2805 15.9 2690
Ford          Mustang         15.9 22 29 2.3 105 4600 2285 15.4 2850
Ford          Probe           14 24 30 2 115 5500 2340 15.5 2710
Ford          Aerostar        19.9 15 20 3 145 4800 2080 21 3735
Ford          Taurus          20.2 21 30 3 140 4800 1885 16 3325
Ford          Crown_Victor    20.9 18 26 4.6 190 4200 1415 20 3950
Geo           Metro           8.4 46 50 1 55 5700 3755 10.6 1695
Geo           Storm           12.5 30 36 1.6 90 5400 3250 12.4 2475
Honda         Prelude         19.8 24 31 2.3 160 5800 2855 15.9 2865
Honda         Civic           12.1 42 46 1.5 102 5900 2650 11.9 2350
Honda         Accord          17.5 24 31 2.2 140 5600 2610 17 3040
Hyundai       Excel           8 29 33 1.5 81 5500 2710 11.9 2345
Hyundai       Elantra         10 22 29 1.8 124 6000 2745 13.7 2620
Hyundai       Scoupe          10 26 34 1.5 92 5550 2540 11.9 2285
Hyundai       Sonata          13.9 20 27 2 128 6000 2335 17.2 2885
Infiniti      Q45             47.9 17 22 4.5 278 6000 1955 22.5 4000
Lexus         ES300           28 18 24 3 185 5200 2325 18.5 3510
Lexus         SC300           35.2 18 23 3 225 6000 2510 20.6 3515
Lincoln       Continental     34.3 17 26 3.8 160 4400 1835 18.4 3695
Lincoln       Town_Car        36.1 18 26 4.6 210 4600 1840 20 4055
Mazda         323             8.3 29 37 1.6 82 5000 2370 13.2 2325
Mazda         Protege         11.6 28 36 1.8 103 5500 2220 14.5 2440
Mazda         626             16.5 26 34 2.5 164 5600 2505 15.5 2970
Mazda         MPV             19.1 18 24 3 155 5000 2240 19.6 3735
Mazda         RX-7            32.5 17 25 1.3 255 6500 2325 20 2895
Mercedes-Benz 190E            31.9 20 29 2.3 130 5100 2425 14.5 2920
Mercury       Capri           14.1 23 26 1.6 100 5750 2475 11.1 2450
Mercury       Cougar          14.9 19 26 3.8 140 3800 1730 18 3610
Mitsubishi    Mirage          10.3 29 33 1.5 92 6000 2505 13.2 2295
Mitsubishi    Diamante        26.1 18 24 3 202 6000 2210 19 3730
Nissan        Sentra          11.8 29 33 1.6 110 6000 2435 13.2 2545
Nissan        Altima          15.7 24 30 2.4 150 5600 2130 15.9 3050
Nissan        Quest           19.1 17 23 3 151 4800 2065 20 4100
Nissan        Maxima          21.5 21 26 3 160 5200 2045 18.5 3200
Oldsmobile    Achieva         13.5 24 31 2.3 155 6000 2380 15.2 2910
Oldsmobile    Cutlass_Cier    16.3 23 31 2.2 110 5200 2565 16.5 2890
Oldsmobile    Silhouette      19.5 18 23 3.8 170 4800 1690 20 3715
Oldsmobile    Eighty-Eight    20.7 19 28 3.8 170 4800 1570 18 3470
Plymouth      Laser           14.4 23 30 1.8 92 5000 2360 15.9 2640
Pontiac       LeMans          9 31 41 1.6 74 5600 3130 13.2 2350
Pontiac       Sunbird         11.1 23 31 2 110 5200 2665 15.2 2575
Pontiac       Firebird        17.7 19 28 3.4 160 4600 1805 15.5 3240
Pontiac       Grand_Prix      18.5 19 27 3.4 200 5000 1890 16.5 3450
Pontiac       Bonneville      24.4 19 28 3.8 170 4800 1565 18 3495
Saab          900             28.7 20 26 2.1 140 6000 2910 18 2775
Saturn        SL              11.1 28 38 1.9 85 5000 2145 12.8 2495
Subaru        Justy           8.4 33 37 1.2 73 5600 2875 9.2 2045
Subaru        Loyale          10.9 25 30 1.8 90 5200 3375 15.9 2490
Subaru        Legacy          19.5 23 30 2.2 130 5600 2330 15.9 3085
Suzuki        Swift           8.6 39 43 1.3 70 6000 3360 10.6 1965
Toyota        Tercel          9.8 32 37 1.5 82 5200 3505 11.9 2055
Toyota        Celica          18.4 25 32 2.2 135 5400 2405 15.9 2950
Toyota        Camry           18.2 22 29 2.2 130 5400 2340 18.5 3030
Toyota        Previa          22.7 18 22 2.4 138 5000 2515 19.8 3785
Volkswagen    Fox             9.1 25 33 1.8 81 5500 2550 12.4 2240
Volkswagen    Eurovan         19.7 17 21 2.5 109 4500 2915 21.1 3960
Volkswagen    Passat          20 21 30 2 134 5800 2685 18.5 2985
Volkswagen    Corrado         23.3 18 25 2.8 178 5800 2385 18.5 2810
Volvo         240             22.7 21 28 2.3 114 5400 2215 15.8 2985
Volvo         850             26.7 20 28 2.4 168 6200 2310 19.3 3245
;
run;

data statdata.sales_inc;
    set statdata.sales;
    if Income='Low' then IncLevel=1;
    else If Income='Medium' then IncLevel=2;
    else If Income='High' then IncLevel=3;
run;

data statdata.ameshousing3;
   attrib PID length=$10 format=$CHAR10. informat=$CHAR10.;
   attrib Lot_Area length=8 label='Lot size in square feet' format=BEST12. informat=BEST12.;
   attrib House_Style length=$6 label='Style of dwelling' format=$CHAR6. informat=$CHAR6.;
   attrib Overall_Qual length=8 label='Overall material and finish of the house' format=BEST12. informat=BEST12.;
   attrib Overall_Cond length=8 label='Overall condition of the house' format=BEST12. informat=BEST12.;
   attrib Year_Built length=8 label='Original construction year' format=BEST12. informat=BEST12.;
   attrib Heating_QC length=$2 label='Heating quality and condition' format=$CHAR2. informat=$CHAR2.;
   attrib Central_Air length=$1 label='Presence of central air conditioning' format=$CHAR1. informat=$CHAR1.;
   attrib Gr_Liv_Area length=8 label='Above grade (ground) living area square feet' format=BEST12. informat=BEST12.;
   attrib Bedroom_AbvGr length=8 label='Bedrooms above grade' format=BEST12. informat=BEST12.;
   attrib Fireplaces length=8 label='Number of fireplaces' format=BEST12. informat=BEST12.;
   attrib Garage_Area length=8 label='Size of garage in square feet' format=BEST12. informat=BEST12.;
   attrib Mo_Sold length=8 label='Month Sold (MM)' format=BEST12. informat=BEST12.;
   attrib Yr_Sold length=8 label='Year Sold (YYYY)' format=BEST12. informat=BEST12.;
   attrib SalePrice length=8 label='Sale price in dollars' format=BEST12. informat=BEST12.;
   attrib Basement_Area length=8 label='Basement area in square feet' format=BEST12. informat=BEST12.;
   attrib Full_Bathroom length=8 label='Number of full bathrooms' format=BEST12. informat=BEST12.;
   attrib Half_Bathroom length=8 label='Number of half bathrooms' format=BEST12. informat=BEST12.;
   attrib Total_Bathroom length=8 label='Total number of bathrooms (half bathrooms counted 10%)' format=BEST12. informat=BEST12.;
   attrib Deck_Porch_Area length=8 label='Total area of decks and porches in square feet' format=BEST12. informat=BEST12.;
   attrib Age_Sold length=8 label='Age of house when sold, in years' format=BEST12. informat=BEST12.;
   attrib Season_Sold length=8 label='Season when house sold' format=BEST12. informat=BEST12.;
   attrib Garage_Type_2 length=$8 label='Garage attached or detached' format=$CHAR8. informat=$CHAR8.;
   attrib Foundation_2 length=$16 label='Foundation Type' format=$CHAR16. informat=$CHAR16.;
   attrib Masonry_Veneer length=$1 label='Masonry veneer or not' format=$CHAR1. informat=$CHAR1.;
   attrib Lot_Shape_2 length=$10 label='Regular or irregular lot shape' format=$CHAR10. informat=$CHAR10.;
   attrib House_Style2 length=$6 label='Style of dwelling' format=$CHAR6. informat=$CHAR6.;
   attrib Overall_Qual2 length=8 label='Overall material and finish of the house' format=BEST12. informat=BEST12.;
   attrib Overall_Cond2 length=8 label='Overall condition of the house' format=BEST12. informat=BEST12.;
   attrib Log_Price length=8 label='Natural log of the sale price' format=BEST12. informat=BEST12.;
   attrib Bonus length=8 label='Sale Price > $175,000' format=BEST12. informat=BEST12.;
   attrib score length=8;

   infile datalines dsd;
   input
      PID:$10.
      Lot_Area:BEST32.
      House_Style:$6.
      Overall_Qual:BEST32.
      Overall_Cond:BEST32.
      Year_Built:BEST32.
      Heating_QC:$2.
      Central_Air:$1.
      Gr_Liv_Area:BEST32.
      Bedroom_AbvGr:BEST32.
      Fireplaces:BEST32.
      Garage_Area:BEST32.
      Mo_Sold:BEST32.
      Yr_Sold:BEST32.
      SalePrice:BEST32.
      Basement_Area:BEST32.
      Full_Bathroom:BEST32.
      Half_Bathroom:BEST32.
      Total_Bathroom:BEST32.
      Deck_Porch_Area:BEST32.
      Age_Sold:BEST32.
      Season_Sold:BEST32.
      Garage_Type_2:$8.
      Foundation_2:$16.
      Masonry_Veneer:$1.
      Lot_Shape_2:$10.
      House_Style2:$6.
      Overall_Qual2:BEST32.
      Overall_Cond2:BEST32.
      Log_Price:BEST32.
      Bonus:BEST32.
      score
   ;
datalines4;
0527127150,4920,1Story,8,5,2001,Ex,Y,1338,2,0,582,4,2010,213500,1338,3,0,3,0,9,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.2713921116508,1,
0527145080,5005,1Story,8,5,1992,Ex,Y,1280,2,0,506,1,2010,191500,1280,2,0,2,226,18,1,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1626430876028,1,
0527425090,10500,1Story,4,5,1971,TA,Y,864,3,1,0,4,2010,115000,864,1,0,1,0,39,2,NA,Cinder Block,N,Regular,1Story,4,5,11.6526874073453,0,
0528228285,3203,1Story,7,5,2006,Ex,Y,1145,2,0,437,1,2010,160000,1145,2,0,2,216,4,1,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.9829290942159,0,
0528250100,7750,SLvl,7,5,2000,Ex,Y,1430,3,1,400,4,2010,180000,384,2,1,2.1,180,10,2,Attached,Concrete/Slab,N,Irregular,SLvl,6,5,12.1007121298723,1,
0531452050,7175,1Story,6,5,1984,TA,Y,752,2,0,264,2,2010,125000,744,2,0,2,443,26,1,Attached,Cinder Block,N,Regular,1Story,6,5,11.7360690162844,0,
0533253210,3880,1Story,8,6,1978,TA,Y,1226,1,1,484,1,2010,206000,1226,2,0,2,301,32,1,Attached,Cinder Block,N,Irregular,1Story,6,6,12.2356314477717,1,
0534401110,9900,1Story,5,5,1966,Gd,Y,1209,3,0,504,4,2010,159000,1209,2,0,2,0,44,2,Attached,Concrete/Slab,N,Regular,1Story,5,5,11.9766594812023,0,
0534403410,14112,SLvl,5,7,1964,TA,Y,1152,3,1,484,4,2010,180500,1152,2,0,2,227,46,2,Attached,Concrete/Slab,Y,Irregular,SLvl,5,6,12.103486056755,1,
0534430080,9717,1Story,5,6,1950,Gd,Y,1078,2,0,240,4,2010,142125,1078,2,0,2,366,60,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.8644622310528,0,
0534475100,9920,1Story,5,5,1954,TA,Y,1063,3,0,280,2,2010,128000,1056,2,0,2,0,56,1,Attached,Cinder Block,Y,Regular,1Story,5,5,11.7597855429017,0,
0534479320,7800,1Story,5,6,1954,Gd,Y,1268,2,1,244,3,2010,132000,1268,1,0,1,98,56,2,Attached,Concrete/Slab,Y,Regular,1Story,5,6,11.7905572015685,0,
0535101020,11380,SFoyer,6,8,1966,Gd,Y,1128,2,1,315,1,2010,178000,1080,2,0,2,238,44,1,Attached,Cinder Block,Y,Irregular,SFoyer,6,6,12.0895388292742,1,
0535302080,10950,1Story,5,7,1952,TA,Y,1064,2,0,318,5,2010,135000,864,1,1,1.1,0,58,2,Detached,Cinder Block,N,Regular,1Story,5,6,11.8130300574205,0,
0535453070,7500,1Story,5,7,1959,Ex,Y,1246,3,0,305,5,2010,154000,1246,2,1,2.1,218,51,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.9447078813957,0,
0535456110,7200,1Story,5,7,1951,TA,Y,900,3,0,576,5,2010,134800,900,1,1,1.1,254,59,2,Detached,Cinder Block,N,Regular,1Story,5,6,11.8115474774603,0,
0535476350,9760,1Story,6,7,1963,TA,Y,1395,2,1,440,5,2010,192000,1395,2,0,2,897,47,2,Attached,Cinder Block,Y,Regular,1Story,6,6,12.1652506510099,1,
0902125160,4608,1Story,4,6,1945,TA,Y,747,2,0,220,6,2010,80000,747,1,0,1,0,65,3,Attached,Cinder Block,N,Regular,1Story,4,6,11.289781913656,0,
0902206130,6900,1.5Fin,6,7,1938,Gd,Y,1251,3,0,240,1,2010,119000,827,1,0,1,0,72,1,Detached,Concrete/Slab,N,Regular,1.5Fin,6,6,11.6868787720936,0,
0903232190,6240,1.5Fin,5,7,1936,Gd,Y,1040,2,0,624,5,2010,123900,528,1,0,1,306,74,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.7272300676172,0,
0904302260,9900,1.5Fin,5,4,1915,TA,N,1392,3,0,0,2,2010,100000,1212,2,0,2,0,95,1,NA,Brick/Tile/Stone,N,Regular,1.5Fin,5,4,11.5129254649702,0,
0905101100,6342,1.5Fin,5,8,1875,Gd,N,1020,2,0,0,5,2010,94000,780,1,0,1,0,135,2,NA,Cinder Block,N,Regular,1.5Fin,5,6,11.4510500612521,0,
0905105200,7800,1Story,5,7,1966,Ex,Y,892,3,0,416,6,2010,137900,864,2,0,2,0,44,3,Detached,Cinder Block,Y,Regular,1Story,5,6,11.8342840637813,0,
0905106140,9364,2Story,6,7,1969,TA,Y,1352,4,0,299,3,2010,158000,663,1,1,1.1,415,41,2,Attached,Cinder Block,Y,Regular,2Story,6,6,11.9703503120091,0,
0905107110,7424,SFoyer,5,5,1978,TA,Y,1373,3,2,591,5,2010,160250,1319,2,0,2,0,32,2,Attached,Cinder Block,N,Irregular,SFoyer,5,5,11.9844903747829,0,
0905453040,10420,1Story,6,5,2009,Ex,Y,1212,3,0,460,3,2010,186000,1212,2,0,2,122,1,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.1335019526953,1,
0905475510,11200,1Story,5,3,1964,Ex,Y,1298,3,0,504,6,2010,114000,1250,2,0,2,144,46,3,Detached,Cinder Block,N,Irregular,1Story,5,4,11.6439537273766,0,
0906477110,8816,SLvl,6,7,1971,Gd,Y,1052,3,0,440,6,2010,155000,1010,2,0,2,0,39,3,Attached,Cinder Block,Y,Regular,SLvl,6,6,11.9511803959013,0,
0907125090,11105,SFoyer,5,5,1996,Gd,Y,965,2,0,580,7,2010,159000,870,2,0,2,71,14,3,Attached,Concrete/Slab,N,Regular,SFoyer,5,5,11.9766594812023,0,
0907290170,4435,1Story,6,5,2003,Ex,Y,848,1,0,420,4,2010,143750,848,2,0,2,140,7,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.8758309586595,0,
0907290240,4426,1Story,6,5,2004,Ex,Y,848,1,0,420,5,2010,143000,848,2,0,2,160,6,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.870599909242,0,
0907410080,8400,1Story,7,5,2004,Ex,Y,1484,3,0,606,5,2010,213000,1473,3,0,3,179,6,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2690474446915,1,
0908102060,8777,1Story,3,6,1945,TA,N,640,2,0,240,4,2010,84900,0,1,0,1,0,65,2,Detached,Cinder Block,N,Regular,1Story,4,6,11.3492293722994,0,
0909176150,7890,1Story,6,6,1939,TA,Y,856,2,1,399,3,2010,126000,856,2,0,2,166,71,2,Detached,Cinder Block,N,Regular,1Story,6,6,11.7440371859336,0,
0914475090,9620,SLvl,6,7,1977,TA,Y,1285,3,1,473,5,2010,190000,1243,2,1,2.1,401,33,2,Attached,Cinder Block,N,Regular,SLvl,6,6,12.1547793511426,1,
0923202105,10114,1Story,5,5,2004,Ex,Y,1430,3,0,624,3,2010,173500,1430,2,0,2,0,6,2,Attached,Concrete/Slab,N,Regular,1Story,5,5,12.063932878369,0,
0923225390,2394,1Story,5,6,1973,Ex,Y,945,2,1,253,5,2010,119500,945,2,1,2.1,282,37,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.6910716503537,0,
0923251080,26142,1Story,5,7,1962,TA,Y,1188,3,0,312,4,2010,157900,1188,1,0,1,300,48,2,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.9697172002437,0,
0526351100,10200,1Story,6,5,1974,TA,Y,1434,4,1,528,6,2009,157000,1434,3,0,3,101,35,3,Attached,Cinder Block,Y,Regular,1Story,6,5,11.9640010843304,0,
0527110020,8530,SLvl,7,5,1995,Gd,Y,1474,3,1,400,5,2009,168500,384,2,1,2.1,192,14,2,Attached,Concrete/Slab,Y,Irregular,SLvl,6,5,12.0346910287745,0,
0527164090,8125,2Story,6,5,1994,Gd,Y,1481,3,1,343,3,2009,174000,702,2,1,2.1,36,15,2,Attached,Concrete/Slab,N,Regular,2Story,6,5,12.0668105781966,0,
0527375210,11050,1Story,7,5,1975,Fa,Y,1193,3,1,506,8,2009,158000,1176,2,0,2,40,34,3,Attached,Cinder Block,N,Irregular,1Story,6,5,11.9703503120091,0,
0527376100,10140,1Story,6,5,1974,TA,Y,1350,3,1,478,8,2009,165000,1064,2,0,2,0,35,3,Attached,Cinder Block,Y,Regular,1Story,6,5,12.0137007528827,0,
0527402220,8750,1Story,5,6,1970,TA,Y,1002,3,0,902,8,2009,148500,1002,2,0,2,0,39,3,Detached,Cinder Block,Y,Irregular,1Story,5,6,11.9083402372248,0,
0527403040,7930,1Story,6,8,1969,Gd,Y,1026,3,0,440,7,2009,156000,1026,2,0,2,219,40,3,Detached,Cinder Block,N,Regular,1Story,6,6,11.9576112862316,0,
0527405180,8120,1Story,4,7,1970,Ex,Y,864,3,0,463,7,2009,124500,864,1,0,1,0,39,3,Detached,Cinder Block,N,Regular,1Story,4,6,11.7320609948869,0,
0527451540,1680,2Story,6,6,1972,TA,Y,987,2,0,288,7,2009,97000,483,2,1,2.1,0,37,3,Detached,Cinder Block,Y,Regular,2Story,6,6,11.4824662574855,0,
0527455080,2364,2Story,6,5,1978,TA,Y,1456,3,1,440,4,2009,138000,855,2,1,2.1,147,31,2,Attached,Cinder Block,N,Regular,2Story,6,5,11.8350089641393,0,
0528175050,10307,1Story,7,5,2007,Ex,Y,1358,2,1,484,5,2009,212500,1350,3,0,3,218,2,2,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.2666972673466,1,
0528221060,12589,2Story,6,5,2005,Ex,Y,1484,3,1,390,6,2009,174000,742,2,1,2.1,60,4,3,Attached,Concrete/Slab,N,Irregular,2Story,6,5,12.0668105781966,0,
0528253010,5063,1Story,7,5,2007,Ex,Y,1314,2,1,626,4,2009,207500,1314,3,0,3,234,2,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2428866186528,1,
0528290030,9734,SLvl,7,5,2004,Ex,Y,1374,3,0,400,5,2009,167000,384,2,1,2.1,0,5,2,Attached,Concrete/Slab,N,Irregular,SLvl,6,5,12.0257490913988,0,
0528294050,7848,SLvl,7,6,1999,Ex,Y,1430,3,1,410,6,2009,168000,384,2,1,2.1,0,10,3,Attached,Concrete/Slab,N,Irregular,SLvl,6,6,12.0317192583853,0,
0528439060,9139,1Story,8,5,2006,Ex,Y,1432,3,1,492,9,2009,245000,1422,2,0,2,347,3,4,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.4090134895268,1,
0531375090,13072,1Story,5,5,2004,Ex,Y,1114,3,0,0,8,2009,142000,1114,1,1,1.1,39,5,3,NA,Concrete/Slab,N,Regular,1Story,5,5,11.8635823365834,0,
0531375130,12450,1Story,5,5,2003,Ex,Y,1114,3,0,576,6,2009,153000,1114,3,0,3,42,6,3,Detached,Concrete/Slab,N,Regular,1Story,5,5,11.9381932003745,0,
0531385020,8529,1Story,7,5,2001,Ex,Y,1434,3,1,527,4,2009,189000,1454,2,0,2,329,8,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1495022940417,1,
0531452070,7175,1Story,6,5,1990,Gd,Y,1332,2,0,542,2,2009,145000,1332,2,0,2,60,19,1,Attached,Concrete/Slab,N,Regular,1Story,6,5,11.8844890214027,0,
0534128100,12936,2Story,6,6,1972,TA,Y,1395,3,1,497,12,2009,162000,723,1,2,1.2,410,37,1,Attached,Cinder Block,N,Irregular,2Story,6,6,11.9953516142145,0,
0534252240,9790,1Story,6,5,1967,TA,Y,1342,3,1,457,9,2009,161500,1372,2,0,2,197,42,4,Attached,Cinder Block,N,Regular,1Story,6,5,11.9922604216448,0,
0534402140,11000,1Story,5,6,1966,Ex,Y,1154,3,1,480,11,2009,154000,1154,1,1,1.1,58,43,4,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.9447078813957,0,
0534431130,9768,1Story,5,5,1955,Gd,Y,960,2,0,330,2,2009,122000,960,2,0,2,70,54,1,Attached,Cinder Block,N,Regular,1Story,5,5,11.7117763237153,0,
0534450150,5330,1Story,4,7,1940,Gd,Y,708,2,0,0,12,2009,82500,420,1,0,1,164,69,1,NA,Cinder Block,N,Regular,1Story,4,6,11.3205535723227,0,
0534451110,7015,1.5Fin,5,4,1950,TA,Y,1203,3,1,352,7,2009,110000,709,2,0,2,0,59,3,Detached,Cinder Block,Y,Irregular,1.5Fin,5,4,11.6082356447745,0,
0535105100,9500,1Story,6,5,1963,Gd,Y,1394,3,2,514,7,2009,159000,1394,2,1,2.1,261,46,3,Attached,Cinder Block,Y,Irregular,1Story,6,5,11.9766594812023,0,
0535175050,12400,1Story,6,7,1958,TA,Y,1215,3,0,297,6,2009,155000,1215,1,0,1,234,51,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,11.9511803959013,0,
0535352090,8480,1Story,5,6,1945,TA,Y,793,2,0,240,8,2009,113000,793,2,0,2,0,64,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.6351430976944,0,
0535353060,9533,1Story,5,5,1953,TA,Y,1210,2,0,616,8,2009,102900,0,1,1,1.1,208,56,3,Attached,Concrete/Slab,Y,Regular,1Story,5,5,11.5415129218221,0,
0535375010,5470,1Story,3,5,1958,Gd,Y,792,2,0,366,8,2009,99900,792,1,0,1,90,51,3,Attached,Cinder Block,N,Regular,1Story,4,5,11.5119249646366,0,
0535383060,5400,1Story,2,5,1940,Gd,N,599,2,0,0,6,2009,59000,416,2,0,2,81,69,3,NA,Concrete/Slab,N,Regular,1Story,4,5,10.9852927228878,0,
0535383110,10800,1Story,5,7,1920,TA,N,846,2,0,576,6,2009,106000,720,1,0,1,0,89,3,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.5711943730942,0,
0535402090,10143,1Story,6,7,1963,Fa,Y,1380,3,0,364,6,2009,154000,1380,1,1,1.1,216,46,3,Attached,Cinder Block,Y,Regular,1Story,6,6,11.9447078813957,0,
0535403190,8010,1Story,6,9,1958,Gd,Y,951,2,0,480,9,2009,143500,951,2,0,2,0,51,4,Detached,Cinder Block,N,Regular,1Story,6,6,11.8740903141818,0,
0535452090,7350,1Story,5,6,1958,Gd,Y,1041,3,0,294,3,2009,128000,1041,1,0,1,0,51,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.7597855429017,0,
0535476110,8604,SFoyer,5,7,1978,Gd,Y,941,2,0,564,11,2009,145000,941,2,0,2,40,31,4,Attached,Cinder Block,Y,Irregular,SFoyer,5,6,11.8844890214027,0,
0902105060,9900,2Story,5,8,1910,Ex,Y,1464,3,0,0,3,2009,129000,504,2,0,2,0,99,2,NA,Cinder Block,N,Regular,2Story,5,6,11.7675676833438,0,
0902205010,5925,1Story,2,4,1940,Fa,N,612,1,0,308,10,2009,45000,0,1,0,1,0,69,4,Detached,Brick/Tile/Stone,N,Regular,1Story,4,4,10.7144177687524,0,
0902206260,5784,1Story,5,8,1938,Gd,Y,886,2,0,273,12,2009,91300,190,1,0,1,164,71,1,Attached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.421906066583,0,
0902207170,8520,1Story,5,8,1923,TA,Y,792,2,0,287,2,2009,99500,624,1,0,1,0,86,1,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.5079129231466,0,
0902329080,3600,2Story,6,7,1917,Ex,Y,1288,3,1,280,5,2009,119000,624,2,0,2,103,92,2,Attached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.6868787720936,0,
0903201020,6615,1Story,6,6,1923,TA,N,1432,3,1,216,9,2009,149000,1022,1,0,1,327,86,4,Attached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.9117015849275,0,
0903205040,8854,1.5Unf,6,6,1916,Fa,N,952,2,1,192,5,2009,121000,952,1,0,1,138,93,2,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.7035458245788,0,
0903231060,6120,1Story,2,3,1936,Fa,N,800,1,1,0,1,2009,60000,264,1,0,1,0,73,1,NA,Brick/Tile/Stone,N,Regular,1Story,4,4,11.0020998412042,0,
0904351200,6629,2Story,6,6,1925,TA,N,1369,3,0,300,7,2009,103600,672,3,0,3,147,84,3,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.5482926088075,0,
0905107310,8014,SFoyer,6,5,1978,TA,Y,1034,3,1,504,6,2009,149900,456,1,1,1.1,0,31,3,Attached,Cinder Block,Y,Irregular,SFoyer,6,5,11.9177236840906,0,
0905451300,9571,1Story,5,5,1956,TA,Y,1073,2,0,340,2,2009,121500,1073,2,0,2,0,53,1,Attached,Cinder Block,N,Regular,1Story,5,5,11.7076695417627,0,
0905475160,7440,1Story,5,6,1954,TA,Y,1089,3,1,252,9,2009,125000,1089,2,0,2,328,55,4,Detached,Cinder Block,N,Regular,1Story,5,6,11.7360690162844,0,
0905475500,11500,1Story,4,3,1957,Ex,N,845,3,0,290,1,2009,84000,0,1,0,1,186,52,1,Detached,Concrete/Slab,N,Irregular,1Story,4,4,11.3385720778254,0,
0905480030,9060,1.5Fin,6,5,1939,TA,Y,1258,2,0,280,10,2009,105000,560,1,0,1,0,70,4,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,5,11.5617156291396,0,
0907181100,9017,1Story,7,5,1999,Ex,Y,1431,3,0,666,9,2009,192000,1431,3,0,3,35,10,4,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1652506510099,1,
0907194110,16285,1Story,7,5,2001,Ex,Y,1430,3,0,605,6,2009,187100,1413,2,0,2,33,8,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1393985122621,1,
0907194160,10739,1Story,7,5,2002,Ex,Y,1444,3,0,577,4,2009,203000,1431,3,0,3,184,7,2,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.2209612580239,1,
0907290180,4435,1Story,6,5,2003,Ex,Y,848,1,0,420,6,2009,144000,848,2,0,2,140,6,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.8775685785581,0,
0908102050,8777,1Story,4,5,1949,Ex,Y,1126,2,0,520,5,2009,108000,0,2,0,2,96,60,2,Detached,Cinder Block,N,Regular,1Story,4,5,11.5898865061063,0,
0908102270,9937,1Story,5,7,1964,Ex,Y,1486,3,0,480,3,2009,167000,1486,2,0,2,0,45,2,Detached,Concrete/Slab,N,Regular,1Story,5,6,12.0257490913988,0,
0908186080,3675,SFoyer,6,5,2005,Gd,Y,1072,2,0,525,4,2009,145500,547,2,0,2,28,4,2,Attached,Concrete/Slab,Y,Regular,SFoyer,6,5,11.8879313655936,0,
0908250030,10206,1Story,3,3,1952,Fa,N,944,2,0,528,7,2009,82000,0,1,0,1,0,57,3,Detached,Concrete/Slab,N,Regular,1Story,4,4,11.3144745262463,0,
0909101010,12354,1.5Fin,6,8,1920,Gd,Y,1196,3,0,528,8,2009,110000,684,1,0,1,46,89,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.6082356447745,0,
0909101100,8212,1.5Fin,5,6,1941,Ex,Y,1298,3,2,256,9,2009,122000,720,1,0,1,84,68,4,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.7117763237153,0,
0909175080,8400,1Story,2,5,1920,TA,N,438,1,0,246,1,2009,60000,290,1,0,1,0,89,1,Detached,Cinder Block,N,Regular,1Story,4,5,11.0020998412042,0,
0909251050,8574,1Story,6,8,1916,Ex,Y,1232,3,1,440,10,2009,147500,816,1,0,1,0,93,4,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.901583454762,0,
0909254010,7155,2Story,7,8,1918,Ex,Y,1228,3,1,215,5,2009,137000,600,1,0,1,308,91,2,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.8277362048102,0,
0909451040,1733,2Story,6,6,1980,TA,Y,1032,2,1,452,5,2009,115000,516,1,0,1,279,29,2,Detached,Cinder Block,N,Regular,2Story,6,6,11.6526874073453,0,
0916386140,8925,1Story,8,5,2007,Ex,Y,1466,3,0,610,7,2009,201000,1466,2,0,2,118,2,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.2110601870412,1,
0916403250,14419,SLvl,7,5,1987,Ex,Y,1479,3,1,578,7,2009,213500,1645,4,1,4.1,462,22,3,Attached,Concrete/Slab,Y,Irregular,SLvl,6,5,12.2713921116508,1,
0916455070,6853,1Story,8,5,2001,Ex,Y,1296,2,0,471,6,2009,220000,1267,3,0,3,217,8,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.3013828253345,1,
0923203190,4500,1Story,6,5,1999,Ex,Y,1224,2,0,402,6,2009,165000,1224,3,0,3,304,10,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.0137007528827,0,
0923225490,9858,1Story,5,6,1968,TA,Y,874,3,0,288,11,2009,130000,864,2,0,2,33,41,4,Attached,Cinder Block,N,Regular,1Story,5,6,11.7752897294377,0,
0923227080,13383,1Story,5,5,1969,Ex,Y,1404,3,1,504,3,2009,160000,1188,2,0,2,16,40,2,Attached,Cinder Block,Y,Irregular,1Story,5,5,11.9829290942159,0,
0923228150,1533,2Story,4,6,1970,TA,Y,1344,3,1,0,5,2009,97000,546,1,1,1.1,0,39,2,NA,Cinder Block,N,Regular,2Story,4,6,11.4824662574855,0,
0923275140,8780,1Story,5,5,1985,Ex,Y,833,3,0,0,3,2009,112000,833,2,0,2,0,24,2,NA,Cinder Block,N,Irregular,1Story,5,5,11.6262541502772,0,
0527140090,5395,1Story,8,5,1993,Gd,Y,1337,2,1,462,10,2008,180000,1337,3,0,3,264,15,4,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1007121298723,1,
0527302070,10825,1Story,7,7,1983,TA,Y,1260,3,0,598,7,2008,181900,1260,3,0,3,152,25,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,12.1112123645062,1,
0527425035,12735,1Story,4,5,1972,TA,Y,864,3,0,576,4,2008,111250,864,1,0,1,216,36,2,Detached,Cinder Block,N,Irregular,1Story,4,5,11.6195352000284,0,
0527451400,1680,2Story,6,3,1971,TA,Y,987,2,0,264,8,2008,89500,483,1,1,1.1,0,37,3,Detached,Cinder Block,Y,Regular,2Story,6,4,11.4019939042629,0,
0528190010,8198,1Story,7,5,2004,Ex,Y,1358,2,1,484,7,2008,207000,1358,3,0,3,222,4,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2404740722475,1,
0528240040,8029,2Story,6,5,2005,Ex,Y,1456,3,0,400,7,2008,176000,728,2,1,2.1,124,3,3,Attached,Concrete/Slab,N,Irregular,2Story,6,5,12.0782392740202,1,
0531363060,7500,1Story,7,5,2004,Ex,Y,1080,3,0,0,4,2008,141000,1080,2,0,2,0,4,2,NA,Concrete/Slab,Y,Regular,1Story,6,5,11.8565151693603,0,
0531375050,13072,1Story,6,5,2005,Ex,Y,1175,3,0,0,6,2008,146000,1175,2,0,2,90,3,3,NA,Concrete/Slab,Y,Regular,1Story,6,5,11.8913619006904,0,
0532477030,19508,1Story,6,5,1974,TA,Y,1430,3,2,484,7,2008,192000,1430,2,1,2.1,225,34,3,Attached,Cinder Block,Y,Regular,1Story,6,5,12.1652506510099,1,
0533206050,4282,1Story,7,5,2004,Ex,Y,1391,2,0,530,7,2008,196000,1391,2,0,2,314,4,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1858699382126,1,
0533208080,4017,2Story,7,5,2006,Ex,Y,1250,2,0,625,3,2008,171900,625,2,1,2.1,54,2,2,Detached,Concrete/Slab,N,Irregular,2Story,6,5,12.0546681913709,0,
0533215040,4385,1Story,9,5,2001,Ex,Y,1419,2,1,588,9,2008,290000,1419,2,1,2.1,213,7,4,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.5776362019626,1,
0533217050,2160,2Story,7,5,1999,Ex,Y,1252,2,0,462,3,2008,160000,600,3,1,3.1,48,9,2,Detached,Concrete/Slab,Y,Regular,2Story,6,5,11.9829290942159,0,
0534204030,8125,1Story,5,7,1965,Ex,Y,925,3,0,576,7,2008,135000,912,2,0,2,233,43,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.8130300574205,0,
0534252090,12122,SFoyer,7,9,1961,Gd,Y,999,3,0,588,7,2008,178400,944,2,0,2,220,47,3,Attached,Cinder Block,Y,Irregular,SFoyer,6,6,12.091783499128,1,
0534426040,10007,1Story,5,7,1959,Ex,Y,1053,3,0,312,8,2008,145500,1053,2,1,2.1,0,49,3,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.8879313655936,0,
0534428020,12493,1Story,4,5,1960,TA,Y,1100,3,1,312,4,2008,141000,1100,2,0,2,355,48,2,Attached,Concrete/Slab,N,Irregular,1Story,4,5,11.8565151693603,0,
0534451080,6627,1Story,3,6,1949,TA,N,720,2,0,287,7,2008,72500,0,1,0,1,0,59,3,Detached,Cinder Block,N,Irregular,1Story,4,6,11.1913418408427,0,
0534451170,4130,1Story,3,6,1935,Gd,Y,729,2,0,0,7,2008,52000,270,1,0,1,0,73,3,NA,Cinder Block,N,Irregular,1Story,4,6,10.8589989975635,0,
0534453140,4882,2Story,4,7,1937,TA,Y,906,2,0,231,9,2008,87000,348,1,0,1,0,71,4,Attached,Concrete/Slab,N,Irregular,2Story,4,6,11.3736633976367,0,
0535105090,9150,SLvl,6,5,1962,Gd,Y,1431,3,1,296,12,2008,165000,1099,1,1,1.1,174,46,1,Attached,Cinder Block,Y,Irregular,SLvl,6,5,12.0137007528827,0,
0535150280,9204,1Story,5,5,1963,TA,Y,1144,3,0,336,8,2008,124000,1144,2,1,2.1,88,45,3,Detached,Cinder Block,N,Regular,1Story,5,5,11.7280368445871,0,
0535151160,7763,1Story,5,7,1962,TA,Y,1283,3,0,506,10,2008,140000,931,2,0,2,0,46,4,Detached,Cinder Block,N,Regular,1Story,5,6,11.8493977015914,0,
0535153140,9840,1Story,5,7,1959,TA,Y,1440,2,0,480,6,2008,185000,1248,3,0,3,406,49,3,Attached,Cinder Block,N,Regular,1Story,5,6,12.1281111040604,1,
0535302140,12774,1Story,5,5,1953,TA,N,950,2,0,400,7,2008,130000,984,1,0,1,32,55,3,Detached,Concrete/Slab,N,Regular,1Story,5,5,11.7752897294377,0,
0535375140,10122,1Story,4,6,1948,TA,N,869,1,0,390,8,2008,89900,0,1,0,1,0,60,3,Detached,Concrete/Slab,N,Regular,1Story,4,6,11.4064532204597,0,
0535426350,12929,1Story,6,6,1960,TA,Y,1081,3,0,401,6,2008,148000,1081,2,0,2,118,48,3,,Cinder Block,Y,Irregular,1Story,6,6,11.9049675527462,0,
0535453040,8000,1Story,5,5,1962,TA,Y,1027,3,0,299,11,2008,125900,1027,1,1,1.1,0,46,4,Attached,Cinder Block,N,Regular,1Story,5,5,11.7432432200324,0,
0535453210,7931,1Story,5,6,1960,TA,Y,1269,3,1,308,6,2008,155000,1269,1,1,1.1,0,48,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.9511803959013,0,
0535455090,7200,1.5Fin,6,5,1954,Fa,Y,1278,4,0,240,4,2008,127500,854,1,0,1,0,54,2,Attached,Cinder Block,N,Regular,1.5Fin,6,5,11.7558716435806,0,
0902328040,6300,2.5Unf,6,6,1914,Ex,Y,1484,3,1,0,6,2008,128000,742,2,0,2,291,94,3,NA,Cinder Block,N,Regular,2Story,6,6,11.7597855429017,0,
0903232030,6120,1Story,5,6,1945,Gd,N,808,1,0,164,6,2008,81300,0,1,0,1,48,63,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.3059012955359,0,
0903235010,6155,2Story,6,8,1920,Ex,Y,1362,3,0,502,6,2008,128000,611,2,0,2,0,88,3,Detached,Brick/Tile/Stone,N,Irregular,2Story,6,6,11.7597855429017,0,
0903235100,6324,1Story,4,6,1927,Fa,N,520,1,0,240,5,2008,68500,520,1,0,1,49,81,2,Detached,Brick/Tile/Stone,N,Irregular,1Story,4,6,11.1345890242503,0,
0903458110,7920,1.5Fin,6,7,1920,TA,Y,1406,3,0,0,3,2008,89500,319,1,0,1,144,88,2,NA,Cinder Block,N,Irregular,1.5Fin,6,6,11.4019939042629,0,
0903481100,10320,2Story,3,3,1915,Ex,N,1344,3,0,0,5,2008,82375,536,2,0,2,42,93,2,NA,Concrete/Slab,N,Regular,2Story,4,4,11.3190372718048,0,
0903484020,10320,1.5Fin,6,7,1906,Ex,Y,1469,3,0,216,6,2008,135000,756,1,0,1,57,102,3,Detached,Cinder Block,N,Regular,1.5Fin,6,6,11.8130300574205,0,
0904351280,10106,1.5Fin,5,7,1940,Gd,Y,1355,4,0,0,9,2008,127500,644,3,0,3,140,68,4,NA,Brick/Tile/Stone,N,Regular,1.5Fin,5,6,11.7558716435806,0,
0905102170,11200,1Story,5,5,1965,Ex,Y,1040,3,0,384,2,2008,129500,1040,2,0,2,0,43,1,Detached,Cinder Block,N,Regular,1Story,5,5,11.7714361601217,0,
0905202230,13500,1Story,6,7,1960,Gd,Y,1252,1,1,564,3,2008,235000,1602,2,0,2,409,48,2,Attached,Cinder Block,N,Regular,1Story,6,6,12.3673407931262,1,
0905402090,11512,SLvl,6,7,1959,Gd,Y,1357,2,1,312,5,2008,177000,1019,2,0,2,163,49,2,Attached,Cinder Block,Y,Irregular,SLvl,6,6,12.0839050115559,1,
0905403150,10452,1Story,6,5,1953,Ex,Y,1094,3,2,495,6,2008,155000,1094,1,0,1,287,55,3,Attached,Cinder Block,Y,Irregular,1Story,6,5,11.9511803959013,0,
0905452070,9350,SFoyer,5,5,1975,Fa,N,864,2,0,0,4,2008,99600,864,2,0,2,0,33,2,NA,Concrete/Slab,N,Regular,SFoyer,5,5,11.5089174435726,0,
0905476120,8405,1.5Fin,5,8,1900,Ex,Y,1367,4,0,384,4,2008,119000,861,2,0,2,130,108,2,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,5,6,11.6868787720936,0,
0905477050,7000,2Story,5,7,1910,TA,Y,1347,3,0,0,1,2008,107500,1117,2,0,2,85,98,1,NA,Cinder Block,N,Regular,2Story,5,6,11.5852461265498,0,
0905479110,10880,1Story,5,5,1950,TA,N,1164,3,0,240,8,2008,125000,1164,2,0,2,48,58,3,Detached,Cinder Block,N,Regular,1Story,5,5,11.7360690162844,0,
0905480150,9600,1.5Fin,6,5,1924,Fa,N,1096,2,0,0,4,2008,79000,572,1,0,1,8,84,2,NA,Brick/Tile/Stone,N,Regular,1.5Fin,6,5,11.2772031314491,0,
0907126030,9750,1Story,5,7,1994,Ex,Y,990,3,0,528,8,2008,155000,990,2,0,2,168,14,3,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.9511803959013,0,
0907203090,7990,1Story,5,6,1975,TA,Y,924,3,0,280,4,2008,110000,924,1,0,1,0,33,2,Detached,Cinder Block,N,Irregular,1Story,5,6,11.6082356447745,0,
0907425015,4426,1Story,6,5,2004,Ex,Y,848,1,1,420,5,2008,141000,848,2,0,2,149,4,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.8565151693603,0,
0908128050,10012,SFoyer,4,5,1972,TA,Y,1181,3,0,588,4,2008,137500,1138,3,0,3,0,36,2,Detached,Cinder Block,N,Regular,SFoyer,4,5,11.8313791960887,0,
0908225170,6931,1Story,4,5,1955,TA,N,784,2,0,0,5,2008,91900,784,2,0,2,112,53,2,NA,Cinder Block,N,Regular,1Story,4,5,11.4284563083437,0,
0908275130,11767,1.5Fin,5,6,1946,Ex,Y,1200,3,0,240,5,2008,130500,768,1,0,1,0,62,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.7791285057448,0,
0909131170,12155,2Story,6,8,1925,TA,N,1482,4,0,400,3,2008,140000,672,2,0,2,0,83,2,Detached,Brick/Tile/Stone,N,Irregular,2Story,6,6,11.8493977015914,0,
0909177120,7290,1Story,7,8,1921,Ex,Y,1424,2,1,312,4,2008,168000,1228,2,0,2,0,87,2,Attached,Brick/Tile/Stone,Y,Regular,1Story,6,6,12.0317192583853,0,
0909251080,8969,2Story,6,6,1926,Ex,Y,1316,2,1,369,7,2008,145000,644,2,0,2,192,82,3,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.8844890214027,0,
0909281030,7801,1Story,6,5,1951,Fa,N,1091,2,1,344,5,2008,104000,1091,1,1,1.1,392,57,2,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,11.5521461781235,0,
0910200080,7000,1Story,6,8,1926,TA,Y,919,2,0,195,7,2008,126000,894,2,0,2,0,82,3,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.7440371859336,0,
0914476010,10125,1Story,6,6,1977,TA,Y,1279,3,2,473,2,2008,171500,1196,2,1,2.1,321,31,1,Detached,Cinder Block,N,Regular,1Story,6,6,12.0523385455881,0,
0923203140,4500,1Story,6,5,1997,Ex,Y,1189,2,0,392,4,2008,160500,1189,3,0,3,122,11,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.9860492215522,0,
0923204040,14137,SFoyer,4,5,1964,Gd,Y,1200,3,0,850,11,2008,173000,1200,2,0,2,290,44,4,,Cinder Block,Y,Regular,SFoyer,4,5,12.0610468734799,0,
0923225370,1596,SLvl,4,6,1973,TA,Y,988,1,1,297,7,2008,94900,462,2,0,2,221,35,3,Attached,Cinder Block,N,Regular,SLvl,4,6,11.460578984598,0,
0527110130,8872,SLvl,6,5,1997,Gd,Y,1384,3,1,390,3,2007,161500,384,2,1,2.1,0,10,2,Attached,Concrete/Slab,N,Irregular,SLvl,6,5,11.9922604216448,0,
0527182040,3696,1Story,8,5,1986,Ex,Y,1088,2,0,461,10,2007,170000,1074,1,1,1.1,74,21,4,Attached,Cinder Block,N,Regular,1Story,6,5,12.0435537160324,0,
0527354050,10400,1Story,6,5,1979,Ex,Y,1353,2,1,478,8,2007,192350,1259,3,0,3,381,28,3,Attached,Cinder Block,Y,Regular,1Story,6,5,12.1670719081804,1,
0527450030,2205,2Story,6,6,1973,TA,Y,1092,3,0,264,2,2007,113500,525,1,1,1.1,144,34,1,Detached,Cinder Block,Y,Regular,2Story,6,6,11.6395581159035,0,
0528174040,6289,1Story,6,5,2005,Ex,Y,1362,2,1,460,6,2007,207000,1362,3,0,3,220,2,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.2404740722475,1,
0528250010,11950,SLvl,7,5,2003,Ex,Y,1394,3,1,400,10,2007,165500,384,2,1,2.1,100,4,4,Attached,Concrete/Slab,,Irregular,SLvl,6,5,12.0167264737992,0,
0528290060,7750,2Story,7,5,2003,Ex,Y,1320,3,0,400,8,2007,162000,660,2,1,2.1,48,4,3,Attached,Concrete/Slab,N,Regular,2Story,6,5,11.9953516142145,0,
0531385130,16196,1Story,7,5,1998,Ex,Y,1494,3,1,514,8,2007,215000,1482,3,0,3,427,9,3,Attached,Concrete/Slab,N,,1Story,6,5,12.2783933071098,1,
0532353120,6285,1Story,5,5,1977,TA,Y,894,2,0,308,3,2007,120750,894,2,0,2,192,30,2,Detached,Cinder Block,N,Regular,1Story,5,5,11.7014775715148,0,
0532377050,7476,1Story,5,7,1968,TA,Y,1040,3,0,686,6,2007,145000,1040,2,1,2.1,188,39,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.8844890214027,0,
0533252130,10768,1Story,5,8,1976,TA,Y,1437,3,1,528,7,2007,218000,1437,3,0,3,201,31,3,Attached,Cinder Block,N,Irregular,1Story,5,6,12.2922503417712,1,
0533253180,3840,1Story,8,6,1978,TA,Y,1295,1,2,571,7,2007,213750,1057,2,0,2,222,29,3,Attached,Cinder Block,N,Irregular,1Story,6,6,12.272562386799,1,
0534178010,10800,1Story,6,5,1963,TA,Y,1052,3,0,311,2,2007,127000,1052,2,0,2,133,44,1,Attached,Cinder Block,Y,Regular,1Story,6,5,11.7519423654407,0,
0534202030,10355,1Story,5,5,1967,TA,Y,1214,3,1,318,7,2007,143000,1214,2,0,2,111,40,3,Attached,Cinder Block,Y,Irregular,1Story,5,5,11.870599909242,0,
0534403040,9350,SLvl,6,7,1964,Ex,Y,1302,3,0,309,10,2007,158000,1302,2,1,2.1,333,43,4,Attached,Cinder Block,Y,Regular,SLvl,6,6,11.9703503120091,0,
0534430090,8280,1Story,6,5,1950,Ex,Y,932,2,1,306,11,2007,124000,932,1,0,1,0,57,4,Attached,Cinder Block,N,Irregular,1Story,6,5,11.7280368445871,0,
0534450090,5000,1Story,1,3,1946,Fa,N,334,1,0,0,1,2007,39300,0,1,0,1,0,61,1,NA,Concrete/Slab,N,Regular,1Story,4,4,10.5789797978573,0,
0534451020,3500,1.5Fin,3,5,1945,TA,N,670,2,0,0,7,2007,64000,370,2,0,2,21,62,3,NA,Cinder Block,N,Regular,1.5Fin,4,5,11.0666383623418,0,
0535106140,10150,1Story,5,5,1958,Ex,Y,912,2,0,275,7,2007,114500,912,1,0,1,0,49,3,Attached,Cinder Block,N,Regular,1Story,5,5,11.6483301019764,0,
0535155110,9250,1Story,5,7,1954,TA,Y,1056,3,0,260,7,2007,139400,1056,1,1,1.1,390,53,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.8451027773085,0,
0535179120,9770,1Story,5,5,1957,TA,Y,922,2,0,308,4,2007,116000,922,2,0,2,34,50,2,Attached,Cinder Block,N,Regular,1Story,5,5,11.6613454700885,0,
0535403030,8300,1Story,6,6,1968,Gd,Y,952,3,0,288,8,2007,128500,952,2,0,2,0,39,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,11.7636841833174,0,
0535451040,7200,1Story,5,7,1950,TA,Y,988,3,0,276,5,2007,119000,876,1,0,1,80,57,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.6868787720936,0,
0535457050,7000,1Story,5,6,1961,Gd,Y,925,3,0,300,7,2007,99000,0,1,0,1,0,46,3,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.5028751291167,0,
0535477180,6600,1Story,5,5,1962,Gd,Y,864,2,0,294,12,2007,125500,864,1,0,1,58,45,1,Detached,Cinder Block,N,Regular,1Story,5,5,11.7400610375539,0,
0902110010,3153,1Story,5,6,1920,Gd,Y,967,2,1,180,7,2007,99900,967,1,0,1,0,87,3,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.5119249646366,0,
0902128160,7200,1Story,5,8,1940,Ex,Y,1072,2,2,379,5,2007,130000,808,1,0,1,0,67,2,Detached,Cinder Block,Y,Regular,1Story,5,6,11.7752897294377,0,
0902205130,6000,1Story,4,4,1920,Gd,Y,960,2,0,308,7,2007,108500,960,1,0,1,0,87,3,Detached,Concrete/Slab,N,Regular,1Story,4,4,11.5945054519626,0,
0902207010,3880,1Story,5,9,1945,Gd,Y,866,2,0,0,8,2007,110500,686,1,0,1,100,62,3,NA,Cinder Block,N,Regular,1Story,5,6,11.6127707999399,0,
0902207150,8520,1Story,5,6,1923,TA,Y,968,2,0,480,7,2007,100000,968,1,0,1,0,84,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.5129254649702,0,
0902301030,9600,1.5Fin,5,8,1925,Gd,Y,1472,3,0,250,7,2007,125000,702,1,0,1,0,82,3,Detached,Concrete/Slab,N,Regular,1.5Fin,5,6,11.7360690162844,0,
0902301130,4571,2Story,5,7,1910,Ex,Y,1232,3,0,480,6,2007,114000,616,1,0,1,280,97,3,Detached,Brick/Tile/Stone,N,Regular,2Story,5,6,11.6439537273766,0,
0903204030,8674,1.5Fin,5,6,1950,TA,Y,1435,3,0,308,3,2007,128250,910,2,0,2,33,57,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.761736763033,0,
0903227140,6000,2Story,6,6,1939,Ex,Y,1232,3,2,217,2,2007,128000,600,1,1,1.1,0,68,1,Attached,Cinder Block,N,Regular,2Story,6,6,11.7597855429017,0,
0903228080,6000,1.5Fin,6,6,1941,Ex,Y,1218,3,1,440,3,2007,131000,735,1,1,1.1,0,66,2,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.7829526021832,0,
0903234160,6180,1Story,6,5,1926,TA,N,986,2,1,180,5,2007,102000,960,1,0,1,128,81,2,Detached,Brick/Tile/Stone,N,Regular,1Story,6,5,11.5327280922664,0,
0903426010,5700,2Story,7,6,1929,Gd,N,1344,3,1,456,9,2007,140000,672,2,1,2.1,0,78,4,Attached,Brick/Tile/Stone,N,Irregular,2Story,6,6,11.8493977015914,0,
0903451110,7449,1.5Unf,7,7,1930,Ex,Y,1108,3,1,280,6,2007,139400,637,1,0,1,0,77,3,Attached,Concrete/Slab,N,Regular,1Story,6,6,11.8451027773085,0,
0903458020,7200,2.5Unf,5,7,1920,TA,N,1111,3,0,288,3,2007,101000,530,1,0,1,0,87,2,Detached,Brick/Tile/Stone,N,Regular,2Story,5,6,11.5228757958233,0,
0903475040,12358,1.5Fin,5,6,1941,TA,Y,1382,2,0,660,5,2007,128500,720,1,1,1.1,237,66,2,Detached,Cinder Block,N,Irregular,1.5Fin,5,6,11.7636841833174,0,
0903476100,4388,1.5Unf,5,7,1930,Ex,Y,840,3,1,0,6,2007,87000,672,1,0,1,0,77,3,NA,Brick/Tile/Stone,N,Irregular,1Story,5,6,11.3736633976367,0,
0905101200,7943,1Story,4,5,1961,Gd,Y,1029,3,0,261,4,2007,118500,1029,2,0,2,64,46,2,Attached,Cinder Block,Y,Regular,1Story,4,5,11.6826682395573,0,
0905102010,14149,SLvl,5,8,1964,TA,Y,1020,3,1,528,5,2007,165000,980,2,1,2.1,0,43,2,Detached,Cinder Block,Y,Irregular,SLvl,5,6,12.0137007528827,0,
0905104240,8425,1Story,5,6,1971,Gd,Y,868,2,0,576,5,2007,119900,768,2,0,2,138,36,2,Detached,Cinder Block,N,Regular,1Story,5,6,11.6944133410156,0,
0905226050,25339,1Story,5,7,1918,Ex,Y,1416,3,0,576,8,2007,112000,816,2,0,2,0,89,3,Attached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.6262541502772,0,
0905475520,11515,1Story,4,5,1958,TA,N,943,3,0,308,8,2007,80000,0,1,0,1,0,49,3,Detached,Concrete/Slab,N,Irregular,1Story,4,5,11.289781913656,0,
0905478220,11100,1.5Fin,5,6,1951,TA,N,1480,4,1,253,7,2007,136500,1080,2,0,2,0,56,3,Attached,Concrete/Slab,N,Regular,1.5Fin,5,6,11.8240798936071,0,
0906201022,10357,1Story,7,5,1990,Gd,Y,1442,3,1,719,5,2007,179900,910,3,0,3,244,17,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1001564199386,1,
0906382060,8760,1Story,8,5,2006,Ex,Y,1500,3,1,674,6,2007,212999,1489,2,0,2,182,1,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2690427498448,1,
0906394050,9317,1Story,6,5,2006,Gd,Y,1314,3,1,440,3,2007,176432,1314,2,0,2,22,1,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.0806908119984,1,
0907200190,8660,SLvl,5,5,1976,TA,Y,1025,3,1,370,7,2007,153500,1015,2,0,2,127,31,3,Detached,Cinder Block,Y,Irregular,SLvl,5,5,11.9414558460093,0,
0907200250,9720,SLvl,5,7,1977,TA,Y,1009,3,1,576,6,2007,160000,995,2,0,2,0,30,3,Detached,Cinder Block,Y,Regular,SLvl,5,6,11.9829290942159,0,
0907290140,4435,1Story,6,5,2003,Ex,Y,848,1,0,420,11,2007,131500,848,2,0,2,140,4,4,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.7867621305999,0,
0908127070,8240,1Story,6,6,1960,Gd,Y,1179,2,0,622,6,2007,110000,1179,1,0,1,0,47,3,Attached,Cinder Block,Y,Regular,1Story,6,6,11.6082356447745,0,
0908152060,6285,SLvl,6,6,1976,TA,Y,1044,3,1,528,4,2007,133500,960,2,0,2,228,31,2,Detached,Cinder Block,N,Regular,SLvl,6,6,11.8018567568224,0,
0909250160,10594,1.5Unf,5,5,1926,Fa,N,789,2,0,200,6,2007,96500,768,1,0,1,0,81,3,Detached,Brick/Tile/Stone,N,Regular,1Story,5,5,11.477298287327,0,
0909252170,6720,2Story,6,7,1921,TA,N,1436,3,1,228,4,2007,141500,585,1,0,1,184,86,2,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.8600549960654,0,
0909254140,4280,1Story,5,6,1913,TA,N,694,2,1,352,3,2007,90350,440,1,0,1,0,94,2,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.4114462960203,0,
0909256120,6305,1Story,5,7,1938,Ex,Y,954,2,1,240,6,2007,119750,920,1,0,1,0,69,3,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.6931615152731,0,
0909275160,13108,1Story,5,5,1951,Fa,Y,1226,2,1,400,6,2007,153500,0,1,1,1.1,426,56,3,Attached,Cinder Block,N,Irregular,1Story,5,5,11.9414558460093,0,
0910201110,6060,1.5Fin,4,5,1939,Gd,Y,1123,3,0,264,6,2007,100000,732,1,0,1,0,68,3,Detached,Concrete/Slab,N,Regular,1.5Fin,4,5,11.5129254649702,0,
0911128020,6060,1Story,5,9,1930,Ex,Y,1001,2,0,216,11,2007,124900,837,1,0,1,240,77,4,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.7352686961136,0,
0914452190,9187,1Story,6,5,1983,TA,Y,1080,3,0,484,6,2007,134000,1084,1,1,1.1,120,24,3,Attached,Concrete/Slab,N,Regular,1Story,6,5,11.805595078933,0,
0916455050,6718,1Story,8,5,2001,Ex,Y,1312,2,0,471,1,2007,180500,1267,2,0,2,284,6,1,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.103486056755,1,
0916455110,9590,SLvl,7,5,2003,Ex,Y,1146,3,1,438,5,2007,187500,868,3,0,3,182,4,2,Attached,Concrete/Slab,Y,Irregular,SLvl,6,5,12.1415341243926,1,
0923203010,6710,SFoyer,6,5,1996,Ex,Y,936,0,0,460,6,2007,140000,920,2,1,2.1,40,11,3,Attached,Concrete/Slab,Y,Irregular,SFoyer,6,5,11.8493977015914,0,
0923225050,4224,1Story,5,5,1976,TA,Y,1142,3,1,528,8,2007,134000,1142,2,1,2.1,626,31,3,Attached,Concrete/Slab,N,Regular,1Story,5,5,11.805595078933,0,
0923228220,1495,2Story,4,6,1970,Ex,Y,1092,3,0,0,5,2007,93900,546,1,1,1.1,64,37,2,NA,Cinder Block,Y,Regular,2Story,4,6,11.4499856651963,0,
0923228250,2001,2Story,4,5,1970,Fa,Y,1092,3,0,286,1,2007,75000,546,1,1,1.1,0,37,1,Attached,Cinder Block,Y,Regular,2Story,4,5,11.2252433925184,0,
0923229040,9129,SFoyer,5,5,1977,TA,Y,1008,1,1,678,7,2007,153500,923,2,0,2,267,30,3,Attached,Concrete/Slab,Y,Regular,SFoyer,5,5,11.9414558460093,0,
0923252080,7599,1Story,4,6,1982,TA,Y,845,2,0,360,6,2007,129500,845,2,0,2,0,25,3,Detached,Cinder Block,N,Regular,1Story,4,6,11.7714361601217,0,
0923425030,10447,1Story,5,6,1984,TA,Y,887,3,0,288,12,2007,124500,864,1,1,1.1,140,23,1,Attached,Cinder Block,N,Regular,1Story,5,6,11.7320609948869,0,
0526302040,10533,1Story,6,6,1956,TA,Y,1024,2,2,313,8,2006,157500,1008,2,0,2,280,50,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,11.9671807372478,0,
0527328010,10464,SFoyer,6,6,1980,TA,Y,1102,2,1,582,6,2006,169000,988,2,0,2,162,26,3,Attached,Cinder Block,Y,Irregular,SFoyer,6,6,12.0376539939052,0,
0527376090,10140,1Story,5,6,1975,Ex,Y,1074,3,0,495,7,2006,153500,1056,2,1,2.1,88,31,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.9414558460093,0,
0527427210,8773,1Story,6,5,2002,Ex,Y,1419,2,0,543,9,2006,190000,1487,3,0,3,264,4,4,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1547793511426,1,
0527450010,2760,2Story,6,5,1973,TA,Y,1092,3,0,440,12,2006,105500,525,1,1,1.1,0,33,1,Detached,Cinder Block,Y,Regular,2Story,6,5,11.5664662318982,0,
0527451380,1680,2Story,6,7,1972,Gd,Y,1218,3,0,264,5,2006,118000,672,1,2,1.2,28,34,2,Detached,Cinder Block,Y,Regular,2Story,6,6,11.6784399034478,0,
0527451450,1680,2Story,6,5,1972,TA,Y,948,2,0,264,7,2006,89000,483,1,1,1.1,0,34,3,Detached,Cinder Block,Y,Regular,2Story,6,5,11.3963916487142,0,
0532376250,8638,1Story,5,6,1963,Gd,Y,925,2,0,484,10,2006,133500,925,2,0,2,277,43,4,Detached,Concrete/Slab,N,Irregular,1Story,5,6,11.8018567568224,0,
0532378130,8020,1Story,5,6,1964,TA,N,912,3,0,0,4,2006,124000,912,1,0,1,0,42,2,NA,Cinder Block,N,Irregular,1Story,5,6,11.7280368445871,0,
0532378160,6993,1Story,5,7,1961,TA,Y,1236,3,1,288,6,2006,135000,912,1,0,1,0,45,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.8130300574205,0,
0532378220,8789,1Story,5,6,1967,TA,Y,941,3,1,288,6,2006,129200,912,1,0,1,64,39,3,Attached,Cinder Block,N,Irregular,1Story,5,6,11.7691168703306,0,
0533206040,3628,1Story,7,5,2004,Ex,Y,1143,1,1,588,5,2006,176400,1143,1,1,1.1,191,2,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.0805094225548,1,
0533212110,2544,2Story,7,5,2005,Ex,Y,1223,2,0,480,7,2006,147400,600,2,1,2.1,166,1,3,Detached,Concrete/Slab,N,Regular,2Story,6,5,11.9009052587373,0,
0533253160,3876,1Story,8,5,1978,TA,Y,1226,1,1,484,7,2006,170000,1226,2,0,2,193,28,3,Attached,Cinder Block,N,Irregular,1Story,6,5,12.0435537160324,0,
0534125210,13110,1Story,5,6,1972,Ex,Y,1193,2,0,501,7,2006,146500,1153,3,0,3,293,34,3,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.8947807074392,0,
0534176250,9600,1Story,7,5,1969,TA,Y,1164,3,0,528,7,2006,140000,1164,1,1,1.1,0,37,3,Attached,Cinder Block,Y,Regular,1Story,6,5,11.8493977015914,0,
0534202020,9759,1Story,5,5,1966,TA,Y,1051,3,0,264,3,2006,124400,1051,2,0,2,270,40,2,Attached,Cinder Block,N,Irregular,1Story,5,5,11.7312574592872,0,
0534430110,11425,1Story,5,6,1954,Gd,Y,1008,2,1,275,7,2006,137000,1008,1,0,1,0,52,3,Attached,Cinder Block,N,Irregular,1Story,5,6,11.8277362048102,0,
0535151080,9723,1Story,6,7,1963,TA,Y,1008,2,0,430,10,2006,135000,1008,1,0,1,0,43,4,Attached,Cinder Block,Y,Irregular,1Story,6,6,11.8130300574205,0,
0535354130,7500,1.5Fin,6,6,1947,Ex,Y,1312,3,0,649,10,2006,127000,784,1,1,1.1,28,59,4,Detached,Cinder Block,N,Regular,1.5Fin,6,6,11.7519423654407,0,
0535402070,13400,SLvl,5,5,1966,TA,Y,1086,3,1,484,6,2006,159950,1024,2,0,2,0,40,3,Attached,Cinder Block,Y,Regular,SLvl,5,5,11.9826165453776,0,
0535404080,7100,1Story,5,7,1957,TA,Y,816,2,0,308,7,2006,129900,816,2,0,2,0,49,3,Detached,Cinder Block,N,Irregular,1Story,5,6,11.7745202026586,0,
0535451210,7200,1Story,4,5,1950,TA,Y,1040,2,0,420,7,2006,109900,0,1,0,1,29,56,3,Detached,Concrete/Slab,N,Regular,1Story,4,5,11.6073261403917,0,
0535454060,8544,1Story,3,4,1950,Gd,N,1040,2,0,400,7,2006,93500,0,2,0,2,0,56,3,Detached,Cinder Block,N,Regular,1Story,4,4,11.4457167152767,0,
0535457070,7000,1Story,5,4,1961,TA,Y,1150,3,0,288,7,2006,146000,1150,1,0,1,162,45,3,Attached,Cinder Block,N,Regular,1Story,5,4,11.8913619006904,0,
0535477060,7590,2Story,6,5,1966,TA,Y,1348,3,1,453,7,2006,155000,660,1,1,1.1,296,40,3,Attached,Cinder Block,Y,Regular,2Story,6,5,11.9511803959013,0,
0535478090,7000,1Story,5,6,1962,Gd,Y,864,3,0,336,2,2006,105000,864,1,1,1.1,0,44,1,Attached,Cinder Block,N,Regular,1Story,5,6,11.5617156291396,0,
0902106090,6451,2Story,7,7,1900,Gd,Y,1428,4,0,576,5,2006,139900,712,2,0,2,264,106,2,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.8486831606535,0,
0902109010,5684,1Story,6,8,1930,Ex,Y,813,2,0,270,6,2006,110000,813,1,0,1,113,76,3,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.6082356447745,0,
0902128020,7200,1Story,4,5,1950,Ex,Y,864,2,0,528,8,2006,105000,576,1,0,1,115,56,3,Detached,Cinder Block,N,Regular,1Story,4,5,11.5617156291396,0,
0902204060,6000,1Story,5,7,1955,TA,Y,960,3,0,576,6,2006,135500,960,2,0,2,0,51,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.8167269193018,0,
0902207080,5820,1Story,3,8,1955,Ex,Y,1163,3,0,220,7,2006,126175,1162,2,0,2,240,51,3,Attached,Cinder Block,N,Regular,1Story,4,6,11.7454251112084,0,
0902207110,5747,1Story,3,4,1920,Gd,Y,840,2,0,250,6,2006,64000,798,1,0,1,112,86,3,Detached,Concrete/Slab,N,Regular,1Story,4,4,11.0666383623418,0,
0902329070,3600,2Story,6,7,1910,Ex,N,1368,3,0,216,10,2006,114504,684,1,0,1,158,96,4,Detached,Cinder Block,N,Regular,2Story,6,6,11.648365035864,0,
0903231070,6240,1.5Fin,6,6,1934,TA,Y,1176,3,1,528,9,2006,114500,816,1,0,1,112,72,4,Detached,Concrete/Slab,N,Regular,1.5Fin,6,6,11.6483301019764,0,
0903233220,6120,1.5Fin,5,7,1930,Gd,Y,1324,3,0,180,2,2006,110000,741,1,0,1,0,76,1,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,5,6,11.6082356447745,0,
0903452090,7518,2Story,5,8,1910,Gd,Y,1330,3,0,390,7,2006,116500,396,1,0,1,72,96,3,Detached,Brick/Tile/Stone,N,Regular,2Story,5,6,11.6656465519878,0,
0903455090,7200,1.5Fin,5,6,1938,Ex,Y,1360,2,0,297,7,2006,125500,803,1,1,1.1,65,68,3,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.7400610375539,0,
0903456060,9786,1Story,3,4,1922,Fa,N,1077,3,1,210,5,2006,91000,1007,1,0,1,100,84,2,Detached,Brick/Tile/Stone,N,Regular,1Story,4,4,11.4186147854989,0,
0904301410,8250,1Story,5,7,1935,TA,N,1032,2,1,260,6,2006,125000,0,1,0,1,0,71,3,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.7360690162844,0,
0905101450,8414,1Story,6,8,1963,TA,Y,1068,3,0,264,2,2006,154500,1059,1,1,1.1,192,43,1,Attached,Cinder Block,N,Regular,1Story,6,6,11.9479493753199,0,
0905106210,11553,1Story,5,5,1968,TA,Y,1159,3,1,336,7,2006,158000,1051,1,1,1.1,466,38,3,Attached,Cinder Block,Y,Irregular,1Story,5,5,11.9703503120091,0,
0905200490,10246,SLvl,4,9,1965,Ex,Y,960,0,0,364,5,2006,145000,648,1,1,1.1,88,41,2,Attached,Cinder Block,N,Irregular,SLvl,4,6,11.8844890214027,0,
0907131070,8685,1Story,7,5,1998,Ex,Y,1425,3,0,591,5,2006,193000,1425,3,0,3,130,8,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.170445467887,1,
0907175060,9236,1Story,6,5,1997,Ex,Y,1494,3,0,576,7,2006,217000,1479,3,0,3,195,9,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.2876526325226,1,
0907227090,7200,1Story,5,8,1972,Ex,Y,864,3,0,297,3,2006,119900,864,1,0,1,0,34,2,Detached,Cinder Block,N,Regular,1Story,5,6,11.6944133410156,0,
0908102320,17755,1Story,5,4,1959,TA,Y,1466,3,2,528,11,2006,149900,1466,1,1,1.1,240,47,4,Attached,Cinder Block,Y,Regular,1Story,5,4,11.9177236840906,0,
0908130020,8050,1Story,6,5,2002,Ex,Y,914,2,0,0,4,2006,117250,914,2,0,2,32,4,2,NA,Concrete/Slab,,Regular,1Story,6,5,11.6720636863085,0,
0909101330,8088,1Story,2,3,1922,TA,N,498,1,0,216,2,2006,35000,498,1,0,1,0,84,1,Detached,Brick/Tile/Stone,N,Regular,1Story,4,4,10.4631033404715,0,
0909428110,15750,1Story,5,5,1953,TA,Y,1336,2,2,375,6,2006,157000,1165,2,0,2,0,53,3,Attached,Cinder Block,Y,Regular,1Story,5,5,11.9640010843304,0,
0910200060,7000,1.5Fin,6,7,1926,Ex,Y,1285,3,0,506,5,2006,145400,861,1,1,1.1,96,80,2,Detached,Concrete/Slab,N,Regular,1.5Fin,6,6,11.8872438440815,0,
0910203100,8534,1Story,4,4,1925,TA,N,672,2,0,0,6,2006,72000,432,1,0,1,0,81,3,NA,Brick/Tile/Stone,N,Regular,1Story,4,4,11.1844213979981,0,
0911175360,11040,1.5Fin,4,6,1920,Gd,Y,1336,3,0,570,9,2006,108000,637,1,1,1.1,47,86,4,,Cinder Block,N,Regular,1.5Fin,4,6,11.5898865061063,0,
0923203100,4500,1Story,6,5,1998,Ex,Y,1337,2,0,405,3,2006,153500,1237,3,0,3,199,8,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.9414558460093,0,
0923276100,8885,1Story,5,5,1983,TA,Y,902,2,0,484,6,2006,131000,864,2,0,2,164,23,3,Attached,Cinder Block,N,Irregular,1Story,5,5,11.7829526021832,0,
;;;;
run;

data statdata.ameshousing4;
   attrib PID length=$10 format=$CHAR10. informat=$CHAR10.;
   attrib Lot_Area length=8 label='Lot size in square feet' format=BEST12. informat=BEST12.;
   attrib House_Style length=$6 label='Style of dwelling' format=$CHAR6. informat=$CHAR6.;
   attrib Overall_Qual length=8 label='Overall material and finish of the house' format=BEST12. informat=BEST12.;
   attrib Overall_Cond length=8 label='Overall condition of the house' format=BEST12. informat=BEST12.;
   attrib Year_Built length=8 label='Original construction year' format=BEST12. informat=BEST12.;
   attrib Heating_QC length=$2 label='Heating quality and condition' format=$CHAR2. informat=$CHAR2.;
   attrib Central_Air length=$1 label='Presence of central air conditioning' format=$CHAR1. informat=$CHAR1.;
   attrib Gr_Liv_Area length=8 label='Above grade (ground) living area square feet' format=BEST12. informat=BEST12.;
   attrib Bedroom_AbvGr length=8 label='Bedrooms above grade' format=BEST12. informat=BEST12.;
   attrib Fireplaces length=8 label='Number of fireplaces' format=BEST12. informat=BEST12.;
   attrib Garage_Area length=8 label='Size of garage in square feet' format=BEST12. informat=BEST12.;
   attrib Mo_Sold length=8 label='Month Sold (MM)' format=BEST12. informat=BEST12.;
   attrib Yr_Sold length=8 label='Year Sold (YYYY)' format=BEST12. informat=BEST12.;
   attrib SalePrice length=8 label='Sale price in dollars' format=BEST12. informat=BEST12.;
   attrib Basement_Area length=8 label='Basement area in square feet' format=BEST12. informat=BEST12.;
   attrib Full_Bathroom length=8 label='Number of full bathrooms' format=BEST12. informat=BEST12.;
   attrib Half_Bathroom length=8 label='Number of half bathrooms' format=BEST12. informat=BEST12.;
   attrib Total_Bathroom length=8 label='Total number of bathrooms (half bathrooms counted 10%)' format=BEST12. informat=BEST12.;
   attrib Deck_Porch_Area length=8 label='Total area of decks and porches in square feet' format=BEST12. informat=BEST12.;
   attrib Age_Sold length=8 label='Age of house when sold, in years' format=BEST12. informat=BEST12.;
   attrib Season_Sold length=8 label='Season when house sold' format=BEST12. informat=BEST12.;
   attrib Garage_Type_2 length=$8 label='Garage attached or detached' format=$CHAR8. informat=$CHAR8.;
   attrib Foundation_2 length=$16 label='Foundation Type' format=$CHAR16. informat=$CHAR16.;
   attrib Masonry_Veneer length=$1 label='Masonry veneer or not' format=$CHAR1. informat=$CHAR1.;
   attrib Lot_Shape_2 length=$10 label='Regular or irregular lot shape' format=$CHAR10. informat=$CHAR10.;
   attrib House_Style2 length=$6 label='Style of dwelling' format=$CHAR6. informat=$CHAR6.;
   attrib Overall_Qual2 length=8 label='Overall material and finish of the house' format=BEST12. informat=BEST12.;
   attrib Overall_Cond2 length=8 label='Overall condition of the house' format=BEST12. informat=BEST12.;
   attrib Log_Price length=8 label='Natural log of the sale price' format=BEST12. informat=BEST12.;
   attrib Bonus length=8 label='Sale Price > $175,000' format=BEST12. informat=BEST12.;
   attrib score length=8;

   infile datalines dsd;
   input
      PID:$10.
      Lot_Area:BEST32.
      House_Style:$6.
      Overall_Qual:BEST32.
      Overall_Cond:BEST32.
      Year_Built:BEST32.
      Heating_QC:$2.
      Central_Air:$1.
      Gr_Liv_Area:BEST32.
      Bedroom_AbvGr:BEST32.
      Fireplaces:BEST32.
      Garage_Area:BEST32.
      Mo_Sold:BEST32.
      Yr_Sold:BEST32.
      SalePrice:BEST32.
      Basement_Area:BEST32.
      Full_Bathroom:BEST32.
      Half_Bathroom:BEST32.
      Total_Bathroom:BEST32.
      Deck_Porch_Area:BEST32.
      Age_Sold:BEST32.
      Season_Sold:BEST32.
      Garage_Type_2:$8.
      Foundation_2:$16.
      Masonry_Veneer:$1.
      Lot_Shape_2:$10.
      House_Style2:$6.
      Overall_Qual2:BEST32.
      Overall_Cond2:BEST32.
      Log_Price:BEST32.
      Bonus:BEST32.
      score
   ;
datalines4;
0526351010,14267,1Story,6,6,1958,TA,Y,1329,3,0,312,6,2010,172000,1329,1,1,1.1,429,52,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,12.0552497557955,0,700
0527165230,7980,1Story,6,7,1992,Ex,Y,1187,3,0,420,3,2010,185000,1168,3,0,3,504,18,2,Attached,Concrete/Slab,N,Irregular,1Story,6,6,12.1281111040604,1,1790
0527403020,8450,1Story,5,6,1968,Ex,Y,1056,3,1,304,7,2010,142000,1056,2,0,2,85,42,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.8635823365834,0,2610
0528181050,7132,1Story,8,5,2006,Ex,Y,1370,2,1,484,4,2010,205000,1370,2,0,2,169,4,2,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.2307652581205,1,410
0528218150,18494,1Story,6,5,2005,Ex,Y,1324,3,0,430,1,2010,199500,1324,2,0,2,59,5,1,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.203569515312,1,730
0528480090,10440,1Story,6,5,2005,Ex,Y,1468,2,1,528,5,2010,271500,1468,3,0,3,318,5,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.5117174183561,1,-280
0533212010,3182,2Story,7,5,2004,Ex,Y,1200,2,0,480,6,2010,151000,600,2,1,2.1,172,6,3,Detached,Concrete/Slab,N,Regular,2Story,6,5,11.925035115797,0,4600
0533352170,13517,2Story,6,8,1976,Ex,Y,1479,3,0,475,3,2010,130500,725,2,1,2.1,44,34,2,Attached,Cinder Block,Y,Irregular,2Story,6,6,11.7791285057448,0,3420
0534176060,9360,1Story,6,7,1972,TA,Y,1381,3,1,676,3,2010,197500,1161,2,1,2.1,0,38,2,Attached,Cinder Block,N,Regular,1Story,6,6,12.1934938633233,1,1430
0534202160,9600,1Story,5,5,1966,TA,Y,1232,3,0,490,4,2010,142250,1232,2,1,2.1,224,44,2,Attached,Cinder Block,Y,Regular,1Story,5,5,11.8653413519885,0,1380
0534251320,9790,1Story,6,5,1963,TA,Y,1328,3,2,528,6,2010,143000,1328,2,1,2.1,26,47,3,Attached,Cinder Block,Y,Regular,1Story,6,5,11.870599909242,0,700
0535153070,8760,1Story,6,6,1959,TA,Y,1194,3,0,312,4,2010,148000,1194,2,0,2,0,51,2,Attached,Cinder Block,Y,Regular,1Story,6,6,11.9049675527462,0,1640
0535325400,7898,1Story,4,7,1920,Gd,Y,985,2,0,676,4,2010,105000,576,1,1,1.1,0,90,2,Detached,Brick/Tile/Stone,N,Regular,1Story,4,6,11.5617156291396,0,5150
0535327140,7200,1Story,5,7,1955,Ex,Y,827,2,1,392,4,2010,107500,0,1,0,1,0,55,2,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.5852461265498,0,8350
0535350040,5868,1Story,5,7,1956,Ex,Y,936,2,0,308,5,2010,129000,936,2,0,2,160,54,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.7675676833438,0,3450
0535454070,8520,1.5Fin,5,4,1952,Fa,Y,1385,4,0,720,6,2010,166000,910,2,0,2,0,58,3,Detached,Cinder Block,N,Regular,1.5Fin,5,4,12.0197430673386,0,2680
0535457090,7635,1Story,5,6,1960,Ex,Y,1175,3,0,484,6,2010,148000,1175,1,1,1.1,0,50,3,Detached,Cinder Block,N,Irregular,1Story,5,6,11.9049675527462,0,1780
0902402130,7740,2Story,4,7,1910,Gd,Y,1363,3,0,528,6,2010,125500,622,1,0,1,168,100,3,Detached,Cinder Block,N,Regular,2Story,4,6,11.7400610375539,0,4160
0903227150,6360,1.5Fin,5,6,1942,TA,Y,1453,3,2,240,3,2010,132000,835,1,1,1.1,148,68,2,Detached,Cinder Block,Y,Regular,1.5Fin,5,6,11.7905572015685,0,2920
0903430080,3068,2Story,6,8,1920,Ex,Y,1324,3,0,180,2,2010,122000,662,1,1,1.1,0,90,1,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.7117763237153,0,4040
0903454060,5600,2Story,4,5,1930,Fa,N,1092,3,0,0,7,2010,55000,0,2,0,2,0,80,3,NA,Concrete/Slab,N,Regular,2Story,4,5,10.9150884642146,0,7820
0904300150,10632,1.5Fin,5,3,1917,Gd,N,1224,3,0,180,1,2010,107500,689,1,1,1.1,0,93,1,Detached,Brick/Tile/Stone,N,Irregular,1.5Fin,5,4,11.5852461265498,0,4110
0904350045,6001,1.5Fin,6,5,1940,Ex,N,919,3,0,231,3,2010,95000,600,1,0,1,0,70,2,Detached,Cinder Block,N,Irregular,1.5Fin,6,5,11.4616321705826,0,5160
0905109170,20062,1Story,7,7,1977,Gd,Y,1483,1,2,690,4,2010,270000,1420,2,1,2.1,496,33,2,Attached,Cinder Block,N,Irregular,1Story,6,6,12.5061772379805,1,-70
0905201030,9259,1Story,4,4,1927,TA,N,756,2,0,440,6,2010,85000,660,1,0,1,80,83,3,Detached,Brick/Tile/Stone,N,Regular,1Story,4,4,11.3504065354724,0,5190
0905426200,11479,1Story,6,7,1950,Ex,Y,1074,3,1,467,6,2010,144500,663,2,0,2,52,60,3,Attached,Cinder Block,N,Regular,1Story,6,6,11.8810347865346,0,4540
0905451320,9571,1Story,5,6,1956,TA,Y,1144,3,0,596,6,2010,129000,1144,2,0,2,44,54,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.7675676833438,0,1990
0906201120,11980,1Story,7,5,1987,Ex,Y,1433,1,2,528,6,2010,270000,1433,2,1,2.1,544,23,3,Attached,Cinder Block,Y,Regular,1Story,6,5,12.5061772379805,1,-30
0906385010,10402,1Story,7,5,2009,Ex,Y,1226,3,0,740,5,2010,198900,1226,2,0,2,36,1,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.200557464842,1,1420
0906425045,14235,1.5Fin,6,8,1900,TA,Y,1445,3,0,484,3,2010,138500,676,2,0,2,59,110,2,Detached,Concrete/Slab,N,Irregular,1.5Fin,6,6,11.8386256046095,0,3730
0907203070,7480,1Story,5,6,1972,TA,Y,876,3,0,484,6,2010,127000,876,2,0,2,0,38,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.7519423654407,0,3870
0908226130,12180,1.5Fin,4,4,1941,Fa,N,924,2,0,280,7,2010,80000,672,2,0,2,0,69,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,4,4,11.289781913656,0,4790
0910203250,8154,1Story,2,5,1941,TA,Y,540,1,0,200,4,2010,82000,480,1,0,1,0,69,2,Detached,Brick/Tile/Stone,N,Regular,1Story,4,5,11.3144745262463,0,6520
0916386060,9802,2Story,5,5,2006,Gd,Y,1444,3,0,400,4,2010,174000,384,2,1,2.1,100,4,2,Attached,Concrete/Slab,N,Regular,2Story,5,5,12.0668105781966,0,5190
0923225300,1974,2Story,4,5,1973,TA,Y,1092,3,0,286,5,2010,83500,546,1,1,1.1,216,37,2,Attached,Cinder Block,N,Regular,2Story,4,5,11.3326019108389,0,5090
0923226320,1491,SFoyer,4,6,1972,Ex,Y,630,1,0,0,5,2010,75500,630,2,0,2,120,38,2,NA,Cinder Block,N,Regular,SFoyer,4,6,11.2318879352371,0,5590
0923426070,10475,2Story,5,5,1991,Gd,Y,1274,3,0,576,3,2010,136000,624,1,1,1.1,22,19,2,Detached,Concrete/Slab,N,Regular,2Story,5,5,11.8204101647181,0,4330
0527161040,8923,SLvl,7,5,1998,Gd,Y,1382,3,1,396,2,2009,177500,384,2,1,2.1,256,11,1,Attached,Concrete/Slab,N,Irregular,SLvl,6,5,12.0867258878976,1,5320
0527164020,7250,1Story,6,5,1993,Ex,Y,1190,3,1,430,11,2009,166000,1181,2,0,2,21,16,4,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.0197430673386,0,1720
0527180100,11851,1Story,7,5,1990,Ex,Y,1442,3,0,500,5,2009,180500,1424,2,0,2,542,19,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.103486056755,1,0
0527404030,8510,1Story,5,7,1971,Ex,Y,1050,3,0,336,7,2009,143000,1043,2,1,2.1,0,38,3,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.870599909242,0,2690
0527451650,1680,2Story,5,7,1972,TA,Y,1302,3,0,264,2,2009,119500,630,2,1,2.1,185,37,1,Detached,Cinder Block,Y,Regular,2Story,5,6,11.6910716503537,0,4250
0527452060,4928,1Story,6,6,1976,TA,Y,958,2,0,440,10,2009,143750,958,2,0,2,60,33,4,Attached,Cinder Block,N,Irregular,1Story,6,6,11.8758309586595,0,3290
0528174060,5381,1Story,6,5,2005,Ex,Y,1306,1,1,624,8,2009,196000,1306,3,0,3,233,4,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.1858699382126,1,860
0528175060,5001,1Story,7,5,2007,Ex,Y,1314,2,1,626,7,2009,230000,1314,3,0,3,234,2,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.3458345879053,1,800
0528186180,6240,1Story,8,5,2006,Ex,Y,1324,2,1,550,12,2009,254000,1324,3,0,3,230,3,1,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.4450895460006,1,730
0528220040,8918,2Story,6,5,2005,Ex,Y,1490,3,1,392,7,2009,167800,745,2,1,2.1,56,4,3,Attached,Concrete/Slab,N,Irregular,2Story,6,5,12.0305280730152,0,3300
0528235200,9434,SLvl,7,5,2004,Ex,Y,1374,3,1,400,8,2009,170000,384,2,1,2.1,100,5,3,Attached,Concrete/Slab,N,Irregular,SLvl,6,5,12.0435537160324,0,5330
0528240060,7750,SLvl,8,5,2002,Ex,Y,1419,3,1,527,3,2009,184100,408,3,1,3.1,120,7,2,Attached,Concrete/Slab,N,Regular,SLvl,6,5,12.1232343672211,1,5120
0528250020,8965,2Story,7,5,2003,Ex,Y,1489,3,1,400,6,2009,192000,782,3,1,3.1,75,6,3,Attached,Concrete/Slab,N,Irregular,2Story,6,5,12.1652506510099,1,3110
0528250040,8174,2Story,7,5,2003,Ex,Y,1342,3,1,393,5,2009,178000,698,3,1,3.1,156,6,2,Attached,Concrete/Slab,N,Irregular,2Story,6,5,12.0895388292742,1,3830
0528290190,7750,SLvl,7,5,1999,Ex,Y,1430,3,1,400,3,2009,156000,384,2,1,2.1,0,10,2,Attached,Concrete/Slab,N,Regular,SLvl,6,5,11.9576112862316,0,5220
0531363010,9605,1Story,7,6,2007,Ex,Y,1218,3,0,576,4,2009,159000,1218,1,1,1.1,178,2,2,Detached,Concrete/Slab,N,Regular,1Story,6,6,11.9766594812023,0,1470
0531453100,10274,2Story,6,7,1986,TA,Y,1400,3,0,465,7,2009,162000,676,2,1,2.1,48,23,3,Attached,Cinder Block,Y,Irregular,2Story,6,6,11.9953516142145,0,3820
0531477020,8400,1Story,4,4,1950,Gd,Y,841,2,0,294,9,2009,82000,721,1,0,1,250,59,4,,Cinder Block,N,Regular,1Story,4,4,11.3144745262463,0,4710
0533223030,3768,2Story,7,5,1999,Ex,Y,1452,3,0,506,9,2009,156000,691,3,1,3.1,34,10,4,Detached,Concrete/Slab,Y,Regular,2Story,6,5,11.9576112862316,0,3640
0533253070,3782,1Story,8,5,1981,TA,Y,1226,1,2,484,9,2009,211500,1226,2,0,2,211,28,4,Attached,Cinder Block,N,Irregular,1Story,6,5,12.2619802774684,1,1420
0534127170,9156,1Story,6,7,1968,Gd,Y,1489,3,1,462,8,2009,185750,1489,2,0,2,0,41,3,Attached,Cinder Block,N,Irregular,1Story,6,6,12.13215696258,1,-420
0534200030,7130,1Story,5,6,1967,TA,Y,864,2,0,312,6,2009,130000,864,1,1,1.1,0,42,3,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.7752897294377,0,3950
0534251030,16500,SFoyer,6,5,1971,Fa,Y,1320,3,1,495,5,2009,172500,1232,2,1,2.1,20,38,2,Attached,Cinder Block,Y,Regular,SFoyer,6,5,12.0581525154535,0,1200
0534277090,9450,1Story,4,5,1957,TA,Y,1362,3,1,768,5,2009,140000,1040,2,0,2,0,52,2,Attached,Cinder Block,Y,Irregular,1Story,4,5,11.8493977015914,0,2080
0535151040,8760,1Story,5,7,1956,TA,Y,1144,3,0,286,6,2009,150000,1169,2,0,2,257,53,3,Attached,Cinder Block,Y,Regular,1Story,5,6,11.9183905730783,0,1870
0535154130,9240,1Story,6,8,1959,TA,Y,988,3,0,297,6,2009,149500,988,3,0,3,156,50,3,Attached,Cinder Block,N,Irregular,1Story,6,6,11.9150516718128,0,3080
0535301170,8532,1Story,5,6,1954,Gd,Y,1297,3,1,498,10,2009,153000,1297,1,1,1.1,0,55,4,Attached,Cinder Block,Y,Regular,1Story,5,6,11.9381932003745,0,920
0535351050,14559,1Story,5,7,1951,Ex,Y,1363,2,2,288,6,2009,164900,1008,2,0,2,534,58,3,,Cinder Block,Y,Regular,1Story,5,6,12.0130945085476,0,2230
0535353040,7626,1Story,5,8,1952,Gd,Y,1031,2,0,230,3,2009,145500,1031,2,0,2,0,57,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.8879313655936,0,2780
0535354070,9600,1Story,5,6,1950,TA,Y,1200,3,0,246,8,2009,129900,1200,1,0,1,126,59,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.7745202026586,0,1600
0535378020,9022,1Story,5,8,1924,Ex,Y,792,2,0,240,5,2009,109500,768,1,0,1,316,85,2,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.6036798282386,0,4580
0535383120,10800,1Story,3,5,1890,TA,Y,725,1,0,320,11,2009,78500,630,1,1,1.1,30,119,4,Detached,Brick/Tile/Stone,N,Regular,1Story,4,5,11.2708539037705,0,5400
0535453100,8000,SLvl,5,5,1959,TA,Y,1183,3,0,288,7,2009,138000,528,2,0,2,0,50,3,Attached,Cinder Block,N,Regular,SLvl,5,5,11.8350089641393,0,4990
0535454100,10800,1.5Fin,4,7,1949,TA,Y,1461,4,0,384,8,2009,133500,832,2,0,2,204,60,3,Detached,Cinder Block,N,Regular,1.5Fin,4,6,11.8018567568224,0,2920
0902103100,4080,1.5Fin,6,8,1935,Gd,Y,1378,3,0,162,6,2009,128900,901,1,0,1,54,74,3,Detached,Concrete/Slab,N,Regular,1.5Fin,6,6,11.7667921889272,0,2740
0902135020,6000,1Story,4,4,1953,TA,N,936,2,0,576,2,2009,93000,936,1,0,1,32,56,1,Detached,Cinder Block,N,Regular,1Story,4,4,11.4403547721353,0,3450
0902201110,6000,1.5Fin,5,7,1950,TA,Y,1328,3,0,308,3,2009,129500,768,1,1,1.1,12,59,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.7714361601217,0,3500
0902331010,3300,1Story,4,3,1910,Ex,Y,816,2,1,0,6,2009,58500,624,1,0,1,33,99,3,NA,Brick/Tile/Stone,N,Regular,1Story,4,4,10.9767820332199,0,5250
0903226130,6000,1.5Fin,4,6,1936,TA,Y,1324,3,0,240,7,2009,128000,672,1,0,1,0,73,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,4,6,11.7597855429017,0,3990
0903231130,6120,1Story,5,7,1931,TA,Y,875,2,0,180,11,2009,105000,715,2,0,2,48,78,4,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.5617156291396,0,4680
0903458170,6240,1.5Fin,4,5,1925,TA,Y,1208,2,0,539,1,2009,103000,780,1,0,1,23,84,1,Detached,Cinder Block,N,Regular,1.5Fin,4,5,11.5424842672117,0,3680
0903484110,10320,2Story,6,7,1915,Ex,Y,1403,3,0,308,2,2009,116000,698,2,1,2.1,0,94,1,Detached,Cinder Block,N,Regular,2Story,6,6,11.6613454700885,0,3700
0905200220,11616,1Story,5,5,1962,TA,Y,1092,3,1,288,9,2009,139000,1092,1,1,1.1,20,47,4,Attached,Cinder Block,Y,Regular,1Story,5,5,11.8422292121128,0,2360
0905200350,15312,SLvl,6,5,1960,Ex,Y,1138,3,1,480,3,2009,148000,1138,1,1,1.1,140,49,2,Attached,Cinder Block,Y,Regular,SLvl,6,5,11.9049675527462,0,2030
0905228050,9000,1Story,2,2,1947,Fa,N,660,2,0,0,6,2009,63900,0,1,0,1,0,62,3,NA,Concrete/Slab,N,Regular,1Story,4,4,11.0650746403656,0,8680
0905377010,17140,1Story,4,6,1956,Ex,Y,1229,3,0,284,4,2009,135000,1134,1,0,1,0,53,2,Attached,Cinder Block,N,Regular,1Story,4,6,11.8130300574205,0,1870
0905402070,15635,1Story,4,5,1954,TA,Y,1383,2,0,498,10,2009,122000,0,1,0,1,110,55,4,Attached,Cinder Block,N,Irregular,1Story,4,5,11.7117763237153,0,7230
0906201021,10778,SLvl,7,6,1990,Gd,Y,1061,1,0,462,7,2009,162000,1054,2,1,2.1,150,19,3,Attached,Concrete/Slab,N,Irregular,SLvl,6,6,11.9953516142145,0,2610
0906380220,10324,1Story,8,5,2008,Ex,Y,1254,2,0,810,3,2009,221800,1254,3,0,3,260,1,2,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.3095313538984,1,1220
0906392110,11645,1Story,8,5,2005,Ex,Y,1498,3,1,844,3,2009,237000,1498,2,0,2,242,4,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.3758154201172,1,-490
0907131190,14753,1Story,7,5,1998,Ex,Y,1463,3,0,539,12,2009,207000,1463,3,0,3,81,11,1,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.2404740722475,1,-240
0907202080,7000,1Story,5,8,1978,Ex,Y,864,3,0,336,7,2009,136500,864,2,0,2,0,31,3,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.8240798936071,0,3950
0907202130,9286,1Story,5,7,1977,TA,Y,1268,3,0,252,10,2009,143500,1268,1,1,1.1,173,32,4,Detached,Cinder Block,N,Irregular,1Story,5,6,11.8740903141818,0,1120
0907280170,8750,1Story,7,5,1997,Ex,Y,1417,3,1,511,8,2009,210000,1417,3,0,3,177,12,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2548628096996,1,80
0907414080,8633,2Story,6,5,2005,Ex,Y,1476,3,0,540,2,2009,173500,738,3,1,3.1,135,4,1,Attached,Concrete/Slab,N,Regular,2Story,6,5,12.063932878369,0,3360
0907420040,11069,2Story,6,5,2007,Ex,Y,1396,3,1,440,7,2009,170000,608,2,1,2.1,136,2,3,Attached,Concrete/Slab,N,Regular,2Story,6,5,12.0435537160324,0,4170
0908102290,8877,1Story,4,6,1938,Ex,Y,816,2,1,288,5,2009,100000,816,2,0,2,0,71,2,Detached,Cinder Block,N,Regular,1Story,4,6,11.5129254649702,0,4290
0908152035,10682,1Story,4,6,1960,TA,Y,1149,3,0,544,7,2009,127000,1014,2,0,2,240,49,3,,Cinder Block,N,Regular,1Story,4,6,11.7519423654407,0,2630
0909253180,6292,1.5Fin,7,7,1928,Gd,Y,1477,3,1,216,8,2009,145000,861,2,1,2.1,50,81,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.8844890214027,0,2740
0909276200,9600,1.5Fin,5,7,1940,Ex,Y,1308,2,2,256,6,2009,160000,728,2,1,2.1,70,69,3,Detached,Brick/Tile/Stone,N,Irregular,1.5Fin,5,6,11.9829290942159,0,3740
0909277090,14680,1Story,5,4,1960,Ex,Y,1273,2,0,307,6,2009,155000,1273,1,0,1,598,49,3,Attached,Cinder Block,N,Irregular,1Story,5,4,11.9511803959013,0,1090
0909278020,7681,1.5Fin,5,6,1921,Ex,Y,1343,3,1,186,7,2009,154900,731,1,1,1.1,192,88,3,Detached,Brick/Tile/Stone,N,Irregular,1.5Fin,5,6,11.9505350264049,0,3660
0909451100,1488,2Story,6,6,1980,TA,Y,1229,2,1,462,10,2009,137000,561,2,1,2.1,176,29,4,Attached,Cinder Block,N,Regular,2Story,6,6,11.8277362048102,0,4740
0909451180,1300,2Story,6,6,1980,TA,Y,1229,2,1,462,5,2009,124000,561,1,1,1.1,150,29,2,Attached,Cinder Block,N,Regular,2Story,6,6,11.7280368445871,0,4740
0910202070,10690,2Story,5,7,1920,Gd,Y,1344,3,0,468,7,2009,147000,672,1,0,1,128,89,3,Detached,Cinder Block,N,Regular,2Story,5,6,11.8981878657608,0,3950
0914475010,9750,SFoyer,6,6,1977,Ex,Y,926,2,1,351,4,2009,156450,902,2,0,2,319,32,2,Attached,Cinder Block,N,Regular,SFoyer,6,6,11.960491749097,0,3640
0923252075,7706,SLvl,6,5,1993,Ex,Y,1091,2,0,429,8,2009,131250,384,1,1,1.1,280,16,3,Attached,Cinder Block,N,Regular,SLvl,6,5,11.7848591804538,0,5900
0526351030,11029,1Story,6,8,1958,Ex,Y,1414,3,1,601,5,2008,176500,1184,2,0,2,241,50,2,Attached,Cinder Block,N,Irregular,1Story,6,6,12.0810761553554,1,1250
0527183060,5950,1Story,8,5,1989,Gd,Y,1337,2,1,462,4,2008,188500,1337,3,0,3,73,19,2,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.1468532858702,1,640
0527450110,1680,2Story,6,5,1973,TA,Y,987,2,0,264,2,2008,103400,483,1,2,1.2,52,35,1,Detached,Cinder Block,Y,Regular,2Story,6,5,11.5463602410564,0,5610
0527450520,1890,2Story,6,6,1972,Gd,Y,987,2,0,352,4,2008,100500,483,1,1,1.1,411,36,2,Detached,Cinder Block,Y,Regular,2Story,6,6,11.5179130064812,0,5610
0527451060,1869,2Story,6,6,1970,TA,Y,987,2,0,280,9,2008,106000,483,1,1,1.1,0,38,4,Detached,Cinder Block,Y,Regular,2Story,6,6,11.5711943730942,0,5610
0527453160,2308,2Story,6,6,1975,Gd,Y,1456,4,0,460,5,2008,143000,855,2,1,2.1,0,33,2,Attached,Cinder Block,N,Regular,2Story,6,6,11.870599909242,0,2810
0528181010,12304,1Story,7,5,2005,Ex,Y,1367,2,1,484,6,2008,192000,1367,2,0,2,33,3,3,Attached,Concrete/Slab,Y,,1Story,6,5,12.1652506510099,1,430
0528290090,7750,2Story,7,5,2002,Ex,Y,1414,3,1,403,4,2008,176000,707,2,1,2.1,135,6,2,Attached,Concrete/Slab,,Regular,2Story,6,5,12.0782392740202,1,3640
0531376070,9260,1Story,7,5,2007,Ex,Y,1162,3,0,483,3,2008,170000,1162,2,0,2,32,1,2,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.0435537160324,0,1870
0532354150,8100,1Story,5,8,1961,Ex,Y,864,3,1,420,7,2008,135000,864,2,0,2,132,47,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.8130300574205,0,3950
0533208140,3435,1Story,7,5,2004,Ex,Y,1245,1,0,495,6,2008,178000,1235,2,0,2,100,4,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.0895388292742,1,1340
0533217060,2160,SLvl,7,5,1999,Ex,Y,1404,3,0,462,6,2008,170000,672,3,1,3.1,20,9,3,Detached,Concrete/Slab,Y,Regular,SLvl,6,5,12.0435537160324,0,3830
0533250050,14963,1Story,8,5,1996,Ex,Y,1288,1,2,500,12,2008,245500,1260,2,1,2.1,374,12,1,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.4110522262167,1,1120
0533251120,11120,1Story,6,6,1984,TA,Y,1232,3,0,516,6,2008,162500,1232,2,0,2,0,24,3,Attached,Concrete/Slab,N,Irregular,1Story,6,6,11.9984332807519,0,1380
0534202130,8872,1Story,5,8,1965,Ex,Y,912,2,0,576,12,2008,147000,912,2,0,2,240,43,1,Detached,Cinder Block,Y,Regular,1Story,5,6,11.8981878657608,0,3620
0534401130,9020,SLvl,6,7,1966,TA,Y,1165,3,0,490,5,2008,174900,1127,2,1,2.1,129,42,2,Attached,Cinder Block,Y,Regular,SLvl,6,6,12.0719696610066,0,2040
0534427040,10721,1Story,6,6,1959,Ex,Y,1252,3,0,528,10,2008,142000,1252,1,0,1,39,49,4,Detached,Cinder Block,Y,Irregular,1Story,6,6,11.8635823365834,0,1240
0534428100,11332,1Story,5,7,1960,Ex,Y,1118,3,0,264,8,2008,153000,1118,2,0,2,290,48,3,Attached,Cinder Block,N,Irregular,1Story,5,6,11.9381932003745,0,2170
0534455030,9600,1Story,5,6,1960,TA,Y,1496,3,0,450,2,2008,141500,1296,2,0,2,22,48,1,Attached,Cinder Block,Y,Regular,1Story,5,6,11.8600549960654,0,530
0534477090,9600,1Story,5,8,1950,Gd,Y,1337,3,1,264,9,2008,141500,572,2,0,2,192,58,4,Attached,Cinder Block,N,Regular,1Story,5,6,11.8600549960654,0,4470
0535104020,10197,1Story,6,5,1961,TA,Y,1362,3,1,504,6,2008,163000,1362,2,1,2.1,20,47,3,Attached,Cinder Block,Y,Irregular,1Story,6,5,12.0015054797889,0,470
0535178060,9000,1Story,6,5,1956,Gd,Y,1196,2,1,297,5,2008,139000,1196,2,0,2,44,52,2,Attached,Cinder Block,Y,Regular,1Story,6,5,11.8422292121128,0,1630
0535180120,10425,1Story,5,5,1956,Gd,Y,1104,3,0,384,4,2008,133000,1104,2,0,2,0,52,2,Attached,Cinder Block,N,Regular,1Story,5,5,11.7981044072038,0,2270
0535425060,11355,1Story,7,7,1958,Ex,Y,1312,3,1,495,4,2008,186000,1312,1,1,1.1,304,50,2,Attached,Cinder Block,Y,Irregular,1Story,6,6,12.1335019526953,1,820
0535451010,8892,1Story,5,7,1953,Gd,Y,910,3,0,414,10,2008,116000,105,1,0,1,196,55,4,Attached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.6613454700885,0,7660
0535451230,7200,1Story,5,5,1950,Gd,Y,1048,3,0,420,7,2008,98300,0,1,0,1,27,58,3,Detached,Cinder Block,N,Regular,1Story,5,5,11.4957793061352,0,7900
0535453020,8000,1Story,5,6,1959,Gd,Y,1256,3,0,311,5,2008,159000,1256,2,1,2.1,240,49,2,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.9766594812023,0,1210
0535455080,7227,1.5Unf,6,6,1954,Gd,Y,832,2,0,528,6,2008,105500,832,1,0,1,0,54,3,Detached,Cinder Block,N,Regular,1Story,6,6,11.5664662318982,0,4180
0902128150,10800,1.5Fin,6,6,1940,TA,Y,1436,3,2,828,5,2008,155000,884,2,0,2,0,68,2,Detached,Cinder Block,N,Regular,1.5Fin,6,6,11.9511803959013,0,2710
0902202090,9000,1.5Fin,5,6,1946,Ex,Y,1499,3,1,869,6,2008,140000,904,1,0,1,20,62,3,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.8493977015914,0,2480
0902301150,9143,1.5Fin,5,7,1900,Ex,Y,1017,2,0,308,5,2008,114000,346,1,0,1,0,108,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.6439537273766,0,6240
0902402260,11340,2Story,2,1,1920,TA,N,1086,2,0,400,11,2008,55000,723,1,0,1,24,88,4,Detached,Brick/Tile/Stone,N,Regular,2Story,4,4,10.9150884642146,0,4210
0902406020,9750,1Story,5,6,1959,Gd,Y,984,2,0,308,6,2008,110000,984,2,0,2,0,49,3,Detached,Cinder Block,Y,Regular,1Story,5,6,11.6082356447745,0,3110
0903225050,6130,1.5Unf,5,6,1924,Gd,Y,784,2,0,0,5,2008,109500,784,2,0,2,0,84,2,NA,Brick/Tile/Stone,N,Regular,1Story,5,6,11.6036798282386,0,4510
0903226150,6000,1Story,5,7,1924,Ex,Y,949,2,1,370,7,2008,119000,949,1,0,1,0,84,3,Detached,Brick/Tile/Stone,N,Regular,1Story,5,6,11.6868787720936,0,3360
0903227080,6000,1.5Fin,6,7,1929,TA,Y,1158,3,1,208,7,2008,120000,862,1,0,1,0,79,3,Attached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.6952470217641,0,3370
0903228060,6000,1.5Fin,6,5,1939,Ex,Y,1342,2,1,240,4,2008,105000,739,2,0,2,0,69,2,Detached,Cinder Block,N,Regular,1.5Fin,6,5,11.5617156291396,0,3620
0903228090,5000,1.5Unf,6,7,1926,Ex,Y,1013,3,0,160,4,2008,113000,992,1,0,1,0,82,2,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.6351430976944,0,3010
0903231080,6240,1.5Fin,4,7,1929,Ex,Y,1136,2,0,336,8,2008,123000,704,1,1,1.1,365,79,3,Detached,Concrete/Slab,N,Regular,1.5Fin,4,6,11.7199396343545,0,4210
0903425420,10267,1Story,6,7,1918,Ex,Y,838,2,0,275,5,2008,130000,816,2,0,2,0,90,2,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.7752897294377,0,4240
0903452025,6291,1Story,6,6,1930,TA,Y,768,1,0,440,7,2008,93850,768,1,0,1,0,78,3,Detached,Brick/Tile/Stone,N,Irregular,1Story,6,6,11.4494530420146,0,4620
0903475020,8235,1Story,5,7,1955,TA,Y,825,2,0,720,6,2008,125000,825,2,0,2,190,53,3,Detached,Cinder Block,N,Irregular,1Story,5,6,11.7360690162844,0,4230
0905104110,10265,1Story,5,7,1967,Ex,Y,992,3,0,294,7,2008,145000,992,2,0,2,204,41,3,Attached,Cinder Block,N,Irregular,1Story,5,6,11.8844890214027,0,3060
0905104180,9764,1Story,5,7,1967,Ex,Y,894,3,0,450,5,2008,130000,894,2,0,2,0,41,2,Attached,Cinder Block,N,Irregular,1Story,5,6,11.7752897294377,0,3740
0905108170,7400,SFoyer,5,5,1984,TA,Y,1126,2,0,506,3,2008,152000,1060,2,0,2,178,24,2,Attached,Concrete/Slab,N,Irregular,SFoyer,5,5,11.9316357998284,0,2450
0905227050,8375,1.5Fin,5,7,1941,Gd,Y,1350,2,0,627,6,2008,152400,576,2,1,2.1,0,67,3,,Brick/Tile/Stone,N,Regular,1.5Fin,5,6,11.9342639222346,0,4420
0905401045,39104,1Story,7,7,1954,Ex,Y,1363,2,2,439,4,2008,241500,1385,2,0,2,81,54,2,Attached,Cinder Block,N,Irregular,1Story,6,6,12.3946247520747,1,350
0905452120,9360,2Story,6,8,1962,TA,Y,1269,3,0,280,11,2008,134500,621,1,1,1.1,236,46,4,Detached,Cinder Block,Y,Regular,2Story,6,6,11.809319478024,0,4360
0907135020,9525,1Story,5,6,1995,Ex,Y,1099,3,0,352,6,2008,144000,1099,1,1,1.1,278,13,3,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.8775685785581,0,2310
0907187080,9382,1Story,7,5,1999,Ex,Y,1479,3,0,577,7,2008,191000,1468,2,0,2,145,9,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.1600287070287,1,-300
0907201060,8385,SLvl,5,8,1977,TA,Y,985,3,0,328,11,2008,149900,985,2,0,2,210,31,4,Attached,Cinder Block,Y,Regular,SLvl,5,6,11.9177236840906,0,3110
0907412040,9750,1Story,7,5,2004,Ex,Y,1445,3,0,470,6,2008,186500,1445,2,0,2,35,4,3,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.136186518066,1,-120
0907418040,9627,1Story,7,5,2007,Ex,Y,1361,3,0,610,6,2008,193000,1351,2,0,2,50,1,3,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.170445467887,1,520
0907425010,4426,1Story,6,5,2004,Ex,Y,848,1,1,420,5,2008,149300,848,2,0,2,149,4,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,11.9137129835272,0,4060
0908275180,8172,1.5Fin,4,6,1954,Ex,Y,1470,4,0,548,5,2008,135000,941,2,0,2,156,54,2,Detached,Concrete/Slab,N,Regular,1.5Fin,4,6,11.8130300574205,0,2360
0909100170,5604,1Story,5,6,1925,TA,N,864,2,0,0,4,2008,98000,864,2,0,2,0,83,2,NA,Cinder Block,N,Regular,1Story,5,6,11.4927227576527,0,3950
0909252220,15564,1.5Fin,6,6,1914,Ex,Y,1264,3,0,400,1,2008,147500,676,1,0,1,424,94,1,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.901583454762,0,4090
0909277070,9260,1.5Fin,5,4,1938,TA,Y,1374,3,0,225,3,2008,110000,884,1,0,1,164,70,2,Detached,Brick/Tile/Stone,N,Irregular,1.5Fin,5,4,11.6082356447745,0,2830
0910202050,3636,1Story,4,4,1922,Fa,N,796,2,0,0,1,2008,55000,796,1,0,1,0,86,1,NA,Brick/Tile/Stone,N,Regular,1Story,4,4,10.9150884642146,0,4430
0910202100,5890,1Story,6,8,1930,Ex,Y,816,2,0,432,6,2008,120500,816,1,0,1,0,78,3,Detached,Brick/Tile/Stone,N,Regular,1Story,6,6,11.6994050319128,0,4290
0911226010,18000,1Story,3,4,1935,TA,Y,894,2,0,1248,8,2008,81000,894,1,0,1,20,73,3,Detached,Cinder Block,N,Regular,1Story,4,4,11.3022044336545,0,3740
0923225150,2665,2Story,5,6,1976,TA,Y,1304,3,1,336,6,2008,115000,264,1,1,1.1,165,32,3,Attached,Concrete/Slab,N,Regular,2Story,5,6,11.6526874073453,0,6070
0923228420,1890,SFoyer,4,7,1972,Gd,Y,630,1,0,0,6,2008,81000,630,2,0,2,88,36,3,NA,Cinder Block,N,Regular,SFoyer,4,6,11.3022044336545,0,5590
0527165020,10784,SLvl,7,5,1991,Gd,Y,1472,3,1,402,5,2007,160000,384,2,1,2.1,164,16,2,Attached,Concrete/Slab,Y,Irregular,SLvl,6,5,11.9829290942159,0,5140
0527226040,41600,1Story,5,5,1969,TA,Y,1424,3,0,828,11,2007,155000,1100,2,1,2.1,144,38,4,,Cinder Block,N,Irregular,1Story,5,5,11.9511803959013,0,1650
0527402150,10530,1Story,6,5,1971,TA,Y,981,3,0,576,3,2007,143250,981,2,1,2.1,312,36,2,Detached,Cinder Block,N,Irregular,1Story,6,5,11.8723466345769,0,3130
0527402240,7472,2Story,7,9,1972,Gd,Y,1479,4,0,484,6,2007,184000,725,2,1,2.1,32,35,3,Attached,Cinder Block,Y,Irregular,2Story,6,6,12.1226910365911,1,3420
0527404150,7340,1Story,4,6,1971,TA,Y,858,2,0,684,6,2007,110000,858,1,0,1,0,36,3,Detached,Cinder Block,N,Irregular,1Story,4,6,11.6082356447745,0,3990
0527450220,2058,2Story,6,5,1973,Ex,Y,1218,4,0,264,12,2007,113700,672,1,1,1.1,28,34,1,Detached,Cinder Block,Y,Regular,2Story,6,5,11.6413186797386,0,4200
0527451020,2016,2Story,5,5,1970,TA,Y,1302,3,0,440,4,2007,106000,630,2,1,2.1,0,37,2,Detached,Cinder Block,Y,Regular,2Story,5,5,11.5711943730942,0,4250
0527451170,1920,2Story,5,5,1971,Ex,Y,1365,2,0,440,8,2007,122500,765,2,1,2.1,276,36,3,Detached,Cinder Block,Y,Regular,2Story,5,5,11.7158663089669,0,3450
0528174010,7577,1Story,6,5,2005,Ex,Y,1362,2,1,460,6,2007,194700,1362,2,0,2,220,2,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.1792151913602,1,470
0528188160,3242,1Story,7,5,2003,Ex,Y,1405,2,1,478,3,2007,200000,1405,3,0,3,172,4,2,Attached,Concrete/Slab,Y,Regular,1Story,6,5,12.2060726455301,1,170
0531363040,7500,1Story,7,5,2006,Ex,Y,1143,3,0,0,10,2007,147000,1143,1,1,1.1,55,1,4,NA,Concrete/Slab,N,Regular,1Story,6,5,11.8981878657608,0,2000
0532479050,10751,1Story,5,5,1974,TA,Y,1037,2,0,431,8,2007,129000,1037,2,0,2,183,33,3,Attached,Cinder Block,Y,Irregular,1Story,5,5,11.7675676833438,0,2740
0533236040,2645,2Story,8,5,1999,Ex,Y,1441,2,0,492,11,2007,174000,776,2,1,2.1,206,8,4,Detached,Concrete/Slab,Y,Regular,2Story,6,5,12.0668105781966,0,3240
0533251130,16157,SLvl,5,7,1978,Ex,Y,1432,2,1,588,6,2007,194000,1360,2,1,2.1,348,29,3,Attached,Concrete/Slab,N,Irregular,SLvl,5,6,12.1756134380454,1,340
0534125120,11700,1Story,6,6,1968,Ex,Y,1152,3,0,412,9,2007,143450,912,2,1,2.1,126,39,4,Attached,Cinder Block,Y,Regular,1Story,6,6,11.8737418214095,0,3140
0534127140,8723,SFoyer,6,6,1969,Ex,Y,1082,3,0,480,1,2007,162500,973,2,0,2,160,38,1,Attached,Concrete/Slab,N,Irregular,SFoyer,6,6,11.9984332807519,0,2970
0534176140,10738,1Story,6,7,1966,Gd,Y,1093,3,1,484,11,2007,158500,1093,3,0,3,224,41,4,Attached,Cinder Block,N,Irregular,1Story,6,6,11.9735098722994,0,2350
0534201040,8050,1Story,5,6,1967,TA,Y,1107,3,0,308,3,2007,127000,949,2,0,2,152,40,2,Attached,Cinder Block,N,Regular,1Story,5,6,11.7519423654407,0,3040
0534252040,9503,1Story,5,5,1958,TA,Y,1344,2,1,484,6,2007,144000,1024,2,0,2,344,49,3,Detached,Cinder Block,N,Regular,1Story,5,5,11.8775685785581,0,2190
0534275170,12772,1Story,6,8,1960,TA,Y,958,2,0,301,4,2007,151500,958,1,0,1,0,47,2,Attached,Cinder Block,N,Irregular,1Story,6,6,11.9283409039315,0,3290
0534276070,10482,SLvl,6,8,1958,Ex,Y,1138,3,0,264,6,2007,145000,588,1,1,1.1,224,49,3,Attached,Cinder Block,Y,Regular,SLvl,6,6,11.8844890214027,0,4780
0534403420,11382,1Story,6,5,1964,TA,Y,1374,3,1,286,8,2007,147000,1130,1,1,1.1,28,43,3,Attached,Cinder Block,Y,Irregular,1Story,6,5,11.8981878657608,0,1600
0534425080,14585,1Story,6,6,1960,Ex,Y,1429,3,2,572,6,2007,181900,1144,1,1,1.1,326,47,3,Attached,Cinder Block,Y,Irregular,1Story,6,6,12.1112123645062,1,1420
0534431020,12172,1.5Unf,5,7,1940,TA,Y,908,2,0,512,10,2007,138500,822,1,0,1,500,67,4,Attached,Concrete/Slab,N,Regular,1Story,5,6,11.8386256046095,0,4070
0534476080,9600,1Story,5,6,1955,Ex,Y,1150,2,0,288,10,2007,144000,1078,2,0,2,175,52,4,Attached,Cinder Block,Y,Regular,1Story,5,6,11.8775685785581,0,2310
0534479120,9492,1.5Fin,5,5,1941,TA,Y,1376,3,1,240,4,2007,105000,768,2,0,2,0,66,2,Attached,Cinder Block,N,Regular,1.5Fin,5,5,11.5617156291396,0,3410
0535151020,8760,1Story,6,7,1957,TA,Y,936,2,0,315,9,2007,141000,936,2,0,2,219,50,4,Attached,Cinder Block,N,Regular,1Story,6,6,11.8565151693603,0,3450
0535176070,11988,1Story,6,6,1957,Ex,Y,1244,3,2,336,5,2007,150000,1244,1,1,1.1,40,50,2,Attached,Cinder Block,N,Irregular,1Story,6,6,11.9183905730783,0,1290
0535181140,12198,1Story,5,6,1955,TA,Y,1411,3,1,310,6,2007,130000,1204,1,0,1,360,52,3,Attached,Cinder Block,N,Irregular,1Story,5,6,11.7752897294377,0,1160
0535300040,10050,1Story,5,5,1955,TA,Y,1216,3,0,336,8,2007,129500,1216,2,0,2,0,52,3,Attached,Cinder Block,N,Regular,1Story,5,5,11.7714361601217,0,1490
0535301060,11556,1Story,5,9,1953,Gd,Y,1154,3,0,336,7,2007,142000,864,1,1,1.1,63,54,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.8635823365834,0,3370
0535302070,10950,1Story,6,6,1952,TA,Y,948,2,0,410,4,2007,125000,948,1,0,1,48,55,2,Detached,Cinder Block,N,Regular,1Story,6,6,11.7360690162844,0,3360
0535304170,7942,1Story,6,7,1953,TA,Y,1040,3,0,293,6,2007,136000,1040,1,1,1.1,0,54,3,Attached,Cinder Block,N,Regular,1Story,6,6,11.8204101647181,0,2720
0535327160,8400,1Story,5,5,1955,TA,Y,925,3,2,390,3,2007,116900,923,2,0,2,81,52,2,Attached,Cinder Block,N,Regular,1Story,5,5,11.6690741474601,0,3540
0535375130,10134,1.5Fin,5,6,1940,Gd,Y,1034,2,0,240,7,2007,109000,735,1,0,1,39,67,3,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.5991031612112,0,4260
0535376010,5500,1.5Unf,4,6,1956,Ex,Y,882,1,0,0,4,2007,103200,882,1,0,1,0,51,2,NA,Cinder Block,N,Regular,1Story,4,6,11.5444241320296,0,3830
0535379060,10800,1Story,4,6,1927,TA,Y,968,4,0,216,8,2007,64500,656,2,0,2,0,80,3,Detached,Brick/Tile/Stone,N,Regular,1Story,4,6,11.0744205027838,0,4780
0535451110,7200,1Story,5,8,1950,Gd,Y,864,3,0,720,7,2007,129000,864,2,0,2,194,57,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.7675676833438,0,3950
0535453080,7500,1Story,5,7,1959,Ex,Y,1040,3,0,286,7,2007,152000,1040,2,0,2,0,48,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.9316357998284,0,2720
0902106070,6000,1.5Fin,6,6,1927,TA,Y,1296,3,0,576,7,2007,127500,845,1,0,1,0,80,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.7558716435806,0,3180
0902201090,9000,1.5Fin,5,8,1900,Ex,Y,1174,2,1,576,6,2007,135000,680,1,0,1,142,107,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,5,6,11.8130300574205,0,4250
0902201130,6000,1.5Fin,3,7,1948,Ex,Y,1183,2,0,308,6,2007,120000,649,1,1,1.1,176,59,3,Detached,Cinder Block,N,Regular,1.5Fin,4,6,11.6952470217641,0,4390
0902427140,8626,1Story,4,6,1956,Gd,Y,968,2,0,331,5,2007,104500,0,1,0,1,0,51,2,Attached,Cinder Block,N,Regular,1Story,4,6,11.556942350387,0,8060
0903201090,6854,1Story,5,7,1925,TA,N,1060,1,1,308,8,2007,136500,756,2,0,2,215,82,3,Detached,Concrete/Slab,N,Regular,1Story,5,6,11.8240798936071,0,4100
0903205085,8731,1Story,5,5,1920,TA,Y,1167,3,1,495,5,2007,144000,915,1,0,1,126,87,2,Detached,Brick/Tile/Stone,N,Irregular,1Story,5,5,11.8775685785581,0,3090
0903225040,6125,1.5Fin,5,7,1939,Ex,Y,1274,3,0,224,3,2007,135000,728,2,0,2,0,68,2,Detached,Cinder Block,N,Regular,1.5Fin,5,6,11.8130300574205,0,3810
0903401070,8850,1.5Fin,6,7,1920,Ex,Y,1376,3,0,576,2,2007,165000,768,1,0,1,54,87,1,Detached,Concrete/Slab,N,Regular,1.5Fin,6,6,12.0137007528827,0,3410
0903454010,6882,2Story,6,7,1914,TA,Y,1355,3,0,0,3,2007,127000,684,1,1,1.1,136,93,2,NA,Concrete/Slab,N,Regular,2Story,6,6,11.7519423654407,0,3870
0905104090,7094,1Story,5,5,1966,TA,Y,894,3,0,384,5,2007,125000,894,1,0,1,0,41,2,Detached,Cinder Block,N,Irregular,1Story,5,5,11.7360690162844,0,3740
0905105170,8398,1Story,5,5,1967,TA,Y,943,2,0,528,6,2007,134500,943,2,0,2,132,40,3,Detached,Cinder Block,Y,Irregular,1Story,5,5,11.809319478024,0,3400
0905200010,8169,1Story,5,7,1966,Ex,Y,912,3,0,315,7,2007,129000,912,2,0,2,204,41,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.7675676833438,0,3620
0905475270,5400,1Story,5,5,1958,TA,Y,864,3,0,399,5,2007,118000,864,1,1,1.1,0,49,2,Attached,Cinder Block,N,Regular,1Story,5,5,11.6784399034478,0,3950
0906392080,7242,1Story,7,5,2005,Ex,Y,1270,2,0,524,7,2007,175900,1270,2,0,2,96,2,3,Attached,Concrete/Slab,N,Regular,1Story,6,5,12.0776709307256,1,1110
0907130060,11249,1Story,6,5,1995,Ex,Y,1200,3,0,521,8,2007,177500,1200,3,0,3,26,12,3,Attached,Concrete/Slab,N,Irregular,1Story,6,5,12.0867258878976,1,1600
0907135180,8070,1Story,4,5,1994,Ex,Y,990,3,0,0,8,2007,123600,990,2,0,2,0,13,3,NA,Concrete/Slab,N,Regular,1Story,4,5,11.7248058240057,0,3070
0907192120,10665,1Story,7,5,2003,Ex,Y,1479,3,0,558,6,2007,226000,1453,3,0,3,173,4,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.3282902782544,1,-220
0907202100,16300,1Story,5,4,1977,TA,Y,907,3,0,308,1,2007,130000,876,2,0,2,0,30,1,Attached,Cinder Block,N,Irregular,1Story,5,4,11.7752897294377,0,3810
0907295040,17227,1Story,8,5,1999,Ex,Y,1341,1,1,482,1,2007,246900,1341,2,1,2.1,324,8,1,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.4167386753332,1,610
0908152280,7024,1Story,5,5,2005,Gd,Y,1090,2,0,450,6,2007,157000,1090,2,1,2.1,49,2,3,Attached,Concrete/Slab,N,Regular,1Story,5,5,11.9640010843304,0,2370
0909251040,6821,1.5Fin,6,7,1921,Gd,Y,1298,2,1,240,8,2007,146500,651,2,0,2,216,86,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.8947807074392,0,4150
0909252150,4000,2Story,7,8,1930,TA,Y,1098,2,1,216,6,2007,148500,531,2,0,2,0,77,3,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.9083402372248,0,5150
0909254100,7155,2Story,6,8,1926,TA,Y,1461,3,1,225,7,2007,135000,686,1,0,1,0,81,3,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.8130300574205,0,3650
0909254150,5362,1.5Fin,5,6,1910,Ex,Y,1250,3,1,552,11,2007,139000,661,2,0,2,242,97,4,Detached,Concrete/Slab,N,Regular,1.5Fin,5,6,11.8422292121128,0,4200
0909281020,6221,1.5Fin,5,5,1941,Ex,Y,1355,3,0,528,10,2007,140000,728,2,0,2,144,66,4,Detached,Cinder Block,N,Irregular,1.5Fin,5,5,11.8493977015914,0,3650
0909451130,1782,2Story,6,6,1980,Gd,Y,1045,2,1,462,12,2007,123900,516,1,0,1,180,27,1,Detached,Cinder Block,N,Regular,2Story,6,6,11.7272300676172,0,5330
0909455060,3907,1Story,8,5,1988,Gd,Y,1020,1,0,509,3,2007,200000,1004,2,0,2,135,19,2,Attached,Cinder Block,N,Irregular,1Story,6,5,12.2060726455301,1,2940
0914452090,12150,SFoyer,6,6,1979,TA,Y,1299,2,1,486,1,2007,183500,1001,3,0,3,84,28,1,Attached,Cinder Block,N,Irregular,SFoyer,6,6,12.1199699464767,1,2400
0914478020,8750,SLvl,7,6,1975,TA,Y,918,3,0,360,3,2007,148000,852,1,1,1.1,276,32,2,Attached,Cinder Block,Y,Irregular,SLvl,6,6,11.9049675527462,0,3900
0916326040,16905,1Story,5,6,1959,Gd,Y,1328,2,2,308,7,2007,170000,1350,1,2,1.2,104,48,3,Attached,Cinder Block,N,Regular,1Story,5,6,12.0435537160324,0,590
0923204050,25286,1Story,4,5,1963,Gd,Y,1040,3,0,648,1,2007,132250,1064,2,0,2,0,44,1,Attached,Concrete/Slab,N,Regular,1Story,4,5,11.7924493497205,0,2600
0923226300,1504,2Story,4,4,1972,TA,Y,1092,3,0,253,5,2007,85500,546,1,1,1.1,0,35,2,Attached,Cinder Block,N,Regular,2Story,4,4,11.3562716549248,0,5090
0923228390,1890,2Story,4,3,1976,Ex,Y,1092,3,0,286,4,2007,75190,546,1,1,1.1,0,31,2,Attached,Cinder Block,N,Regular,2Story,4,4,11.227773522372,0,5090
0923229100,15957,SLvl,6,6,1977,TA,Y,1356,3,1,528,9,2007,188000,1244,4,0,4,1424,30,4,Attached,Concrete/Slab,N,Irregular,SLvl,6,6,12.144197241812,1,1070
0923230010,8286,2Story,5,7,1977,Ex,Y,1432,3,1,531,6,2007,157000,716,2,1,2.1,376,30,3,Attached,Concrete/Slab,N,Irregular,2Story,5,6,11.9640010843304,0,3560
0526302030,11027,1Story,6,5,1954,Gd,Y,1293,2,0,452,5,2006,149900,1178,3,0,3,280,52,2,Attached,Cinder Block,Y,Irregular,1Story,6,5,11.9177236840906,0,1520
0527450210,1953,2Story,6,5,1973,TA,Y,987,2,0,264,6,2006,83000,483,1,1,1.1,72,33,3,Detached,Cinder Block,Y,Regular,2Story,6,5,11.3265958867787,0,5610
0527450460,1890,2Story,6,7,1972,Ex,Y,1030,3,0,264,7,2006,116000,494,1,1,1.1,0,34,3,Detached,Cinder Block,Y,Regular,2Story,6,6,11.6613454700885,0,5470
0527452310,7838,SFoyer,5,5,1967,TA,Y,900,3,1,288,12,2006,123000,864,2,0,2,319,39,1,Attached,Cinder Block,N,Regular,SFoyer,5,5,11.7199396343545,0,3880
0527453070,2280,1Story,7,7,1976,TA,Y,1055,2,0,319,4,2006,137500,1055,3,0,3,29,30,2,Attached,Cinder Block,N,Regular,1Story,6,6,11.8313791960887,0,2620
0528174080,7052,1Story,7,5,2005,Ex,Y,1364,2,1,484,6,2006,185850,1364,3,0,3,228,1,3,Attached,Concrete/Slab,Y,Irregular,1Story,6,5,12.1326951757254,1,450
0531452100,7175,1Story,6,5,1991,Gd,Y,1217,2,0,484,6,2006,151000,1217,2,0,2,64,15,3,Attached,Concrete/Slab,N,Regular,1Story,6,5,11.925035115797,0,1480
0532351060,9100,1Story,5,4,1962,Ex,Y,988,3,0,624,7,2006,129500,988,2,0,2,0,44,3,Detached,Cinder Block,Y,Regular,1Story,5,4,11.7714361601217,0,3080
0532378070,13526,1Story,5,6,1965,TA,Y,935,3,0,288,11,2006,137000,935,2,0,2,180,41,4,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.8277362048102,0,3460
0533223080,2651,2Story,7,5,2000,Ex,Y,1382,3,0,490,4,2006,165000,673,3,1,3.1,203,6,2,Detached,Concrete/Slab,N,Regular,2Story,6,5,12.0137007528827,0,3870
0533253050,3640,1Story,8,5,1980,TA,Y,1036,1,1,484,9,2006,188000,1036,2,0,2,241,26,4,Detached,Cinder Block,N,Irregular,1Story,6,5,12.144197241812,1,2750
0534201230,9600,1Story,5,5,1968,Gd,Y,1051,3,0,504,7,2006,142000,1051,2,0,2,0,38,3,Attached,Cinder Block,N,Regular,1Story,5,5,11.8635823365834,0,2640
0534226060,9230,1Story,5,8,1965,Gd,Y,1200,1,0,884,10,2006,146000,864,2,1,2.1,64,41,4,Detached,Cinder Block,Y,Regular,1Story,5,6,11.8913619006904,0,3280
0534403440,9350,2Story,5,6,1964,Gd,Y,1440,4,1,480,7,2006,157500,720,1,1,1.1,32,42,3,Attached,Cinder Block,N,Regular,2Story,5,6,11.9671807372478,0,3520
0534430050,8550,1Story,6,8,1934,Ex,Y,816,2,1,240,7,2006,129800,816,2,0,2,228,72,3,Attached,Cinder Block,N,Regular,1Story,6,6,11.7737500832521,0,4290
0534451130,5825,1Story,4,5,1926,Gd,Y,747,1,0,528,6,2006,79900,600,1,0,1,0,80,3,Detached,Concrete/Slab,Y,Irregular,1Story,4,5,11.2885311317543,0,5510
0534455080,9600,1Story,5,6,1961,TA,Y,1433,3,1,441,6,2006,161000,1251,2,0,2,144,45,3,Attached,Cinder Block,N,Regular,1Story,5,6,11.9891596439666,0,880
0534476100,9600,1Story,5,5,1951,Ex,Y,1216,3,0,280,5,2006,135000,1056,2,0,2,0,55,2,Attached,Cinder Block,Y,Regular,1Story,5,5,11.8130300574205,0,2290
0535152070,8163,SLvl,5,6,1959,TA,Y,1144,3,1,796,3,2006,143000,1144,2,0,2,86,47,2,Attached,Cinder Block,Y,Regular,SLvl,5,6,11.870599909242,0,1990
0535176050,11600,1Story,6,5,1960,TA,Y,1383,3,0,292,4,2006,145250,1383,1,1,1.1,45,46,2,Attached,Cinder Block,Y,Regular,1Story,6,5,11.8862116747141,0,320
0535177100,9610,1Story,6,6,1958,Ex,Y,1336,3,1,488,12,2006,162000,1121,1,1,1.1,80,48,1,Attached,Cinder Block,Y,Irregular,1Story,6,6,11.9953516142145,0,1720
0535179050,14850,1Story,5,5,1957,TA,Y,1092,2,1,299,5,2006,141000,1092,2,0,2,390,49,2,Attached,Cinder Block,N,Irregular,1Story,5,5,11.8565151693603,0,2360
0535180070,10011,1Story,5,6,1957,TA,Y,1236,2,1,447,5,2006,134450,1070,1,1,1.1,0,49,2,Attached,Cinder Block,Y,Irregular,1Story,5,6,11.808947661697,0,2180
0535303050,11310,1Story,6,5,1954,Ex,Y,1375,2,1,451,6,2006,140000,1367,1,0,1,30,52,3,Attached,Cinder Block,N,Regular,1Story,6,5,11.8493977015914,0,420
0535304020,12778,1Story,5,6,1952,Ex,Y,1008,2,0,280,1,2006,139500,1008,2,0,2,154,54,1,Attached,Cinder Block,N,Regular,1Story,5,6,11.8458198802435,0,2940
0535325130,7700,SLvl,5,7,1956,Ex,Y,1145,3,0,684,9,2006,127000,301,1,0,1,0,50,4,Detached,Cinder Block,N,Regular,SLvl,5,6,11.7519423654407,0,6210
0535355100,7000,1.5Fin,6,6,1924,Gd,Y,1310,2,0,398,5,2006,112000,617,2,0,2,0,82,2,Attached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.6262541502772,0,4300
0535375040,10410,1Story,3,8,1930,Ex,Y,713,2,0,371,10,2006,99800,713,1,0,1,75,76,4,Detached,Concrete/Slab,N,Regular,1Story,4,6,11.5109234622995,0,5010
0535376090,5400,1Story,5,7,1954,Ex,Y,833,2,0,326,8,2006,117000,833,1,0,1,0,52,3,Detached,Cinder Block,N,Regular,1Story,5,6,11.6699292137798,0,4170
0535377070,10914,1Story,3,3,1929,Fa,N,715,2,0,660,8,2006,68000,715,1,0,1,112,77,3,Detached,Cinder Block,N,Regular,1Story,4,4,11.1272629841582,0,5000
0535382130,10800,1.5Fin,5,8,1936,Gd,Y,1466,3,1,566,4,2006,170000,796,2,1,2.1,457,70,2,Attached,Cinder Block,N,Regular,1.5Fin,5,6,12.0435537160324,0,3090
0535402100,10184,SLvl,6,5,1963,TA,Y,1146,3,1,294,6,2006,165000,1083,1,1,1.1,420,43,3,Attached,Cinder Block,Y,Regular,SLvl,6,5,12.0137007528827,0,2290
0535453160,7560,1Story,5,5,1959,TA,Y,1040,3,0,286,7,2006,133700,1040,1,0,1,140,47,3,Attached,Cinder Block,N,Regular,1Story,5,5,11.80335376309,0,2720
0535454030,8544,1Story,3,4,1950,Fa,N,1040,2,0,400,12,2006,81400,0,2,0,2,0,56,1,Detached,Concrete/Slab,N,Regular,1Story,4,4,11.3071305519906,0,7920
0535478110,7000,SFoyer,5,5,1962,TA,Y,1025,3,0,0,3,2006,124000,1025,2,0,2,176,44,2,NA,Cinder Block,N,Regular,SFoyer,5,5,11.7280368445871,0,2830
0902104020,9600,1.5Fin,6,8,1900,Ex,Y,1416,3,0,400,6,2006,156500,780,1,1,1.1,24,106,3,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,6,6,11.9608112889623,0,3270
0902108060,3960,2Story,7,8,1930,TA,N,1004,2,1,200,7,2006,105000,502,1,0,1,280,76,3,Detached,Brick/Tile/Stone,N,Regular,2Story,6,6,11.5617156291396,0,5480
0903232170,6240,1.5Fin,4,5,1947,Gd,N,912,2,0,0,7,2006,80500,0,1,0,1,0,59,3,NA,Concrete/Slab,N,Regular,1.5Fin,4,5,11.2960124634066,0,8180
0903400030,11672,1Story,5,5,1925,TA,Y,816,2,0,210,7,2006,109000,816,1,0,1,168,81,3,Detached,Brick/Tile/Stone,N,Irregular,1Story,5,5,11.5991031612112,0,4290
0903430130,4118,1Story,4,4,1941,Fa,N,693,2,0,0,3,2006,52500,693,1,0,1,20,65,2,NA,Cinder Block,N,Irregular,1Story,4,4,10.8685684485797,0,5150
0904100030,12375,1.5Fin,5,5,1951,TA,Y,1422,3,1,288,6,2006,137500,806,2,0,2,0,55,3,Detached,Cinder Block,Y,Regular,1.5Fin,5,5,11.8313791960887,0,3130
0905103180,10366,SLvl,6,7,1964,TA,Y,934,2,0,336,7,2006,132000,912,1,1,1.1,77,42,3,Attached,Cinder Block,N,Irregular,SLvl,6,6,11.7905572015685,0,3570
0905107070,7844,2Story,6,7,1978,TA,Y,1400,3,1,440,3,2006,149500,672,1,1,1.1,0,28,2,Attached,Cinder Block,Y,Regular,2Story,6,6,11.9150516718128,0,3840
0905107220,9535,1Story,5,5,1967,TA,Y,1458,3,1,512,7,2006,165000,1176,2,1,2.1,284,39,3,Attached,Cinder Block,Y,Irregular,1Story,5,5,12.0137007528827,0,1200
0905107300,7176,SLvl,6,6,1978,Fa,Y,1040,3,1,616,7,2006,160500,960,2,0,2,311,28,3,Detached,Cinder Block,Y,Irregular,SLvl,6,6,11.9860492215522,0,3120
0905202210,13050,1Story,5,6,1963,Ex,Y,1000,1,2,575,4,2006,164000,1000,2,0,2,238,43,2,Attached,Cinder Block,N,Regular,1Story,5,6,12.0076217068063,0,3000
0905451410,10519,1Story,5,8,1955,Gd,Y,1057,3,0,288,3,2006,137000,1057,1,1,1.1,0,51,2,Attached,Cinder Block,Y,Regular,1Story,5,6,11.8277362048102,0,2600
0905475150,6420,1Story,5,7,1952,Fa,Y,1148,2,0,308,9,2006,123500,980,1,1,1.1,0,54,4,Detached,Concrete/Slab,N,Irregular,1Story,5,6,11.7239964350501,0,2800
0905480160,7585,1.5Fin,5,3,1948,Fa,Y,1456,4,1,280,8,2006,91500,810,2,1,2.1,0,58,3,Detached,Cinder Block,N,Regular,1.5Fin,5,4,11.4240942512636,0,3040
0907202140,9920,1Story,5,6,1969,TA,Y,971,3,1,300,5,2006,128500,971,1,1,1.1,0,37,2,Attached,Cinder Block,N,Irregular,1Story,5,6,11.7636841833174,0,3200
0907230240,3612,2Story,6,5,1993,Ex,Y,1320,3,0,484,6,2006,137000,630,2,1,2.1,48,13,3,Detached,Concrete/Slab,N,Irregular,2Story,6,5,11.8277362048102,0,4210
0909103020,11388,1.5Fin,4,7,1910,TA,N,1273,3,0,275,9,2006,121000,616,1,0,1,212,96,4,Detached,Brick/Tile/Stone,N,Regular,1.5Fin,4,6,11.7035458245788,0,4370
0911225110,8520,1.5Fin,3,5,1916,Fa,N,936,2,0,0,4,2006,78000,216,1,0,1,0,90,2,NA,Concrete/Slab,N,Regular,1.5Fin,4,5,11.2644641056717,0,7050
0914476130,11080,SLvl,6,6,1975,TA,Y,1210,3,0,528,5,2006,148000,1128,3,0,3,0,31,2,Attached,Cinder Block,Y,Regular,SLvl,6,6,11.9049675527462,0,1940
0923202025,7020,SFoyer,7,5,1997,Gd,Y,1368,2,0,784,11,2006,215000,1288,4,0,4,48,9,4,Attached,Concrete/Slab,Y,Regular,SFoyer,6,5,12.2783933071098,1,820
0923225510,10172,1Story,5,7,1968,Ex,Y,874,3,0,288,10,2006,126500,864,2,0,2,120,38,4,Attached,Cinder Block,N,Irregular,1Story,5,6,11.7479975871497,0,3930
0923226290,1484,2Story,4,4,1972,TA,Y,1092,3,0,253,5,2006,79400,546,1,1,1.1,0,34,2,Attached,Cinder Block,N,Regular,2Story,4,4,11.2822536472352,0,5090
0923400125,10441,SFoyer,5,5,1992,TA,Y,970,3,0,0,7,2006,132000,912,1,1,1.1,112,14,3,NA,Concrete/Slab,N,Regular,SFoyer,5,5,11.7905572015685,0,3500
0924100070,10010,1Story,5,5,1974,Gd,Y,1389,2,1,418,4,2006,170000,1389,2,0,2,278,32,2,Attached,Cinder Block,N,Regular,1Story,5,5,12.0435537160324,0,280
;;;;
run;



%let text1=%str(Your SAS practice files are stored in this location:);
%put;
%put &text1;
%put &filemac;
%put;
%put &sasmac;

options source notes ls=80;

