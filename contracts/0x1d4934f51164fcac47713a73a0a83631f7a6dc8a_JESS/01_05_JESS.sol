// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Jessica Moore Editions
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//     ▄▄▄██▀▀▀▓█████   ██████   ██████  ██▓ ▄████▄   ▄▄▄          ███▄ ▄███▓ ▒█████   ▒█████   ██▀███  ▓█████     //
//       ▒██   ▓█   ▀ ▒██    ▒ ▒██    ▒ ▓██▒▒██▀ ▀█  ▒████▄       ▓██▒▀█▀ ██▒▒██▒  ██▒▒██▒  ██▒▓██ ▒ ██▒▓█   ▀     //
//       ░██   ▒███   ░ ▓██▄   ░ ▓██▄   ▒██▒▒▓█    ▄ ▒██  ▀█▄     ▓██    ▓██░▒██░  ██▒▒██░  ██▒▓██ ░▄█ ▒▒███       //
//    ▓██▄██▓  ▒▓█  ▄   ▒   ██▒  ▒   ██▒░██░▒▓▓▄ ▄██▒░██▄▄▄▄██    ▒██    ▒██ ▒██   ██░▒██   ██░▒██▀▀█▄  ▒▓█  ▄     //
//     ▓███▒   ░▒████▒▒██████▒▒▒██████▒▒░██░▒ ▓███▀ ░ ▓█   ▓██▒   ▒██▒   ░██▒░ ████▓▒░░ ████▓▒░░██▓ ▒██▒░▒████▒    //
//     ▒▓▒▒░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░░▓  ░ ░▒ ▒  ░ ▒▒   ▓▒█░   ░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░    //
//     ▒ ░▒░    ░ ░  ░░ ░▒  ░ ░░ ░▒  ░ ░ ▒ ░  ░  ▒     ▒   ▒▒ ░   ░  ░      ░  ░ ▒ ▒░   ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░    //
//     ░ ░ ░      ░   ░  ░  ░  ░  ░  ░   ▒ ░░          ░   ▒      ░      ░   ░ ░ ░ ▒  ░ ░ ░ ▒    ░░   ░    ░       //
//     ░   ░      ░  ░      ░        ░   ░  ░ ░            ░  ░          ░       ░ ░      ░ ░     ░        ░  ░    //
//                                          ░                                                                      //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract JESS is ERC721Creator {
    constructor() ERC721Creator("Jessica Moore Editions", "JESS") {}
}