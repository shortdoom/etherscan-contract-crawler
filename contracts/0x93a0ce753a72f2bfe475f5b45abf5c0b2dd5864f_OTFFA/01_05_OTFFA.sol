// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: One Thousand Faces: Fan Art
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                                                                       //
//           .__                                         __  .__         //
//      ____ |  |   ____   ____  __ _______        _____/  |_|  |__      //
//    _/ __ \|  | _/ __ \ / ___\|  |  \__  \     _/ __ \   __\  |  \     //
//    \  ___/|  |_\  ___// /_/  >  |  // __ \_   \  ___/|  | |   Y  \    //
//     \___  >____/\___  >___  /|____/(____  / /\ \___  >__| |___|  /    //
//         \/          \/_____/            \/  \/     \/          \/     //
//                      _____  _______________   ____                    //
//                     /     \ \_   _____/\   \ /   /                    //
//                    /  \ /  \ |    __)_  \   Y   /                     //
//                   /    Y    \|        \  \     /                      //
//                   \____|__  /_______  /   \___/                       //
//                           \/        \/                                //
//                                                                       //
//                                                                       //
//                                                                       //
///////////////////////////////////////////////////////////////////////////


contract OTFFA is ERC721Creator {
    constructor() ERC721Creator("One Thousand Faces: Fan Art", "OTFFA") {}
}