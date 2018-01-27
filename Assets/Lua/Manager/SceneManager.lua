local LoginScene = require "Scene.LoginScene"

SceneManager = {}
local this = SceneManager

function SceneManager.Init()
    SceneManager["LoginScene"] = LoginScene
end

function SceneManager.LoadScene(sceneName)
    SceneManager[sceneName].LoadScene()
end

function SceneManager.LoadSceneAsync(sceneName) 
    SceneManager[sceneName].LoadSceneAsync()
end