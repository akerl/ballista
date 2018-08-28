ballista
=========

[![Gem Version](https://img.shields.io/gem/v/ballista.svg)](https://rubygems.org/gems/ballista)
[![Build Status](https://img.shields.io/travis/com/akerl/ballista.svg)](https://travis-ci.com/akerl/ballista)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/ballista.svg)](https://codecov.io/github/akerl/ballista)
[![Code Quality](https://img.shields.io/codacy/c9caebd934f04ca699d1f02fac6dcf22.svg)](https://www.codacy.com/app/akerl/ballista)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Helper for projecting based on [Ledger](http://www.ledger-cli.org/) format.

## Usage

To make a new Projection object, use `Ballista.new(entries: my_config)`. my_config should be a hash of projection entries, like this:

```
- name: Pay Check
  when:
  - 15
  - 30
  actions:
    Expenses:Taxes:federal_income: $729.26
    Expenses:Taxes:va_income: $215.14
    Expenses:Taxes:social_security: $299.46
    Expenses:Taxes:medicare: $70.04
    Assets:Checking:simple: $2739.10
    Assets:401K:Trad:work: $772.00
    Income:Salary:work: $-4825.00
- name: Automatic transfer to Savings
  when: 2
  actions:
    Assets:Savings:ally: $1000.00
    Assets:Checking:simple: null
- name: Rent
  when: 2
  actions:
    Expenses:Bills:rent: $2800.00
    Assets:Checking:simple: null
```

To do a projection, call `.project(start_dt, end_dt)` on your created object. The dates should be Ruby Date objects.

The returned object will be a Ledger journal, courtesy of [libledger](https://github.com/akerl/libledger). As such, you can inspect the .entries as well as use .to_s or puts to print it in ledger text file format.

## Installation

    gem install ballista

## License

ballista is released under the MIT License. See the bundled LICENSE file for details.

