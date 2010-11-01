# Small utility which uses the homepage and nokogori to get a description from the formula's homepage.
#
# As written in the homebrew wiki:
# > Homebrew doesn’t have a description field because the homepage is always up to date,
# > and Homebrew is not. Thus it’s less maintenance for us. To satisfy the description
# > we’re going to invent a new packaging microformat and persuade everyone to publish
# > it on their homepage.
#
# Too bad no packaging microformat has yet been invented, but brew-more just first looks for a
# `<meta name="description">` tag, then for an `a#project_summary_link` tag (which is used in
# While this does not lead to a good description for all formulas, it works for quiet a few,
# try e.g. `brew more rubinius`.
#
# Note: this command depends on `nokogori`, `json` and `rubygems`
#
# Edit: non-sudo gem install works fine (by adamv)
# Edit: use google search instead of title as fallback - returns pretty good results :)
# Edit: display disclaimer when loading description via google
#

require 'formula'

require 'uri'
require 'open-uri'
require 'rubygems'
begin
  require 'json'  
  require 'nokogiri'
rescue LoadError
  onoe "command requires 'nokogiri' gem, install with: gem install nokogiri --no-ri --no-rdoc"
  exit 2
end

# split description at 80 chars
MAX_CHARS = 80

class Object
  # Define try() method to simplify Nokogori scrape-ing  
  def try(method, *args); self.nil? ? nil : self.send(method, *args) end
end

def scrape_info(name)  
  f = Formula.factory(name)

  more = "<No description>"
  google = false
  
  if doc = Nokogiri::HTML(open(f.homepage))
    part = doc.xpath('/html/head/meta[@name="description"]').first.try(:[], 'content') || doc.css('a#project_summary_link').first.try(:text)    
    unless part
      # try a google search :)
      if hash = JSON.load(open("http://www.google.com/uds/GwebSearch?q=#{URI.escape(f.homepage)}&v=1.0")).try(:[], 'responseData').try(:[], 'results').try(:first)
        part = Nokogiri::HTML(hash['title']).text + ' ' + Nokogiri::HTML(hash['content']).text
        google = true
      end
    end
    more,c = part.split(/ +/).inject([' ',1]) do |res, i|
      if (i.length + 1 + res[1]) > MAX_CHARS
        res[0] << "\n "
        res[1] = 1
      end
      [res[0] << " " << i, res[1] + 1 + i.length]
    end if part
    more << "\n" << "(FYI: description via Google)".rjust(MAX_CHARS) if google
  end
  
  puts "- #{f.name} #{f.version}" + (f.prefix.parent.directory? ? " (installed)" : "")
  puts more
  puts f.homepage.to_s.rjust(MAX_CHARS)
end

if ARGV.named.empty?
  onoe "please specifiy a formula"
  puts "Usage: brew more [formula] ... (formula description scraper)"
  exit 1
end

ARGV.named.each { |name| scrape_info(name) }
