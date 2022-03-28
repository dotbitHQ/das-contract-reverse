# das-contract-reverse

This is used for the non-eoa address to set its reverse record of `.bit` account.
It can be used on any EVM based chains. Now it is supported on ETH/BSC/Polygon.

## Overview

The related contract addresses are all the same on any EVM chains, because of the same code.


| name     |                                    address |
|----------|--------------------------------------------|
| proxy    | 0xf4cc55f3da1db69b3b15a94400f4927d5a619a90 |
| logic    | 0x047ceb02869994c1e05bd02f0b579af3390cce57 |
| timelock | 0x50b616f15349ca12353651066ed4b5d6ad6440f2 |


## Usage

Simply use proxy contract only. Take ETH as an example

1. Open this [link](https://etherscan.io/address/0xf4cc55f3da1db69b3b15a94400f4927d5a619a90#writeProxyContract) with Chrome
2. Login owner address of the contract, which you want to set, by click `Connect to Web3`
3. Expand the function `setReverseName`
4. Fill in the form with the `.bit` name and contract address
5. Send the tx by click `Write` button

## Others
1. The audit report is shown on [SlowMist](https://www.slowmist.com/en/)'s [github](https://github.com/slowmist/Knowledge-Base/blob/master/open-report/SlowMist%20Audit%20Report%20-%20Das%20Contract%20Reverse.pdf)
2. [MIT license](https://github.com/dotbitHQ/das-contract-reverse/blob/main/LICENSE)
