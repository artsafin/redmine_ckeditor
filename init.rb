require 'redmine'
require 'redmine_ckeditor'

ActiveSupport::Reloader.to_prepare do
  RedmineCkeditor.apply_patch
end

Redmine::Plugin.register :redmine_ckeditor do
  name 'CKEditor 5 for Redmine'
  author 'Akihiro Ono, Artur Safin'
  description 'Integration of CKEditor 5 to Redmine'
  version '2.0.0'
  requires_redmine :version_or_higher => '4.0.0'
  url 'http://github.com/artsafin/redmine_ckeditor'

  settings(:partial => 'settings/ckeditor')

  wiki_format_provider 'CKEditor', RedmineCkeditor::WikiFormatting::Formatter,
    RedmineCkeditor::WikiFormatting::Helper
end

Loofah::HTML5::WhiteList::ALLOWED_PROTOCOLS.replace RedmineCkeditor.allowed_protocols
