# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Changelog.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Changelog.Repo
alias Changelog.{Episode, Person, Podcast, PodcastHost}

# Clean slate

Repo.delete_all Episode
Repo.delete_all PodcastHost
Repo.delete_all Podcast
Repo.delete_all Person

# People

adamstac = Repo.insert! %Person{
  name: "Adam Stacoviak",
  email: "adam@stacoviak.com",
  handle: "adamstac",
  twitter_handle: "adamstac",
  github_handle: "adamstac",
  bio: "Founder & Editor-in-Chief of @Changelog",
  website: "http://adamstacoviak.com/",
  admin: true
}

jerodsanto = Repo.insert! %Person{
  name: "Jerod Santo",
  email: "jerod.santo@gmail.com",
  handle: "jerodsanto",
  twitter_handle: "jerodsanto",
  github_handle: "jerodsanto",
  bio: "Professional `binding.pry` typer. Also @changelog, @objectlateral, @interfaceschool",
  website: "http://jerodsanto.net/",
  admin: true
}

carlisia = Repo.insert! %Person{
  name: "Carlisia Pinto",
  email: "carlisia@changelog.com",
  handle: "carlisia",
  twitter_handle: "carlisia",
  github_handle: "carlisia",
  bio: "Distributing all your systems @fastly • #golang dev • @golangbridge • @remotemeetupGo • co-host of @GoTimeFM • runner",
  website: "https://keybase.io/carlisia"
}

erikstmartin = Repo.insert! %Person{
  name: "Erik St. Martin",
  email: "erikstmartin@changelog.com",
  handle: "erikstmartin",
  twitter_handle: "erikstmartin",
  github_handle: "erikstmartin",
  bio: "@GopherCon Organizer, Co-author Go in Action, Co-founder @GopherAcademy, Co-host @gotimefm, Kubernetes / Container fanatic"
}

bketelsen = Repo.insert! %Person{
  name: "Brian Ketelsen",
  email: "bketelsen@gmail.com",
  handle: "bketelsen",
  twitter_handle: "bketelsen",
  github_handle: "bketelsen",
  bio: "@GopherCon Organizer, Co-author Go in Action, Co-founder @GopherAcademy, Co-host @gotimefm, Kubernetes / Container fanatic",
  website: "http://www.brianketelsen.com"
}

nayafia = Repo.insert! %Person{
  name: "Nadia Eghbal",
  email: "nadia.eghbal@gmail.com",
  handle: "nayafia",
  twitter_handle: "nayafia",
  github_handle: "nayafia",
  bio: "Subtle + overt = subvert",
  website: "http://nadiaeghbal.com/"
}

mikeal = Repo.insert! %Person{
  name: "Mikeal Rogers",
  email: "mikeal.rogers@gmail.com",
  handle: "mikeal",
  twitter_handle: "mikeal",
  github_handle: "mikeal",
  bio: "Community Organizer @ Node.js Foundation. Creator of request, NodeConf, lots of thing. Co-host of the RFC podcast.",
  website: "http://mikealrogers.com/"
}

# Podcasts
changelog = Repo.insert! %Podcast{
  name: "The Changelog",
  slug: "podcast",
  status: 2,
  description: "A weekly podcast that shines a spotlight on the technology and people of open source. It's about the code, the people, and the community.",
  twitter_handle: "changelog",
  itunes_url: "https://itunes.apple.com/us/podcast/the-changelog/id341623264?mt=2",
  ping_url: "https://github.com/thechangelog/ping",
  schedule_note: "New show every Friday!",
  podcast_hosts: [
    %PodcastHost{
      position: 1,
      person: adamstac
    },
    %PodcastHost{
      position: 2,
      person: jerodsanto
    }
  ]
}

founderstalk = Repo.insert! %Podcast{
  name: "Founders Talk",
  slug: "founderstalk",
  status: 2,
  description: "An interview podcast, featuring in-depth, one on one, conversations with Founders.",
  itunes_url: "https://itunes.apple.com/us/podcast/founders-talk/id396900791?mt=2",
  podcast_hosts: [
    %PodcastHost{
      position: 1,
      person: adamstac
    }
  ]
}

gotime = Repo.insert! %Podcast{
  name: "Go Time",
  slug: "gotime",
  status: 2,
  description: "A weekly panelist podcast discussing the Go programming language, the community, and everything in between.",
  vanity_domain: "gotime.fm",
  twitter_handle: "gotimefm",
  itunes_url: "https://itunes.apple.com/us/podcast/go-time/id1120964487?mt=2",
  ping_url: "https://github.com/gotimefm/ping",
  schedule_note: "Records LIVE every Thursday at 12pm PST!",
  podcast_hosts: [
    %PodcastHost{
      position: 1,
      person: erikstmartin
    },
    %PodcastHost{
      position: 2,
      person: carlisia
    },
    %PodcastHost{
      position: 3,
      person: bketelsen
    }
  ]
}

rfc = Repo.insert! %Podcast{
  name: "Request for Commits",
  slug: "rfc",
  status: 2,
  description: "Exploring different perspectives in open source sustainability. It's about the human side of code.",
  itunes_url: "https://itunes.apple.com/us/podcast/request-for-commits/id1141345001?mt=2",
  podcast_hosts: [
    %PodcastHost{
      position: 1,
      person: nayafia
    },
    %PodcastHost{
      position: 2,
      person: mikeal
    }
  ]
}

# Podcast Episodes

changelog_episode = Repo.insert! %Episode{
  guid: "51",
  slug: "51",
  title: "The Road to Font Awesome 5 with Dave Gandy",
  summary: "Dave Gandy joined the show to talk about the history of Font Awesome, what's to come in Font Awesome 5 and their Kickstarter to fund Font Awesome 5 Pro, and how everything they're doing is funneling back into the forever free and open source — Font Awesome Free.",
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus molestie ut lorem vitae feugiat. Pellentesque vel erat libero. Vivamus rhoncus non erat nec bibendum. Vivamus ullamcorper massa mauris, at dapibus metus tincidunt sit amet. Suspendisse eu nibh vitae libero consectetur vehicula non a dolor. Aenean quis ligula ut risus iaculis blandit.",
  published: true,
  published_at: Timex.now,
  recorded_at: Timex.now,
  bytes: 1234,
  duration: 6840,
  podcast: changelog
}
changelog_episode |> Ecto.Changeset.change(
  audio_file: %{file_name: "web/static/assets/california.mp3", updated_at: Ecto.DateTime.utc}
) |> Repo.update!

founderstalk_episode = Repo.insert! %Episode{
  guid: "51",
  slug: "51",
  title: "Sam Soffes / Onward",
  summary: "TCould this be Sam's final appearance on Founders Talk? Only time will tell.",
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus molestie ut lorem vitae feugiat. Pellentesque vel erat libero. Vivamus rhoncus non erat nec bibendum. Vivamus ullamcorper massa mauris, at dapibus metus tincidunt sit amet. Suspendisse eu nibh vitae libero consectetur vehicula non a dolor. Aenean quis ligula ut risus iaculis blandit.",
  published: true,
  published_at: Timex.now,
  recorded_at: Timex.now,
  bytes: 1234,
  duration: 6840,
  podcast: founderstalk
}
founderstalk_episode |> Ecto.Changeset.change(
  audio_file: %{file_name: "web/static/assets/california.mp3", updated_at: Ecto.DateTime.utc}
) |> Repo.update!

gotime_episode = Repo.insert! %Episode{
  guid: "23",
  slug: "23",
  title: "Open Sourcing Chain's Developer Platform with Tess Rinearson",
  summary: "Tess Rinearson joined the show to talk about Chain launching their open source developer platform, choosing an open source license, open sourcing Chain Core, and the future of this powerful blockchain written in Go.",
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus molestie ut lorem vitae feugiat. Pellentesque vel erat libero. Vivamus rhoncus non erat nec bibendum. Vivamus ullamcorper massa mauris, at dapibus metus tincidunt sit amet. Suspendisse eu nibh vitae libero consectetur vehicula non a dolor. Aenean quis ligula ut risus iaculis blandit.",
  published: true,
  published_at: Timex.now,
  recorded_at: Timex.now,
  bytes: 1234,
  duration: 6840,
  podcast: gotime
}
gotime_episode |> Ecto.Changeset.change(
  audio_file: %{file_name: "web/static/assets/california.mp3", updated_at: Ecto.DateTime.utc}
) |> Repo.update!

rfc_episode = Repo.insert! %Episode{
  guid: "9",
  slug: "9",
  title: "Open Source & Licenses with Heather Meeker",
  summary: "Heather Meeker joined the show to talk about open source licensing, why open source licenses are historically significant, how much developers really need to know, and how much developers think they know. We also talk about mixing commercial and open source licenses, and how lawyers keep up with an ever-changing landscape.",
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus molestie ut lorem vitae feugiat. Pellentesque vel erat libero. Vivamus rhoncus non erat nec bibendum. Vivamus ullamcorper massa mauris, at dapibus metus tincidunt sit amet. Suspendisse eu nibh vitae libero consectetur vehicula non a dolor. Aenean quis ligula ut risus iaculis blandit.",
  published: true,
  published_at: Timex.now,
  recorded_at: Timex.now,
  bytes: 1234,
  duration: 6840,
  podcast: rfc
}
rfc_episode |> Ecto.Changeset.change(
  audio_file: %{file_name: "web/static/assets/california.mp3", updated_at: Ecto.DateTime.utc}
) |> Repo.update!
