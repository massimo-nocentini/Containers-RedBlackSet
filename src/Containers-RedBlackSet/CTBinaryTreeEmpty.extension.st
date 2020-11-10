Extension { #name : #CTBinaryTreeEmpty }

{ #category : #'*Containers-RedBlackSet' }
CTBinaryTreeEmpty >> includes: anObject witness: aWitness inSet: aSet [
	^ aSet inNilRepresentation: self includes: anObject witness: aWitness
]

{ #category : #'*Containers-RedBlackSet' }
CTBinaryTreeEmpty >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	^ aSet
		  inNilRepresentation: self
		  push: anObject
		  witness: aWitness
		  continuation: aContinuation
]
