class User < ActiveRecord::Base
 has_many :memorials
 has_many :posts, dependent: :destroy
 has_secure_password

  before_validation :format_user, on: [ :create, :update ]
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, :exclusion => { :in =>
    %w( Ass Ass-hat Ass-pirate Assbag Asshole Asslick Asswipe
        Bastard Bitch Bitchass Bitches Bitchy Blowjob Boner Bullshit Buttplug Butt-pirate Buttpirate Buttfucker
        Camel-toe Cameltoe Carpet-muncher Carpetmuncher Chink Clit Clit-face Clitface Clit-fuck Clitfuck Cock Coon Cum Cum-guzzler Cumguzzler Cum-slut Cumslut Cunt-face Cuntface Cunt-licker Cuntlicker Cunty
        Dick Dick-face Dickface Dick-milk Dickmilk Dicks Dick-sucker Dicksucker Dick-sucking Dicksucking Dick-wad Dickwad Dike Dildo Dipshit Douche Douche-bag Douchebag Dumass Dum-ass Dumb-ass Dumbass Dumb-fuck Dumbfuck Dumb-shit Dumbshit Dyke
        Fart Fag Fag-bag Fagbag Faggit Faggot Fag-tard Fagtard Fatass Fellatio Flamer Fuck Fuck-ass Fuckass Fuck-bag Fuckbag Fuck-boy Fuckboy Fuck-brain Fuckbrain Fuck-butt Fuckbutt Fucker Fuck-face Fuckface Fuck-head Fuckhead Fuck-hole Fuckhole Fucking Fucknut Fuck-off Fuckoff Fucks Fuck-stick Fuckstick Fuck-tard Fucktard Fuck-up Fuckup Fuck-wad Fuckwad Fudge-packer Fudgepacker
        Gay Gay-ass Gayass Gay-do Gaydo Gay-fuck Gayfuck Gay-lord Gaylord Gay-tard Gaytard Gay-wad Gaywad God-damn Goddamn God-damnit Goddamnit Gooch Gook Guido
        Hand-job Handjob Hard-on Hardon Hell Ho Hoe Homo Homosexual Honkey Hump Humping Humpy
        Jack-ass Jackass Jack-off Jackoff Jag-ass Jagass Jag-off Jagoff Jap Jerk-off Jerkoff Jizz
        Kooch Kootch Kunt
        Lame-ass Lameass Lesbian Lesbo Lezzie
        Mc-faggot Mcfaggot Motha-fucka Mothafucka Motha-fuckah Mothafuckah Motha-fuckin Mothafuckin Motha-fucker Mothafucker Motha-fucking Mothafucking Mother-fucker Motherfucker Mother-fucking Motherfucking
        Negro Niga-boo Nigaboo Nigga-boo Niggaboo Nigga Nigger Niggers Niglet Nut-sack Nutsack
        Pecker Pecker-head Peckerhead Penis Penis-banger Penisbanger Penis-fucker Penisfucker Penis-puffer Penispuffer Piss Pissed Pissed-off Pissedoff Poonani Porch-Monkey Porchmonkey Prick Pussies Pussy Pussy-licking Pussylicking Pussy-licker Pussylicker
        Queef Queefs Queer Queers
        Rim-job Rimjob
        Sand-nigga Sandnigga Sand-niggah Sand-niggah Sand-nigger Sandnigger Sand-nigguh Sandnigguh Schlong Shit Shit-ass Shitass Shit-bag Shitbag Shit-bagger Shitbagger Shit-brains Shitbrains Shit-breath Shitbreath Shit-cunt Shitcunt Shit-dick Shitdick Shit-face Shitface Shit-head Shithead Shit-hole Shithole Shit-stain Shitstain Shitter Shittiest Shitting Shitty Shiz Shizz Shiznit Skank Skanky Skull-fuck Skullfuck Slut Slutty Slut-bag Slutbag Spic Spick Sucka Suckah Sucker Suckuh
        Tard Testicle Tit Tit-fuck Titfuck Titt-fuck Titfuck Titty-fuck Titty-fucker Tits Twat Twats
        Vagina Vagina-fart Vaginafart
        Wank Wanker Wank-job Wankjob Wet-back Wetback Whore Whore-bag Whorebag Whore-face Whoreface
        ),
    :message => "must not contain profane language. Users generating profane language will be banned." }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :role, :inclusion => { :in => %{ admin } }, :allow_nil => true

   def full_name
      "#{first_name} #{last_name}"
   end

   def to_param
      "#{id} #{to_s}".parameterize
   end

   protected
     def format_user
       self.first_name.capitalize!
       self.last_name.capitalize!
       self.email.downcase!
       self
     end

end
