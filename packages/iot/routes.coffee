# From: https://medium.com/@satyavh/using-flow-router-for-authentication-ba7bb2644f42#.vty74pkpy

# Routes in this group are for logged in users. Unauthenticated users
# will be redirected to login / signup.
loggedIn = FlowRouter.group
 triggersEnter: [ ->
   unless Meteor.loggingIn() or Meteor.userId()
     route = FlowRouter.current()
     unless route.route.name is 'login'
       Session.set 'redirectAfterLogin', route.path
     FlowRouter.go '/login'
 ]

loggedIn.route '/device/:uuid',
  name: 'Device.display'
  action: (params, queryParams) ->
    BlazeLayout.render 'MainLayoutComponent',
      main: 'Device.DisplayComponent'

# loggedIn.route '/devices/',
#   name: 'Device.list'
#   action: (params, queryParams) ->
#     BlazeLayout.render 'MainLayoutComponent',
#       main: 'Device.ListComponent'

loggedIn.route '/environment/:uuid',
  name: 'Environment.display'
  action: (params, queryParams) ->
    BlazeLayout.render 'MainLayoutComponent',
      main: 'Environment.DisplayComponent'

# User must be logged in to see dashboard
loggedIn.route '/',
  name: 'Dashboard'
  action: (params, queryParams) ->
    BlazeLayout.render 'MainLayoutComponent',
      main: 'Dashboard'


# User must be logged in to claim a new device.
loggedIn.route '/environment/:uuid/new-device',
  name: 'Environment.NewDeviceComponent'
  action: (params, queryParams) ->
    BlazeLayout.render 'MainLayoutComponent',
      main: 'Environment.NewDeviceComponent'

# User must be logged in to claim a new device.
# loggedIn.route '/new-thing',
#   name: 'Device.newThing'
#   action: (params, queryParams) ->
#     BlazeLayout.render 'MainLayoutComponent',
#       main: 'Device.NewThingComponent'

loggedIn.route '/new-grow-file',
  name: 'GrowFileCreatorComponent'
  action: (params, queryParams) ->
    BlazeLayout.render 'MainLayoutComponent',
      main: 'GrowFileCreatorComponent'      