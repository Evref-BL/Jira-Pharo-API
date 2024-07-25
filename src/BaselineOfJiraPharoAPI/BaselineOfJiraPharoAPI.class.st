Class {
	#name : #BaselineOfJiraPharoAPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfJiraPharoAPI
}

{ #category : #baselines }
BaselineOfJiraPharoAPI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfJiraPharoAPI >> defineDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #baselines }
BaselineOfJiraPharoAPI >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfJiraPharoAPI >> definePackages: spec [

	spec
		package: 'JiraPharoAPI'
		with: [ spec requires: #( 'JiraPharoAPI-Model' 'NeoJSON' ) ].
	spec package: 'JiraPharoAPI-Model'.
	spec
		package: 'JiraPharoAPI-Model-Extended'
		with: [ spec requires: #( 'JiraPharoAPI-Model' ) ].
	spec package: 'JiraPharoAPI-Model-Generator'.
	spec
		package: 'JiraPharoAPI-Tests'
		with: [ spec requires: #( 'JiraPharoAPI' 'JiraPharoAPI-Model' ) ]
]
