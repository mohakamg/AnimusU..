var script = document.createElement('script');
script.src = '//code.jquery.com/jquery-1.11.0.min.js';
document.getElementsByTagName('head')[0].appendChild(script);

startPageNo = parseInt(prompt("Enter Start Page"));
url = $(location).attr('href');
lastPage = parseInt(prompt("Enter Last Page"));
for(var i=startPageNo;i<=lastPage;i++){

	$.get(url+"&page="+i, function( my_var1 ) {

	    pagesHtml = my_var1;

			var delayMillis = 5000; //5 seconds
			setTimeout(function() {
			}, delayMillis);

			var $pagesHtml = $('<div />',{html:pagesHtml});

			var delayMillis = 5000; //5 second
			setTimeout(function() {
			}, delayMillis);

			$pagesHtml.find('.s-access-detail-page').each(function(i){
				$.get($(this)[0].href, function( my_var2 ) {

				    html = my_var2;

						var delayMillis = 5000; //5 seconds
						setTimeout(function() {
						}, delayMillis);

						$html = $('<div />',{html:html});

						var delayMillis = 5000; //5 second
						setTimeout(function() {
						}, delayMillis);

						reference_url = $(this)[0].href;
						totalImg = "";
						$html.find('.a-button-text img').each(function(i){
							x = $(this)[0].src;
							start = x.indexOf('._');
							end = x.length-4;
							deleteStr = "";
							for(start;start<end;start++){
							    deleteStr += x[start];
							}
							x = x.replace(deleteStr, "");
							totalImg = totalImg + x + ",";
						});

						title = $html.find('#title')[0]
						if (typeof title == 'undefined')
							title = $html.find('#productTitle')[0];
						if (typeof title == 'undefined')
							title = $html.find('#productTitle');
							if (typeof title == 'undefined')
								title = $html.find('#title');
						title = title.innerText;

						// brand = $html.find('#brand')[0];
						// if (typeof brand != 'undefined')
						// 	brand = $html.find('#brand')[0].innerText;
						// price = $html.find('#priceblock_saleprice')[0];
						// if (typeof price == 'undefined');
						// 	price = $html.find('#priceblock_ourprice')[0]
						// price = price.innerText.replace('$','');
						// description = $html.find('#feature-bullets')[0].innerHTML;

						// For Books
						price = $html.find('.a-color-price').innerText



						console.log(title)
						console.log(brand)
						console.log(price)
						console.log(description)
						console.log(totalImg)
						console.log(reference_url)

						$.post( "https://animusu.herokuapp.com/amazon_product", { p_type: "Watch", price: price, brand: brand, description: description, title: title, images: totalImg, reference_url: reference_url, tags: ["Amazon Import"], variants: [] } );

				});
			});


		});

		var delayMillis = 5000; //5 second
		setTimeout(function() {
		}, delayMillis);

}
