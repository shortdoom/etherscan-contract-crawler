// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: TRANSITION//TRANSMISSION
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████╬╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙███████████████████████████████████████████████████    //
//        ██████████▒╠╬╬╗               ╙█████████████████████████████████████████████████    //
//        ████████╠╬╠╬╠╠╬╬▒╖        '     ╙███████████████████████████████████████████████    //
//        ██████░╬╠╬╬╠╬╬╬╬╠╬▒▄              ╙▀████████████████████████████████████████████    //
//        ███╬░╬╬╬╠╠▒╬╬╬╠╠╠╠╠╬╬╦               ▀███████████████████████████████████████▓██    //
//        █╬╬╠╬╠╬╠╠╠╬╬╠╬╠╠╠╬╬╠╠╠╠╗               ╙████████████████████████████████████████    //
//        ╠╬╬╠╠╠╬╬╠╠╠╠╠╬╬╬╬╠╬╬╬╬╠╬╬╦               ╙██████████████████████████████████████    //
//        ╬╬╬╠╠╬╬╠╠╠╠╬╠╬╬╬╠╬╬╬╠╬╬╠╬╠╬▓Ç              ╙████████████████████████████████████    //
//        ╠╬╬╠╠╬╬╬╬╠╠╬╬╬╠╬╬╬╠╬╬╬╠╬╠╬╬╠╠▓▄              ╙██████████████████████████████████    //
//        ╠╬╬╬╠╠╬╠╠╬╠╠╬╬╬╠╠╠╬╠╬╬╬╬╬╠╬╬╬╬╬▓╦              ╙████████████████████████████████    //
//        ╬╬╬╠╬╬╬╬╠╠╬╬▄▒╬╠╬╬╬╬╬╠╬╠╬╬╬╬╠╬╬╬╬╬╗               ▀█████████████████████████████    //
//        ╠╬╬╬╬╬╬╠╠╠▓████▒╬╬╬╬╠╠╬╬╠╬╬╬╬╬╬╠╬╠╬╬▒        !~     ▀███████████████████████████    //
//        ╬╬╠╬╠╠╬╬█████████▄▒╬╢╬╬╟╢╬╬╠╬╬╠╠╠╬╬╬╬╬▓▄              ╙█████████████████████████    //
//        ╠╬╬╠╠▒██████████████╬╬╬╬╬╬╬╬╬╬╬╠╠╬╬╬╬╬╬╣▓▄              ╙███████████████████████    //
//        ╠╬╬╬▓████████████████▓╬╠╬╬╬╬╬╬╠╬╬╬╬╠╬╬╢╬╬╣▓▄              ╙█████████████████████    //
//        ╠╬▓█████████████████████╬╬╬╬╠╬╬╬╠╬╬╬╬╬╬╬╬╬╬╬▓▄              ╙███████████████████    //
//        ▓█▓▓██████████████████████╬╬╬╢╬╬╠╬╬╬╬╬╠╬╣╬╬╬╬╬╬▓              ╙▀████████████████    //
//        ▓███████████████████████████╬╣╬╬╬╬╬╬╬╬╣╬╣╢╬╬╣╬╬╬╬▓▄              ▀██████████████    //
//        ▓█████████████████████████████╬╬╬╢╬╬╬╬╬╬╬╬╬╣╬╬╬╣╬╬╬▓▄              ▀████████████    //
//        ▓▓██████▓▓██████████████████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╠████████▓▄▓▓╗╗╗╗▓██████████    //
//        ▓▓▓▓▓█▓▓███████████████████████████╬╬╬╬╬╬╬╬╣╬▓╬╬╬╣╟████████████▓██╣█████████████    //
//        ▓▓▓▓▓████████████████████████████████╬╬╬╬╬╬╬╬╬╣╣╟███████████████▓███████████████    //
//        ▓╬▓▓███████████████████████████████████╬╬╬╬╬╬╣╟█████▀▀▀╙╩╙╚╙▀█▓█▓███████████████    //
//        █████████████████████████████████████████╬╣╬▓██████▌  .   ²⌐  ╙╣▓███████████████    //
//        ███████████████████████████████████████████▓████████▄           `▀██████████████    //
//        █████████████████████████████████████████████████████▄ '       ,, ╙█████████████    //
//        ██▓████████████████████████████████████████████████████ ,,#█╜╙╙╫╙╙╙▓▓███████████    //
//        ████████████████████████████████████████████████████████▓╬╣.    `,  ████████████    //
//        ████████████████████████████████████████████████████████████▄     V  ███████████    //
//        ██████████████▓███████████████████████████████████████████████▄      ,#█████████    //
//        ██████████▓███████████████▓██████████████████████████████████████▄  ▓╣╬█████████    //
//        ██████████████▓███████████████████████████████████████████████████████▓█████████    //
//        ▓██▓████▓▓██▓██▓██▓███████████████████████████████████▓██████▓██████████████████    //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract BXHDTRNS is ERC721Creator {
    constructor() ERC721Creator("TRANSITION//TRANSMISSION", "BXHDTRNS") {}
}