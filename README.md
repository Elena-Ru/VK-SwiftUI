# VK-SwiftUI
Application for working in the social network, in which it is possible to manage groups, friends, view news and photos of the news feed, store your data locally on the device and on a remote server.

To login the app you shoud enter your VK-acount information. If there is no internet connection the screen with warning will be shown.

![login](https://user-images.githubusercontent.com/10026372/216045036-7639dfbc-9978-45a5-812b-cb6bc9d8cd9b.jpg)

If user has no friends yet, the empty view will be shown on the first TabView. In other case there will be a list of friends. Friends are divived into sections by the first letter of the last name and sorted in alphabet order.
You can manage them by adding to Favorites. You have opportunity to watch only Favorites. Just press toogle on the top of the view.

![second](https://user-images.githubusercontent.com/10026372/215997766-1f351792-627c-4130-8d62-f9ca26fb2373.jpg)

You can watch photos of your friends. You shoud press on the row and photo gallery will be showned. 
All photos structured into 2 columns. Below every photo you can see Like control. It shows total quantity of likes and is the user liked already this photo. You can tap on this control and set like or remove own like on it. Your actions will be send in post-request to server.
Also you can see photo in full-size format and leaf through all of them.

![photo](https://user-images.githubusercontent.com/10026372/216007229-535953b5-3570-4193-8554-b75730cd4fa5.jpg)

You can zoom photo, if ypu need.

![ezgif com-gif-maker (4)](https://user-images.githubusercontent.com/10026372/216052914-6b100b4e-3d63-4099-9bd9-a0ad56562797.gif)

There is a list of your favourite groups on the second TabView. 
If you have no favorite groups allready, the app will offer to add one.

![ezgif com-gif-maker (5)](https://user-images.githubusercontent.com/10026372/216986381-62fec887-e3e6-4bcc-ad5e-1c8956c4589f.gif)

You can add new group to your list by pressing Add button on the right top of the view. After you have pressed this button,  the view with list of all groups will apperead. There is a search bar in All group list, so you can search any group you need.

![searchGroup](https://user-images.githubusercontent.com/10026372/218621924-51dc4487-1b3b-4e85-8da1-a3e97d8662a4.jpg)

If you tap on group, it will be added to your favorite list and current view will be changed to MyGoups. But if if you tap on group, wich already exsist in your favorite list, alert view will appered.
You can also manage you favourite groups by deleting them from this list. All changes will appear also in your account on remote server.

![deleteGroup](https://user-images.githubusercontent.com/10026372/218622488-e0c58960-f8ad-4628-ba66-8e260a1061f8.jpg)

There is a list news on the third TabView. Here you can see the news from your groups. You can like news post, by tapping on like control below the news content.

![news](https://user-images.githubusercontent.com/10026372/216014281-fa626ccb-2843-410f-bb9f-290a600698f0.jpg)

Application uses:
 - Realm;
 - Alamofire;
 - SDWebImage;
 - SwiftLint;
 - AlertX.
