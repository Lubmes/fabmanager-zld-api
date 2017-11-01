module Api
  module V1
    class EventsController < ApplicationController

      require 'google/apis/calendar_v3'
      require 'googleauth'
      require 'googleauth/stores/file_token_store'
      require 'openssl'
      require 'fileutils'


      def index
        # @events = Event.all
        # render json: @events
      end


      OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

      def retrieve_events
        client = Signet::OAuth2::Client.new({
                                                client_id: Rails.application.secrets.google_client_id,
                                                client_secret: Rails.application.secrets.google_client_secret,
                                                token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
                                            })

        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        @event_list = service.list_events(params[:calendar_id])
        # @event_list = service.list_events(1)

        @event_list.items.each do |event|

          unless event.start.nil?
            e = Event.find_or_initialize_by(title: event.summary)
            if event.start.date
              e.start_time = DateTime.parse(event.start.date).beginning_of_day
              e.end_time = DateTime.parse(event.start.date).end_of_day
            else
              e.start_time = event.start.date_time
              e.end_time = event.end.date_time
            end
            e.approved = true
            e.save!
          end
        end
        render json: @event_list
      end

      def new_event
        client = Signet::OAuth2::Client.new({
                                                client_id: Rails.application.secrets.google_client_id,
                                                client_secret: Rails.application.secrets.google_client_secret,
                                                token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
                                            })

        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        today = Date.today

        event = Google::Apis::CalendarV3::Event.new({
                                                        start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
                                                        end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
                                                        summary: 'New event!'
                                                    })

        service.insert_event(params[:calendar_id], event)

        redirect_to events_url(calendar_id: params[:calendar_id])
      end

      def redirect
        client = Signet::OAuth2::Client.new({
                                                client_id: Rails.application.secrets.google_client_id,
                                                client_secret: Rails.application.secrets.google_client_secret,
                                                authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
                                                scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
                                                redirect_uri: callback_url
                                            })

        redirect_to client.authorization_uri.to_s
      end

      def callback
        client = Signet::OAuth2::Client.new({
                                                client_id: Rails.application.secrets.google_client_id,
                                                client_secret: Rails.application.secrets.google_client_secret,
                                                token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
                                                redirect_uri: callback_url,
                                                code: params[:code]
                                            })

        response = client.fetch_access_token!

        session[:authorization] = response

        redirect_to calendars_url
      end

      def calendars
        client = Signet::OAuth2::Client.new({
                                                client_id: Rails.application.secrets.google_client_id,
                                                client_secret: Rails.application.secrets.google_client_secret,
                                                token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
                                            })

        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        @calendar_list = service.list_calendar_lists
      end
      end
  end
end
