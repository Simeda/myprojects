%dw 1.0
%output application/xml
---

	prodName: {
		(
			(
		payload map {
		pname: $.name}
		
		) filter $.name=='Hp'
		
		)
}
	
