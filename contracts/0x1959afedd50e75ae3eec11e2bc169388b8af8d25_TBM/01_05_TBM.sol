// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Butterfly Man
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//    .---..              .--.       .   .            .-..          .    .               //
//      |  |              |   )     _|_ _|_           |  |          |\  /|               //
//      |  |--.  .-.      |--: .  .  |   |   .-. .--.-|- | .  .     | \/ | .-.  .--.     //
//      |  |  | (.-'      |   )|  |  |   |  (.-' |    |  | |  |     |    |(   ) |  |     //
//      '  '  `- `--'     '--' `--`- `-' `-' `--''    '  `-`--|     '    ' `-'`-'  `-    //
//                                                            ;                          //
//                                                         `-'                           //
//    by Sabrina Khan                                                                    //
//                                                                                       //
//                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////


contract TBM is ERC721Creator {
    constructor() ERC721Creator("The Butterfly Man", "TBM") {}
}