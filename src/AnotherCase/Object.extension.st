Extension { #name : #Object }

{ #category : #'*AnotherCase' }
Object >> apply: aBlock [
	^ aBlock cull: self
]

{ #category : #'*AnotherCase' }
Object >> applyTest: aBlock [ 
	^ aBlock argumentCount <= 1 and: [ aBlock cull: self ]
]

{ #category : #'*AnotherCase' }
Object >> argumentCount [
	^ -1 " I don't accept arguments "
]

{ #category : #'*AnotherCase' }
Object >> cull: ignored [

]

{ #category : #'*AnotherCase' }
Object >> switch [
	^ Switch new with: self
]
