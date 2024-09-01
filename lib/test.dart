import 'package:flutter/material.dart';
import 'package:test/editing_video.dart';
import 'package:test/empa2.dart'; // Update with correct path if needed
import 'package:test/empathetic_data.dart';
import 'package:test/feedback_capture_matrix.dart';
import 'package:test/i_like_i_wish_what_if.dart';
import 'package:test/identify_a_variable.dart';
import 'package:test/prototype_to_decide.dart';
import 'package:test/review_your_portfolio.dart';
import 'package:test/secondpage.dart';
import 'package:test/shooting_video.dart';
import 'package:test/storytelling.dart';
import 'package:test/test2.dart';
import 'package:test/testing_with_users.dart';
import 'package:test/user_driven_prototyping.dart';
import 'package:test/wizard_of_oz_prototyping.dart'; // Update with correct path if needed
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _lessons = [
    'Introduction',
    'Feedback Capture Matrix',
    'Storytelling',
    'I Like, I Wish, What If',
    'Empathetic Data',
    'Review Your Portfolio',
    'Shooting Video',
    'Editing Video',
    'Testing with Users',
    'Prototype to Decide',
    'Wizard of Oz Prototyping',
  ];

  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredLessons = [];
  Set<String> _bookmarkedLessons = {}; // To keep track of bookmarked lessons
  int? _selectedLessonIndex;

  @override
  void initState() {
    super.initState();
    _filteredLessons = _lessons;
    _searchController.addListener(_filterLessons);
    _loadBookmarks(); // Load bookmarks from SharedPreferences
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLessons() {
    setState(() {
      _filteredLessons = _lessons
          .where((lesson) => lesson
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _openLesson(int index) {
    String lessonTitle = _filteredLessons[index];
    Widget targetPage;

    // Decide which page to navigate to based on the selected lesson
    switch (lessonTitle) {
      case 'Feedback Capture Matrix':
        targetPage = const FeedbackCaptureMatrix(
          lessonImageFront: 'assets/images/Feedback Capture Matrix.png',
          lessonTitleFront: 'Feedback Capture Matrix',
          lessonContentFront:
              'Feedback capture matrices facilitate real-time capture of feedback on presentations and prototypes. You can use a feedback capture matrix either to give feedback on progress within the design team or to capture user feedback. The matrix itself arranges thoughts and ideas into four categories for easy assessment. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use a feedback capture matrix:  \n',
          lessonContentBack:
              'Section off a blank page or whiteboard into quadrants. Draw a plus sign in the upper left quadrant, a delta sign in the upper right quadrant, a question mark in the lower left quadrant, and a light bulb in the lower right quadrant.   \n\n'
              'Fill in the matrix as you give or receive feedback. Place things one likes or finds notable in the upper left (plus sign). Constructive criticism goes in the upper right (delta sign). Questions raised go in the lower left (question mark). And new ideas spurred go in the lower right (light bulb). If you’re giving feedback, strive to give input in each quadrant (especially the upper two: “likes” and “wishes”).\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Wizard of Oz Prototyping':
        targetPage = const Wizard(
          lessonImageFront: 'assets/images/Wizard of Oz Prototyping.png',
          lessonTitleFront: 'Wizard of Oz Prototyping',
          lessonContentFront:
              'A wizard of Oz prototype fakes functionality that you want to test with users, saving you the time and money of actually creating it. Wizard of Oz prototypes often refer to prototypes of digital systems, in which the user thinks the response is computer-driven, when in fact it’s human-controlled.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to create a Wizard of Oz prototype: \n',
          lessonContentBack:
              'Determine what you want to test. Then figure out how to fake that functionality and still give users an authentic experience. \n\n'
              'You can combine existing tools (tablets, email systems, Powerpoint) with human intervention to create the illusion of functionality. \n\n'
              'The company Aardvark needed to test user reactions totheir online interface for connecting people withquestions to qualified people with answers. Instead ofcoding, they used an instant messaging system andteam members behind the scenes to physically routequestions and answers to the right people. \n\n'
              'Wizard of Oz prototypes can be extended beyond thedigital realm, to physical prototypes. You couldprototype a vending machine without building themechanics behind it—using a person hidden inside todeliver purchases. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Introduction':
        targetPage = const Test2(
          lessonTitleFront: 'Introduction',
          lessonContentFront:
              'Testing is your chance to gather feedback, refine solutions, and continue to learn about your users. The test mode is an iterative mode in which you place low-resolution prototypes in the appropriate context of your user’s life. Prototype as if you know you’re right, but test as if you know you’re wrong.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to Test:',
          lessonContentBack:
              'Create authentic experiences for users to test your prototypes. \n\n'
              'Learn more about your user. \n'
              'Testing is another opportunity to build empathy through observation and engagement—often yielding unexpected insights. \n\n'
              'Refine your prototypes and solutions.  \n'
              'Testing informs the next iterations of prototypes. Sometimes this means going back to the drawing board. \n\n'
              'Test and refine your Point of View. \n'
              'Testing may reveal that, not only did you get the solution wrong, but you also framed the problem incorrectly.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',

          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Testing with Users':
        targetPage = const TestingUser(
          lessonImageFront: 'assets/images/Testing with Users.png',
          lessonTitleFront: 'Testing with Users',
          lessonContentFront:
              'Testing with users is a fundamental part of humancentered design. You test with users to not only refineyour solution, but to better understand the peopleyou’re designing for. When you test prototypes,consider both what you can learn about your solutionand what you can learn about your user—you can always use more empathy.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to test with users: ',
          lessonContentBack: 'Let your user experience the prototype.\n'
              'Show don’t tell. Put your prototype in the user’s hands(or your user in the prototype) and give only the basic context they need to understand what to do. \n\n'
              'Have them talk through their experience. \n'
              'Use prompts. “Tell me what you’re thinking as you do this.”\n\n'
              'Actively observe. \n'
              'Don’t immediately “correct” your user. Watch howthey use (and misuse) your prototype.\n\n'
              'Follow up with questions. \n'
              'This is often the most valuable part. “Show me why thiswould (not) work for you.” “Can you tell me how thismade you feel?” “Why?” Answer questions withquestions. “Well, what do you think that button does?” \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Prototype to Decide':
        targetPage = const PrototypeDe(
          lessonImageFront: 'assets/images/Prototype to Decide.png',
          lessonTitleFront: 'Prototype to Decide',
          lessonContentFront:
              'During the design process, it can be unclear how toproceed forward, particularly when team membershave mixed opinions. The best way to resolve teamconflicts about design elements is to prototype andevaluate them with users. If a prototype is receivedwell, it’s a good sign it’s worth pursuing further.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to prototype to decide:\n',
          lessonContentBack:
              'If the team is stuck between multiple opinions, buildout multiple prototypes (for agility purposes, limit theteam to 3-5 prototypes). Develop models of potentialdesign candidates. \n\n'
              'Be sure to distill the design problem down to discrete elements, isolating the variable you’re testing. \n\n'
              'Build as quickly and low-resolution as possible. Thentest your prototypes on the team, outsider peers, or,better yet, test your prototypes on real users. Be sureto capture feedback. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Storytelling':
        targetPage = const Storytelling(
          lessonImageFront: 'assets/images/Storytelling.png',
          lessonTitleFront: 'Storytelling',
          lessonContentFront:
              'A well-told story—filled with rich detail, surprising meaning, and universal emotion affects both the brain and the heart. Stories are a great way to connect people with ideas, at a human level. If you want to make an impression on your audience (teammates, clients, investors), tell a great user-centered story. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to tell stories: ',
          lessonContentBack:
              'Follow the structure of a story spine to flesh out the narrative arc of your user-centered story:  \n\n'
              'Once upon a time...  \n'
              'And every day... \n'
              'Until one day... \n'
              'Because of that...  \n'
              'And because of that...  \n'
              'Until finally...  \n'
              'And ever since that day...  '
              'And the moral is...  \n\n'
              'Remember, your user is the hero of your story, not your concept. Your concept contributes to the transformation of your character, and to the relief of dramatic tension, but it’s not the main character.  \n'
              'Once you’ve finished your story, remove the stems from the story spine prompts. Don’t say “once upon a time,” for example, when you tell your story to an actual audience. Just like scaffolding for painters, the story spine prompts get removed once they serve their purpose. What remains should be a believable, compelling user story. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',

          // lessonImageBack: 'assets/images/howtoemphize.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'I Like, I Wish, What If':
        targetPage = const ILike(
          lessonImageFront: 'assets/images/I like I wish What If.png',
          lessonTitleFront: 'I Like, I Wish, What If',
          lessonContentFront:
              'As a designer, you must rely on personal communication and, particularly, feedback, during design work. Colleagues give feedback on design frameworks. Users give feedback on solution concepts. I like, I wish, What if (IL/IW/WI) is a simple tool to encourage open feedback. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to use I like, I wish, what if: ',
          lessonContentBack:
              'IL/IW/WI is almost too simple to write down, but it’s too useful not to mention. Meet as a group. Team members chime in by expressing “likes,” “wishes,” or “what ifs” as succinct headlines. \n\n'
              '“I like how we broke our team into pairs.” “I wish we had discussed our plan before testing.” “What if we tried one more prototype?”  \n\n'
              'Share dozens of headlines in a session (be sure to pick someone to capture). You don’t need to respond to every one. Let the team decide which topics to discuss as they arise.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Empathetic Data':
        targetPage = const Empathetic(
          lessonImageFront: 'assets/images/Empathetic Data.png',
          lessonTitleFront: 'Empathetic Data',
          lessonContentFront:
              'The difficulty with many new ideas is that they’re hard to empirically prove, leaving key decision makers no basis for comparison. The good news is, designers can create data through simple prototyping. \n'
              'If you’re struggling to get buy-in from key stakeholders due to lack of hard data, consider building an empathetic data set, derived from real user prototype testing. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to gather empathetic data: ',
          lessonContentBack:
              'Take your prototype (it doesn’t need to be perfect, just usable) and place it in a context where your users currently experience your product or service. Bonus points if you can find a setting that allows users to test the current offering and the new offering.   \n\n'
              'Extra bonus points if that setting is low pressure, so customers feel comfortable giving open and honest feedback. For example, d.school alum, Bill Pacheco, tested exercise machine prototypes in a real gym with actual users.  \n\n'
              'During your test, capture usage counts, quotes, and reactions via notes or video. Create a sizable data sample to support and refine your prototype.  \n\n'
              'Pro tip: bring your decision makers along to watch and interact with users. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Review Your Portfolio':
        targetPage = const ReviewPortfolio(
          lessonImageFront: 'assets/images/Review Your Portfolio.png',
          lessonTitleFront: 'Review Your Portfolio',
          lessonContentFront:
              'Sustaining/incremental innovations and disruptive innovations are what make up your innovation portfolio. Reviewing where various concepts fall in the portfolio helps you understand where to focus your energy. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to review your portfolio: \n',
          lessonContentBack:
              'Create a simple 2x2 matrix. Plot “depth of insight” on the x-axis, from shallow to deep. Shallow insights are things the team knew before the project started. Deep insights expose the problem in a brand new light.  \n\n'
              'Plot “disruptiveness of concept” on the y-axis, from incremental to breakthrough. Incremental concepts are simple builds on existing products or services (or things the organization has tried before). Breakthrough concepts have never been tried—they might even be new to the industry.  \n\n'
              'It’s easier to move a deep insight up to breakthrough territory than it is to move a shallow insight. When reviewing your portfolio, ask “which concepts address problems we’ve never considered?” These concepts are easier to “Yes, And!” into breakthrough territory.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Identify a Variable':
        targetPage = const IdentifyVar(
          lessonImageFront: 'assets/images/Identify a Variable.png',
          lessonTitleFront: 'Identify a Variable',
          lessonContentFront:
              'Rather than prototype a complete mockup of a solution, it’smore productive to single out and test a specific variable.Identifying a variable not only saves time and money (youdon’t need to create all facets of a complex solution), it givesyou the opportunity to test multiple prototypes, each varyingin the one property. This encourages the user to makenuanced comparisons between prototypes and choose one option over another.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to identify a variable:\n',
          lessonContentBack:
              'Prototype with a purpose. Based on user needs andinsights, identify one variable of your concept to fleshout and test. Then build a few iterations. Keepprototypes as low resolution as possible.  \n\n'
              'Remember, a prototype doesn’t have to be, or evenlook like the solution. You might want to know how heavy a device should be. Create prototypes of varied weight, without making them operable. You may wantto find out if users prefer delivery versus pick up. Build boxes for each service, without filling them. \n\n'
              'By selecting one variable to test, you can bring resolution to that aspect of your concept and slide one step closer to a design solution. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'User-Driven Prototyping':
        targetPage = const UserDriven(
          lessonImageFront: 'assets/images/User Driven Prototyping.png',
          lessonTitleFront: 'User-Driven Prototyping',
          lessonContentFront:
              'User-driven prototypes are created by users, rather than developed by you. When users create aspects of the design themselves, they reveal assumptions and desires that otherwise remain unmined. \n'
              'Your goal is not to integrate their ideas into your design, but to better understand their thinking and reveal undetected needs and insights.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to create a userdriven prototype: \n',
          lessonContentBack:
              'Strike a balance between how much you provide and how much you ask users to create. The ideal prototype should be scaffolded enough to spur generative thinking, but open enough to broaden user understanding. \n\n'
              'Some user-driven prototypes ask users to draw something (“draw going to the doctor”), make an object (“make a diaper bag with this paper and tape”), or compile artifacts (“tear out magazine pictures that depict your ideal mall shopping experience”).  \n\n'
              'If you were designing a website for users to create custom t-shirts, a traditional prototype might be a mockup of the website. A user-driven prototype might be a blank piece of paper for users to draw their own website. Scaffolding to get users going might include empty boxes on the page for them to fill in with content.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Wizard of Oz Prototyping':
        targetPage = const Wizard(
          lessonImageFront: 'assets/images/Wizard of Oz Prototyping.png',
          lessonTitleFront: 'Wizard of Oz Prototyping',
          lessonContentFront:
              'A wizard of Oz prototype fakes functionality that you want to test with users, saving you the time and money of actually creating it. Wizard of Oz prototypes often refer to prototypes of digital systems, in which the user thinks the response is computer-driven, when in fact it’s human-controlled.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to create a Wizard of Oz prototype: \n',
          lessonContentBack:
              'Determine what you want to test. Then figure out how to fake that functionality and still give users an authentic experience. \n\n'
              'You can combine existing tools (tablets, email systems, Powerpoint) with human intervention to create the illusion of functionality. \n\n'
              'The company Aardvark needed to test user reactions totheir online interface for connecting people withquestions to qualified people with answers. Instead ofcoding, they used an instant messaging system andteam members behind the scenes to physically routequestions and answers to the right people. \n\n'
              'Wizard of Oz prototypes can be extended beyond thedigital realm, to physical prototypes. You couldprototype a vending machine without building themechanics behind it—using a person hidden inside todeliver purchases. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Shooting Video':
        targetPage = const ShootingVideo(
          lessonImageFront: 'assets/images/Shooting Video.png',
          lessonTitleFront: 'Shooting Video',
          lessonContentFront:
              'Video is a powerful medium for communicating ideas, insights and stories. The frame is your medium—be aggressive. If it’s not in the frame, it doesn’t exist. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to shoot video: \n',
          lessonContentBack:
              '1. Know your intention. What’s the one thing you want your audience to leave with?  \n\n'
              '2. Get a tight frame of your subject at all times. \n\n'
              '3. Be conscious of light sources and shadows on your subject.  \n\n'
              '4. Overshoot! Get more than you think you need. Editing is where the storytelling begins. Remember to get longer takes. They allow you some wiggle room for transitions.  \n\n'
              '5. Keep mic close to the subject (boom mic preferred).  \n\n'
              '6. Point mic away from undesired noise. \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;
      case 'Editing Video':
        targetPage = const EditingVideo(
          lessonImageFront: 'assets/images/Editing Video.png',
          lessonTitleFront: 'Editing Video',
          lessonContentFront:
              'At its core, editing is storytelling. The medium where your narrative comes to life. Being meticulous in your editing is crucial to delivering the best, clearest narrative.  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          lessonTitleBack: 'How to edit video: ',
          lessonContentBack:
              'To edit quickly and create compelling videos, follow these guidelines:  \n\n'
              'During the process, ensure an audience will understand your visual narrative. Remember, it’s better to be clear than clever.  \n\n'
              'Make an initial rough cut of the whole film. Block out the beginning, middle and end.  \n\n'
              'Kill the darlings. Remain focused on what will tell your story best.  \n\n'
              'What you hear is equally important to what you see. Ensure any music compliments your visuals and doesn\'t distract.\n\n'
              'Before exporting your video, know where it will live. If to be played off your computer, use minimal compression to ensure quality. For social media or video hosting sites, consult their listed guidelines.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
          // lessonImageBack: 'assets/images/interviews.png',
          backgroundImage: 'assets/images/text2.jpg',
        );
        break;

      // Add other cases for other lessons if needed
      default:
        targetPage = Empa2(
          lessonTitleFront: lessonTitle,
          lessonContentFront: 'Content for $lessonTitle',
          lessonTitleBack: lessonTitle,
          lessonContentBack: 'Additional content for $lessonTitle',
          lessonImageBack: 'assets/images/default.png', // Example default image
          backgroundImage: 'assets/images/empahize.jpg',
        );
    }

    setState(() {
      _selectedLessonIndex = index;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    });
  }

  Future<void> _toggleBookmark(String lesson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_bookmarkedLessons.contains(lesson)) {
        _bookmarkedLessons.remove(lesson);
      } else {
        _bookmarkedLessons.add(lesson);
      }
    });
    // Save the updated bookmark list to SharedPreferences
    await prefs.setStringList('bookmarkedLessons', _bookmarkedLessons.toList());
  }

  bool _isBookmarked(String lesson) {
    return _bookmarkedLessons.contains(lesson);
  }

  Future<void> _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedBookmarks = prefs.getStringList('bookmarkedLessons');
    if (savedBookmarks != null) {
      setState(() {
        _bookmarkedLessons = savedBookmarks.toSet();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/TestBG.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),

          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Back Button and Title
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the row items
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Secondpage()),
                        );
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'TEST',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    // Empty container to balance the row, but not required for centering
                    Container(width: 48),
                  ],
                ),
                const SizedBox(height: 20),

                // Adding extra space above the search bar
                const SizedBox(
                    height:
                        5), // Adjust this value to move the search bar lower

                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search lessons...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 134, 24, 185),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 40), // Adjust space after the search bar

                // Lessons List
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredLessons.length,
                    itemBuilder: (context, index) {
                      String lesson = _filteredLessons[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: ListTile(
                          leading: const Icon(
                            Icons.book,
                            color: Color.fromARGB(255, 134, 24, 185),
                          ),
                          title: Text(
                            lesson,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  _isBookmarked(lesson)
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      const Color.fromARGB(255, 134, 24, 185),
                                ),
                                onPressed: () {
                                  _toggleBookmark(lesson);
                                },
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                          onTap: () => _openLesson(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
