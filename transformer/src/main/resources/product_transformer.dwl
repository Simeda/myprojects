%dw 1.0
%output application/xml
---
product @(pid: payload.productId): {
	pname: payload.name,
	offerPrice: payload.offer.offerPrice,
	images: payload.images[1]
}