Class {
	#name : #CTBinaryTreeNodeUnbalanced,
	#superclass : #CTBinaryTreeNode,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeUnbalanced >> includes: anObject witness: aWitness inSet: aSet [
	^ (aSet is: anObject lessThan: value)
		  ifTrue: [ 
		  previousLink includes: anObject witness: aWitness inSet: aSet ]
		  ifFalse: [ nextLink includes: anObject witness: value inSet: aSet ]
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeUnbalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	^ (aSet is: anObject lessThan: value)
		  ifTrue: [ 
			  | link |
			  link := previousLink
				          push: anObject
				          witness: aWitness
				          continuation: aContinuation
				          inSet: aSet.
			  self class left: link value: value right: nextLink ]
		  ifFalse: [ 
			  | link |
			  link := nextLink
				          push: anObject
				          witness: value
				          continuation: aContinuation
				          inSet: aSet.
			  self class left: previousLink value: value right: link ]
]
