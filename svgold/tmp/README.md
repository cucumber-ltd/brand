# How the bubble is made

This doc is just some notes about how the bubble is made.
Open `cucumber-mark-1.svg` and `cucumber-mark-2.svg` svgs to see the progression
of how the bubble was made, using the original bubble as a guide.

Turns: 3.66
Divergence: 0.760
Inner Radius: 0.728
W: 33.269
H: 37.265

Turns: 3.65
Divergence: 2.4
Inner Radius: 0.725
W: 29.339
H: 37.123

For both circle and spiral:

  Path -> Object To Path
  Path -> Union
  Fill -> Flat Color (small square)

For the circle I did an intersection with a square to cut off the right part.
Then I did a union of what was left with the spiral.
