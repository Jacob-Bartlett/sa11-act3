def extract_urls(text)
  pattern = /\b\w+tp\w*:\/\/\S+\b/
  urls = text.scan(pattern)
  urls.flatten
end

# So im not sure what is happening, but my regex does work however it gets locked into a 2d array??????

sample_text = "Visit our site at http://www.example.org for more
information. Check out our search page at
https://example.com/search?q=ruby+regex. Don’t forget to ftp our
resources at ftp://example.com/resources."

# Brute forcing the results to appear
extract_urls(sample_text).each do |url|
  puts url
end

def parse_invoices(invoice_data)
  pattern = /(\d+\-\d+\-\d+) - (\w+\d+) - (\w+\s+\w+) - (\$\d+)/

  invoice_data.each_line do |line|
    match = line.match(pattern)
    if match
      puts "Date: #{match[1]}, Invoice Number: #{match[2]}, Client: #{match[3]}, Amount: #{match[4]}"
    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
