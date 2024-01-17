class RouterInfo {
  String routeName;
  String path;

  RouterInfo({required this.routeName, required this.path});


  static RouterInfo rootRoute= RouterInfo(routeName: '/', path: '/');
  static RouterInfo dataRoute=  RouterInfo(routeName: 'DataRoute', path: '/data');
  static RouterInfo liberialRoute=  RouterInfo(routeName: 'LiberialRoute', path: '/liberial');
  static RouterInfo venueRoute=  RouterInfo(routeName: 'VenueRoute', path: '/venue');
  static RouterInfo tableRoute=  RouterInfo(routeName: 'TableRoute', path: '/table');
  static RouterInfo configRoute=  RouterInfo(routeName: 'ConfigRoute', path: '/config');

}
