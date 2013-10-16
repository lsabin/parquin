<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBrWkTEHJyntaMr0IxcTkqWt1JLCukZKAo&sensor=true">
    </script>
    <script type="text/javascript">



      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(42.878228,-8.542213),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          panControl: true,
		  zoomControl: true,
    	  scaleControl: true
        };


//Fofan: 42.473047,-8.762391

        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);


        var myLatlng = new google.maps.LatLng(42.878228,-8.542213);
		var marker = new google.maps.Marker({
		    position: myLatlng,
		    title:"Hello World!"
		});

		marker.setMap(map);



		jQuery.getJSON("parquesJson", function(data) {
			jQuery.each(data, function (i, item) {
				
			     var myLatlng = new google.maps.LatLng(item.coords.latitud, item.coords.longitud);


				 var marker = new google.maps.Marker({
		    		position: myLatlng,
		    		title:"Hello World!"
				});

				marker.setMap(map);		

				

			     var contenido = '<div class="texto-mapa"><h1>' + item.nombre + '</h1>' +
			     '<div class="descripcion">una descipcion: <a href="${createLink(action: "show")}/' + item.id + ' ">ver</a></div>' + 
			     '</div>';


			     var infoMapa = new google.maps.InfoWindow({
				      content: contenido
				  });

			    google.maps.event.addListener(marker, 'click', function() {
			    	infoMapa.open(map,marker);
			  	});			     



			});
		});



		  var contentString = '<div id="content" style="height:100px;width:200px;">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
      'sandstone rock formation in the southern part of the '+
      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
      'south west of the nearest large town, Alice Springs; 450&#160;km '+
      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
      'Aboriginal people of the area. It has many springs, waterholes, '+
      'rock caves and ancient paintings. Uluru is listed as a World '+
      'Heritage Site.</p>'+
      '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
      'http://en.wikipedia.org/w/index.php?title=Uluru</a> '+
      '(last visited June 22, 2009).</p>'+
      '</div>'+
      '</div>';

  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });


    google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });


      }





      google.maps.event.addDomListener(window, 'load', initialize);
    </script>

   <r:require module="jquery"/>
		<g:layoutHead/>




		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
