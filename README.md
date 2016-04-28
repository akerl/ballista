ballista
=========

[![Gem Version](https://img.shields.io/gem/v/ballista.svg)](https://rubygems.org/gems/ballista)
[![Dependency Status](https://img.shields.io/gemnasium/akerl/ballista.svg)](https://gemnasium.com/akerl/ballista)
[![Build Status](https://img.shields.io/circleci/project/akerl/ballista.svg)](https://circleci.com/gh/akerl/ballista)
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
- name: Electric Bill
  when: 4
  actions:
    Expenses:Bills:electric: $40.00
    Assets:Checking:simple: null
- name: Comcast Bill
  when: 10
  actions:
    Expenses:Bills:internet: $82.95
    Assets:Checking:simple: null
- name: Github Bill
  when: 14
  actions:
    Expenses:Bills:github: $7.00
    Assets:Checking:simple: null
- name: Spotify
  when: 10
  actions:
    Expenses:Bills:spotify: $9.99
    Assets:Checking:simple: null
- name: Geico
  when: 5
  actions:
    Expenses:Insurance:auto: $65.73
    Assets:Checking:simple: null
- name: T-Mobile
  when: 2
  actions:
    Expenses:Bills:phone: $30.50
    Assets:Checking:simple: null
- name: Netflix
  when: 29
  actions:
    Expenses:Bills:netflix: $11.99
    Assets:Checking:simple: null
```

## Installation

    gem install ballista

## License

ballista is released under the MIT License. See the bundled LICENSE file for details.

