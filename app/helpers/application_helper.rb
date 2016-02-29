module ApplicationHelper
  def active?(*args)
    args.each do |arg|
      if arg.class == Hash 
        arg.each do |key, val|
          return 'active-feature' if key.to_s == c_name && a_name.in?([val].flatten.map(&:to_s))
        end
      end
      return 'active-feature' if arg.to_s.in?([c_name])
    end
    return 
  end
  def a_name; action_name end
  def c_name; controller_name end
end
