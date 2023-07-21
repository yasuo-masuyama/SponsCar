module InfosHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
        infos_path
    elsif action_name == 'edit'
        info_path
    end
  end
end
