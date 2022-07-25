// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Distant Vibrations
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ███████████████████████▒╠▓▓██████████████████████████▓▓▒▒███████████████████████    //
//        ███████████████████████▒╟▓▓███████████████████████████▓╬Å▓██████████████████████    //
//        ███████████████████████▒╠▓▓███████████████████████████▓▒▒▓██████████████████████    //
//        ███████████████████████▓▒╟▓▓▓████████████████████████▓╬▒╣███████████████████████    //
//        ███████████████████▓▓╬███▄╬╣╣╬████╣██████████╬▓███╬╣╬╬▒▓██╬▓╬╣██████████████████    //
//        ██████████████▌╠████╬▓╣╣█▓▒╠╣╬╬███╬╣████████▓╬▓██▒╬╬╩▒▓██▓▓▓████╠╟██████████████    //
//        ████████████▒██╚╣███▓▓▓▓█▓╬▒╠╬╣╣╬██▓▓███████▓██▓╬╬╬╬▒╠╣█▓▓▓▓███▀▒▓█▒████████████    //
//        ████████████████▄╬███╬▓▓▓▓█▓╬▄╬╠╣╣▓▓▓██████▓▓▓▓╬╬▒▄╣▓█▓▓▓▓╬▓██▓▒████████████████    //
//        ███████████████╣█▌╣████▓█████▓████▓╬╬▓▓███▓╬╬╟█████▓████▓████╣╣██╫██████████████    //
//        ███████████████▒██▌╬████▓▓██▓╬╬╬╠╠▒╬╬╣▓▓▓▓╬╬╬╬▒╠╣╬╣╣███▓╣███▓╣██╬███████████████    //
//        ████████████████╬╟█▓╣╬██╬╣▓█▓╬╬╬╬╬╬▒╠╬╬╬╬╬╣╬╠╠╬╬╬╬╣▓██╬╬██╬╬╣██╣████████████████    //
//        █████████████████▒██▓╬╬╬██╬╬▓██▓╬╬╬╣▓╬╬╬╬╬╬╣╣╬╬╬▓▓█▓╬╬██▓╠╬╣██▒▓████████████████    //
//        ██████████████████████╠╬╬██╬╣▓███▓▓╬▓╣▓╣╬╣▓▓╬▓▓▓██▓╬╬╣█╠╬╠▓███▓█████████████████    //
//        ██████████████████▒███▒╬╬╬█▌╣╣╬▓▓▓▓╬╬╬╬╬╬╬╣╬╣▓▓█▓╬╣╬╣█╬╬╬╬███╬██████████████████    //
//        ████████████▓██████▓████╬╬╬██╬╣╬╬████▓╬╬╬╬╣████╬╬╬╬██╬╬╬████▓███████████████████    //
//        ████████████▓█████████████▒╬╬█▓╣╣╬╬████▓╣▓███╬╬╬╬╣█▒╬╬█████████████▓▓███████████    //
//        ▓▓▓▓█▓▓╬╬▓▓▓╣█████████████▌╬╬▓╬█╟╣▓╬████████╬╣▓╬█▓▓╬╬╬█████████████▓█▓▓▓╬▓▓▓▓▓▓▓    //
//        ███████████████████████████▌╬╣██╠▓╟▓▓╬████╬▓▓▓▓▓███╬╬███████████████████████████    //
//        ███████████████████████████╬╬╬███▓╬▓█▓▓╬╬▓▓▓▓╬╣███╬╬╣███████████████████████████    //
//        ███████████████████████████╬╬╬▓███╬╬╣▓▓▓╣▓▓▓╣╬████╬╣╬███████████████████████████    //
//        ████████████████████████████╬╬█████▓▓▓█╬╬█▓╬▓█████╬╬▓███████████████████████████    //
//        ███████████╬█████████████████▒╣████▓██╬██╬╫█▓█████╬█████████████████╬███████████    //
//        ██████████╣██████████████████▓╬███████▓╬▓╣███████╬╬██████████████████╬██████████    //
//        ▓╬╫▓▓╬▓█╣████▌░╠▓█████████████▓████████▓╬████████▓╟█████████████╬▒╣████▌╣╬▓▓▓╣▓▓    //
//        ███████▓██████░╠╬▓████████████████████╣███▓████████████████████╬╠▒╫██████▓██████    //
//        ▓▓▓▓███╬█████░▒▒╫██████████████████████╬▓██████████████████████▌▒▒▒█████▓▓███▓▓▓    //
//        ╣╣╣╣╬╬╬╬╬██████▒╠╬╬▓████████████████████████████████████████╫╬╬▒▒▓█████╬╬╬╬╬╬╣╣╣    //
//        ╬╬╬╬╬╬╬╬╬╬╬╬╣███▓▒╠╢╬╟██▓█████████████████████████████████▓╟╬╠╠▓███▓╬╬╬╬╬╬╬╬╬╬╬╬    //
//        ╬╬╬╬╬╬╬╬╬╬╬╬╬██████▒▒╠╬╣████████████████████████████████╣╣╬▒▒██████╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//        ╬╬╬╬╬╬╬╬╬╬╬╬╬╬██████▒░╬╬╬▓████████████████████████████▓╬╬╬╩╠██████╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//        ╬╬╬╬╬╬╬╬╬╬╬╬╢▓╬███▒▀█▓╬╬╬╬╠██████████████████████████▓╬╬╬╬╣█▀╬███▓╣╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//        ╬╬╬╬╬╬╬╬╬╣╬╠╬╬████▓╬╠▒╬╣╢╬██▓███████████████████▓█████╠╬╬╬▒╩╠▓▓███╬╬╬╟╬╬╬╬╬╬╬╬╬╬    //
//        ╬╬╬╬╬╣╬╬╬╬╬╬╬╬╣██╠╣▓▄▄▀░╩▓█▓╟██╠╬▓█████████████╬╬███▓█▓╩╩▀▄▄▓╬▒╟█▓╬╬╬╬╬╬╬╬╣╬╬╬╬╬    //
//        ╬╬╬╬╬╬╬╬╣╬╬╬╬╢██▒╠╬╬╬▀▓▒╫▓▓█████▓▄╚▀█████████▀▄▄███████▓╟▓▀╣╣╬▒░██╬╠╬╬╣╣╬╬╬╬╬╬╬╬    //
//        ▓╣▓▓▓▓▓▓╠╬╬╠╠╠╬╬█▓╣▓░▒╠╟╣█████████Å╬╣▓████▓╢╣╬╣█████████╬╬▒░▄╢▓█╬╬╬▒╠╠╬▒╣▓▓▓▓▓╬▓    //
//        ╣░░░░░╠╠╬╬╬╠╠╬╬╬╠╠╠╬▒╬╬╬╬╬╬╬╬█████▒▒╠╬╬╣▓╬╬▒▒▒█████╬╬╬╬╬╣╠╢▒╬╬╠╠╬╬╬╠╠╠╬╬╠▒░░░░░╫    //
//        ╜╜╜╜╜╜╜╜╜╜╜╜╜╙╜╜╜╜╙╙╙╜╜╜╜╜╜╜╜▀▀▀▀▀▀▀╜╙╙╜╜╜╙╜╨▀▀▀╜▀▀▀╜╜╜╜╜╜╜╜╜╙╜╜╜╜╜╙╜╜╜╜╙╜╜╜╜╜╜╜    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract DSTV is ERC1155Creator {
    constructor() ERC1155Creator() {}
}