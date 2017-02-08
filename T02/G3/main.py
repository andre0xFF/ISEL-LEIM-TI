import xml.etree.ElementTree as ET

def print_videos_lists(tree):
    namespace = { 'xmltube': 'urn:xmltube:ns' }
    playlist_elem = tree.findall('.//playlist', namespace)
    playlists = ''
    for playlist in playlist_elem:
        user = tree.find('.//users')
        subscribers = tree.find('.//users')
        videos = tree.find('.//videos')
        playlists_videos = tree.find('.//playlists_videos')
        playlists += print_video_list(playlist, user, subscribers, videos, playlists_videos) + '\n'

    return playlists

def print_video_list(playlist_elem, users_elem, subscribers_elem, videos_elem, playlists_videos_elem):
    playlist = 'Playlist: {}, {}, {}\n'.format(
        playlist_elem.get('id'),
        playlist_elem.find('title').text,
        playlist_elem.find(('creation_date')).text
    )
    link = '  Link: {}\n'.format(playlist_elem.get('thumbnail'))
    user = print_user_data(users_elem.find('.//user[@username="{}"]'.format(playlist_elem.get('username'))), 2) + '\n'

    subscribers = '  Subscribers:\n'
    for sub in subscribers_elem:
        s = users_elem.find('.//user[@username="{}"]'.format(sub.get('username')))
        subscribers += print_user_data(s, 4) + '\n'

    videos = '  Videos:\n'
    for video in playlists_videos_elem:
        v = videos_elem.find('.//video[@id="{}"]'.format(video.get('video_id')))
        videos += print_video(v, 4) + '\n'
        videos += print_user_data(users_elem.find('.//user[@username="{}"]'.format(v.get('username'))), 6) + '\n'

    return playlist + link + user + subscribers + videos

def print_user_data(user_elem, ii):
    space = ''
    for i in range(ii):
        space += ' '

    user = 'User: {}, {}'.format(
        user_elem.get('username'),
        user_elem.find('name').text
    )
    birthday = user_elem.find('birthday')
    if birthday != None:
        user += ', {}'.format(birthday.text)

    return space + user

def print_video(video_elem, ii):
    space = ''
    for i in range(ii):
        space += ' '

    video = 'Video: {}, {}'.format(video_elem.get('id'), video_elem.find('title').text)

    return space + video

def main():
    tree = ET.parse('../../T01/XMLTube.xml')
    lists = print_videos_lists(tree)
    print(lists, end = '')


if __name__ == '__main__': main()
