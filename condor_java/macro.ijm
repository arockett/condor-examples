//Set PATH
var patho="./";

//Open bot.tif file and make inverse
open(patho+"bot.tif");
open(patho+"sel1.roi");
run("Make Inverse");

open(patho+"sl1.tif");
open(patho+"sel1.roi");


//Multiply inv(bot.tif) with sl1.tif and save as sl1new.tif
imageCalculator("Multiply create", "bot.tif","sl1.tif");
saveAs("Tiff", patho+"sl1new.tif");

