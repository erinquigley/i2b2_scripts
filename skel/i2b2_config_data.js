{
	urlProxy: "index.php",
	urlFramework: "js-i2b2/",
	//-------------------------------------------------------------------------------------------
	// THESE ARE ALL THE DOMAINS A USER CAN LOGIN TO
	lstDomains: [
		{ domain: "i2b2demo",
		  name: "Data Analysis/DataMart",
		  urlCellPM: "http://I2B2_URL/i2b2/services/PMService/",
		  allowAnalysis: true,
		  debug: false,
		  adminOnly: false
		},
		{ domain: "i2b2demo",
		  name: "Administration",
		  urlCellPM: "http://I2B2_URL/i2b2/services/PMService/",
		  allowAnalysis: true,
		  debug: false,
		  adminOnly: true
		}
	]
	//-------------------------------------------------------------------------------------------
}
