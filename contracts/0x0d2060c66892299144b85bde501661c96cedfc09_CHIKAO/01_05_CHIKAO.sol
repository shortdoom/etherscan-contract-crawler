// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Chibi Kao
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//                                                                                                                                                                  //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        █████████████████████████████▀▀▀▀▀▀▀██████████▀▀▀▀▀▀▀▀▀▀▀▀█████▀▀▀▀▀▀▀▀███████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀████████▀▀▀▀▀▀▀▀▀████████████████████████████    //
//        ████████████████████████████▌       ▐███████████L       █████████▌  ██████████████████████           ▄████▀'  "▀███▄,     ████████████████████████████    //
//        ████████████████████████████        ▐███████████▌       █████████  ███████████████████████         ▄█████"      ▐█████,   ▐███████████████████████████    //
//        ████████████████████████████         ███████████▌       ████████  ▄███████████████████████r       ▐██████       ▐██████⌐  j███████████████████████████    //
//        ████████████████████████████         ███████████▌       ███████` ▐█████████████████▀██████▌       ███████       ▐██████▌   ███████████████████████████    //
//        ███████████████████████████▌ ]       ███████████▌       ██████▌ ,██████████████████ ███████       ███████       ▐██████▌   ███████████████████████████    //
//        ███████████████████████████─ ▐L      ▐██████████▌       █████▀  ███████████████████ ███████       ███████       ▐██████▌   ███████████████████████████    //
//        ███████████████████████████  █▌      ]██████████▌       █████  ████████████████████ ███████       ███████       ▐██████▌   ▐██████████████████████████    //
//        ███████████████████████████  ██       ██████████▌       ████  ▄███████████████████▌ ▐██████L      ███████       ▐██████▌   ¬██████████████████████████    //
//        ██████████████████████████▌  ██       ██████████▌       ███` ▐████████████████████^ ¬██████▌      ███████       ▐██████▌    ██████████████████████████    //
//        ██████████████████████████▌ ▐██       ██████████▌       ██▀  █████████████████████   ███████      ███████       ▐██████▌    ██████████████████████████    //
//        ██████████████████████████  ▐██r      ▐█████████▌       █▌  ▐█████████████████████   ███████      ███████       ▐██████▌    ██████████████████████████    //
//        ██████████████████████████  ███▌      ¬█████████▌       █    ████████████████████▌   ███████`     ███████       ▐██████▌    ▐█████████████████████████    //
//        ██████████████████████████  ████       █████████▌            `███████████████████▌   ▐██████▌     ███████       ▐██████▌     █████████████████████████    //
//        █████████████████████████▌  ████       █████████▌             ███████████████████`   j██████▌     ███████       ▐██████▌     █████████████████████████    //
//        █████████████████████████' ▐████       █████████▌              ██████████████████     ███████     ███████       ▐██████▌     █████████████████████████    //
//        █████████████████████████  █████⌐      ▐████████▌       ▄      ▐█████████████████     ███████     ███████       ▐██████▌     ▐████████████████████████    //
//        █████████████████████████  █████▌       ████████▌       █       ████████████████▌     ███████.    ███████       ▐██████▌     ▐████████████████████████    //
//        ████████████████████████▌  █████▌       ████████▌       █▌      ▐███████████████▌     ▐██████▌    ███████       ▐██████▌      ████████████████████████    //
//        ████████████████████████L  ▀▀▀▀▀▀       ████████▌       ██       ███████████████▄▄▄▄▄▄▐███████    ███████       ▐██████▌      ████████████████████████    //
//        ████████████████████████  ╒▄▄▄▄▄▄       ▐███████▌       ██▌      `██████████████▀▀▀▀▀▀▀███████    ███████       ▐██████▌      ████████████████████████    //
//        ████████████████████████  ███████       ▐███████▌       ███       ██████████████       ███████    ███████       ▐██████▌      ▐███████████████████████    //
//        ███████████████████████▌  ███████▌       ███████▌       ████       ████████████▌       ███████r   ███████       ▐██████▌      ]███████████████████████    //
//        ███████████████████████▌  ███████▌       ███████▌       ████⌐      ▐███████████Γ       ▐██████▌   ███████       ▐██████▌       ███████████████████████    //
//        ███████████████████████` ╒████████       ███████▌       █████       ███████████        ▐███████   ███████       ▐██████▌       ███████████████████████    //
//        ███████████████████████  ▐████████       ▐██████▌       █████▌      ▐██████████         ███████   ███████       ▐██████▌       ███████████████████████    //
//        ███████████████████████  █████████       ]██████▌       ██████       ██████████         ███████   ▐██████       ▐██████"       ▐██████████████████████    //
//        ██████████████████████▌  █████████L       ██████▌       ██████▌      `████████▌         ███████r   ▀█████.      ▐█████"        -██████████████████████    //
//        ██████████████████████─  █████████▌       ██████L       ███████       ▀███████,         ███████▌     ▀████▄,  ,▄███▀"           ██████████████████████    //
//        ████████████████████,,,,,,,█████▄,,,,,,,,,,,██▄,,,,,,,,,,,██████,,,,,,,,▄███████▌,,,,,████████████,,,,,▄▄████████▄╓,,,,,,,,,,,,,,,████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//        ██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████    //
//                                                                                                                                                                  //
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract CHIKAO is ERC1155Creator {
    constructor() ERC1155Creator() {}
}