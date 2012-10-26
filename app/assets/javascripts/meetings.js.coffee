# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@Styx.Initializers.Meetings =
  initialize: ->

  index: (data) ->

    ###
    class MyApp extends Batman.App
      @root 'meetings#index'
    class MyApp.MeetingsController extends Batman.Controller
      index: ->
        console.log('index action')
    MyApp.run()
    ###


  show: ->
    
  create: ->
    @new()

  new: (data) ->
    RightJS.$(document).onReady ->
      start = new MeetingTime('meeting_start_at')
      start.timer.setDate(Date())
      end = new MeetingTime('meeting_end_at',start)


    class MeetingTime
      constructor: (id,start) ->
        @timer = new RightJS.Calendar(@format()).assignTo(id)
        if start?
          @timer.on 'change', =>
            $.pnotify("Встреча должна заканчиваться после начала") if @timer.getDate() < start.timer.getDate()

      format: ->
        min_date = new Date()
        max_date = new Date()
        max_date.setMonth(max_date.getMonth() + 1)
        max_date.setDate(0)
        format ={format: '%d-%m-%Y %H:%M', timePeriod: 5, showTime: 'true', showButtons: 'true', minDate: min_date, maxDate: max_date}




