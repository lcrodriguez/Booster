module ApplicationHelper
  def request_status
    @request_status = [ "New", "Status2", "Status3", "Ready" ]
  end

  def will_paginate(collection, options = {})
    options.merge!({
      :previous_label => t( 'previous'),
      :next_label => (t 'next')
    })
    
    super(collection, options)
  end
  
  def write_links(m, is_admin)
    model_name = m.class.to_s.underscore
    
    html = ""
    html << link_to(t('show'), m)
    html << " | " + link_to(t("edit"), send("edit_#{model_name}_path", m))
    html << " | " + link_to(t('destroy'), m, :confirm => 'Are you sure?', :method => :delete) if is_admin
    
    html
  end
  
  def general_title(object, count=0)
    html = "<div class=\"review-actions\">"
    html << link_to(t(:export), url_for(:action => 'index',:format => "xls"))
    html << " | "
    html << link_to(t('new_header', :title =>  object.human_name), url_for(:action => 'new'))
    html << "</div>"
    
    html << "<h1>#{object.human_name}"
#    html << " [#{count}]" if count > 0
    html << "</h1>"
    
    html
  end
  
  def form_title(object, readonly=false)
    html = "<div class=\"review-actions\">"
    
    if !object.id.blank? && !readonly
      html << link_to(t('show'), object)
      html << " | "
    end
    
    model_name = object.class.to_s.underscore.pluralize
    html << link_to(t("back"), send("#{model_name}_path"))
    html << "</div>"
    
    if !object.id.blank?
      html << "<h1>" + t('view_header', :title => object.class.human_name, :number => object.id) + "</h1>" if readonly
      html << "<h1>" + t('edit_header', :title => object.class.human_name, :number => object.id) + "</h1>" if !readonly
    else
      html << "<h1>" + t('new_header', :title => object.class.human_name) + "</h1>"
    end
    
    html
  end
  
  def tm(object, property)
    html = object.human_attribute_name(property)
  end
  
  def errors_for(object)
    html = ""
    
    if object.errors.any?
      html << "<div id=\"error_explanation\">"
      html << "<h2>#{t(:error_header, :count => object.errors.count)}</h2>"
      html << "<ul>"

      object.errors.full_messages.each do |msg|
        html << "<li>#{msg}</li>"
      end
    
      html << "</ul>"
      html << "</div>"
    end
    
    html
  end
  
end
