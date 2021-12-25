/*
  # Widget Lifecycle:
    1) Stateless
      => State does not Change over time
      => Build Function only runs once
    2) Stateful
      => State Can be change over time
      => setState() triggers the build function
      => StateFul widget also have couple of different life cycle methods that we can tap into:
          a) initState()
            -> Called only once when the widget is created
            -> Subscribe to streams or any object that could change our widget data
          b) Build()
            -> Builds that widget tree
            -> A build is triggered every time we use setState()
          c) Dispose()
            -> When the widget/state object is removed
*/