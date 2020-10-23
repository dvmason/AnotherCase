Extension { #name : #Object }

{ #category : #'*AnotherCase' }
Object >> apply: aBlock [
	^ aBlock cull: self
]

{ #category : #'*AnotherCase' }
Object >> cull: ignored [

]

{ #category : #'*AnotherCase' }
Object >> switch [
	^ Switch new with: self
]
