Extension { #name : #JPUser }

{ #category : #'*JiraPharoAPI' }
JPUser class >> fromDictionary: aUserInDictionary [

	| user |
	user := self new.
	aUserInDictionary keysAndValuesDo: [ :key :value |
		| setter |
		setter := (key asSymbol , ':') asSymbol.
		(user respondsTo: setter) ifTrue: [
			user perform: setter with: value ] ].
	^ user
]
