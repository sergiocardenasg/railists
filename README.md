# Railists

Railists is an application where users can create songs and add them to personalized playlists. A song has an artist and genre, and can be in a more than one playlist.

While all created songs are accesable to users, playlists can only be seen, edited, or deleted by the user who created them.

## Installation

Clone this repo into your local environment and run the following commands:

Execute this to install the [Ruby Gems](https://rubygems.org/):

    $ bundle install

Run migrations:

    $ rake db:migrate 

And finally, boot up the server:

    $ rails s

Everything should be set up.

## Usage

Create an account or sign in (with GitHub or the app itself). See navigation bar display your own playlists, as well as all songs, artists, and genres created by all users.

Playlists can only be edited, seen, and deleted by the user who created them. However, all songs, artists, and genres can be seen, edited, and deleted by any user.

Each form (to sign in/up, create a song/playlist/artist/genre, etc.) has validation controls.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>my-reading-repo/. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/reading/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MyReadingRepo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>my-reading-repo/blob/master/CODE_OF_CONDUCT.md).
