module QuestsHelper
  # def add_choice_link(name)
  #    link_to_function name do |page|
  #    page.insert_html :bottom, :choices, :partial => 'choices/form', :object => Choice.new
  #    end
  # end
  def add_choice_link(name)
        link_to_function name do |page|
           page.insert_html :bottom, :choices, :partial => 'quests/choice' , :object => Choice.new
        end
    end
    
  # def add_choice_link(name, form)
  #   link_to_function name do |page|
  #     choice = render(:partial => 'quests/choice', :locals => { :pf => form, :choice => Choice.new })
  #     page << %{var new_choice_id = "new_" + new Date().getTime();
  #       $('choices').insert({ bottom: "#{ escape_javascript choice }".replace(/new_\\d+/g, new_choice_id) });
  #     }
  #   end
  # end
end
