Class {
	#name : #CTBinaryTreeNodeBalanced,
	#superclass : #CTBinaryTreeNodeUnbalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeBalanced >> balance: repr inSet: aBinaryTree [
	^ repr
		  balance: [ :A :x :B :y :C :z :D | 
			  | L R |
			  L := aBinaryTree
				       leftBinaryTreeElement: A
				       value: x
				       rightBinaryTreeElement: B.
			  R := aBinaryTree
				       leftBinaryTreeElement: C
				       value: z
				       rightBinaryTreeElement: D.
			  aBinaryTree
				  leftBinaryTreeElement: L asBlackNode
				  value: y
				  rightBinaryTreeElement: R asBlackNode ]
		  representation: repr
]

{ #category : #accessing }
CTBinaryTreeNodeBalanced >> color [
	self subclassResponsibility
]

{ #category : #actions }
CTBinaryTreeNodeBalanced >> mergeBinaryTreeElement: aBTElement inBinaryTree: aBinaryTree [
	| repr |
	repr := super
		        mergeBinaryTreeElement: aBTElement
		        inBinaryTree: aBinaryTree.
	^ self balance: repr inSet: aBinaryTree
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeBalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aBinaryTree [
	| repr |
	repr := super
		        push: anObject
		        witness: aWitness
		        continuation: aContinuation
		        inSet: aBinaryTree.
	^ self balance: repr inSet: aBinaryTree
]
