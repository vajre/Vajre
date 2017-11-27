using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UpdatePanel : MonoBehaviour
{
	[SerializeField]
	Text text_desc;

	[SerializeField]
	Text text_progress;

	[SerializeField]
	Text text_mid;

	[SerializeField]
	Slider progressbar;

	public void Extracting(int current, int total)
	{
		text_desc.text = "正在解压文件:";
		text_progress.text = string.Format ("{0}/{1}", current, total);
		progressbar.value = (float)current / (float)total;
	}

	public void ExtractOver(string msg)
	{
		text_mid.text = "解压完成!";
		text_desc.text = "";
		text_progress.text = "";
		progressbar.value = 0;
	}

	public void Downloading(int current, int total)
	{
		text_mid.text = "";
		text_desc.text = "正在下载文件:";
		text_progress.text = string.Format ("{0}/{1}", current, total);
		progressbar.value = (float)current / (float)total;
	}

	public void DownloadOver(string msg)
	{
		text_mid.text = "下载完成!";
		text_desc.text = "";
		text_progress.text = "";
	}
}
