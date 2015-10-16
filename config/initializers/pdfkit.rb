PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :encoding => "UTF-8",
    :page_size => "Letter",
    :margin_top => "0.25in",
    :margin_right => "1in",
    :margin_bottom => "0.25in",
    :margin_left => "1in",
    :disable_smart_shrinking => false,
    :custom_header => "User-Agent: PDFKit",
    :ignore_errors => true
  }
end