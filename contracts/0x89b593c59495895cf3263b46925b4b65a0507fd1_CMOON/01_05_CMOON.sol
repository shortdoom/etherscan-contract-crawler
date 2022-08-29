// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CELLARMOON
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//                                                                                               //
//     ██████╗███████╗██╗     ██╗      █████╗ ██████╗ ███╗   ███╗ ██████╗  ██████╗ ███╗   ██╗    //
//    ██╔════╝██╔════╝██║     ██║     ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔═══██╗████╗  ██║    //
//    ██║     █████╗  ██║     ██║     ███████║██████╔╝██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║    //
//    ██║     ██╔══╝  ██║     ██║     ██╔══██║██╔══██╗██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║    //
//    ╚██████╗███████╗███████╗███████╗██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║    //
//     ╚═════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝    //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


contract CMOON is ERC721Creator {
    constructor() ERC721Creator("CELLARMOON", "CMOON") {}
}