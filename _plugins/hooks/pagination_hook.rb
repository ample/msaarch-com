require 'open-uri'

Jekyll::Hooks.register(:site, :pre_render) do |site|
  per = 12
  generated_docs = []

  site.collections.dig('markets').docs.each do |market|
    if projects = market.data.dig('has_many', 'projects')
      pages = projects.each_slice(per).to_a
      market.data['pages'] = {
        "projects" => pages.first,
        "total_pages" => pages.count
      }

      docs = pages[1..-1].collect.with_index do |page, n|
        doc = Jekyll::Document.new(market.path, site: site, collection: site.collections['markets'])
        url = "#{market.url}/page/#{n+2}"
        doc.instance_variable_set('@url', url)
        doc.instance_variable_set('@data', market.data.reject{|k,v| %w(pages has_many).include? k})
        doc.data['pages'] = {
          "projects" => page,
        }
        generated_docs.push(doc)
        doc
      end

      urls = ([market] + docs).collect(&:url)
      ([market] + docs).each do |doc|
        doc.data['pages']['urls'] = urls
      end
    end
  end

  site.collections['markets'].docs.concat(generated_docs)
end