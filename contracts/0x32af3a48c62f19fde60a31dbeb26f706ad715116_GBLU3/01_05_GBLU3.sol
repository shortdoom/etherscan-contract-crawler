// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Grift3rs by BLU30RGY
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
//                                                                                                     //
//       ▄██████▄     ▄████████  ▄█     ▄████████     ███      ▄████████    ▄████████    ▄████████     //
//      ███    ███   ███    ███ ███    ███    ███ ▀█████████▄  ███    ███   ███    ███   ███    ███    //
//      ███    █▀    ███    ███ ███▌   ███    █▀     ▀███▀▀██  ███    █▀    ███    ███   ███    █▀     //
//     ▄███         ▄███▄▄▄▄██▀ ███▌  ▄███▄▄▄         ███   ▀ ▄███▄▄▄      ▄███▄▄▄▄██▀   ███           //
//    ▀▀███ ████▄  ▀▀███▀▀▀▀▀   ███▌ ▀▀███▀▀▀         ███     ▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████    //
//      ███    ███ ▀███████████ ███    ███            ███      ███    █▄  ▀███████████          ███    //
//      ███    ███   ███    ███ ███    ███            ███      ███    ███   ███    ███    ▄█    ███    //
//      ████████▀    ███    ███ █▀     ███           ▄████▀    ██████████   ███    ███  ▄████████▀     //
//                                                                                                     //
//                                     ▀█████████▄  ▄██   ▄                                            //
//                                       ███    ███ ███   ██▄                                          //
//                                       ███    ███ ███▄▄▄███                                          //
//                                      ▄███▄▄▄██▀  ▀▀▀▀▀▀███                                          //
//                                     ▀▀███▀▀▀██▄  ▄██   ███                                          //
//                                       ███    ██▄ ███   ███                                          //
//                                       ███    ███ ███   ███                                          //
//                                      ▄█████████▀   ▀█████▀                                          //
//                                                                                                     //
//    ▀█████████▄  ▄█        ███    █▄     ▄████████  ▄██████▄     ▄████████    ▄██████▄  ▄██   ▄      //
//     ███    ███  ███       ███    ███   ███    ███ ███    ███   ███    ███   ███    ███ ███   ██▄    //
//     ███    ███  ███       ███    ███   ███    █▀  ███    ███   ███    ███   ███    █▀  ███▄▄▄███    //
//    ▄███▄▄▄██▀   ███       ███    ███  ▄███▄▄▄     ███    ███  ▄███▄▄▄▄██▀  ▄███        ▀▀▀▀▀▀███    //
//    ▀███▀▀▀██▄   ███       ███    ███  ▀███▀▀▀     ███    ███ ▀▀███▀▀▀▀▀   ▀▀███ ████▄  ▄██   ███    //
//     ███    ██▄  ███       ███    ███   ███    █▄  ███    ███ ▀███████████   ███    ███ ███   ███    //
//     ███    ███  ███▌    ▄ ███    ███   ███    ███ ███    ███   ███    ███   ███    ███ ███   ███    //
//    ▄█████████▀  █████▄▄██ ████████▀    ██████████  ▀██████▀    ███    ███   ████████▀   ▀█████▀     //
//                                                                                                     //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////


contract GBLU3 is ERC721Creator {
    constructor() ERC721Creator("Grift3rs by BLU30RGY", "GBLU3") {}
}