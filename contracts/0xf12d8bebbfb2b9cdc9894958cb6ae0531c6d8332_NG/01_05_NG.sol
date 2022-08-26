// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NekoGirls
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                                                                            //
//                                                                            //
//          ___           ___           ___           ___                     //
//         /__/\         /  /\         /__/|         /  /\                    //
//         \  \:\       /  /:/_       |  |:|        /  /::\                   //
//          \  \:\     /  /:/ /\      |  |:|       /  /:/\:\                  //
//      _____\__\:\   /  /:/ /:/_   __|  |:|      /  /:/  \:\                 //
//     /__/::::::::\ /__/:/ /:/ /\ /__/\_|:|____ /__/:/ \__\:\                //
//     \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\/:::::/ \  \:\ /  /:/                //
//      \  \:\  ~~~   \  \::/ /:/   \  \::/~~~~   \  \:\  /:/                 //
//       \  \:\        \  \:\/:/     \  \:\        \  \:\/:/                  //
//        \  \:\        \  \::/       \  \:\        \  \::/                   //
//         \__\/         \__\/         \__\/         \__\/                    //
//          ___                       ___                         ___         //
//         /  /\        ___          /  /\                       /  /\        //
//        /  /:/_      /  /\        /  /::\                     /  /:/_       //
//       /  /:/ /\    /  /:/       /  /:/\:\    ___     ___    /  /:/ /\      //
//      /  /:/_/::\  /__/::\      /  /:/~/:/   /__/\   /  /\  /  /:/ /::\     //
//     /__/:/__\/\:\ \__\/\:\__  /__/:/ /:/___ \  \:\ /  /:/ /__/:/ /:/\:\    //
//     \  \:\ /~~/:/    \  \:\/\ \  \:\/:::::/  \  \:\  /:/  \  \:\/:/~/:/    //
//      \  \:\  /:/      \__\::/  \  \::/~~~~    \  \:\/:/    \  \::/ /:/     //
//       \  \:\/:/       /__/:/    \  \:\         \  \::/      \__\/ /:/      //
//        \  \::/        \__\/      \  \:\         \__\/         /__/:/       //
//         \__\/                     \__\/                       \__\/        //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


contract NG is ERC721Creator {
    constructor() ERC721Creator("NekoGirls", "NG") {}
}