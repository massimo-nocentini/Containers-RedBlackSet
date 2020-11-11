Class {
	#name : #CTBinaryTreeEmptyBalanced,
	#superclass : #CTBinaryTreeEmptyUnbalanced,
	#category : #'Containers-RedBlackSet'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceLeftTreeOf: aCTBinaryTreeEmptyBalanced leftTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceLeftTreeOf: aCTBinaryTreeEmptyBalanced rightTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceRightTreeOf: aCTBinaryTreeEmptyBalanced leftTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceRightTreeOf: aCTBinaryTreeEmptyBalanced rightTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceTree: aCTBinaryTreeEmptyBalanced leftTreeOf: aCTBinaryTreeNodeBalancedRed leftTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceTree: aCTBinaryTreeEmptyBalanced leftTreeOf: aCTBinaryTreeNodeBalancedRed rightTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceTree: aCTBinaryTreeEmptyBalanced rightTreeOf: aCTBinaryTreeNodeBalancedRed leftTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> balanceTree: aCTBinaryTreeEmptyBalanced rightTreeOf: aCTBinaryTreeNodeBalancedRed rightTreeOf: aCTBinaryTreeNodeBalancedBlack continuation: aContinuation [
	^ aContinuation value
]

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptyBalanced >> color [
	^ Color black
]
