import 'package:flutter/material.dart';

class Guideline extends StatelessWidget {
  const Guideline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Community Guidelines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
              SizedBox(
                height: 24,
              ),
              Text("Things you should do...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(
                height: 4,
              ),
              Text(
                  "Respect everyone, we're all here because we have something in common. Be polite and welcoming to new users. We were all new once.Ask for help and provide assistance to others when possible.Offer constructive criticism or voice a dissenting opinion, but don't be mean or disrespectful.Feel free to use use Emoji (Emoticons) to convey the tone of your message. :wink:Lead by example. Treat others even better than you expect to be treated yourself and the discussions become a better place for everyone"),
              SizedBox(
                height: 32,
              ),
              Text("Things you should not do...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(
                height: 4,
              ),
              Text(
                  "Do not share or ask for links to copyrighted, non-fair use material. Do not share any NSFW* content (e.g. links, images, text etc.) on your profile or in forum discussions. Trolling, abuse, flaming and/or harassment (e.g. personal attacks, name-calling and/or insulting/ridiculing another user) are uncalled for and will not be tolerated. Have discussions based on well-formulated arguments. Do not post spam** or advertisements on TMDB. Double posting is frowned upon. Please edit your first post unless a second post is absolutely necessary. Impersonating another user of TMDB by copying their name and/or avatar is not allowed. Just be your charming self."),
              SizedBox(
                height: 32,
              ),
              Text(
                  "Offensive or distasteful usernames are unnecessary and will either be changed or banned. One account per person is enough. Multiples are unnecessary and will be banned and/or removed. But most importantly; 'Be nice or go home!'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
