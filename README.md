# Flare Helper
A helper utilty for listing the names of the animations in the default artboard.

## Building 
Build the binary:
```
./build.sh
```

## Running
Pass the path to your .flr file to analyze as the first (and only) argument.
```
./bin/flare_helper assets/teddy.flr
```

The utility will output the following:
```
Filename assets/teddy.flr contains 4 animations.
  fail
  test
  success
  idle
```