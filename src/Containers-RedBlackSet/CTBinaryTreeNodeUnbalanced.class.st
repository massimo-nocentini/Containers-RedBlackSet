Class {
	#name : #CTBinaryTreeNodeUnbalanced,
	#superclass : #CTBinaryTreeNode,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeUnbalanced >> includes: anObject witness: aWitness inSet: aSet [
	| aRefinedWitness |
	aRefinedWitness := value.
	^ (aSet is: anObject lessThan: aRefinedWitness)
		  ifTrue: [ 
		  previousLink includes: anObject witness: aWitness inSet: aSet ]
		  ifFalse: [ 
		  nextLink includes: anObject witness: aRefinedWitness inSet: aSet ]
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeUnbalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	^ (aSet is: anObject lessThan: value)
		  ifTrue: [ 
			  aSet class nodeTreeClass
				  left: (previousLink
						   push: anObject
						   witness: aWitness
						   continuation: aContinuation
						   inSet: aSet)
				  value: value
				  right: nextLink ]
		  ifFalse: [ 
			  aSet class nodeTreeClass
				  left: previousLink
				  value: value
				  right: (nextLink
						   push: anObject
						   witness: value
						   continuation: aContinuation
						   inSet: aSet) ]
]
