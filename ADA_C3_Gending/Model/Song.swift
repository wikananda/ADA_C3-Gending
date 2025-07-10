//
//  Song.swift
//  ADA_C3_Gending
//
//  Created by Dwika Putra on 09/07/25.
//

import Foundation

struct Song {
    var fileName: String
    var image: String
    var year: Int
    var title: String
    var composer: String
    var period: String
    var context: String
    var region: String
    var instrument: String
    var performedBy: String
    var description: String
}

extension Song {
    static var dummySongs = [
        Song(fileName: "Ayuning",image: "pesta_nada_cover", year: 2017, title: "Ayuning", composer: "I Wayan Arik Wirawan", period: "Modern Music", context: "Ceremony", region: "Denpasar", instrument: "Gamelan Pesel", performedBy: "Gamelan Pesel", description: "Karya instrumental ini terinspirasi dari kecantikan dan paras ayu gadis Bali. Pesona dan aura yang terpancar membuat remaja lelaki berbunga-bunga dan mengaguminya."),
        Song(fileName: "Mekenyir",image: "nada_hidup_cover", year: 2024, title: "Mekenyir", composer: "I Wayan Arik Wirawan", period: "Modern Music", context: "Ceremony", region: "Denpasar", instrument: "Gamelan Pesel", performedBy: "Gamelan Pesel", description: "Siratan wajah yang berseri-seri dan ceria merupakan sumber imajinasi karya gending instrumental ini."),
        Song(fileName: "Tabuh Petegak Bebarongan Guna Geni",image: "pesta_nada_cover", year: 2024, title: "Tabuh Petegak Bebarongan Guna Geni", composer: "I Wayan Arik Wirawan", period: "Modern Music", context: "Ceremony", region: "Denpasar", instrument: "Gamelan Pesel", performedBy: "Gamelan Pesel", description: "Guna berarti berguna, geni berarti api, Guna Geni berarti kegunaan dari api sebagai kelangsungan hidup di dunia ini. Terinspirasi dari besarnya kegunaan api di dunia, terciptalah tabuh petegak bebarongan yang berjudul Guna Geni. Kotekan gangsa menyulut bagai api, pukulan kendang memberikan kejutan panas membara serta liukan api mengisprirasi permainan ritme serta melodi."),
        Song(fileName: "Rebong", image: "kolaborasi", year: 2017, title: "Rebong", composer: "I Gusti Putu Sudarta", period: "Modern Music", context: "Ceremony", region: "Denpasar", instrument: "Gong Cenik & Classic", performedBy: "Chandra Wirabhuana", description: "This is the accompaniment to a scene in the Wayang Jataka in which a hunter pursuing the Bodhisattva uses a peahen to seduce him. The piece fonctions similarly to rebong in traditional shadow theater, but is modeled on the saccharine and syrupy Indonesian keroncong light classical genre."),
        Song(fileName: "Tari Baris Tunggal Lengkap",image: "dummy", year: 1550, title: "Tari Baris Tunggal", composer: "I Wayan Arik Wirawan", period: "Modern Music", context: "Ceremony", region: "Bali", instrument: "Griya Tetamian", performedBy: "Gamelan Pesel", description: "Tari Baris adalah jenis tari tradisional berkelompok yang berasal dari Bali. Tari Baris ini tergolong sebagai jenis tari perang yang menunjukkan sikap ksatria. Tari Baris ini diperkirakan telah ada sejak tahun 1550 Masehi. Hal ini ditunjukkan dalam Kidung Sunda. Adapun sejarah Tari Baris menyebutkan jika tarian ini ditampilkan dalam upacara kremasi di Jawa Timur. Hal itu menunjukkan bahwa Tari Baris dikenal sebagai bagian dari ritual keagamaan. Adapun jenis Tari Baris yang tergolong sebagai bagian ritual keagamaan adalah Tari Baris Gede."),
        
    ]
//    static var dummySong = Song(fileName: "Rebong", year: 2015, title: "Rebong")
}
