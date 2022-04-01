class Details {
	int? total;
	List<Entry>? entries;

	Details({this.total, this.entries});

	factory Details.fromJson(Map<String, dynamic> json) => Details(
				total: json['total'] as int?,
				entries: (json['entries'] as List<dynamic>?)
						?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'total': total,
				'entries': entries?.map((e) => e.toJson()).toList(),
			};
}
class PosterArt {
	String? url;
	int? width;
	int? height;

	PosterArt({this.url, this.width, this.height});

	factory PosterArt.fromJson(Map<String, dynamic> json) => PosterArt(
				url: json['url'] as String?,
				width: json['width'] as int?,
				height: json['height'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
				'width': width,
				'height': height,
			};
}

class Images {
	PosterArt? posterArt;

	Images({this.posterArt});

	factory Images.fromJson(Map<String, dynamic> json) => Images(
				posterArt: json['Poster Art'] == null
						? null
						: PosterArt.fromJson(json['Poster Art'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'Poster Art': posterArt?.toJson(),
			};
}

class Entry {
	String? title;
	String? description;
	String? programType;
	Images? images;
	int? releaseYear;

	Entry({
		this.title, 
		this.description, 
		this.programType, 
		this.images, 
		this.releaseYear, 
	});

	factory Entry.fromJson(Map<String, dynamic> json) => Entry(
				title: json['title'] as String?,
				description: json['description'] as String?,
				programType: json['programType'] as String?,
				images: json['images'] == null
						? null
						: Images.fromJson(json['images'] as Map<String, dynamic>),
				releaseYear: json['releaseYear'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'title': title,
				'description': description,
				'programType': programType,
				'images': images?.toJson(),
				'releaseYear': releaseYear,
			};
}