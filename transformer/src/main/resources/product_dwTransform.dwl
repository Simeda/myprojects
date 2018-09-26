%dw 1.0
%output application/xml
%var conversionRate= lookup("getConversionRateFlow", inboundProperties.'http.query.params'.country)
%function getconvertedRate(price) price*conversionRate
%var getConversionRate = (price) -> price*conversionRate
%function getImages(images) {
								(
									images map {
									image: $
								}
							)
						}
---
products: {
			(
					(
				payload map {
					product: {
						pname: $.name,
						pid: $.productId,
						offerPrice: getConversionRate($.offer.offerPrice),
						brandName: $.brandName,
						images: getImages($.images)
						
				
						}
				
					}
					
					) orderBy $.product.offerPrice
			

	)
}