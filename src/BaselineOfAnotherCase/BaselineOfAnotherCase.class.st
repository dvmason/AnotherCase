Class {
	#name : #BaselineOfAnotherCase,
	#superclass : #BaselineOf,
	#category : #BaselineOfAnotherCase
}

{ #category : #baselines }
BaselineOfAnotherCase >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
		"Packages"
			spec
				package: 'AnotherCase';
				package: 'AnotherCase-Tests'  with: [ spec requires: #('AnotherCase') ].
		"Groups"
			spec
				group: 'default' with: #('AnotherCase');
				group: 'All' with: #('AnotherCase' 'AnotherCase-Tests')
		]
]
