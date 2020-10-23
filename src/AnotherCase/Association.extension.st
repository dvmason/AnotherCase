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
Association >> applyTest: aBlock [
	^ self apply: aBlock
]
