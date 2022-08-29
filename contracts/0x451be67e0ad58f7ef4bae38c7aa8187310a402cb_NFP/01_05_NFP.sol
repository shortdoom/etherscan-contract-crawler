// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NFP
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKOO0NWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxooooxKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0doddddod0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0dodollooooONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOdododkkdooooONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOdddoxKNNXxooooONWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOdddoxKWMMWXxooookNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOdddoxXWMMMMWXkooolkXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoddokXWMMMMMMWXkooolkXWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkoxxokXWMMMMMMMMWNkolloxkOO00KXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXkdxxokXMMMMMMMMMWWXOoloooddxxxkkO0XNMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXxdxxdkNMMMMMMMMWKkdolllooodddxxkkkkO0XWMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxdxxdONMMMMMMMNKklccccllooodddxxkkkkOO0NMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxdxxdONMMMMMWXOoc:::ccclloooddxxxkkkkOO0XMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxdkxdONMMMMWKxl:;;:::ccclloooddxxxkkkkOO0NMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxdkxdONMMMN0o:;;;;;:::ccclllooddxxxxkkkO0NWWWWMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0xdkxd0NMMNOl;,,,;;;;:::ccllloooddxxxkkkOKXXNNNWWMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMW0dxkxd0WWNkc,,,,,,;;;::::ccldkxdddxxxxdddOKKNWMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMW0dxkxx0WWOl,'',,,,,;;;::::cclokOOOO0K0xlloxOXMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMN0dxkdxKWXd;''''',,,,;;;::::ccclloddxkOOkddxooONMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMNOdxkdxKWXo,'''''',,,,;;;;:::cccllodxOKKKKKklcclONMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMNOdxkdxKWXo,'''''',,,,,;;;;:::ccclllooxOKXXNKxlcclkNWMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMNOdkkdxKWKl''';;,''',;::;;;:cccccclloooddxkkO00xlcclkNWMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMNOdkkdkXWKl'',lxc''';:::c:;;;cxOxollodddddxkO0OOOdccclkNWWWWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMWNkdkkdkXWNd'.,xXO;''cxl,,:c:;::lkXXOdlodOKOxxOXNX0OxoolokKXWMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMWXkdkkdkXWWO;.,dNWk;',ll;,;oOxlc::coOKxloxXMNOxkXMMWNK0kddoxXWMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMWXkdOkdkXWMNo',oXMM0c',:cox0NMWXKOxolloodkXWMW0xkXMMMMMNOlcccxXWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMWXkxOkdkNMMNx;;dXMMMXd:,;oKWMMMMMMMWNKxoooONMMWKkkKWMMMMMNOl::cxXWMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMWXkxOkdONWXOo:l0WMMMWk:dOdclONMMMMMMMWKookdxXMMMN0kkKNNWWWWNOl::cdKWMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMWXxxOkoodxxdox0NMMMMMWxc0MWKxcdXMMMMMMWOlkN0xKWWMMWXKKKXXXNNNN0o::cdKWMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMWKxxOkloxOKXNWMMMNK000kloXMMMWOcxNMMMMMMKxxKN0O00KWMMMMMMMMMWWWN0o::cdKWMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWKxxOkxONMMMMMMMMMNK00OkONMMMMWOcdNMMMMMMWN0k0WWWNXNMMMMMMMMMMMMMW0o:::dKWMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMWKxxOkx0WMMMMMMMMMMMMMMMMMMMWKkxxkXMMMMMMMMMWK0NMMMMMMMMMMMMMMMMMMMWKd:::oKWMMMMMMMMMMMM    //
//    MMMMMMMMMMMWKxxOxd0NWWWWWWWWWWWWWWWWWWWNKdxKNWWWWWWWWWWWWNNWWWWWWWWWWWWWWWWWWWWWN0o:::o0WMMMMMMMMMMM    //
//    MMMMMMMMMMWKxk0kddkkkkkkkkkkkkkkkkkkkkkxoodkkxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdo::::oKWMMMMMMMMMM    //
//    MMMMMMMMMMW0xkOOkkkkkkkkkkxxxxxxxxxxddddddddddooooooooollllllllcccccccccc::::::::::::::lOWMMMMMMMMMM    //
//    MMMMMMMMMMMNKOOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkxxxxxxxxxxxxxxxxxxxxxxxxxxxk0NMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWWWWWWWWWWWWWWWWWWWNNNNNWWWNNNWNXXXNWWNXXXXNWWNNNWWWWWWWWWWWWWWWWWWWWWWWWWMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN00OkXMMXkO0kkOkk0XOdkOkx0NKdOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKKkxXWWKxxxd0WKdxOxoOWN0dxklkWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKxkxxO00kxkxdKWKdxOxo0WMXxoxlkWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0xkxxKXX0xkxdKWKdxOxo0WWKddxlkNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKxkxxXMMXxkOxk0kdkKkoxOkxkKOodkOO0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKXXKNMMWXXWNKKKXWMNKKKKXWMNK0000KWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract NFP is ERC721Creator {
    constructor() ERC721Creator("NFP", "NFP") {}
}