using UnityEngine;
using LuaFramework;
using System.Collections.Generic;

public class AppView : View
{
//	[SerializeField]
//	Object updatePanelPrefab;

	public class Message
	{
		public int current;
		public int total;
		public float speed;
	}

    private string message;
	private string message_download;
	private string message_process;

	[SerializeField]
	UpdatePanel m_UpdatePanel;

    ///<summary>
    /// 监听的消息
    ///</summary>
    List<string> MessageList
	{
        get {
            return new List<string>()
            { 
				NotiConst.UPDATE_CREATE_LOACL_PANEL,
                NotiConst.UPDATE_MESSAGE,
                NotiConst.UPDATE_EXTRACT,
				NotiConst.UPDATE_EXTRACT_OVER,
                NotiConst.UPDATE_DOWNLOAD,
                NotiConst.UPDATE_PROGRESS,
				NotiConst.UPDATE_CREATE_PANEL,
				NotiConst.UPDATE_DOWNLOAD_OVER,
            };
        }
    }

    void Awake()
	{
        RemoveMessage(this, MessageList);
        RegisterMessage(this, MessageList);
    }

	void AddUpdatePanel(bool isLocal)
	{
		LoadingManager.CSLoadPanel("UpdatePanel", delegate(UnityEngine.Object[] objs) {
			if (objs.Length == 0) return;
			GameObject prefab = objs[0] as GameObject;
			if (prefab == null) return;

			GameObject go = Instantiate(prefab) as GameObject;
			go.name = "UpdatePanel";
			go.layer = LayerMask.NameToLayer("Default");
			GameObject Parent = GameObject.FindWithTag("GuiCamera");
			go.transform.SetParent(Parent.transform);
			go.transform.localScale = Vector3.one;
			go.transform.localPosition = Vector3.zero;
//			m_UpdatePanel = go.GetComponent<UpdatePanel>();
//			go.AddComponent<LuaBehaviour>();
		});
	}

    /// <summary>
    /// 处理View消息
    /// </summary>
    /// <param name="message"></param>

	float speed;
    public override void OnMessage(IMessage message)
	{
        string name = message.Name;
        object body = message.Body;
	
        switch (name)
		{
			case NotiConst.UPDATE_CREATE_LOACL_PANEL:
				AddUpdatePanel (true);
			break;
			case NotiConst.UPDATE_CREATE_PANEL:
				AddUpdatePanel (false);
			break;
			case NotiConst.UPDATE_MESSAGE:      //更新消息
			{
				Message msg = message.Body as Message;
				if (msg != null)
				{
					UpdateMessage ("正在下载文件:> " + msg.current + "/" + msg.total);
					m_UpdatePanel.Downloading (msg.current, msg.total);
//					Util.CallMethod("UpdatePanel", "Downloading", msg.current, msg.total);
				}
			}
			break;
			case NotiConst.UPDATE_DOWNLOAD_OVER:
			{
				UpdateMessage (body.ToString ());
				m_UpdatePanel.DownloadOver (body.ToString ());
//				Util.CallMethod("UpdatePanel", "DownloadOver", body.ToString());
			}
			break;
			case NotiConst.UPDATE_EXTRACT:      //更新解压
			{
				Message msg = message.Body as Message;
				if (msg != null)
				{
					UpdateExtract ("正在解包文件:> " + msg.current + "/" + msg.total);
					m_UpdatePanel.Extracting (msg.current, msg.total);
//					Util.CallMethod("UpdatePanel", "Extracting", msg.current, msg.total);
				} 
			}
			break;
			case NotiConst.UPDATE_EXTRACT_OVER:
			{
				//解包完成
//				Util.CallMethod("UpdatePanel", "ExtractOver", body.ToString ());

				m_UpdatePanel.ExtractOver(body.ToString ());
				UpdateExtract (body.ToString ());
			}
			break;
			case NotiConst.UPDATE_DOWNLOAD:     //更新下载的文件名字
				UpdateDownload (body.ToString());
			break;
			case NotiConst.UPDATE_PROGRESS:     //更新下载速度
			{
				Message msg = message.Body as Message;
				if (msg != null)
				{
					UpdateProgress (msg.speed.ToString("0.00"));
					speed = msg.speed;
					active = true;
				} 
			}
			break;
        }
    }

	bool active;
	public void Update()
	{
		if (!active)
			return;
//		Util.CallMethod("UpdatePanel", "DownloadSpeed", speed);
		active = false;
	}

    public void UpdateMessage(string data)
	{
        this.message = data;
    }

    public void UpdateExtract(string data)
	{
        this.message = data;
    }

    public void UpdateDownload(string data)
	{
		this.message_download = data;
    }

    public void UpdateProgress(string data)
	{
		this.message_process = data;
    }

    void OnGUI()
	{
//        GUI.Label(new Rect(10, 120, 960, 50), message);
//
//		GUI.Label(new Rect(10, 170, 960, 50), message_download);
//
//		GUI.Label(new Rect(10, 220, 960, 50), message_process);
    }
}
