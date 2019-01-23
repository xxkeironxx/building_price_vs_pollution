# Project information

## Project pourposes
 - Get a historical of contamination
 - Get a model to explain building's price in valencia
 - Compare contamination with building's price and purpose a new factor to
 determinate building's price

## Pollution data
Pollution data has been taken from valencia's city hall public data.

The measured data is from the date 01/01/2014 until 08/31/2017.

We've taken different formats of the data becase not all formats contain the same
data. In our case, we needed the 'csv' format for the main pollution data and the
'kml' format fot the environmental station's location.

Environmental stations location:
![Environmental Stations](https://github.com/osmuogar/cda/blob/master/project/images/environmental_stations.png)

Minimum distance between stations:
![Minimum distance](https://github.com/osmuogar/cda/blob/master/project/images/min_distance.png)

Data in stations:

| Name| Data |
|---|---|
| Jardines de Viveros   | Dióxido de azufre (SO2),Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Ozono,Benceno (Benc),Tolueno (Tolue),Xileno (Xilen),Nivel de presión sonora (SPL),Partículas PM2.5,Partículas PM10,Niquel (Ni),Arsénico (As),Plomo (Pb),Benzo(a)pireno (BaP),Cadmio (Cd)|
| Avda. de Francia, 60 | Dióxido de azufre (SO2),Monóxido de carbono (CO),Ozono,Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Partículas PM10,Partículas PM2.5,Partículas PM1,Velocidad de viento (Veloc.) |
| Avda. Tres Cruces s/n (Parking Cementerio de Valencia) | Dióxido de azufre (SO2),Ozono,Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Partículas PM10,Niquel (Ni),Arsénico (As),Plomo (Pb),Benzo(a)pireno (BaP),Cadmio (Cd) |
| Campus de la U. Politécnica. Avda. Tarongers | Dióxido de azufre (SO2),Ozono,Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Partículas PM10,Partículas PM2.5,Partículas PM1 |
| Avda. Pío Baroja - Avda. General Avilés | Dióxido de azufre (SO2),Monóxido de carbono (CO),Ozono,Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Partículas PM10,Partículas PM2.5,Partículas PM1 |
| C/ Filipinas, s/n | Dióxido de azufre (SO2),Monóxido de carbono (CO),Ozono,Óxidos de nitrógeno totales (NOx),Monóxido de nitrógeno (NO),Dióxido de nitrógeno (NO2),Partículas PM10,Nivel de presión sonora (SPL),Velocidad de viento (Veloc.),Temperatura media (Temp.),Humedad relativa (H.Rel.),Radiación solar (R.Sol.),Presión barométrica (Pres.) |

Common data:

| NAME | SO2 | NOx | NO | NO2 | O3 | Benc | Tolue | Xilen | SPL | PM2.5 | PM10 | Ni |  As | Pb | BaP | Cd | CO | PM1 | viento | Temp | H.Rel. | R.Sol. | Pres. |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Jardines de viveros |x|x|x|x|x|x|x|x|x|x|x|x|x|x|x|x||||||||
| Avda. de Francia |x|x|x|x|x||||||x|x|x|x|x|x|x|||||||
| Avda. Tres Cruces |x|x|x|x|x||||||x|x|x|x|x|x||||||||
| U. Politécnica |x|x|x|x|x|||||x|x|||||||x|||||||
| Avda. Pío Baroja |x|x|x|x|x|||||x|x||||||x|||||||
| C/Filipinas |x|x|x|x|x||||x||x||||||||x|x|x|x|x|

## Idealista API
Idealista gave us acces to it's api with a maximum of 100 requests per month.

The way the requests have been made it's crucial to gain as much information as
possible, thus the requests have been optimized to obtain the desired data.

It's been made a test to view the point with the minimum number of buidings, and
finally the minimum was found at 359 by 'Avda. Pío Baroja'. As the calls returns
items by 50 each row, it's been decided to take 350 items from each point.

To make the requests the following steps have been followed:

1 - Obtain a token from idealista's auth method

2 - Insert important parameters in request:
  - Central coordinates of request
  - Type of building requested: 'homes'
  - Max distance of the building from our central coordinates: 945 meters
  - Order items by: instance from center
  - Sort items: asc by distance from center
  - Max items per page (max allowed: 50)
  - Num of the page of the request

3 - Clenaning data
  - Join all different responses depending on the central point
  - Anonimize data
## Point One: Pollution Histogram
### PM10
anual – 50

Zona3 moderada(25%-50%)

Partículas sólidas o líquidas dispersas en la atmósfera (su diámetro inferior de
10micras) como polvo, cenizas, ho- llín, partículas metálicas, cemento o polen.
Tiene la particularidad de penetrar en el aparato respiratorio hasta los alvéolos
pulmonares. 

Fuentes principales 

De la combustión industrial y doméstica del carbón, de los procesos industriales,
incendios, erosión eólica y erupciones volcánicas, de las construcciones,
demoliciones y otros. 

Salud

produce irritación en las vías respiratorias. Su acumulación en los pulmones
origina enfermedades como la silicosis y la asbestosis. Agravan el asma y las
enfermedades cardiovasculares.

### Ozono
8horas-160

El ozono es un gas compuesto de tres átomos de oxígeno. Se denomina oxidante y
capta electrones de otras moléculas, iniciando con esto reacciones en cadenas y
perturbando las estructuras vitales en las células. El ozono recibe el nombre de
smog fotoquímico. Se forma en la baja atmósfera ediante reacciones químicas de
compuestos orgánicos volátiles y el bióxido de nitró- geno en presencia de la
luz. Las temperaturas elevadas estimulan la reacción fotoquímica.

Salud

produce irritación de los ojos, nariz, y del tracto respiratorio. Agrava las
enfermedades respiratorias y cardiovasculares. Los síntomas se manifiestan por
dolor de pecho, tos, jadeo, congestión nasal y pulmonar, garganta irritada,
náuseas, respiración acelerada.

### Dióxido de nitrógeno (N02)
anual-100

Zona3 moderada(25%-50%)

Zona4 marginal (10%-25%)

Es un gas amarillo parduzco picante que da al smog su característica color café.
Es producido por reacción fotoquímica de óxido nitroso (NO) en el aire. El NO2
es también un oxidante, con capacidad de quitar electrones a otras moléculas.

Fuentes principales

Se produce en la combustión de altas temperaturas en industrias y vehículos,
tormentas eléctricas y en las reacciones químicas atmosféricas.
 
Salud

Produce irritación a los pulmones y daña las células que revisten los pulmones.
No se presentan síntomas a menos que se trate de concentraciones muy altas; el
mayor daño aparece de 5 a 72 horas después de la exposición causando edema pulmonar.
Los niños que habitan en casas con calefacción presentan infecciones respiratorias
(resfriados comunes). Algunos de los síntomas son: descarga nasal, dolor de cabeza,
mareo y dificultad al respirar.

## Point Two: House Price Model
### Data summary
This is a summary of the data we are working with:

![Summary](https://github.com/osmuogar/cda/blob/master/project/images/summary_idealista.png)

With some interesting plots which can give us a lot of information:

![general](https://github.com/osmuogar/cda/blob/master/project/images/general.png)

Price of he m² in the area:

![priceByArea](https://github.com/osmuogar/cda/blob/master/project/images/priceByArea.png)

Sice of the building:

![size](https://github.com/osmuogar/cda/blob/master/project/images/size.png)

Number of rooms in the building:

![rooms](https://github.com/osmuogar/cda/blob/master/project/images/rooms.png)

Number of bathrooms in the building:

![bathrooms](https://github.com/osmuogar/cda/blob/master/project/images/bathrooms.png)

Building's floor:

![floor](https://github.com/osmuogar/cda/blob/master/project/images/floor.png)

Building's type:

![propertyType](https://github.com/osmuogar/cda/blob/master/project/images/propertyType.png)

¿Is a new development?:

![newDevelopment](https://github.com/osmuogar/cda/blob/master/project/images/newDevelopment.png)

¿Does the building has exteior?:

![exterior](https://github.com/osmuogar/cda/blob/master/project/images/exterior.png)

¿Does the building has lift?:

![hasLift](https://github.com/osmuogar/cda/blob/master/project/images/hasLift.png)

¿Does the building's annuncement has video?:

![hasVideo](https://github.com/osmuogar/cda/blob/master/project/images/hasVideo.png)

### Correlation matrix
| |"idealista.numPhotos"|"idealista.floor"|"idealista.price"|"idealista.size"|"idealista.rooms"|"idealista.bathrooms"|"idealista.distance"|"idealista.priceByArea"|
|------|---------------------|-----------------|-----------------|----------------|-----------------|---------------------|--------------------|-----------------------|
|"idealista.numPhotos"|1|0.0228663859753944|0.200127598819606|0.217131543943512|0.158056190383887|0.243583953981404|0.0265132182549054|0.154771666204187|
|"idealista.floor"|0.0228663859753944|1|-0.0629873814735868|-0.0678433766320239|-0.111935104262641|-0.078521295087387|0.0339933426616476|-0.0324798341522402|
|"idealista.price"|0.200127598819606|-0.0629873814735868|1|0.819939447805392|0.384216843210799|0.664279454640393|-0.153181368422473|0.772428958461427|
|"idealista.size"|0.217131543943512|-0.0678433766320239|0.819939447805392|1|0.59869868308806|0.755402544974632|-0.119885827351203|0.385444883640686|
|"idealista.rooms"|0.158056190383887|-0.111935104262641|0.384216843210799|0.59869868308806|1|0.483503546307477|-0.102700130563136|0.0236068448493952|
|"idealista.bathrooms"|0.243583953981404|-0.078521295087387|0.664279454640393|0.755402544974632|0.483503546307477|1|-0.0651835603408353|0.426240897826799|
|"idealista.distance"|0.0265132182549054|0.0339933426616476|-0.153181368422473|-0.119885827351203|-0.102700130563136|-0.0651835603408353|1|-0.176255292679035|
|"idealista.priceByArea"|0.154771666204187|-0.0324798341522402|0.772428958461427|0.385444883640686|0.0236068448493952|0.426240897826799|-0.176255292679035|1|

### House price model
Call:
lm(formula = price ~ priceByArea + size + rooms + bathrooms + 
    floor + numPhotos + distance, data = train)

Residuals:

  | Min     | 1Q     | Median| 3Q    | Max    |
  |---------|--------|-------|-------|--------|
  | -490213 | -34060 | -4722 | 27031 | 961095 |

Coefficients:

  |             | Estimate   | Std. Error | t value | Pr(>mod(t))  |
  |-------------|------------|------------|---------|--------------|
  | (Intercept) | -3.427e+05 |  1.077e+04 | -31.831 | < 2e-16 ***  |
  | priceByArea |  1.445e+02 |  2.363e+00 | 61.170  | < 2e-16 ***  |
  | size        |  2.897e+03 |  5.694e+01 | 50.872  | < 2e-16 ***  |
  | rooms       |  3.475e+03 |  2.585e+03 | 1.344   | 0.1791       |
  | bathrooms   | -2.435e+04 |  4.338e+03 | -5.612  | 2.38e-08 *** |
  | floor       | -4.351e+02 |  4.177e+02 | -1.042  |  0.2977      |
  | numPhotos   | -2.703e+02 |  1.991e+02 | -1.358  |  0.1748      |
  | distance    |  2.069e+01 |  9.076e+00 |  2.280  |  0.0227 *    |

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 73830 on 1481 degrees of freedom
Multiple R-squared:  0.9152,	Adjusted R-squared:  0.9148 
F-statistic:  2283 on 7 and 1481 DF,  p-value: < 2.2e-16

  | RMSE      | MAE        |
  |-----------|------------|
  |71173.29 € | 43755.22 € |

## Point Three: Pollution and Building's price
Building distance from environmental stations:

![distance](https://github.com/osmuogar/cda/blob/master/project/images/distance.png)


||"idealista.numPhotos"|"idealista.floor" | "idealista.price" | "idealista.size" | "idealista.rooms" | "idealista.bathrooms" | "idealista.distance" | "idealista.priceByArea" | "idealista.Ozono" | "idealista.NO" | "idealista.NO2" | "idealista.PM10" | "idealista.NOx"|
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
|"idealista.numPhotos" | 1 | 0.0228663859753944 | 0.200127598819606 | 0.217131543943512 | 0.158056190383887 | 0.243583953981404 | 0.0265132182549054 | 0.154771666204187 | 0.0299027282137369 | -0.0684711781941785 | -0.0443662045293524 | -0.157177165607272 | -0.0596412976464541|
|"idealista.floor" | 0.0228663859753944 | 1 | -0.0629873814735868 | -0.0678433766320239 | -0.111935104262641 | -0.078521295087387 | 0.0339933426616476 | -0.0324798341522402 | -0.064030392317771 | 0.066285013511549 | 0.0621450640510698 | 0.054317755166048 | 0.06500682553748|
|"idealista.price" | 0.200127598819606 | -0.0629873814735868 | 1 | 0.819939447805392 | 0.384216843210799 | 0.664279454640393 | -0.153181368422473 | 0.772428958461427 | 0.309589155361494 | -0.331334545104012 | -0.338441641810372 | -0.306179204529924 | -0.338175926482031|
|"idealista.size" | 0.217131543943512 | -0.0678433766320239 | 0.819939447805392 | 1 | 0.59869868308806 | 0.755402544974632 | -0.119885827351203 | 0.385444883640686 | 0.183123846230245 | -0.20132672144859 | -0.204986819708456 | -0.207723695499212 | -0.205228014871553|
|"idealista.rooms" | 0.158056190383887 | -0.111935104262641 | 0.384216843210799 | 0.59869868308806 | 1 | 0.483503546307477 | -0.102700130563136 | 0.0236068448493952 | 0.0353876843697189 | -0.0254925299774846 | -0.0323438471213082 | -0.0185278264248089 | -0.0282142820910945|
|"idealista.bathrooms" | 0.243583953981404 | -0.078521295087387 | 0.664279454640393 | 0.755402544974632 | 0.483503546307477 | 1 | -0.0651835603408353 | 0.426240897826799 | 0.110558107113447 | -0.148428948214802 | -0.133343045457453 | -0.226600371910357 | -0.144176611464903|
|"idealista.distance" | 0.0265132182549054 | 0.0339933426616476 | -0.153181368422473 | -0.119885827351203 | -0.102700130563136 | -0.0651835603408353 | 1 | -0.176255292679035 | -0.0198076446695443 | -0.107317510822303 | -0.0148488432041438 | -0.0660165670498725 | -0.0711809389607002|
|"idealista.priceByArea" | 0.154771666204187 | -0.0324798341522402 | 0.772428958461427 | 0.385444883640686 | 0.0236068448493952 | 0.426240897826799 | -0.176255292679035 | 1 | 0.370185747034997 | -0.396772844486748 | -0.397596793482065 | -0.371852757635007 | -0.401644125140688|
|"idealista.Ozono" | 0.0299027282137369 | -0.064030392317771 | 0.309589155361494 | 0.183123846230245 | 0.0353876843697189 | 0.110558107113447 | -0.0198076446695443 | 0.370185747034997 | 1 | -0.958283852176848 | -0.985918868081585 | -0.244777442135839 | -0.977826436114908|
|"idealista.NO" | -0.0684711781941785 | 0.066285013511549 | -0.331334545104012 | -0.20132672144859 | -0.0254925299774846 | -0.148428948214802 | -0.107317510822303 | -0.396772844486748 | -0.958283852176848 | 1 | 0.962091108164532 | 0.462442936294359 | 0.993252256500626|
|"idealista.NO2" | -0.0443662045293524 | 0.0621450640510698 | -0.338441641810372 | -0.204986819708456 | -0.0323438471213082 | -0.133343045457453 | -0.0148488432041438 | -0.397596793482065 | -0.985918868081585 | 0.962091108164532 | 1 | 0.331897616366495 | 0.987169739054438|
|"idealista.PM10" | -0.157177165607272 | 0.054317755166048 | -0.306179204529924 | -0.207723695499212 | -0.0185278264248089 | -0.226600371910357 | -0.0660165670498725 | -0.371852757635007 | -0.244777442135839 | 0.462442936294359 | 0.331897616366495 | 1 | 0.415718422242103|
|"idealista.NOx" | -0.0596412976464541 | 0.06500682553748 | -0.338175926482031 | -0.205228014871553 | -0.0282142820910945 | -0.144176611464903 | -0.0711809389607002 | -0.401644125140688 | -0.977826436114908 | 0.993252256500626 | 0.987169739054438 | 0.415718422242103 | 1|



Call:
lm(formula = price ~ priceByArea + size + rooms + bathrooms + 
    floor + numPhotos + distance + Ozono + NO + NO2 + PM10 + 
    NOx, data = train)

Residuals:

  | Min     | 1Q     | Median| 3Q    | Max    |
  |---------|--------|-------|-------|--------|
  | -430597 | -31335 | -5248 | 26248 | 952945 |

Coefficients:

  |             | Estimate   | Std. Error | t value | Pr(>mod(t))  |
  |-------------|------------|------------|---------|--------------|
  | (Intercept) | -6.593e+05 | 1.363e+06  | -0.484  | 0.62862      |
  | priceByArea | 1.493e+02  | 2.504e+00  | 59.648  | < 2e-16 ***  |
  | size        | 2.757e+03  | 5.664e+01  | 48.676  | < 2e-16 ***  |
  | rooms       | 7.412e+03  | 2.488e+03  | 2.979   | 0.00294 **   |
  | bathrooms   | -2.433e+04 | 4.219e+03  | -5.767  | 9.8e-09 ***  |
  | floor       | 1.455e+01  | 4.046e+02  | 0.036   | 0.97131      |
  | numPhotos   | -1.255e+02 | 1.919e+02  | -0.654  | 0.51320      |
  | distance    | 1.764e+01  | 1.345e+01  | 1.312   | 0.18986      |
  | Ozono       | 4.401e+03  | 2.298e+04  | 0.191   | 0.84817      |
  | NO          | 1.217e+05  | 1.703e+05  | 0.715   | 0.47501      |
  | NO2         | 7.513e+04  | 1.088e+05  | 0.690   | 0.49015      |
  | PM10        | 2.193e+03  | 1.147e+03  | 1.913   | 0.05600 .    |
  | NOx         | -7.631e+04 | 1.054e+05  | -0.724  | 0.46924      |

  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

  Residual standard error: 71350 on 1476 degrees of freedom
  Multiple R-squared:  0.9194,	Adjusted R-squared:  0.9188 
  F-statistic:  1404 on 12 and 1476 DF,  p-value: < 2.2e-16


  | RMSE             | MAE              |
  |------------------|------------------|
  | 65065.3485892552 | 40183.7016671026 |


## Conclusions

As we could see, the corelation matrix doesn't give us a statistically clear correlation between
contaminants and building's price.

In the other hand we could see the regression model has been improved because the RMSE and
the MAE have decreased, but not in a signifficant way.

Air pollution seems not to be actually an imporant characteristic which influences in the price
of buildings, but now we have the technology and the information to make this possible.

The question is, would the prices of valencia's buildings decrease or increase?
In this report we made a local comparison in air pollution, but when getting some
global info, this could result in a increase of the price of valencia's buildings.


### Global pollution

![World](https://github.com/osmuogar/cda/blob/master/project/images/world.png)
![Africa](https://github.com/osmuogar/cda/blob/master/project/images/africa.png)
![Asia](https://github.com/osmuogar/cda/blob/master/project/images/asia.png)
![Australia](https://github.com/osmuogar/cda/blob/master/project/images/australia.png)
![Europe](https://github.com/osmuogar/cda/blob/master/project/images/europe.png)
![India](https://github.com/osmuogar/cda/blob/master/project/images/india.png)
![MiddleEast](https://github.com/osmuogar/cda/blob/master/project/images/middle_east.png)
![NorthAmerica](https://github.com/osmuogar/cda/blob/master/project/images/north_america.png)
![SouthAmerica](https://github.com/osmuogar/cda/blob/master/project/images/south_america.png)

### Similar studies

The only research we could find similar to ours is this, with more or less the same results:
http://www.rff.org/files/document/file/Sullivan_2017_True_Cost_of_Pollution.pdf