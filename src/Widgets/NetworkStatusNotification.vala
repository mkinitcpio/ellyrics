namespace Ellyrics.Widgets {

    class NetworkStatusNotification : Granite.Widgets.Toast {

        private const string DEFAULT_NOTIFICATION_TITLE = "";

        public NetworkStatusNotification () {
            Object (
                title: DEFAULT_NOTIFICATION_TITLE
            );
        }
        public void show (string title) {
            this.title = title;
            this.send_notification ();
        }
    }
}