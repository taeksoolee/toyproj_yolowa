		//set up markers 
		var myMarkers = {"markers": [
				{"latitude": "35.974671", "longitude":"126.693540", "icon": "img/map-marker.png"}
			]
		};
		
		//set up map options
		$(".map_contact").mapmarker({
			zoom	: 14,
			center  : '전라북도 군산시 전북외국어고등학교',
			markers	: myMarkers
		});

