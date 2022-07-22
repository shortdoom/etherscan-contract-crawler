// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: BeetsDAO Founder's Pass Creators
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                               //
//                                                                                                                                                                                                                               //
//    $$$$$$$$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  $$$$$$$$\ $$$$$$$\  $$\  $$$$$$\        $$$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\         $$$$$$\  $$$$$$$\  $$$$$$$$\  $$$$$$\ $$$$$$$$\  $$$$$$\  $$$$$$$\   $$$$$$\      //
//    $$  _____|$$  __$$\ $$ |  $$ |$$$\  $$ |$$  __$$\ $$  _____|$$  __$$\ $  |$$  __$$\       $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\       $$  __$$\ $$  __$$\ $$  _____|$$  __$$\\__$$  __|$$  __$$\ $$  __$$\ $$  __$$\     //
//    $$ |      $$ /  $$ |$$ |  $$ |$$$$\ $$ |$$ |  $$ |$$ |      $$ |  $$ |\_/ $$ /  \__|      $$ |  $$ |$$ /  $$ |$$ /  \__|$$ /  \__|      $$ /  \__|$$ |  $$ |$$ |      $$ /  $$ |  $$ |   $$ /  $$ |$$ |  $$ |$$ /  \__|    //
//    $$$$$\    $$ |  $$ |$$ |  $$ |$$ $$\$$ |$$ |  $$ |$$$$$\    $$$$$$$  |    \$$$$$$\        $$$$$$$  |$$$$$$$$ |\$$$$$$\  \$$$$$$\        $$ |      $$$$$$$  |$$$$$\    $$$$$$$$ |  $$ |   $$ |  $$ |$$$$$$$  |\$$$$$$\      //
//    $$  __|   $$ |  $$ |$$ |  $$ |$$ \$$$$ |$$ |  $$ |$$  __|   $$  __$$<      \____$$\       $$  ____/ $$  __$$ | \____$$\  \____$$\       $$ |      $$  __$$< $$  __|   $$  __$$ |  $$ |   $$ |  $$ |$$  __$$<  \____$$\     //
//    $$ |      $$ |  $$ |$$ |  $$ |$$ |\$$$ |$$ |  $$ |$$ |      $$ |  $$ |    $$\   $$ |      $$ |      $$ |  $$ |$$\   $$ |$$\   $$ |      $$ |  $$\ $$ |  $$ |$$ |      $$ |  $$ |  $$ |   $$ |  $$ |$$ |  $$ |$$\   $$ |    //
//    $$ |       $$$$$$  |\$$$$$$  |$$ | \$$ |$$$$$$$  |$$$$$$$$\ $$ |  $$ |    \$$$$$$  |      $$ |      $$ |  $$ |\$$$$$$  |\$$$$$$  |      \$$$$$$  |$$ |  $$ |$$$$$$$$\ $$ |  $$ |  $$ |    $$$$$$  |$$ |  $$ |\$$$$$$  |    //
//    \__|       \______/  \______/ \__|  \__|\_______/ \________|\__|  \__|     \______/       \__|      \__|  \__| \______/  \______/        \______/ \__|  \__|\________|\__|  \__|  \__|    \______/ \__|  \__| \______/     //
//                                                                                                                                                                                                                               //
//                                                                                                                                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract BDFPCreators is ERC721Creator {
    constructor() ERC721Creator("BeetsDAO Founder's Pass Creators", "BDFPCreators") {}
}