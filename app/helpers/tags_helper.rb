module TagsHelper
  def get_tag_name tag
    @tag_name = tag.name + " (" + tag.blogs.size.to_s +  ")"
    return @tag_name
  end
end
