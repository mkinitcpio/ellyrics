namespace Ellyrics.Services {
    public class NetworkConnectionService : Object {
        private GLib.NetworkMonitor _monitor;
        private bool _prev_network_connection_state;
        private static NetworkConnectionService _network_service_instance;

        public signal void on_network_connection_changed (bool available);

        private NetworkConnectionService() {
            _monitor = NetworkMonitor.get_default ();
            _prev_network_connection_state = _monitor.get_network_available ();
    
            _monitor.network_changed.connect (available => {
                if(available != _prev_network_connection_state) {
                    _prev_network_connection_state = available;
                    on_network_connection_changed (available);
                }
            });
        }

        public bool is_network_available {
            get {
                return _monitor.get_network_available ();
            }
        }

        public static NetworkConnectionService get_instance () {
            if(_network_service_instance == null) {
                _network_service_instance = new NetworkConnectionService ();
            }

            return _network_service_instance;
        }
    }
}
