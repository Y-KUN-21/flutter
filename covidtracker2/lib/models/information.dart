
class Symtoms{
  String imgpath;
  String title;
  String description;

  Symtoms({this.imgpath, this.title,this.description});
}

 List<Symtoms> symtoms = [
    Symtoms(
      imgpath: "assets/covidcons/017-fever.png",
      title: 'Fever.',
      description: 'A fever is a body temperature that is higher than normal.',
    ),
    Symtoms(
      imgpath: "assets/covidcons/037-cough.png",
      title: 'Dry cough.',
      description:
          'Coughing is a common reflex action that clears your throat of mucus or foreign irritants.',
    ),
    Symtoms(
      imgpath: "assets/covidcons/026-sore throat.png",
      title: 'Sore throat.',
      description: 'A sore throat is pain, scratchiness or irritation of the throat that often worsens when you swallow.',
    ),
    Symtoms(
      imgpath: "assets/covidcons/025-diarrhea.png",
      title: 'Diarrhoea.',
      description: 'Diarrhea is loose, watery stools (bowel movements). You have diarrhea if you have loose stools three or more times in one day.',
    ),
    Symtoms(
      imgpath: "assets/covidcons/034-headache.png",
      title: 'Headache.',
      description: 'Headache is the symptom of pain in the face, head, or neck. It can occur as a migraine, tension-type headache, or cluster headache.',
    ),
    Symtoms(
      imgpath: "assets/covidcons/rash.png",
      title: 'A rash on skin.',
      description: 'Temporary outbreak of red, bumpy, scaly or itchy patches of skin, possibly with blisters or welts.',
    ),
  ];

  
class Preventions{
  String imgpath;
  String title;
  String description;

  Preventions({this.imgpath, this.title,this.description});
}

List<Preventions> preventions = [
    Preventions(
      imgpath: "assets/covidcons/003-patient.png",
      title: 'Face mask.',
      description: 'Wear Face mask to protect yourself from covid-19.',
    ),
    Preventions(
      imgpath: "assets/covidcons/023-distance.png",
      title: 'Social Distancing.',
      description: 'Maintain a safe distance from anyone who is coughing or sneezing.',
    ),
    Preventions(
      imgpath: "assets/covidcons/006-hand wash.png",
      title: 'Wash your hands.',
      description: 'Use warm water and soap and rub your hands for at least 20 seconds.',
    ),
    Preventions(
      imgpath: "assets/covidcons/007-quarantine.png",
      title: 'Self-quarantine.',
      description: 'Call your doctor if you have any symptoms. Stay home until you recover.',
    ),
    Preventions(
      imgpath: "assets/covidcons/041-disinfectant.png",
      title: 'Disinfect surfaces.',
      description: 'Use alcohol-based disinfectants to clean hard surfaces in your home like countertops, door handles, furniture etc.',
    ),
    Preventions(
      imgpath: "assets/covidcons/013-cough.png",
      title: 'Cover your cough.',
      description: 'Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.',
    ),
     Preventions(
      imgpath: "assets/covidcons/039-namaste.png",
      title: 'Greet with Namaste.',
      description: 'Handshaking is an efficient way to spread germs, since we touch our faces multiple times every hour.',
    ),
];

