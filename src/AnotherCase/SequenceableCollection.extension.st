Extension { #name : #SequenceableCollection }

{ #category : #'*AnotherCase' }
SequenceableCollection >> apply: aBlock [
	^ aBlock argumentCount = self size ifTrue: [
				aBlock valueWithArguments: self
			] ifFalse: [
				aBlock cull: self
			]

]

{ #category : #'*AnotherCase' }
SequenceableCollection >> applyPredicates: aCollection [
	self size = aCollection size ifFalse: [ ^ false ].
	self with: aCollection do: [: each : predicate | (predicate value: each) ifFalse: [ ^ false ] ].
	^ true 
]

{ #category : #'*AnotherCase' }
SequenceableCollection >> applyTest: aBlock [
	aBlock argumentCount = self size ifTrue: [ ^ self apply: aBlock ].
	^ aBlock argumentCount <= 1 and: [ aBlock cull: self ]
]
