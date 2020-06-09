# CommonAlgorithms

This is a collections of common algorithms and data structures that everyone comes across at some point but not natively implemented in the Swift standard library.

## Binary Heap

In `Heap.swift`, a number of binary heap related functions are implemented. Note that I did not implement a Heap data structure as it should be just an Array of some comparables. Keeping the utilities seperate from the array gives one the flexibility to do what one wants. Anyway, this is not my idea but rather to say that I agree with what Python's standard library says. 

## Binary Search

Inspired by the `bisect` package in Python library. I have implemented binary search in ascending and descending array with the option to give you the index on the left and right of the insertion position (hence `bisect_left` and `bisect_right`).

This is done as an extension to `RandomAccessCollection`.

## Permutations

Inspired by the implementations in the standard library of C++.

This is done as an extension to `RandomAccessCollection` with constraint that `Self` is mutable.

## MIT Licence

Of course.
