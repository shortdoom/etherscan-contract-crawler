// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: 2302.eth
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                       //
//                                                                                                                                       //
//                                                                                                                                       //
//    ____/\\\\\\\\\_________/\\\\\\\\\\______/\\\\\\\_______/\\\\\\\\\_________________________________________/\\\_________            //
//     __/\\\///////\\\_____/\\\///////\\\___/\\\/////\\\___/\\\///////\\\______________________________________\/\\\_________           //
//      _\///______\//\\\___\///______/\\\___/\\\____\//\\\_\///______\//\\\___________________________/\\\______\/\\\_________          //
//       ___________/\\\/___________/\\\//___\/\\\_____\/\\\___________/\\\/_____________/\\\\\\\\___/\\\\\\\\\\\_\/\\\_________         //
//        ________/\\\//____________\////\\\__\/\\\_____\/\\\________/\\\//_____________/\\\/////\\\_\////\\\////__\/\\\\\\\\\\__        //
//         _____/\\\//__________________\//\\\_\/\\\_____\/\\\_____/\\\//_______________/\\\\\\\\\\\_____\/\\\______\/\\\/////\\\_       //
//          ___/\\\/____________/\\\______/\\\__\//\\\____/\\\____/\\\/_________________\//\\///////______\/\\\_/\\__\/\\\___\/\\\_      //
//           __/\\\\\\\\\\\\\\\_\///\\\\\\\\\/____\///\\\\\\\/____/\\\\\\\\\\\\\\\__/\\\__\//\\\\\\\\\\____\//\\\\\___\/\\\___\/\\\_     //
//            _\///////////////____\/////////________\///////_____\///////////////__\///____\//////////______\/////____\///____\///__    //
//                                                                                                                                       //
//                                                                                                                                       //
//                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract TwoThreeOhTwo is ERC721Creator {
    constructor() ERC721Creator("2302.eth", "TwoThreeOhTwo") {}
}