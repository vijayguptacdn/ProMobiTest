module ApplicationHelper

 def get_class_name(parmas)
   if (params[:controller] == "devise/registrations" || parmas[:controller] == "devise/passwords") && parmas[:action] == "new"
   	 "hold-transition register-page"
   elsif params[:controller] == "devise/sessions" && parmas[:action] =="new"
     "hold-transition login-page" 
   else
   	" skin-blue sidebar-mini wysihtml5-supported"
   end   			
 end

  def get_status_class(status)
 		if status == "new"
 			"label-primary"
 		elsif status == "inprogress"
 			'label-warning'
 		elsif status == "done"
 			'label-success'
 		end	
 end
end
