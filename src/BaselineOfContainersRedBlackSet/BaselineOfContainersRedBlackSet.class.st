Class {
	#name : #BaselineOfContainersRedBlackSet,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersRedBlackSet
}

{ #category : #baselines }
BaselineOfContainersRedBlackSet >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		"Packages"
		spec
			package: 'Containers-RedBlackSet';
			package: 'Containers-RedBlackSet-Visualizations';
			package: 'Containers-RedBlackSet-Tests' ]
]
