# Stream.Transcripts
Gigaohm Biological High Resistance Low Noise Information Transcripts

The purpose of this repo is to place AI generate captions in one location for easy searching. How this repo will change will depend on how well it is working for our purposes.

**Note:** *Due to when this repo got created, it would not be possible to generate all the captions for all the streams (at least initially). JC has his own archive of all the streams, so this is possible, but it is a matter of time and effort.*

## Organization

All transcripts will be
- [twitch](twitch) - from http://twitch.tv/gigaohmbiological
- [youtube](youtube) - from [JC on a Bike (channel)](https://www.youtube.com/@JConabike)
- [guest.speaker](guest.speaker) - from various

Other folders:
- [tools](tools) - tools and scripts

### Conventions

In each transcript "top" folder, will be a new folder for each stream. These folders will typically start with the stream ID and include the title and date of ths stream. Inside each folder will be the transcript (probably in [VTT format](https://developer.mozilla.org/en-US/docs/Web/API/WebVTT_API)). This provides some flexibility in case we need to put additional files there. It will also have a ReadMe.md file which should include some information like a link back to the known streams.

# Plans

Initially this will server as a repository for AI generated (and corrected) transcripts from any streams that Gigaohm Biological appears for the purpose of searching. However, over time, we might develop new capabilities.

## Javascript + Static Site

One idea is to generate (using github pages) a static site using javascript and pre-built indexes to make the searching a lot better/easier (including hot-linking to the right timestamp from either the Twitch or alternative sourced stream). This would make finding the content that one wants to share much faster.

(This is a far-off-in-the-future plan...)