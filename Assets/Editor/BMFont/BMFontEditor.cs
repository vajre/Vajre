using UnityEngine;
using UnityEditor;

public class BMFontEditor : EditorWindow
{
	[MenuItem("Tools/BMFont Maker")]
	static public void OpenBMFontMaker()
	{
		EditorWindow.GetWindow<BMFontEditor>(false, "BMFont Maker", true).Show();
	}
		
	private Font targetFont;
	private Material fontMaterial;
	private TextAsset fntData;
	private Texture2D fontTexture;
	private BMFont bmFont = new BMFont();

	void OnGUI()
	{
		targetFont = EditorGUILayout.ObjectField("Target Font", targetFont, typeof(Font), false) as Font;
		fontMaterial = EditorGUILayout.ObjectField("Font Material", fontMaterial, typeof(Material), false) as Material;
		fntData = EditorGUILayout.ObjectField("Fnt Data", fntData, typeof(TextAsset), false) as TextAsset;
		fontTexture = EditorGUILayout.ObjectField("Font Texture", fontTexture, typeof(Texture2D), false) as Texture2D;


		if (GUILayout.Button("Create BMFont"))
		{
//			AssetDatabase.OpenAsset(targetFont);
//			AssetDatabase.StartAssetEditing ();

			BMFontReader.Load(bmFont, fntData.name, fntData.bytes); // 借用NGUI封装的读取类
			CharacterInfo[] characterInfo = new CharacterInfo[bmFont.glyphs.Count];
			for (int i = 0; i < bmFont.glyphs.Count; i++)
			{
				BMGlyph bmInfo = bmFont.glyphs[i];
				CharacterInfo info = new CharacterInfo();
				info.index = bmInfo.index;
				info.uv.x = (float)bmInfo.x / (float)bmFont.texWidth;
				info.uv.y = 1 - (float)bmInfo.y / (float)bmFont.texHeight;
				info.uv.width = (float)bmInfo.width / (float)bmFont.texWidth;
				info.uv.height = -1f * (float)bmInfo.height / (float)bmFont.texHeight;
				info.vert.x = 0;
				info.vert.y = -(float)bmInfo.height;
				info.vert.width = (float)bmInfo.width;
				info.vert.height = (float)bmInfo.height;
				info.width = (float)bmInfo.advance;
				characterInfo[i] = info;
			}
			targetFont.characterInfo = characterInfo;
			if (fontMaterial)
			{
				fontMaterial.mainTexture = fontTexture;
			}
			targetFont.material = fontMaterial;
			fontMaterial.shader = Shader.Find("UI/Default Font");

			Debug.Log("create font <" + targetFont.name + "> success");

//			AssetDatabase.StopAssetEditing();
			EditorUtility.SetDirty(targetFont);
			AssetDatabase.SaveAssets();
			AssetDatabase.Refresh(ImportAssetOptions.ForceSynchronousImport);
			Close();
		}
	}
}