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

	| lesserTree greaterTree tree |
	self value < aBTElement value
		ifTrue: [ 
			lesserTree := self.
			greaterTree := aBTElement ]
		ifFalse: [ 
			lesserTree := aBTElement.
			greaterTree := self ].

	tree := lesserTree nextLink
		        mergeBinaryTreeElement: greaterTree
		        inBinaryTree: aBinaryTree.

	^ aBinaryTree
		  leftBinaryTreeElement: lesserTree previousLink
		  value: lesserTree value
		  rightBinaryTreeElement: tree
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

			  aBinaryTree binaryTreeElementNode
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

			  aBinaryTree binaryTreeElementNode
				  previousLink: previousLink;
				  value: value;
				  nextLink: link;
				  yourself ]
]
