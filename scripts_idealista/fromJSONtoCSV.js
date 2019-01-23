/**
 * This file is to make the conversion from JSON to csv.
 * The problem is the R json parser is making a bad conversion from the json files
 * to R objects.
 */

var fs = require('fs');

/**
 * Class inmueble
 * @param {*} propertyCode 
 * @param {*} thumbnail 
 * @param {*} numPhotos 
 * @param {*} floor 
 * @param {*} price 
 * @param {*} propertyType 
 * @param {*} operation 
 * @param {*} size 
 * @param {*} exterior 
 * @param {*} rooms 
 * @param {*} bathrooms 
 * @param {*} address 
 * @param {*} province 
 * @param {*} municipality 
 * @param {*} district 
 * @param {*} country 
 * @param {*} neighborhood 
 * @param {*} latitude 
 * @param {*} longitude 
 * @param {*} showAddress 
 * @param {*} url 
 * @param {*} distance 
 * @param {*} hasVideo 
 * @param {*} status 
 * @param {*} newDevelopment 
 * @param {*} hasLift 
 * @param {*} priceByArea 
 * @param {*} detailedType 
 * @param {*} suggestedTexts 
 * @param {*} hasPlan 
 * @param {*} has3DTour 
 * @param {*} has360 
 */
function Inmueble(
  point, propertyCode, thumbnail, numPhotos, floor, price, propertyType, operation,
  size, exterior, rooms, bathrooms, address, province, municipality, district,
  country, neighborhood, latitude, longitude, showAddress, url, distance, hasVideo,
  status, newDevelopment, hasLift, priceByArea, detailedType, suggestedTexts,
  hasPlan, has3DTour, has360
) {
  this.properties = {}
  this.properties.point = point;
  this.properties.propertyCode = propertyCode;
  this.properties.thumbnail = thumbnail;
  this.properties.numPhotos = numPhotos;
  this.properties.floor = floor;
  this.properties.price = price;
  this.properties.propertyType = propertyType;
  this.properties.operation = operation;
  this.properties.size = size;
  this.properties.exterior = exterior;
  this.properties.rooms = rooms;
  this.properties.bathrooms = bathrooms;
  this.properties.address = address;
  this.properties.province = province;
  this.properties.municipality = municipality;
  this.properties.district = district;
  this.properties.country = country;
  this.properties.neighborhood = neighborhood;
  this.properties.latitude = latitude;
  this.properties.longitude = longitude;
  this.properties.showAddress = showAddress;
  this.properties.url = url;
  this.properties.distance = distance;
  this.properties.hasVideo = hasVideo;
  this.properties.status = status;
  this.properties.newDevelopment = newDevelopment;
  this.properties.hasLift = hasLift;
  this.properties.priceByArea = priceByArea;
  this.properties.detailedType_typology = detailedType.typology;
  this.properties.suggestedTexts_title = suggestedTexts.title;
  this.properties.suggestedTexts_subtitle = suggestedTexts.subtitle;
  this.properties.hasPlan = hasPlan;
  this.properties.has3DTour = has3DTour;
  this.properties.has360 = has360;

  this.toString = function () {
    var res = '';
    for (var key in this.properties) {
      res += this.properties[key] + ';'
    }
    return res;
  }

  this.HEADERS = function () {
    var res = '';
    for (var key in this.properties) {
      res += key + ';'
    }
    return res;
  }

}

const POINT_NAME = [
  'viveros', 'avd_francia', 'boulevar_sur', 'universidad_politecnica', 'moli_del_sol',
  'pista_de_silla'
]

const NUM_POINTS = POINT_NAME.length;
const NUM_PAGES = 7;

const result_file_path = "../data_idealista/";
var result_file_name;
var result_file;

var file;
var file_name;
var elements;
/** We'll take each file and add it to the list */
for (var point = 0; point < NUM_POINTS; point++) {
  elements = [];

  for (var page = 1; page <= NUM_PAGES; page++) {
    file_name = '../data_idealista/point-' + point + '-page-' + page + '.json'
    file = require(file_name);

    for (var i = 0; i < file.elementList.length; i++) {
      elements.push(
        new Inmueble(
          POINT_NAME[point],
          file.elementList[i].propertyCode !== undefined ? file.elementList[i].propertyCode : '',
          file.elementList[i].thumbnail !== undefined ? file.elementList[i].thumbnail : '',
          file.elementList[i].numPhotos !== undefined ? file.elementList[i].numPhotos : '',
          file.elementList[i].floor !== undefined ? file.elementList[i].floor : '',
          file.elementList[i].price !== undefined ? file.elementList[i].price : '',
          file.elementList[i].propertyType !== undefined ? file.elementList[i].propertyType : '',
          file.elementList[i].operation !== undefined ? file.elementList[i].operation : '',
          file.elementList[i].size !== undefined ? file.elementList[i].size : '',
          file.elementList[i].exterior !== undefined ? file.elementList[i].exterior : '',
          file.elementList[i].rooms !== undefined ? file.elementList[i].rooms : '',
          file.elementList[i].bathrooms !== undefined ? file.elementList[i].bathrooms : '',
          file.elementList[i].address !== undefined ? file.elementList[i].address : '',
          file.elementList[i].province !== undefined ? file.elementList[i].province : '',
          file.elementList[i].municipality !== undefined ? file.elementList[i].municipality : '',
          file.elementList[i].district !== undefined ? file.elementList[i].district : '',
          file.elementList[i].country !== undefined ? file.elementList[i].country : '',
          file.elementList[i].neighborhood !== undefined ? file.elementList[i].neighborhood : '',
          file.elementList[i].latitude !== undefined ? file.elementList[i].latitude : '',
          file.elementList[i].longitude !== undefined ? file.elementList[i].longitude : '',
          file.elementList[i].showAddress !== undefined ? file.elementList[i].showAddress : '',
          file.elementList[i].url !== undefined ? file.elementList[i].url : '',
          file.elementList[i].distance !== undefined ? file.elementList[i].distance : '',
          file.elementList[i].hasVideo !== undefined ? file.elementList[i].hasVideo : '',
          file.elementList[i].status !== undefined ? file.elementList[i].status : '',
          file.elementList[i].newDevelopment !== undefined ? file.elementList[i].newDevelopment : '',
          file.elementList[i].hasLift !== undefined ? file.elementList[i].hasLift : '',
          file.elementList[i].priceByArea !== undefined ? file.elementList[i].priceByArea : '',
          file.elementList[i].detailedType !== undefined ? file.elementList[i].detailedType : '',
          file.elementList[i].suggestedTexts !== undefined ? file.elementList[i].suggestedTexts : '',
          file.elementList[i].hasPlan !== undefined ? file.elementList[i].hasPlan : '',
          file.elementList[i].has3DTour !== undefined ? file.elementList[i].has3DTour : '',
          file.elementList[i].has360 !== undefined ? file.elementList[i].has360 : ''
        )
      );
    }
  } // End for pages

  /*
    When all pages have been read, a file is wiritten which contains all the listed items
   */
  result_file_name = POINT_NAME[point];
  result_file = result_file_path + result_file_name + '.csv';

  fs.writeFileSync(result_file, elements[0].HEADERS() + '\n');
  for (var index in elements) {
    fs.appendFileSync(result_file, elements[index].toString() + '\n');
  }
}// End for points