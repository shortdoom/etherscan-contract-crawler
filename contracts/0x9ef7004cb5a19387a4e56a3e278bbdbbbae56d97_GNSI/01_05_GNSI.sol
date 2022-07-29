// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Genesia Illustrations
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
//     _______  _______  _        _______  _______ _________ _______                                                           //
//    (  ____ \(  ____ \( (    /|(  ____ \(  ____ \\__   __/(  ___  )                                                          //
//    | (    \/| (    \/|  \  ( || (    \/| (    \/   ) (   | (   ) |                                                          //
//    | |      | (__    |   \ | || (__    | (_____    | |   | (___) |                                                          //
//    | | ____ |  __)   | (\ \) ||  __)   (_____  )   | |   |  ___  |                                                          //
//    | | \_  )| (      | | \   || (            ) |   | |   | (   ) |                                                          //
//    | (___) || (____/\| )  \  || (____/\/\____) |___) (___| )   ( |                                                          //
//    (_______)(_______/|/    )_)(_______/\_______)\_______/|/     \|                                                          //
//                                                                                                                             //
//    _________ _        _                 _______ _________ _______  _______ __________________ _______  _        _______     //
//    \__   __/( \      ( \      |\     /|(  ____ \\__   __/(  ____ )(  ___  )\__   __/\__   __/(  ___  )( (    /|(  ____ \    //
//       ) (   | (      | (      | )   ( || (    \/   ) (   | (    )|| (   ) |   ) (      ) (   | (   ) ||  \  ( || (    \/    //
//       | |   | |      | |      | |   | || (_____    | |   | (____)|| (___) |   | |      | |   | |   | ||   \ | || (_____     //
//       | |   | |      | |      | |   | |(_____  )   | |   |     __)|  ___  |   | |      | |   | |   | || (\ \) |(_____  )    //
//       | |   | |      | |      | |   | |      ) |   | |   | (\ (   | (   ) |   | |      | |   | |   | || | \   |      ) |    //
//    ___) (___| (____/\| (____/\| (___) |/\____) |   | |   | ) \ \__| )   ( |   | |   ___) (___| (___) || )  \  |/\____) |    //
//    \_______/(_______/(_______/(_______)\_______)   )_(   |/   \__/|/     \|   )_(   \_______/(_______)|/    )_)\_______)    //
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract GNSI is ERC721Creator {
    constructor() ERC721Creator("Genesia Illustrations", "GNSI") {}
}