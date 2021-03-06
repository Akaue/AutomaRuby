require 'report_builder'

Before do
    @register = RegisterPage.new
    @login = LoginPage.new
    @buying = BuyingPage.new

end

After do |scenario|
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/,' ')
    screenshot = "log/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    attach(screenshot,'image/png')

end


# at_exit do   
#    ReportBuilder.configure do |config|
#       config.input_path = 'log/report.json'
#       config.report_path = 'log/report'
#       config.report_types = [:retry, :html]
#       config.report_title = 'Evidências do teste'
#       config.compress_image = true
#       config.additional_info = {"app" => "web","Data de execução" => "20/10/2020"}
#     end

#   ReportBuilder.build_report
# end

at_exit do  
options = {
  json_path:    'cucumber_sample/logs',
  report_path:  'my_test_report',
  report_types: ['retry', 'html'],
  report_title: 'My Test Results',
  include_images: true,
  voice_commands: true,
  color: 'deep-purple',
  additional_info: {'browser' => 'Chrome', 'environment' => 'Stage 5'}
}
   
ReportBuilder.build_report options

end