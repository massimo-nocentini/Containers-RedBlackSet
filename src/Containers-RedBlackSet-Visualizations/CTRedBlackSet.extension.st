Extension { #name : #CTRedBlackSet }

{ #category : #'*Containers-RedBlackSet-Visualizations' }
CTRedBlackSet >> gtInspectorTreeUsingCanvas: aCanvas [
	^ representation edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  | text content |
			  content := aVertex content.
			  text := String streamContents: [ :s | 
				          content value
					          ifNil: [ s nextPut: $• ]
					          ifNotNil: [ :v | v printOn: s ] ].
			  RSLabel new
				  text: text;
				  color: content color;
				  yourself ]
]

{ #category : #'*Containers-RedBlackSet-Visualizations' }
CTRedBlackSet >> gtInspectorTreesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ self gtInspectorTreeUsingCanvas: RSCanvas new ];
		  yourself
]
