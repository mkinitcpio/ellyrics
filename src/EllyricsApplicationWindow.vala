using Ellyrics.Widgets;

class EllyricsApplicationWindow : Gtk.Application {

    private const string APPLICATION_ID = "com.github.mkinitcpio.ellyrics";

    private const int DEFAUT_HEIGHT = 480;
    private const int DEFAUT_WIDTH = 640;
    private const string WINDOW_TITLE = "Ellyrics";

    private HeaderBar _headerbar;

    public EllyricsApplicationWindow () {
        Object (
            application_id: APPLICATION_ID,
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var window = new Gtk.ApplicationWindow (this);
        window.set_default_size (DEFAUT_HEIGHT, DEFAUT_WIDTH);
        window.title = WINDOW_TITLE;

        _headerbar = new HeaderBar();

        window.set_titlebar(_headerbar);
        window.show_all ();
    }
}