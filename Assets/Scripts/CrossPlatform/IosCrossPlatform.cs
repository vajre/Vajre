using System.Runtime.InteropServices;

public sealed class IosCrossPlatform : CrossPlatform
{
    [DllImport("__Internal")]
    private static extern string OnPlatformMsg(string msg);
    public override string SendPlatformMsg(string msg)
    {
        return OnPlatformMsg(msg);
    }
}