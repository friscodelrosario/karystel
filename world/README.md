##On maps

One thing Karel implementers don't do in common is world mapping. An R developer did it this way:

```
mundo008 <- list(
  nx = 9,
  ny = 7,
  hor_walls = NULL,
  ver_walls = NULL,
  karel_x = 1,
  karel_y = 1,
  karel_dir = 1,
  beepers_x = rep(2:8, times = c(3, 5, 2, 3, 6, 0, 2)),
  beepers_y = c(1:3, 1:5, 1:2, 1:3, 1:6, 1:2),
  beepers_n = rep(1, 21),
  beepers_bag = 0
)
```

The developer doesn't seem to be accounting for a kid's desire to make his own worlds. From a C++ project, this is better:

```
Dimension: (7, 5)
Wall: (3, 2) west
Wall: (3, 2) south
Wall: (3, 3) west
Wall: (3, 4) west
Wall: (3, 5) south
Wall: (4, 2) south
Wall: (4, 5) south
Wall: (5, 2) south
Wall: (5, 5) south
Wall: (6, 2) west
Wall: (6, 4) west
Beeper: (6, 3) 1
Karel: (3, 4) east
Speed: 1.50
```

What I didn't like about this method was the possibility of one wall having two names. That is, a wall at 1,1 east performs the same world function as at 1,2 west.

This one is part of a Java project in which students supply their own maps as input. It's simplest, and I think I'll follow it as a model.

```
KarelWorld
streets 5
avenues 8
beeper 4 2 1
wall 5 2 west
```

