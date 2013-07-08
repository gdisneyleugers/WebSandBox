  use Gtk3 -init;
  use Gtk3::WebKit;
  use JavaScript::V8;
  use App::XUL;
  use CGI::Session;
  use CGI::Session::Flash;
  use DynaLoader;
  use HTML::DOM;
  use HTML::HTML5::DOM;
  use XML::LibXML;
  use XML::LibXML::NodeList;
  use XML::SAX::ParserFactory;
  use XML::Validator::Schema;
  use Config::IniFiles;
  use Module::Manifest;
  use Fliggy::Server;
  my $cfg = Config::IniFiles->new(-file => "application.ini");
bless our $modules = {
  DynaLoader::dl_load_file(
    'lib/libpeerconnection.so'),
  DynaLoader::dl_load_file(
    'lib/libpepflashplayer.so'),
  DynaLoader::dl_load_file(
    'lib/libffmpegsumo.so'),
  DynaLoader::dl_load_file(
    'lib/libpdf.so'),
  DynaLoader::dl_load_file(
    'lib/libppGoogleNaClPluginChrome.so'),
  DynaLoader::dl_load_file(
    'lib/libwidevinecdm.so'),
  DynaLoader::dl_load_file(
    'lib/libwidevinecdmadapter.so'),
 DynaLoader::dl_load_file(
    'lib/libflashplayer.so'),
 DynaLoader::dl_load_file(
    'lib/kcm_adobe_flash_player.so'),
 };

  my $window = Gtk3::Window->new ('toplevel');
  $window->set_default_size(300, 200);
  my $table = Gtk3::Table ->new (6, 0, FALSE);
  $window->set_title("WebSandBox");
  my $button = Gtk3::Button->new ('Sandbox Site');
   my $label = Gtk3::Label->new("Website");
   my $web_entry = Gtk3::Entry->new;
   my $dom_tree = new HTML::DOM;
   $button->signal_connect (clicked => sub { 
   print "loading";
   open "application.ini";
   system "xulapp setup --profile dev";
   system "xulapp register --profile dev";
   system "xulapp bundle .";
   system "lib/plugin-container lib/components.manifest";
   system "lib/xpcshell";
   system "lib/xulrunner";
   system "lib/xulrunner-stub";
   
   my $session = CGI::Session->new();
   $xml = Module::Manifest->new();
   push @libs, ([libbrowsercomps.so,
libffmpegsumo.so,
libflashplayer.so,
libmozalloc.so,
libmozjs.so,
libpdf.so,
libpeerconnection.so,
libpepflashplayer.so,
libppGoogleNaClPluginChrome.so,
libwidevinecdm.so,
libwidevinecdmadapter.so,
libxul.so,
]);
$xml->parse(manifest => @libs);
   bootstrap(boot_$modules);
   my $app = App::XUL->new(name => 'WebSandBox');
   my $server = Fliggy::Server->new();
   my $pepper = $manifest;
   $pepper{$_};
   my $parser = XML::LibXML->new();
   $file = "policy.xml";
   $parser->parse_file($file);
   $validator = XML::Validator::Schema->new(file => 'policy.xsd');
   my $engine = JavaScript::V8::Context->new();
      my $sandbox = Gtk3::Window->new ('toplevel');
   $sandbox->set_default_size(800, 800);
      $sandbox->maximize;
   $modules{$_};
   my $url = $web_entry->get_text;
   my $flash   = CGI::Session::Flash->new($session, \%options);
   my $doc = HTML::HTML5::Parser->load_html(location => $url);
   XML::LibXML::Augment->rebless($doc);
   $dom_tree->parse_file($url);
      $sandbox->set_title($url);
   $engine->bind(
      window => {
         parent => undef,
         perl_object => $view,
         top => undef,
         location => $url,
         document => $url,
         domain => $url,
               });
   my $view = Gtk3::WebKit::WebView->new();
      $view->load_uri($url);
   $server->register_service($view);
   my $scrolls = Gtk3::ScrolledWindow->new();
            $scrolls->add($view);
        $sandbox->add($scrolls);
    $mod = open "mod.js";
    $engine->eval(@libs);
    $engine->eval($xml);
    $engine->eval($app);
    $engine->eval($parser);
    $engine->eval($validator);
    $engine->eval($modules);
    $engine->eval($flash);
    $engine->eval($doc);
    $engine->eval($server);
    $engine->eval($url);
    $engine->eval($view);
    $engine->eval($mod);
    $sandbox->show_all();
   });
   
  $table->attach_defaults ($label, 0, 1, 0, 1);
  $table->attach_defaults ($web_entry, 0, 3, 1, 2);
  $table->attach_defaults ($button, 0, 3, 4, 5);
  $window->add ($table);
  $window->show_all;
  AE::cv->recv;
  Gtk3::main;
  exit;
