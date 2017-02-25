const exportStops = require("efa-export-stops-by-coordinates");

const ENDPOINT_BASE_URL_TEMPLATE = "http://delfi1.vvo-online.de:8080/delfi3/XSLT_COORD_REQUEST?&jsonp=&boundingBox=&boundingBoxLU={minx}%3A{miny}%3AWGS84%5BDD.DDDDD%5D&boundingBoxRL={maxx}%3A{maxy}%3AWGS84%5BDD.DDDDD%5D&coordOutputFormat=WGS84%5BGGZHTXX%5D&type_1=STOP&outputFormat=json&inclFilter=1";

const DISTRICT_CODES = [
	"14612",
	"14625",
	"14627",
	"14628"
];

exportStops(ENDPOINT_BASE_URL_TEMPLATE, 13, 50.5, 15, 52, 0, DISTRICT_CODES);
