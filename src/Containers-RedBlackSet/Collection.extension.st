Extension { #name : #Collection }

{ #category : #'*Containers-RedBlackSet' }
Collection >> asBinaryTree [

	^ self asBinaryTree: CTBinaryTreeAbstract
]

{ #category : #'*Containers-RedBlackSet' }
Collection >> asRedBlackSet [

	^ self asBinaryTree: CTRedBlackSet
]

{ #category : #'*Containers-RedBlackSet' }
Collection >> asUnbalancedSet [

	^ self asBinaryTree: CTUnbalancedSet
]
