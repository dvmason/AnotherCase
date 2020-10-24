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
	^ aCollection size = 2 and: [ (aCollection first value: key) and: [ aCollection second value: value ] ]
]

{ #category : #'*AnotherCase' }
Association >> applyTest: aBlock [
	aBlock argumentCount = 2 ifTrue: [ ^ self apply: aBlock ].
	^ aBlock argumentCount <= 1 and: [ aBlock cull: self ]
]
