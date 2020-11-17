Class {
	#name : #CTBinaryTreeNodeUnbalanced,
	#superclass : #CTBinaryTreeNode,
	#category : #'Containers-RedBlackSet'
}

{ #category : #testing }
CTBinaryTreeNodeUnbalanced >> includes: anObject witness: aWitness inSet: aSet [
	^ (aSet is: anObject lessThan: value)
		  ifTrue: [ 
		  previousLink includes: anObject witness: aWitness inSet: aSet ]
		  ifFalse: [ nextLink includes: anObject witness: value inSet: aSet ]
]

{ #category : #actions }
CTBinaryTreeNodeUnbalanced >> mergeBinaryTreeElement: aBTElement inBinaryTree: aBinaryTree [
	^ aBTElement ifEmpty: [ self ] ifNotEmpty: [ 
		  (aBinaryTree is: value lessThan: aBTElement value)
			  ifTrue: [ 
				  | r |
				  r := nextLink ifEmpty: [ aBTElement ] ifNotEmpty: [ 
					       nextLink
						       mergeBinaryTreeElement: aBTElement
						       inBinaryTree: aBinaryTree ].
				  aBinaryTree
					  leftBinaryTreeElement: previousLink
					  value: value
					  rightBinaryTreeElement: r ]
			  ifFalse: [ 
			  aBTElement mergeBinaryTreeElement: self inBinaryTree: aBinaryTree ] ]
]

{ #category : #adding }
CTBinaryTreeNodeUnbalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aBinaryTree [
	^ (aBinaryTree is: anObject lessThan: value)
		  ifTrue: [ 
			  | link |
			  link := previousLink
				          push: anObject
				          witness: aWitness
				          continuation: aContinuation
				          inSet: aBinaryTree.
			  self class new
				  previousLink: link;
				  value: value;
				  nextLink: nextLink;
				  yourself ]
		  ifFalse: [ 
			  | link |
			  link := nextLink
				          push: anObject
				          witness: value
				          continuation: aContinuation
				          inSet: aBinaryTree.
			  self class new
				  previousLink: previousLink;
				  value: value;
				  nextLink: link;
				  yourself ]
]
