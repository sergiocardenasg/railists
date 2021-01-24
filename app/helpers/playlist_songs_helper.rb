module PlaylistSongsHelper
    def self.user_playlists
        current_user.playlists.ordered_by_name
    end
end
