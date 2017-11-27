Sound = {}
local this = Sound


function Sound.Init()
    this.m = {}
    this.m.MusicOn = CS.PlayerPrefs.GetFloat("Music", 1.0)
    this.m.Audio = CS.PlayerPrefs.GetFloat("Audio", 1.0)
    Sound.SetMusic(this.m.MusicOn)
    this.SetAudio(this.m.Audio)
end

function Sound.PlayMusic(audioClip)
    if audioClip == nil then
        return
    end
    CS.SoundManager:PlayBacksound(audioClip, true)
end

function Sound.StopMusic(audioClip)
    if audioClip == nil then
        return
    end
    CS.SoundManager:PlayBacksound(audioClip, false)
end

function Sound.PlayAudio(audioClip)
    if audioClip == nil then
        return
    end
    CS.SoundManager:Play(audioClip, CS.PlayerPrefs.GetFloat("Audio", 1.0))
end

function Sound.SetMusic(tag)
    CS.PlayerPrefs.SetFloat("Music", tag)
    CS.SoundManager:SetMusicVolume(tag)
end

function Sound.SetAudio(tag)
    CS.PlayerPrefs.SetFloat("Audio", tag)
    this.m.Audio = tag
end
