Extension { #name : #CTBinaryTreeNode }

{ #category : #'*Containers-RedBlackSet' }
CTBinaryTreeNode >> includes: anObject witness: aWitness inSet: aSet [
	^ aSet
		  inDoubleLinkRepresentation: self
		  includes: anObject
		  witness: aWitness
]

{ #category : #'*Containers-RedBlackSet' }
CTBinaryTreeNode >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	^ aSet
		  inDoubleLinkRepresentation: self
		  push: anObject
		  witness: aWitness
		  continuation: aContinuation
]
