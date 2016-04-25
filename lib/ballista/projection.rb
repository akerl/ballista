require 'date'
require 'libledger'

module Ballista
  ##
  # Projection class for creating journals
  class Projection
    def initialize(params = {})
      @entries = params[:entries]
    end

    def project(months)
      start = Date.today + 1
      finish = start >> months
      entries = start.upto(finish).map { |date| parse_day(date) }
      Ledger.new(entries: entries.flatten)
    end

    private

    ##
    # This method pads all months so their last day covers through 31
    # This ensures all monthly events can trigger, even in shorter months
    def get_days(date)
      return [date.day] if date.month == date.next.month
      date.day.upto(date.day + 3).to_a
    end

    def out_of_bounds?(entry, date)
      if entry[:starts] && Date.parse(entry[:starts]) > date
        true
      elsif entry[:ends] && Date.parse(entry[:ends]) < date
        true
      else
        false
      end
    end

    def parse_day(date)
      get_days(date).map do |fake_day|
        calendar[fake_day].map do |entry|
          next if out_of_bounds?(entry, date)
          build_entry(entry, date)
        end
      end
    end

    def build_entry(entry, date)
      Ledger::Entry.new(
        date: date,
        name: entry[:name],
        state: '!',
        actions: build_actions(entry)
      )
    end

    def build_actions(entry)
      entry[:actions].map { |name, amount| { name: name, amount: amount } }
    end

    def calendar
      return @calendar if @calendar
      @calendar = Hash.new { |h, k| h[k] = [] }
      load_entries!
      @calendar
    end

    def load_entries!
      @entries.each do |entry|
        dates = entry[:when]
        dates = [dates] unless dates.is_a? Array
        dates.each { |date| @calendar[date] << entry }
      end
    end
  end
end
