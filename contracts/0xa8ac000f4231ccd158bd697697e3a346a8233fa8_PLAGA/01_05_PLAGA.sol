// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: La Plaga Invade
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                ▄▄▄██████████████▄▄,                        //
//                                           ▄▄██████▀▀▀▀▀`   ▀▀▀▀▀██████▄,                   //
//                                        ▄████▀▀                     "▀█████▄                //
//                                     ▄████▀                             '▀███▄,             //
//                                   ▄███▀                                   "▀███▄           //
//                                 ▄████▄▄▄▄█████▄▄▄▄▄,                         ▀███,         //
//                                ▄███████▀▀▀▀▀▀▀▀▀███████▄                       ▀██▄        //
//                              ,████▀'                `▀████▄                     ▀███       //
//              ,,            ,██████████▄▄,               ▀███▄                     ███      //
//          ,▄ ,███▄▄       ▄████▀▀▀▀▀▀▀▀█████▄              ▀██▄                     ███     //
//          ███████████▄  ▄██████▄▄         ▀███▄             ▀███                    ▐██▌    //
//         ████▄  ███████████▀▀▀▀████         ▀███             ▀██▌                    ███    //
//        ██████▌ `▀▀▀███████     `███         ▐██▌             ███                    ███    //
//        ██████     ▄█████▀▀      ███          ███             ███                    ███    //
//         ██████████████▌        ╔██▌          ▐██`            ███                    ███    //
//          ▀█████████▀███▄      ▄███           ███             ███                   ]██▌    //
//                      ███████████▀           ╒██▌             ███                   ███     //
//                      ╙███▀▀▀▀-             ▄███             ███                   ███▀     //
//                        ▀███▄             ▄███▀             ▄██▀                  ███▀      //
//                          ███████▄▄▄▄▄▄█████▀             ,███▀                 ,███        //
//                           ▀████▀▀████▀▀▀▀              ▄████`           ▄▄▄▄▄,███▀_        //
//                             ▀████▄▄               ,▄▄████▀           ,██████████           //
//                                ▀█████████████████████▀▀            ▄████'▐██▀▀             //
//                                 `█████▀▀▀▀▀▀▀▀▀▀`'               ▄████▄▄▄███`              //
//                                   `▀█████▄▄,                ,▄▄█████████▀███               //
//                                       ▀▀████████████████████████████▀▀                     //
//                                             ▀▀▀▀▀██████████▀▀▀▀▀`                          //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract PLAGA is ERC721Creator {
    constructor() ERC721Creator("La Plaga Invade", "PLAGA") {}
}