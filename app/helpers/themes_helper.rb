module ThemesHelper
  def theme_stylesheet_link_tag
    if GroupSubdomainConstraint.matches?(request)
      @group = Group.published.find_by_subdomain(request.subdomain)
    end

    if @group and @group.theme.present?
      stylesheet_link_tag theme_css_path(@group.theme)
    end
  end
end
