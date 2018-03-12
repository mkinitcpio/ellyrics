using Ellyrics.Widgets;
using Ellyrics.Services;

class EllyricsApplicationWindow : Gtk.Application {

    private const string APPLICATION_ID = "com.github.mkinitcpio.ellyrics";

    private const int DEFAUT_HEIGHT = 480;
    private const int DEFAUT_WIDTH = 640;
    private const string WINDOW_TITLE = "Ellyrics";

    private HeaderBar _headerbar;
    private NetworkConnectionService _networkConnectionService;
    private NetworkStatusNotification _network_status_notification;
    public EllyricsApplicationWindow () {
        Object (
            application_id: APPLICATION_ID,
            flags: ApplicationFlags.FLAGS_NONE
        );

        _networkConnectionService = NetworkConnectionService.get_instance ();
        _networkConnectionService.on_network_connection_changed.connect ((activate) => {
            if(activate) {
                _network_status_notification.show ("The network connection is available.");
            } else {
                _network_status_notification.show ("The network connection was lost.");
            }
        });
    }

    protected override void activate () {
        var window = new Gtk.ApplicationWindow (this);
        window.set_default_size (DEFAUT_HEIGHT, DEFAUT_WIDTH);
        window.title = WINDOW_TITLE;

        _network_status_notification = new NetworkStatusNotification ();
        _headerbar = new HeaderBar();

        window.set_titlebar(_headerbar);
        window.add (_network_status_notification);

        if(!_networkConnectionService.is_network_available) {
            _network_status_notification.show ("No network connection.");
        }
        window.show_all ();
    }
}