Class {
	#name : 'BaselineOfJiraPharoAPI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfJiraPharoAPI',
	#package : 'BaselineOfJiraPharoAPI'
}

{ #category : 'baselines' }
BaselineOfJiraPharoAPI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfJiraPharoAPI >> defineDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : 'baselines' }
BaselineOfJiraPharoAPI >> defineGroups: spec [
]

{ #category : 'baselines' }
BaselineOfJiraPharoAPI >> definePackages: spec [

	spec
		package: 'JiraPharoAPI'
		with: [ spec requires: #( 'JiraPharoAPI-Model' 'NeoJSON' ) ].
	spec package: 'JiraPharoAPI-Model'
]
