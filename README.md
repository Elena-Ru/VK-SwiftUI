# VK-SwiftUI
Application for working in the social network, in which it is possible to manage groups, friends, view news and photos of the news feed, store your data locally on the device and on a remote server.

To login the app you shoud enter your VK-acount information. If there is no internet connection the screen with warning will be shown.

![ll](https://user-images.githubusercontent.com/10026372/215652200-e5db5ba8-d0b2-4340-91d8-5dbab0e6f1de.jpg)

If user has no friends yet, the empty view will be shown on the first TabView. In other case there will be a list of friends. Friends are divived into sections by the first letter of the last name and sorted in alphabet order.
You can manage them by adding to Favorites. You have opportunity to watch only Favorites. Just press toogle on the top of the view.

![friendsList](https://user-images.githubusercontent.com/10026372/215741882-2a395889-0fc3-4eae-8231-2a10628965c7.jpg)

You can watch photos of your friends. You shoud press on the row and photo gallery will be showned. 
All photos structured into 2 columns. Below every photo you can see Like control. It shows total quantity of likes and is the user liked already this photo. You can tap on this control and set like or remove own like on it. Your actions will be send in post-request to server.
Also you can see photo in full-size format and leaf through all of them.

![friendsPhotos](https://user-images.githubusercontent.com/10026372/215656732-e01560e5-ceeb-4587-afe4-5897f6ae922a.jpg)

There is a list of your groups on the second TabView. 
You can add new group to your list by pressing Add button on the right top of the view. After you have pressed this button,  the view with list of all groups will apperead. If you tap on group, it will be added to your favorite list and current view will be changed to MyGoups. But if if you tap on group, wich already exsist in your favorite list, alert view will appered.

![addGroup](https://user-images.githubusercontent.com/10026372/215689596-5a749454-5777-4692-8e66-0ee118b505f3.jpg)

You also can manage you favourite groups by deleting them from this list.

![deleteGroup](https://user-images.githubusercontent.com/10026372/215692448-66728872-b261-4afb-9a96-eb7265d3da3b.jpg)

There is a list news on the third TabView. Here you can see the news from your groups. You can like news post, by tapping on like control below the news content.

![news](https://user-images.githubusercontent.com/10026372/215693949-3315c7c8-b700-4578-80de-150d3228858c.jpg)

Application uses:
 - Realm for storing data;
 - Alamofire for requests;
 - SDWebImage for images;
 - AlertX for custom alert views.
