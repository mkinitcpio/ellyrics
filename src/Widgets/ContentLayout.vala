using Ellyrics.Models;

namespace Ellyrics.Widgets {

    class ContentLayout : Gtk.Stack {

        private Gtk.Box _search_page;
        private Gtk.Box _bookmarks_page;

        public ContentLayout () { }

        construct {
            _search_page = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            _bookmarks_page = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

            _search_page.add (new Gtk.Label ("Search page"));
            _bookmarks_page.add (new Gtk.Label ("Bookmarks page"));

            this.add (_search_page);
            this.add (_bookmarks_page);
            this.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
        }

        public void set_active_page (ViewMode selected_view_mode) {
            switch (selected_view_mode) {
                case ViewMode.SearchPage: {
                    this.set_visible_child (_search_page);
                    break;
                }
                case ViewMode.BookmarksPage: {
                    this.set_visible_child (_bookmarks_page);
                    break;
                }
                default: {
                    break;
                }
            }
        }
    }
}