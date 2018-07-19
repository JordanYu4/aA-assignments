require 'sqlite3'
require 'singleton'
require_relative 'plays'

# class PlayDBConnection < SQLite3::Database
#   include Singleton
#
#   def initialize
#     super('plays.db')
#     self.type_translation = true
#     self.results_as_hash = true
#   end
# end

class Playwright
  attr_accessor :name, :birth_year
  attr_reader :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    author = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
    return nil if author.empty?
    Playwright.new(author.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless @id
    data = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT *
      FROM plays
      WHERE playwright_id = @id
    SQL
    data.map { |datum| Play.new(datum) }
  end

end
