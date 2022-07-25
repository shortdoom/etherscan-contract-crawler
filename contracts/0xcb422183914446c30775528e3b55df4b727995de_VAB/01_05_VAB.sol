// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bratovanov Ventsislav
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    ██████████████████████████████████████████████████████████████████████████████████████████    //
//    ██████████████████████████████████████████████████████████████████████████████████████████    //
//    █████████████████████████████████████████████████████████████████████████████████████▓████    //
//    ███████████████████▓██████████████████▓▓▒▒▒▒▒▒▒▒▒▒▒▓▓████████████████████████████████▓▓███    //
//    ███████████████████▓▓██▓▓▓▓████████▓▒▒▒▒▒░░░░░░░░░░▒▒▒▒▓▓█████████████▓▓▓▓█████▓█████▓▓███    //
//    ██████████████████▓▓▓▓█▓▓▓▓██▓███▓▒▒░░░░░░░░░░░░░░░░░░░▒▒▓▓███████████▓▓▓▓▓████▓▓█▓▓▓▓▓███    //
//    ██████████████████▓▓███▓▓▓▓▓█▓▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░▒▒▓▓█████▓████▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓███    //
//    █████████████████▓▓▓███▓▓▓▓█▓▓▓▒▒░░▒▒░░░▒▒▒▒░░░░░▒░░░░░░░░░▒▓▓███▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███    //
//    █████████▓████████▓▓▓▓█▓▓▓▓▓▓▓▒▒░▒▒▒▒░▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░▒▓▓▓█▓▓▓▓█▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓███    //
//    █████████▓██████▓▓▓▓▓██▓▓▓▓▓▓▒▒░▒▒░░▒▒░░░░░░░░░░░░░░▒▒░░░░░▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓█▓▓▓▓▓▓▒▒░▒░░░░░░░░░░░░░░░░░░░░▒▒░░░░▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓█▓▓▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░░░░▒░░░░▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▒░░▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▒▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒░░░░░░░░░░▒██░░░░░░░▒▒░▒▒▒▒▒▓▓▓▓▒▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒░░░░░░░░░░▒██░░░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓███    //
//    █████████▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒░░░░░░░░░░░▓▒░░░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓███    //
//    █████████▓████████▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░▓████▒░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▒▓▓▓▓▓▓███████▓▓▓▓▓▓████    //
//    █████████▓████████▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░████████░░░░▒▒▒▒▒▒▓▒▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓██████    //
//    █████████▓████████▓▓▓▓▓▓▓▓▓▓▓▓▒▓▒▒▒▒▒░░░░▒████████▓░░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓██████    //
//    █████████▓████████▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▒▒▒░▒░░▓████████▓░░░▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓██████    //
//    █████████▓████████▓█▓██▓▓█▓▓▓▓▓▓▓▓▓▒▒▒▒▒░▓████████▒░░░▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓▓▓▓██████    //
//    █████████▓████████▓████▓██▓▓█▓▓▓▓▓▓▒▒▒▒▒░▒████████▒░░▒▒▒▒▒▓▓▓▓▓██▓▓▓▓▓▓▓████████▓▓▓███████    //
//    ██████████████████▓████▓██▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░███████▓▒░░░▒▒▒▒▓▓▓▓▓▓█▓▓██▓▓▓████████▓▓▓███████    //
//    ██████████████████▓████▓▓█▓▓▓▓▒▒▒▒▒▒▒░░░░░███████▒░░░░░░▒▒▒▒▒▒▓▓▓▓███▓▓▓████████▓▓▓███████    //
//    ██████████████████▓█▓▓▓▓▓▓▒▒▓▒▒▒▒▒░░░░░░░░███████░░░░░░░░░▒▒▒▒▓▓▓▓▓▓▓▓▓▓████████▓▓▓███████    //
//    ██████████████████▓█▓▓▓▓▒▒▒▒▒▒▒░░░░░░░░░░▒██████▓░░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓████████▓▓▓███████    //
//    ██████████████████▓█▓▒▒▒▒▒▒░░░░░░░░░░░░░░░▓█████▓░░░░░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓█████████▓████████    //
//    ██████████████████▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░▓████▒░░░░░░░░░░░░░░▒▒▒▒▒▓▓▓▓██████████████████    //
//    █████████████████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▓▓░░░░░░░░░░░▒▒▒▒░░░▒▒▒▒▓▓▓▓▓████████████████    //
//    ██████████████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓████▓█████████    //
//    ███████████▓▓▓▓▓▓▒▒▒▒▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓▓▓▓█████████    //
//    ██████████▓▓▓▓▓▓▓▓▓▓▓▓▓████████████████████████████▓▓▓▓▓▓█▓██▓▓▓▓█▓███▓▓▓▓▓▓▓▓▓▓▓█████████    //
//    █████████▓▓▓▓▓▓▓▓▓███████████████████████████████▓▓▓▓▓▓▓▓█▓████▓█████████▓▓▓▓▓▓▓▓▓████████    //
//    ████████▓▓▓▓█████████████████████████████████████▓▓▓▓▓▓▓▓▓▓▓▓█████████████████▓▓▓▓████████    //
//    ██████████████████████████████████████████████████████████████████████████████████████████    //
//    ██████████████████████████████████████████████████████████████████████████████████████████    //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract VAB is ERC721Creator {
    constructor() ERC721Creator("Bratovanov Ventsislav", "VAB") {}
}