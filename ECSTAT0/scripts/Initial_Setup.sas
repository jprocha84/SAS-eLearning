/*************************************************************\
| Copyright (C) 2014 by SAS Institute Inc., Cary, NC, USA.    |
|                                                             |
| SAS (R) is a registered trademark of SAS Institute Inc.     |
|                                                             |
| This program sets up practice data for the SAS e-course     |
| ECSTAT0R.                                                     |
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



%let text1=%str(Your SAS practice files are stored in this location:);
%put;
%put &text1;
%put &filemac;
%put;
%put &sasmac;

options source notes ls=80;

