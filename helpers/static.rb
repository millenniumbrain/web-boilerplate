def link_js(filename)
  "#{ENV['BASE_URL']}/js/#{filename}.js" 
end

def link_css(filename)
  "#{ENV['BASE_URL']}/css/#{filename}.css"
end

def link_img(filename, ext: "jpg")
  "#{ENV['BASE_URL']}/img/#{filename}.#{ext}"
end