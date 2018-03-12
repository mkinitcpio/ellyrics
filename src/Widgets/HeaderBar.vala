namespace Ellyrics.Widgets {

    class HeaderBar : Gtk.HeaderBar {

        private Gtk.SearchEntry _search_entry;

        public signal void on_search_text_changed(string search_text);

        public HeaderBar() {
            Object(
                has_subtitle: true,
                show_close_button: true
            );
        }

        construct {
            _search_entry = new Gtk.SearchEntry();
            _search_entry.placeholder_text = "Search Lyrics";
            _search_entry.search_changed.connect(() => on_search_text_changed(_search_entry.text));

            pack_end(_search_entry);
            show_all();
        }
    }
}
