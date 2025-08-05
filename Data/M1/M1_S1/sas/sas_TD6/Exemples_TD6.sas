/*Importation store.csv*/
PROC IMPORT OUT= WORK.store
            DATAFILE= "C:\MySAS\store.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=yes;
     DATAROW=2; 
RUN;
PROC PRINT;
RUN;

*Histogramme;
PROC SGPLOT DATA = store;
 HISTOGRAM storeSize;
 TITLE "Quantit� des produits stock�s";
RUN;
*Histogramme avec densit�;
PROC SGPLOT DATA = store;
 HISTOGRAM storeSize;
 DENSITY storeSize;
 TITLE "Quantit� des produits stock�s avec leur densit�";
RUN;
* Colonnes (Bar Charts);
PROC SGPLOT DATA = store;
 VBAR storetypeID;
 TITLE 'Produits stock�s par cat�gorie';
RUN; 
PROC SGPLOT DATA = store;
 VBAR storetypeID / GROUP = cityID;
 TITLE 'Produits stock�s par cat�gorie et Villes';
RUN; 
PROC SGPLOT DATA = store;
 VBAR cityID / RESPONSE = storeSize;
 TITLE 'Quantit� des Produits stock�s par Ville';
RUN; 
* S�rie de donn�es (Series plot);
PROC SGPLOT DATA = store;
 SERIES X = storeSize Y = cityID;
 TITLE 'S�rie des quantit�s des produits par ville';
RUN;
/*Ouverture*/
proc sgplot data=store;
   title1 "Quantit� des produits par cat�gorie";
   styleattrs datacolors=(red green purple orange cyan) backcolor=vpav wallcolor=pwh;
   vbox storeSize / category=storetypeID group=storetypeID;
 
run;

