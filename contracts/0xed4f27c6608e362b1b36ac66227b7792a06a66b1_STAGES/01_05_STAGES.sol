// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: STAGES OF LIFE
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//    '  ..........................................................................    //
//    '  ....//...).)../__..___/.....//.|.|.....//...).).....//..././.....//...).).    //
//    '  ...((..........././........//__|.|....//...........//____.......((........    //
//    '  .....\\.......././......../.___..|...//..____...../.____..........\\......    //
//    '  .......).)...././........//....|.|..//...././....//.................).)...    //
//    '  ((___././...././........//.....|.|.((____/./....//____/./....((___././....    //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract STAGES is ERC721Creator {
    constructor() ERC721Creator("STAGES OF LIFE", "STAGES") {}
}