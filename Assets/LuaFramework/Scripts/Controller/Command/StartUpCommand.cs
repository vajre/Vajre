using UnityEngine;
using System.Collections;
using LuaFramework;

public class StartUpCommand : ControllerCommand
{
    public override void Execute(IMessage message)
    {
        if (!Util.CheckEnvironment()) return;

        GameObject gameMgr = GameObject.Find("GlobalGenerator");
        if (gameMgr != null)
		{
			AppView appView = gameMgr.GetComponent<AppView>();
			if (appView == null) 
			{
				appView = gameMgr.AddComponent<AppView>();
			}
            //AppView appView = gameMgr.AddComponent<AppView>();
        }

        //-----------------初始化管理器-----------------------
        AppFacade.Instance.AddManager<LuaManager>(ManagerName.Lua);
        AppFacade.Instance.AddManager<SoundManager>(ManagerName.Sound);
        AppFacade.Instance.AddManager<TimerManager>(ManagerName.Timer);
        AppFacade.Instance.AddManager<NetworkManager>(ManagerName.Network);
        AppFacade.Instance.AddManager<ResourceManager>(ManagerName.Resource);
        AppFacade.Instance.AddManager<ThreadManager>(ManagerName.Thread);
        AppFacade.Instance.AddManager<ObjectPoolManager>(ManagerName.ObjectPool);
		AppFacade.Instance.AddManager<NativePlatformMessageManager> (ManagerName.NativePlatformMessage);
        AppFacade.Instance.AddManager<GameManager>(ManagerName.Game);
    }
}