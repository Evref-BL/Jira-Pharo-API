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
]

{ #category : #baselines }
BaselineOfJiraPharoAPI >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfJiraPharoAPI >> definePackages: spec [

	spec package: 'JiraPharoAPI'
]
