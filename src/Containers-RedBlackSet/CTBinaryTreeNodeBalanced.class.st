Class {
	#name : #CTBinaryTreeNodeBalanced,
	#superclass : #CTBinaryTreeNodeUnbalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #accessing }
CTBinaryTreeNodeBalanced >> color [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeBalanced >> push: anObject witness: aWitness continuation: aContinuation inSet: aSet [
	| repr |
	repr := super
		        push: anObject
		        witness: aWitness
		        continuation: aContinuation
		        inSet: aSet.
	^ repr
		  balance: [ :A :x :B :y :C :z :D | 
			  | L R |
			  L := CTBinaryTreeNodeBalancedBlack left: A value: x right: B.
			  R := CTBinaryTreeNodeBalancedBlack left: C value: z right: D.
			  CTBinaryTreeNodeBalancedRed left: L value: y right: R ]
		  representation: repr
]
