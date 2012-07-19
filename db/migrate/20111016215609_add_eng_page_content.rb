class AddEngPageContent < ActiveRecord::Migration
  def self.up
    p = Page.new
    p.id=110
    p.name="Story for Tomorrow"
    p.body="together with KNIGI NA DOZHDE,  Dozhd-TV
<br />
October 23, 11:00 am – 1:00 pm 
<br />
<br />
2Morrow festival’s film market presents a new program at the intersection of film and literature. We will introduce Russian and foreign film professionals to the new arrivals on Russia’s book market. 10 books have been selected for Story for Tomorrow. These are works by both well-known authors and outstanding newcomers that have recently been published or are being prepared for publication. The selection includes titles in various genres – biography non-fiction, science fiction, detective novel, historical novel and parable – whose authors were able to deliver very on-point, contemporary narrative with obvious cinematic potential. 
<br />
<br />
The goal of  Story for Tomorrow is to strengthen the ties between the literary process and cinema, as well as to encourage screenwriters and directors to work with high-quality literature as foundation for cinematic work. Screen rights for all the books presented at Story for Tomorrow are available. 
<br />
The film industry needs fresh ideas, and the writers have them!
<br />
The books will be presented by Nikolay Alexandrov (Dozhd TV), Fyodor Svarovsky (Paulsen Editions)
and Natalia Smirnova (Gumen and Smirnova Literary Agency). 
<br />
<br />
This is the program for Story for Tomorrow – 2011:
<br />
Alexander Ilichevsky. Mathematician/ Matematik
<br />
Andrey Rubanov. The Psycho Agent  / Psyhodel
<br />
Sergey Kuznetsov. Alive and Adult / Zhivye I vzroslye
<br />
Yana Vagner. VongoLake / VongOzero
<br />
Sergey Kostin. The Death of a White Mouse / Smert’ Beloy Myshi
<br />
Alexey Bayer. Meat / Myaso
<br />
Alexander Grigorenko. Mebet / Mebet
<br />
Sergey Soloukh. The Bucket Kick / Igra v Yaschik
<br />
Gennady Prashkevich. Russian Hyperborea / Russkaya Giperboreya
<br />
Sergey Bushmanov. Cold / Holod 
<br />
<br />
Location: the DOME film lounge, Bersenevsky per., 3/10, building 7, Krasny Oktyabr
<br />
Admittance with Project for Tomorrow film market accreditation
<br />"
  p.save
  end

  def self.down
  end
end
