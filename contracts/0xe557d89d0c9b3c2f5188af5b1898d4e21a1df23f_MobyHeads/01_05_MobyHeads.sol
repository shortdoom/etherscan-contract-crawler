// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MobyHeads
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////
//                                                               //
//                                                               //
//                                                               //
//     _      ____  ____ ___  _ _     _____ ____  ____  ____     //
//    / \__/|/  _ \/  _ \\  \/// \ /|/  __//  _ \/  _ \/ ___\    //
//    | |\/||| / \|| | // \  / | |_|||  \  | / \|| | \||    \    //
//    | |  ||| \_/|| |_\\ / /  | | |||  /_ | |-||| |_/|\___ |    //
//    \_/  \|\____/\____//_/   \_/ \|\____\\_/ \|\____/\____/    //
//                                                               //
//                                                               //
//                                                               //
//                                                               //
///////////////////////////////////////////////////////////////////


contract MobyHeads is ERC721Creator {
    constructor() ERC721Creator("MobyHeads", "MobyHeads") {}
}