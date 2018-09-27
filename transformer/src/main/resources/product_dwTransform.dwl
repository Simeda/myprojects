%dw 1.0
%output application/xml
%var conversionRate=1
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
				payload map {
					product: {
						pname: $.name,
						pid: $.productId,
						offerPrice: getconvertedRate($.offer.offerPrice),
						brandName: $.brandName,
						offerValidDate: $.offer.offerValidUntil as :number,
						description: $.description,
						images: getImages($.images)
						
				
						}
				
					}
			

	)
}