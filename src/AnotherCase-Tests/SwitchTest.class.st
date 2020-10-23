Class {
	#name : #SwitchTest,
	#superclass : #TestCase,
	#category : #'AnotherCase-Tests'
}

{ #category : #tests }
SwitchTest >> testBlocks [
	self assert: (1 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 13.
	self assert: (3 switch
		case: 1 do: [ 3+10];
		case: 3 do: [: v | v+39 ];
		otherwise: 17) equals: 42.
	self assert: (2 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: [: v | v+15 ]) equals: 17.

]

{ #category : #tests }
SwitchTest >> testCond [
	self assert: (Switch new
		if: 6 squared > 25 do: [ 1 ];
		if: 12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 1.
	self assert: (Switch new
		if: 5 squared > 25 do: [ 1 ];
		if: 12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 2.
	self assert: (Switch new
		if: 5 squared > 25 do: [ 1 ];
		if: -12 negated < 10 do: [ 2 ];
		otherwise: [ 3 ]) equals: 3.

]

{ #category : #tests }
SwitchTest >> testSimple [
	self assert: (1 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 13.
	self assert: (3 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 42.
	self assert: (2 switch
		case: 1 do: [ 3+10];
		case: 3 do: 42;
		otherwise: 17) equals: 17.

]
