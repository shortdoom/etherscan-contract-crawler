// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: rachna
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////
//                                                          //
//                                                          //
//                                                          //
//    ██████╗``█████╗``██████╗██╗``██╗███╗```██╗`█████╗`    //
//    ██╔══██╗██╔══██╗██╔════╝██║``██║████╗``██║██╔══██╗    //
//    ██████╔╝███████║██║`````███████║██╔██╗`██║███████║    //
//    ██╔══██╗██╔══██║██║`````██╔══██║██║╚██╗██║██╔══██║    //
//    ██║``██║██║``██║╚██████╗██║``██║██║`╚████║██║``██║    //
//    ╚═╝``╚═╝╚═╝``╚═╝`╚═════╝╚═╝``╚═╝╚═╝``╚═══╝╚═╝``╚═╝    //
//    ``````````````````````````````````````````````````    //
//                                                          //
//                                                          //
//                                                          //
//////////////////////////////////////////////////////////////


contract RR is ERC721Creator {
    constructor() ERC721Creator("rachna", "RR") {}
}