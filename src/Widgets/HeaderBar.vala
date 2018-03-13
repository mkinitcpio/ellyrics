namespace Ellyrics.Widgets {

    class HeaderBar : Gtk.HeaderBar {

        private Gtk.SearchEntry _search_entry;
        private Granite.Widgets.ModeButton _view_mode;
        private const int DEFAULT_ACTIVE_BUTTON_INDEX = 0;

        public signal void on_search_text_changed (string search_text);
        public signal void on_view_mode_changed (Ellyrics.Models.ViewMode view_mode_index);

        public HeaderBar () {
            Object (
                has_subtitle: true,
                show_close_button: true
            );
        }

        construct {
            _search_entry = new Gtk.SearchEntry ();
            _search_entry.placeholder_text = "Search Lyrics";
            _search_entry.search_changed.connect (() => on_search_text_changed(_search_entry.text));

            _view_mode = new Granite.Widgets.ModeButton ();
            _view_mode.append_text ("Search");
            _view_mode.append_text ("Bookmarks");
            _view_mode.set_active (DEFAULT_ACTIVE_BUTTON_INDEX);
            _view_mode.mode_changed.connect ((widget) => on_view_mode_changed ((Ellyrics.Models.ViewMode) _view_mode.selected));

            set_custom_title ( _view_mode);
            pack_end (_search_entry);
            show_all ();
        }
    }
}
