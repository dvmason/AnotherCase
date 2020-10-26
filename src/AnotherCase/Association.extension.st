Extension { #name : #Association }

{ #category : #'*AnotherCase' }
Association >> apply: aBlock [
	^ aBlock argumentCount = 2 ifTrue: [
				aBlock value: key value: value
			] ifFalse: [
				aBlock cull: self
			]
]

{ #category : #'*AnotherCase' }
Association >> applyPredicates: aCollection [ 
	| temp |
	^ aCollection size = 2 and: [
		((temp := aCollection first) isClass ifTrue: [
				key isKindOf: temp
			] ifFalse: [ temp value: key ]) and: [
				( temp := aCollection second) isClass ifTrue: [
						value isKindOf: temp
					 ] ifFalse: [ temp value: value ]]]
]

{ #category : #'*AnotherCase' }
Association >> applyTest: aBlock [
	aBlock argumentCount = 2 ifTrue: [ ^ self apply: aBlock ].
	^ aBlock argumentCount <= 1 and: [ aBlock cull: self ]
]
