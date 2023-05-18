# Taiga Simulator

The Taiga Simulator is a [Juvix](https://juvix.org) function that simulates the [Taiga](https://github.com/anoma/taiga) execution model.

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
