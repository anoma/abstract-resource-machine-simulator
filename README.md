# Anoma Abstract Resource Machine Simulator

This project is a simulator for the Anoma Abstract Resource Machine (AARM) written in [Juvix](https://juvix.org).

See [Simulator.juvix](Simulator.juvix) for the API.

## Apps

The following apps can run on the simulator:

| App                                                   | Simulator Example                             |
|-------------------------------------------------------|-----------------------------------------------|
| [TwoPartyExchange.juvix](Apps/TwoPartyExchange.juvix) | [AppsTest.juvix#L65](Test/AppsTest.juvix#L65) |
| [Sudoku.juvix](Apps/Sudoku.juvix)                     | [AppsTest.juvix#L18](Test/AppsTest.juvix#L65) |

## Tests

Install the [Juvix](https://juvix.org) compiler and run:

``` shell
make
```
